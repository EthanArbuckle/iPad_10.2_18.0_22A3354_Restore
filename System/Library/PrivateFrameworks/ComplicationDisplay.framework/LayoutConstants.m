@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:", 63.0);
  _LayoutConstants___constants_0 = v2;
  objc_msgSend(v4, "scaledValue:", 91.0);
  _LayoutConstants___constants_1 = v3;

}

double ___LayoutConstants_block_invoke_0(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double result;
  double v11;

  v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  *(_QWORD *)&_LayoutConstants___constants = v3;
  CLKValueForLuxoDeviceMetrics();
  *((_QWORD *)&_LayoutConstants___constants + 1) = v4;
  CLKValueForLuxoDeviceMetrics();
  qword_254B6FDD0 = v5;
  CLKValueForLuxoDeviceMetrics();
  qword_254B6FDD8 = v6;
  CLKValueForLuxoDeviceMetrics();
  *(_QWORD *)&xmmword_254B6FDE0 = v7;
  CLKValueForLuxoDeviceMetrics();
  *((_QWORD *)&xmmword_254B6FDE0 + 1) = v8;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v11 = v9;

  _LayoutConstants___constantsXL = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constants, v11);
  xmmword_254B6FE00 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_254B6FDD0, v11);
  xmmword_254B6FE10 = xmmword_254B6FDE0;
  result = v11 * *(double *)&xmmword_254B6FDE0;
  *(double *)&xmmword_254B6FE10 = v11 * *(double *)&xmmword_254B6FDE0;
  return result;
}

void ___LayoutConstants_block_invoke_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:", 62.0);
  _LayoutConstants___constants_0_0 = v2;
  objc_msgSend(v4, "scaledValue:", 88.0);
  _LayoutConstants___constants_1_0 = v3;

}

void ___LayoutConstants_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_0_1 = v3;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_1_1 = v4;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_2 = v5;
  CLKValueForLuxoDeviceMetrics();
  v7 = v6;

  _LayoutConstants___constants_3 = v7;
}

void ___LayoutConstants_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  _QWORD v9[4];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:", 20.0);
  _LayoutConstants___constants_0_2 = v3;
  v10[0] = &unk_24CF2D618;
  v10[1] = &unk_24CF2D630;
  v11[0] = &unk_24CF2DA20;
  v11[1] = &unk_24CF2DA30;
  v10[2] = &unk_24CF2D648;
  v11[2] = &unk_24CF2DA40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v4, 20.5);
  _LayoutConstants___constants_1_2 = v5;

  v8[0] = &unk_24CF2D660;
  v8[1] = &unk_24CF2D618;
  v9[0] = &unk_24CF2DA50;
  v9[1] = &unk_24CF2DA60;
  v8[2] = &unk_24CF2D630;
  v8[3] = &unk_24CF2D648;
  v9[2] = &unk_24CF2DA70;
  v9[3] = &unk_24CF2DA80;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 14.5);
  _LayoutConstants___constants_2_0 = v7;

}

void ___LayoutConstants_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoundingBehavior:", 0);
  v9[0] = &unk_24CF2D678;
  v9[1] = &unk_24CF2D690;
  v10[0] = &unk_24CF2DA90;
  v10[1] = &unk_24CF2DA90;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 1.5);
  _LayoutConstants___constantsGraphicRegular = v6;

  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v8 = v7;

  *(double *)&_LayoutConstants___constantsGraphicExtraLarge = v8
                                                            * *(double *)&_LayoutConstants___constantsGraphicRegular;

}

void ___LayoutConstants_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = &unk_24CF2D6A8;
  v28[1] = &unk_24CF2D6C0;
  v29[0] = &unk_24CF2DAA0;
  v29[1] = &unk_24CF2DAB0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 17.0);
  *(_QWORD *)&_LayoutConstants___constants_0 = v6;

  *((_QWORD *)&_LayoutConstants___constants_0 + 1) = 0x4043000000000000;
  qword_254B6FF50 = CDCornerComplicationOuterUpperTextBaselineRadius(v3);
  qword_254B6FF58 = CDCornerComplicationOuterLowerTextBaselineRadius(v3);
  objc_msgSend(v4, "scaledValue:", 11.0);
  *(_QWORD *)&xmmword_254B6FF60 = v7;
  *((_QWORD *)&xmmword_254B6FF60 + 1) = 0x4012000000000000;
  v8 = CDCornerComplicationTopLeftCenterAngle(v3);

  qword_254B6FF70 = *(_QWORD *)&v8;
  v26[0] = &unk_24CF2D6A8;
  v26[1] = &unk_24CF2D6C0;
  v27[0] = &unk_24CF2DAC0;
  v27[1] = &unk_24CF2DAC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v9, -60.0);
  qword_254B6FF78 = v10;

  v24[0] = &unk_24CF2D6A8;
  v24[1] = &unk_24CF2D6C0;
  v25[0] = &unk_24CF2DAD0;
  v25[1] = &unk_24CF2DAD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v11, 95.0);
  *(_QWORD *)&xmmword_254B6FF80 = v12;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 57.5, 12.5, &unk_24CF2D6D8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v22[1] = &unk_24CF2D6F0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 55.5, 12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v22[2] = &unk_24CF2D708;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 62.5, 13.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = &unk_24CF2D720;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 62.5, 13.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = &unk_24CF2D6A8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 57.5, 12.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = &unk_24CF2D6C0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 62.5, 13.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledSize:withOverrides:", v19, 52.5, 11.5);
  *((_QWORD *)&xmmword_254B6FF80 + 1) = v20;
  qword_254B6FF90 = v21;

}

void ___LayoutConstants_block_invoke_6(uint64_t a1, void *a2)
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
  double v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&_LayoutConstants___constants_1 = CDRichComplicationCornerInnerFontSize(v3);
  qword_254B6FFC8 = CDCornerComplicationInnerUpperTextBaselineRadius(v3);
  v28[0] = &unk_24CF2D738;
  v28[1] = &unk_24CF2D750;
  v29[0] = &unk_24CF2DAE0;
  v29[1] = &unk_24CF2DAF0;
  v28[2] = &unk_24CF2D768;
  v28[3] = &unk_24CF2D780;
  v29[2] = &unk_24CF2DB00;
  v29[3] = &unk_24CF2DB00;
  v28[4] = &unk_24CF2D798;
  v28[5] = &unk_24CF2D7B0;
  v29[4] = &unk_24CF2DB10;
  v29[5] = &unk_24CF2DB20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 86.5);
  *(_QWORD *)&xmmword_254B6FFD0 = v6;

  v26[0] = &unk_24CF2D798;
  v26[1] = &unk_24CF2D7B0;
  v27[0] = &unk_24CF2DB30;
  v27[1] = &unk_24CF2DB30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v7, 3.0);
  *((_QWORD *)&xmmword_254B6FFD0 + 1) = v8;

  v24[0] = &unk_24CF2D738;
  v24[1] = &unk_24CF2D798;
  v25[0] = &unk_24CF2DB40;
  v25[1] = &unk_24CF2DB30;
  v24[2] = &unk_24CF2D7B0;
  v25[2] = &unk_24CF2DB30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v9, 3.0);
  qword_254B6FFE0 = v10;

  qword_254B6FFE8 = CDCornerComplicationTopLeftCenterAngle(v3);
  v22[0] = &unk_24CF2D798;
  v22[1] = &unk_24CF2D7B0;
  v23[0] = &unk_24CF2DB50;
  v23[1] = &unk_24CF2DB50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v11, 0.0);
  *(_QWORD *)&xmmword_254B6FFF0 = v12;

  v20[0] = &unk_24CF2D798;
  v20[1] = &unk_24CF2D7B0;
  v21[0] = &unk_24CF2DB60;
  v21[1] = &unk_24CF2DB60;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v13, 55.0);
  *((_QWORD *)&xmmword_254B6FFF0 + 1) = v14;

  v18[0] = &unk_24CF2D798;
  v18[1] = &unk_24CF2D7B0;
  v19[0] = &unk_24CF2DB70;
  v19[1] = &unk_24CF2DB70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v15, 140.0);
  qword_254B70000 = v16;

  v17 = CDCornerComplicationClippingSliceAngle((uint64_t)v3);
  qword_254B6FFC0 = *(_QWORD *)&v17;

}

void ___LayoutConstants_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaledValue:", 5.5);
  *(_QWORD *)&_LayoutConstants___constants_2 = v4;
  *((double *)&_LayoutConstants___constants_2 + 1) = CDCornerComplicationInnerUpperCircleRadius(v3) * 2.0 + -1.0;
  objc_msgSend(v9, "scaledValue:withOverride:forSizeClass:", 3, 6.5, 7.5);
  qword_254B70030 = v5;
  CLKDegreesToRadians();
  qword_254B70038 = v6;
  objc_msgSend(v9, "scaledValue:withOverride:forSizeClass:", 3, 15.0, 17.0);
  *(_QWORD *)&xmmword_254B70040 = v7;
  *((_QWORD *)&xmmword_254B70040 + 1) = CDRichComplicationCornerInnerFontSize(v3);
  qword_254B70050 = CDCornerComplicationInnerUpperCircleRadius(v3);
  qword_254B70058 = CDCornerComplicationInnerLowerTextBaselineRadius(v3);
  xmmword_254B70060 = xmmword_21306B3F0;
  CDCornerComplicationTopLeftCenterAngle(v3);

  CLKDegreesToRadians();
  qword_254B70070 = v8;

}

void ___LayoutConstants_block_invoke_8(uint64_t a1, void *a2)
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
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = &unk_24CF2D7E0;
  v35[1] = &unk_24CF2D7F8;
  v36[0] = &unk_24CF2DB90;
  v36[1] = &unk_24CF2DBA0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 13.0);
  *(_QWORD *)&_LayoutConstants___constants_3 = v6;

  *((_QWORD *)&_LayoutConstants___constants_3 + 1) = 0x4043000000000000;
  v33[0] = &unk_24CF2D810;
  v33[1] = &unk_24CF2D7E0;
  v34[0] = &unk_24CF2DBB0;
  v34[1] = &unk_24CF2DBC0;
  v33[2] = &unk_24CF2D7F8;
  v34[2] = &unk_24CF2DBD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 94.0);
  qword_254B700E8 = v8;

  v31[0] = &unk_24CF2D810;
  v31[1] = &unk_24CF2D7E0;
  v32[0] = &unk_24CF2DBE0;
  v32[1] = &unk_24CF2DBD0;
  v31[2] = &unk_24CF2D7F8;
  v32[2] = &unk_24CF2DBF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v9, 102.5);
  qword_254B700F0 = v10;

  v11 = CDCornerComplicationTopLeftCenterAngle(v3);
  *(double *)&xmmword_254B700F8 = v11;
  v29[0] = &unk_24CF2D7E0;
  v29[1] = &unk_24CF2D7F8;
  v30[0] = &unk_24CF2DC00;
  v30[1] = &unk_24CF2DC00;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v12, 15.0);
  *((_QWORD *)&xmmword_254B700F8 + 1) = v13;

  v27[0] = &unk_24CF2D7E0;
  v27[1] = &unk_24CF2D7F8;
  v28[0] = &unk_24CF2DC10;
  v28[1] = &unk_24CF2DC10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v14, 115.0);
  qword_254B70108 = v15;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 25.0, 12.0, &unk_24CF2D810);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = &unk_24CF2D828;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 24.0, 11.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  v25[2] = &unk_24CF2D840;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 27.5, 12.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = &unk_24CF2D858;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 27.5, 12.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v19;
  v25[4] = &unk_24CF2D7E0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 25.0, 12.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v20;
  v25[5] = &unk_24CF2D7F8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 27.5, 12.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledSize:withOverrides:", v22, 22.5, 11.0);
  qword_254B70110 = v23;
  *(_QWORD *)&xmmword_254B70118 = v24;

  *((_QWORD *)&xmmword_254B70118 + 1) = 0x3FF0000000000000;
}

void ___LayoutConstants_block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = &unk_24CF2D870;
  v16[1] = &unk_24CF2D888;
  v17[0] = &unk_24CF2DC20;
  v17[1] = &unk_24CF2DC30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 10.0);
  _LayoutConstants_constants_0 = v4;

  v14[0] = &unk_24CF2D8A0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 21.0, 9.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = &unk_24CF2D8B8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 20.0, 9.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = &unk_24CF2D8D0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 22.5, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = &unk_24CF2D8E8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 22.5, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  v14[4] = &unk_24CF2D870;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 21.0, 9.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v9;
  v14[5] = &unk_24CF2D888;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 22.5, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledSize:withOverrides:", v11, 19.0, 8.5);
  _LayoutConstants_constants_1 = v12;
  _LayoutConstants_constants_2 = v13;

  _LayoutConstants_constants_3 = 0x3FF0000000000000;
}

void ___LayoutConstants_block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB8738];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CDCircularSmallComplicationDiameter(v3);

  _LayoutConstants___constants_0_4 = *(_QWORD *)&v5;
  v10[0] = &unk_24CF2D9C0;
  v10[1] = &unk_24CF2D9D8;
  v11[0] = &unk_24CF2DED0;
  v11[1] = &unk_24CF2DEE0;
  v10[2] = &unk_24CF2D9F0;
  v10[3] = &unk_24CF2DA08;
  v11[2] = &unk_24CF2DEF0;
  v11[3] = &unk_24CF2DF00;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v6, 4.0);
  _LayoutConstants___constants_1_4 = v7;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 63.0, 70.0);
  _LayoutConstants___constants_2_1 = v8;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 80.0, 89.0);
  _LayoutConstants___constants_3_0 = v9;

}

@end
