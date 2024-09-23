@implementation NSArray(AVTExtension)

+ (id)avt_arrayWithFloat4x4:()AVTExtension
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[6];

  v35[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  a1.n128_u64[0] = objc_claimAutoreleasedReturnValue();
  v34[3] = a1.n128_u64[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2.n128_f64[0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v22;
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  a2.n128_u64[0] = objc_claimAutoreleasedReturnValue();
  v33[3] = a2.n128_u64[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3.n128_f64[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v18;
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a4.n128_f64[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v11;
  HIDWORD(v12) = a4.n128_u32[1];
  LODWORD(v12) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
  a4.n128_u64[0] = objc_claimAutoreleasedReturnValue();

  return (id)a4.n128_u64[0];
}

+ (id)avt_arrayWithFloat4x4:()AVTExtension roundingBehavior:
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a7;
  objc_msgSend(v7, "avt_numberWithFloat:roundingBehavior:", v8, a1.n128_f64[0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v32;
  HIDWORD(v9) = a1.n128_u32[1];
  LODWORD(v9) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  a1.n128_u64[0] = objc_claimAutoreleasedReturnValue();
  v40[3] = a1.n128_u64[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, a2.n128_f64[0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v28;
  HIDWORD(v10) = a2.n128_u32[1];
  LODWORD(v10) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  a2.n128_u64[0] = objc_claimAutoreleasedReturnValue();
  v39[3] = a2.n128_u64[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, a3.n128_f64[0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v24;
  HIDWORD(v11) = a3.n128_u32[1];
  LODWORD(v11) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, a4.n128_f64[0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v16;
  HIDWORD(v17) = a4.n128_u32[1];
  LODWORD(v17) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v37[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (__n128)avt_float4x4
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  unsigned int v7;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  __int128 v44;

  if (objc_msgSend(a1, "count") == 4)
  {
    v2 = a1;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "floatValue");
    v43 = v3;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    v42 = v4;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "floatValue");
    v41 = v5;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    *(_QWORD *)&v6 = __PAIR64__(v42, v43);
    *((_QWORD *)&v6 + 1) = __PAIR64__(v7, v41);
    v44 = v6;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");

    return (__n128)v44;
  }
  else
  {
    return *(__n128 *)MEMORY[0x1E0C83FF0];
  }
}

+ (id)avt_arrayWithFloat3:()AVTExtension
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)avt_arrayWithFloat3:()AVTExtension roundingBehavior:
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a4;
  objc_msgSend(v4, "avt_numberWithFloat:roundingBehavior:", v5, a1.n128_f64[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  HIDWORD(v7) = a1.n128_u32[1];
  LODWORD(v7) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v5, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)avt_arrayWithFloat4:()AVTExtension
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)avt_arrayWithFloat4:()AVTExtension roundingBehavior:
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a4;
  objc_msgSend(v4, "avt_numberWithFloat:roundingBehavior:", v5, a1.n128_f64[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  HIDWORD(v7) = a1.n128_u32[1];
  LODWORD(v7) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v5, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v5, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (__n128)avt_float3
{
  unint64_t v2;
  __n128 result;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int128 v10;
  int v11;
  int v12;
  __int128 v13;
  __int128 v14;

  v2 = objc_msgSend(a1, "count");
  result.n128_u64[0] = 0;
  if (v2 >= 3)
  {
    v4 = a1;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    *(_QWORD *)&v13 = v6;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v12 = v8;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "floatValue");
    v10 = v13;
    DWORD1(v10) = v12;
    DWORD2(v10) = v11;
    v14 = v10;

    return (__n128)v14;
  }
  return result;
}

- (__n128)avt_float4
{
  unint64_t v2;
  __n128 result;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  __int128 v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  __int128 v17;

  v2 = objc_msgSend(a1, "count");
  result.n128_u64[0] = 0;
  if (v2 >= 4)
  {
    v4 = a1;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v16 = v6;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v15 = v8;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v14 = v10;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "floatValue");
    *(_QWORD *)&v12 = __PAIR64__(v15, v16);
    *((_QWORD *)&v12 + 1) = __PAIR64__(v13, v14);
    v17 = v12;

    return (__n128)v17;
  }
  return result;
}

- (id)avt_randomObject
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)v2));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)avt_mutableContainersCopy
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__NSArray_AVTExtension__avt_mutableContainersCopy__block_invoke;
  v5[3] = &unk_1EA61ED58;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

@end
