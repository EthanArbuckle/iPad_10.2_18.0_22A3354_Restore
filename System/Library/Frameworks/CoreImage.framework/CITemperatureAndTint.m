@implementation CITemperatureAndTint

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[7];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorAdjustment");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryInterlaced");
  v7[4] = CFSTR("CICategoryNonSquarePixels");
  v7[5] = CFSTR("CICategoryHighDynamicRange");
  v7[6] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v9[1] = CFSTR("5");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.7");
  v8[3] = CFSTR("inputNeutral");
  v5[0] = CFSTR("CIAttributeDefault");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 6500.0, 0.0);
  v5[1] = CFSTR("CIAttributeIdentity");
  v5[2] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 6500.0, 0.0);
  v6[2] = CFSTR("CIAttributeTypeOffset");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v8[4] = CFSTR("inputTargetNeutral");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 6500.0, 0.0, CFSTR("CIAttributeDefault"));
  v3[1] = CFSTR("CIAttributeIdentity");
  v3[2] = CFSTR("CIAttributeType");
  v4[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 6500.0, 0.0);
  v4[2] = CFSTR("CIAttributeTypeOffset");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (CIVector)inputNeutral
{
  return self->inputNeutral;
}

- (void)setInputNeutral:(id)a3
{
  CIVector *inputNeutral;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  CIVector *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  _QWORD v76[26];
  _QWORD v77[26];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  double v82[26];
  double v83[26];
  unsigned int v84[52];
  unsigned int v85[52];
  unsigned int v86[52];
  unsigned int v87[52];
  unsigned int v88[52];
  _DWORD v89[52];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96[4];

  v96[3] = *(double *)MEMORY[0x1E0C80C00];
  inputNeutral = self->inputNeutral;
  if (objc_msgSend(a3, "count") == 3)
  {
    objc_msgSend(a3, "X");
    v7 = v6;
    objc_msgSend(a3, "Y");
    v9 = v8;
    objc_msgSend(a3, "Z");
    v96[0] = v7 * v7;
    v96[1] = v9 * v9;
    v96[2] = v10 * v10;
    CMatrix::CMatrix((CMatrix *)v89, 3u, 3u, 0.454268, v11, v12, 0x3FD69CBAA49EB5D9, 0x3FC40C03BE7630B2, 0x3FCEF689906AD933, 0x3FE58E8E5F4360FFLL, 0x3FB59E6D9AB61B65, 0x3F8E7F0ABDCF9CFALL, 0x3FB73315A5A6D043, 0x3FE7053603937997);
    CMatrix::CMatrix((CMatrix *)v88, 3u, 3u, 0.8951, v13, v14, 0x3FD10CB295E9E1B1, 0xBFC4A8C154C985F0, 0xBFE801A36E2EB1C4, 0x3FFB6A7EF9DB22D1, 0x3FA2CA57A786C227, 0x3FA3EAB367A0F909, 0xBFB189374BC6A7F0, 0x3FF0793DD97F62B7);
    CMatrix::CMatrix((CMatrix *)v87, 3u, 3u, 0.986993, v15, v16, 0xBFC2D2AA5C5F7C67, 0x3FC479AAE6C8F755, 0x3FDBAAE297396D09, 0x3FE09667B5F1BEF5, 0x3FA93CAB81F969E4, 0xBF8177A7008A697BLL, 0x3FA480841EDE1199, 0x3FEEFDD872F33CA3);
    CMatrix::operator*(v88, v89, v85);
    CMatrix::CMatrix((CMatrix *)v84, 3u, 1u, 1.0, v17, v18, 0x3FF0000000000000, 0x3FF0000000000000);
    CMatrix::operator*(v85, v84, v86);
    CMatrix::operator*(v88, v89, v84);
    CMatrix::CMatrix((CMatrix *)v83, 3u, 1u, v96);
    CMatrix::operator*(v84, v83, v85);
    v83[0] = 0.0;
    v82[0] = 0.0;
    tempTint_to_xy(6500.0, 0.0, v83, v82);
    if (v82[0] >= 1.0e-20)
      CMatrix::CMatrix((CMatrix *)v84, 3u, 1u, v83[0] / v82[0], v19, v20, 0x3FF0000000000000, (1.0 - v83[0] - v82[0]) / v82[0]);
    else
      CMatrix::CMatrix((CMatrix *)v84);
    CMatrix::operator*(v88, v84, (unsigned int *)v83);
    v77[0] = CMatrix::operator[]((unsigned int *)v83, 0);
    v77[1] = v22;
    v23 = *(double *)CMatrixRow::operator[]((uint64_t)v77, 0);
    v76[0] = CMatrix::operator[](v85, 0);
    v76[1] = v24;
    v25 = *(double *)CMatrixRow::operator[]((uint64_t)v76, 0);
    v94 = CMatrix::operator[](v86, 0);
    v95 = v26;
    v27 = *(double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
    v92 = CMatrix::operator[]((unsigned int *)v83, 1u);
    v93 = v28;
    v29 = *(double *)CMatrixRow::operator[]((uint64_t)&v92, 0);
    v90 = CMatrix::operator[](v85, 1u);
    v91 = v30;
    v31 = *(double *)CMatrixRow::operator[]((uint64_t)&v90, 0);
    v81[0] = CMatrix::operator[](v86, 1u);
    v81[1] = v32;
    v33 = *(double *)CMatrixRow::operator[]((uint64_t)v81, 0);
    v80[0] = CMatrix::operator[]((unsigned int *)v83, 2u);
    v80[1] = v34;
    v35 = *(double *)CMatrixRow::operator[]((uint64_t)v80, 0);
    v79[0] = CMatrix::operator[](v85, 2u);
    v79[1] = v36;
    v37 = *(double *)CMatrixRow::operator[]((uint64_t)v79, 0);
    v78[0] = CMatrix::operator[](v86, 2u);
    v78[1] = v38;
    v39 = (double *)CMatrixRow::operator[]((uint64_t)v78, 0);
    CMatrix::CMatrix((CMatrix *)v82, 3u, 1u, v23 * v25 / v27, v40, v41, v29 * v31 / v33, v35 * v37 / *v39);
    CMatrix::operator*(v87, v82, (unsigned int *)v77);
    CMatrix::CMatrix((CMatrix *)v76, (const CMatrix *)v77);
    v94 = CMatrix::operator[]((unsigned int *)v76, 0);
    v95 = v42;
    v43 = *(double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
    v92 = CMatrix::operator[]((unsigned int *)v76, 1u);
    v93 = v44;
    v45 = *(double *)CMatrixRow::operator[]((uint64_t)&v92, 0);
    v90 = CMatrix::operator[]((unsigned int *)v76, 2u);
    v91 = v46;
    v47 = v43 + v45 + *(double *)CMatrixRow::operator[]((uint64_t)&v90, 0);
    v48 = 0.0;
    v49 = 0.0;
    v50 = 0.0;
    if (v47 >= 1.0e-20)
    {
      v94 = CMatrix::operator[]((unsigned int *)v76, 0);
      v95 = v51;
      v52 = *(double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
      v94 = CMatrix::operator[]((unsigned int *)v76, 1u);
      v95 = v53;
      v54 = (double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
      v49 = v52 / v47;
      v50 = *v54 / v47;
    }
    v55 = 0;
    v56 = v49 + v49;
    v57 = 1.5 - v49 + v50 * 6.0;
    v58 = v56 / v57;
    v59 = v50 * 3.0 / v57;
    v60 = 0xFFFFFFFF00000000;
    v61 = 0.0;
    v62 = 0.0;
    do
    {
      v63 = v62;
      v64 = v61;
      v65 = v48;
      v66 = v55;
      v55 += 32;
      v67 = *(double *)((char *)&kTempTable + v55 + 24);
      v68 = sqrt(v67 * v67 + 1.0);
      v48 = 1.0 / v68;
      v61 = v67 / v68;
      v70 = *(double *)((char *)&kTempTable + v55 + 8);
      v69 = *(double *)((char *)&kTempTable + v55 + 16);
      v62 = (v59 - v69) * v48 - (v58 - v70) * v61;
      v60 += 0x100000000;
    }
    while (v66 != 928 && v62 > 0.0);
    if (v60)
    {
      v71 = 0.0;
      if (v62 <= 0.0)
        v71 = (v59 - v69) * v48 - (v58 - v70) * v61;
      v72 = -v71 / (v63 - v71);
    }
    else
    {
      v72 = 0.0;
    }
    v73 = v65 * v72 + v48 * (1.0 - v72);
    v74 = v64 * v72 + v61 * (1.0 - v72);
    v75 = sqrt(v74 * v74 + v73 * v73);
    v21 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1000000.0/ ((1.0 - v72) * *(double *)((char *)&kTempTable + v55)+ *(double *)((char *)&kTempTable + (v60 >> 27)) * v72), (v74 / v75 * (v59 - (v69 * (1.0 - v72) + *(double *)((char *)&kTempTable + (v60 >> 27) + 16) * v72))+ (v58 - (v70 * (1.0 - v72) + *(double *)((char *)&kTempTable + (v60 >> 27) + 8) * v72)) * (v73 / v75))* -3000.0);
  }
  else
  {
    v21 = (CIVector *)a3;
  }
  self->inputNeutral = v21;

}

- (id)outputImage
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  CIImage *inputImage;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  CIVector *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  CIVector *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  unsigned int v46[52];
  double v47;
  double v48;
  double v49;
  double v50;
  _DWORD v51[52];
  _DWORD v52[52];
  _QWORD v53[26];
  _QWORD v54[26];
  _QWORD v55[26];
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[26];
  _QWORD v64[26];
  _QWORD v65[26];
  _QWORD v66[26];
  _QWORD v67[26];

  if (!self->inputImage)
    return 0;
  v49 = 0.0;
  v50 = 0.0;
  v47 = 0.0;
  v48 = 0.0;
  get_input_xy(self->inputNeutral, &v50, &v49);
  get_input_xy(self->inputTargetNeutral, &v48, &v47);
  v6 = v47;
  v5 = v48;
  if (vabdd_f64(v50, v48) <= 0.0005 && vabdd_f64(v49, v47) <= 0.0005)
    return self->inputImage;
  if (v49 >= 1.0e-20)
    CMatrix::CMatrix((CMatrix *)v55, 3u, 1u, v50 / v49, v3, v4, 0x3FF0000000000000, (1.0 - v50 - v49) / v49);
  else
    CMatrix::CMatrix((CMatrix *)v55);
  if (v6 >= 1.0e-20)
    CMatrix::CMatrix((CMatrix *)v54, 3u, 1u, v5 / v6, v7, v8, 0x3FF0000000000000, (1.0 - v5 - v6) / v6);
  else
    CMatrix::CMatrix((CMatrix *)v54);
  CMatrix::CMatrix((CMatrix *)v52, (const CMatrix *)v55);
  CMatrix::CMatrix((CMatrix *)v51, (const CMatrix *)v54);
  CMatrix::CMatrix((CMatrix *)v67, 3u, 3u, 0.8951, v10, v11, 0x3FD10CB295E9E1B1, 0xBFC4A8C154C985F0, 0xBFE801A36E2EB1C4, 0x3FFB6A7EF9DB22D1, 0x3FA2CA57A786C227, 0x3FA3EAB367A0F909, 0xBFB189374BC6A7F0, 0x3FF0793DD97F62B7);
  CMatrix::CMatrix((CMatrix *)v66, 3u, 3u, 0.986993, v12, v13, 0xBFC2D2AA5C5F7C67, 0x3FC479AAE6C8F755, 0x3FDBAAE297396D09, 0x3FE09667B5F1BEF5, 0x3FA93CAB81F969E4, 0xBF8177A7008A697BLL, 0x3FA480841EDE1199, 0x3FEEFDD872F33CA3);
  CMatrix::operator*((unsigned int *)v67, v52, (unsigned int *)v65);
  CMatrix::operator*((unsigned int *)v67, v51, (unsigned int *)v64);
  v56 = CMatrix::operator[]((unsigned int *)v64, 0);
  v57 = v14;
  v15 = *(double *)CMatrixRow::operator[]((uint64_t)&v56, 0);
  v62[0] = CMatrix::operator[]((unsigned int *)v65, 0);
  v62[1] = v16;
  v17 = *(double *)CMatrixRow::operator[]((uint64_t)v62, 0);
  v61[0] = CMatrix::operator[]((unsigned int *)v64, 1u);
  v61[1] = v18;
  v19 = *(double *)CMatrixRow::operator[]((uint64_t)v61, 0);
  v60[0] = CMatrix::operator[]((unsigned int *)v65, 1u);
  v60[1] = v20;
  v21 = *(double *)CMatrixRow::operator[]((uint64_t)v60, 0);
  v59[0] = CMatrix::operator[]((unsigned int *)v64, 2u);
  v59[1] = v22;
  v23 = *(double *)CMatrixRow::operator[]((uint64_t)v59, 0);
  v58[0] = CMatrix::operator[]((unsigned int *)v65, 2u);
  v58[1] = v24;
  v25 = (double *)CMatrixRow::operator[]((uint64_t)v58, 0);
  CMatrix::diagonalMatrix((CMatrix *)3, v15 / v17, v63, COERCE__INT64(v19 / v21), v23 / *v25);
  CMatrix::operator*((unsigned int *)v66, v63, (unsigned int *)&v56);
  CMatrix::operator*((unsigned int *)&v56, v67, (unsigned int *)v53);
  CMatrix::CMatrix((CMatrix *)v67, 3u, 3u, 0.454268, v26, v27, 0x3FD69CBAA49EB5D9, 0x3FC40C03BE7630B2, 0x3FCEF689906AD933, 0x3FE58E8E5F4360FFLL, 0x3FB59E6D9AB61B65, 0x3F8E7F0ABDCF9CFALL, 0x3FB73315A5A6D043, 0x3FE7053603937997);
  CMatrix::inverse((CMatrix *)v67, (unsigned int *)v66);
  CMatrix::operator*((unsigned int *)v66, v53, (unsigned int *)v65);
  CMatrix::operator*((unsigned int *)v65, v67, v46);
  inputImage = self->inputImage;
  v67[0] = CMatrix::operator[](v46, 0);
  v67[1] = v29;
  v30 = *(double *)CMatrixRow::operator[]((uint64_t)v67, 0);
  v66[0] = CMatrix::operator[](v46, 0);
  v66[1] = v31;
  v32 = *(double *)CMatrixRow::operator[]((uint64_t)v66, 1u);
  v65[0] = CMatrix::operator[](v46, 0);
  v65[1] = v33;
  v34 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v30, v32, *(double *)CMatrixRow::operator[]((uint64_t)v65, 2u));
  v64[0] = CMatrix::operator[](v46, 1u);
  v64[1] = v35;
  v36 = *(double *)CMatrixRow::operator[]((uint64_t)v64, 0);
  v63[0] = CMatrix::operator[](v46, 1u);
  v63[1] = v37;
  v38 = *(double *)CMatrixRow::operator[]((uint64_t)v63, 1u);
  v56 = CMatrix::operator[](v46, 1u);
  v57 = v39;
  v40 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v36, v38, *(double *)CMatrixRow::operator[]((uint64_t)&v56, 2u));
  v55[0] = CMatrix::operator[](v46, 2u);
  v55[1] = v41;
  v42 = *(double *)CMatrixRow::operator[]((uint64_t)v55, 0);
  v54[0] = CMatrix::operator[](v46, 2u);
  v54[1] = v43;
  v44 = *(double *)CMatrixRow::operator[]((uint64_t)v54, 1u);
  v53[0] = CMatrix::operator[](v46, 2u);
  v53[1] = v45;
  return -[CIImage filteredImage:keysAndValues:](inputImage, "filteredImage:keysAndValues:", CFSTR("CIColorMatrix"), CFSTR("inputRVector"), v34, CFSTR("inputGVector"), v40, CFSTR("inputBVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v42, v44, *(double *)CMatrixRow::operator[]((uint64_t)v53, 2u)), CFSTR("inputAVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), CFSTR("inputBiasVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, 0.0, 0.0), 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputTargetNeutral
{
  return self->inputTargetNeutral;
}

- (void)setInputTargetNeutral:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
