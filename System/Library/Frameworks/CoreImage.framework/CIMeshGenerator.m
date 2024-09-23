@implementation CIMeshGenerator

+ (id)customAttributes
{
  uint64_t v3;
  CIColor *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryGenerator");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryHighDynamicRange");
  v7[4] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v9[1] = CFSTR("12");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.14");
  v8[3] = CFSTR("inputWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A310;
  v6[1] = &unk_1E2F1A320;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A330;
  v6[3] = &unk_1E2F1A340;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputColor");
  v4 = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0, CFSTR("CIAttributeDefault"));
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)_CIMesh1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mesh1);
}

- (id)_CIMesh2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mesh2);
}

- (id)_CIMesh4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mesh4);
}

- (id)_CIMesh8
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mesh8);
}

- (id)_CIMesh16
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mesh16);
}

- (id)_CIMesh32
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mesh32);
}

- (CGRect)extentOfMeshStart:(int)a3 count:(int)a4 halfWidth:(double)a5
{
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CGRect result;

  if (a4 < 1)
  {
    v39 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
    v42 = 0.0;
  }
  else
  {
    v45 = v20;
    v46 = v19;
    v47 = v18;
    v48 = v17;
    v49 = v16;
    v50 = v15;
    v51 = v14;
    v52 = v13;
    v53 = v10;
    v54 = v9;
    v55 = v8;
    v56 = v7;
    v57 = v6;
    v58 = v5;
    v59 = v11;
    v60 = v12;
    v23 = 0;
    v24 = a3;
    v25 = a4;
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
    do
    {
      v30 = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", v24 + v23, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60);
      objc_msgSend(v30, "X");
      v32 = v31;
      objc_msgSend(v30, "Y");
      v34 = v33;
      objc_msgSend(v30, "Z");
      v36 = v35;
      objc_msgSend(v30, "W");
      v38 = v37;
      v39 = fmin(v32, v36) - a5;
      v40 = fmax(v32, v36) + a5;
      v41 = fmin(v34, v38) - a5;
      v42 = fmax(v34, v38) + a5;
      if (v23)
      {
        if (v39 >= v29)
          v39 = v29;
        if (v40 <= v28)
          v40 = v28;
        if (v41 >= v27)
          v41 = v27;
        if (v42 <= v26)
          v42 = v26;
      }
      ++v23;
      v26 = v42;
      v27 = v41;
      v28 = v40;
      v29 = v39;
    }
    while (v25 != v23);
  }
  v43 = v40 - v39;
  v44 = v42 - v41;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v41;
  result.origin.x = v39;
  return result;
}

- (id)outputImage
{
  float v3;
  float v4;
  double v5;
  float v6;
  int v7;
  int v8;
  float v9;
  void *v10;
  uint64_t v11;
  int v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t i;
  id v23;
  uint64_t v24;
  CIColor *inputColor;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t j;
  id v37;
  uint64_t v38;
  CIColor *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t k;
  id v51;
  uint64_t v52;
  CIColor *v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t m;
  id v65;
  uint64_t v66;
  CIColor *v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  id v78;
  uint64_t v79;
  CIColor *v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  id v91;
  id v92;
  uint64_t v93;
  CIColor *v94;
  double v95;
  void *v96;
  _QWORD v97[4];
  __int128 v98;
  uint64_t v99;
  CIColor *v100;
  uint64_t v101;
  _OWORD v102[2];
  uint64_t v103;
  CIColor *v104;
  uint64_t v105;
  _OWORD v106[4];
  uint64_t v107;
  CIColor *v108;
  uint64_t v109;
  _OWORD v110[8];
  uint64_t v111;
  CIColor *v112;
  uint64_t v113;
  _OWORD v114[16];
  uint64_t v115;
  CIColor *v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
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
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = v3 * 0.5;
  if ((float)(v3 * 0.5) < 0.001)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIColor alpha](self->inputColor, "alpha");
  *(float *)&v5 = v5;
  if (*(float *)&v5 < 0.00001)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v6 = v4 >= 1.0 ? v4 : 1.0;
  v7 = -[NSArray count](self->inputMesh, "count");
  v8 = v7;
  if (v7 < 1)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v9 = fminf(v4, 1.0);
  if (v7 >= 0x20)
  {
    v11 = 0;
    v10 = 0;
    do
    {
      -[CIMeshGenerator extentOfMeshStart:count:halfWidth:](self, "extentOfMeshStart:count:halfWidth:", v11, 32, v6);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      for (i = 0; i != 32; ++i)
        *((_QWORD *)&v118 + i) = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", v11 + i);
      v23 = -[CIMeshGenerator _CIMesh32](self, "_CIMesh32");
      v114[0] = v118;
      v114[1] = v119;
      v114[2] = v120;
      v114[3] = v121;
      v114[4] = v122;
      v114[5] = v123;
      v114[6] = v124;
      v114[7] = v125;
      v114[8] = v126;
      v114[9] = v127;
      v114[10] = v128;
      v114[11] = v129;
      v114[12] = v130;
      v114[13] = v131;
      v114[14] = v132;
      v114[15] = v133;
      v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
      inputColor = self->inputColor;
      v115 = v24;
      v116 = inputColor;
      *(float *)&v26 = v9;
      v117 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
      v27 = (void *)objc_msgSend(v23, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 35), v15, v17, v19, v21);
      if (v10)
        v27 = (void *)objc_msgSend(v27, "imageByCompositingOverImage:", v10);
      v10 = v27;
      v11 += 32;
      v12 = v8 - v11;
    }
    while (v8 > (int)v11 && v12 > 31);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = v7;
  }
  if (v12 >= 16)
  {
    -[CIMeshGenerator extentOfMeshStart:count:halfWidth:](self, "extentOfMeshStart:count:halfWidth:", v11, 16, v6);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    for (j = 0; j != 16; ++j)
      *((_QWORD *)&v118 + j) = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", v11 + j);
    v37 = -[CIMeshGenerator _CIMesh16](self, "_CIMesh16");
    v110[0] = v118;
    v110[1] = v119;
    v110[2] = v120;
    v110[3] = v121;
    v110[4] = v122;
    v110[5] = v123;
    v110[6] = v124;
    v110[7] = v125;
    v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
    v39 = self->inputColor;
    v111 = v38;
    v112 = v39;
    *(float *)&v40 = v9;
    v113 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
    v41 = (void *)objc_msgSend(v37, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 19), v29, v31, v33, v35);
    if (v10)
      v41 = (void *)objc_msgSend(v41, "imageByCompositingOverImage:", v10);
    v12 -= 16;
    v11 = v11 | 0x10;
    v10 = v41;
  }
  if (v12 >= 8)
  {
    -[CIMeshGenerator extentOfMeshStart:count:halfWidth:](self, "extentOfMeshStart:count:halfWidth:", v11, 8, v6);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    for (k = 0; k != 8; ++k)
      *((_QWORD *)&v118 + k) = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", (int)v11 + k);
    v51 = -[CIMeshGenerator _CIMesh8](self, "_CIMesh8");
    v106[0] = v118;
    v106[1] = v119;
    v106[2] = v120;
    v106[3] = v121;
    v52 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
    v53 = self->inputColor;
    v107 = v52;
    v108 = v53;
    *(float *)&v54 = v9;
    v109 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
    v55 = (void *)objc_msgSend(v51, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 11), v43, v45, v47, v49);
    if (v10)
      v55 = (void *)objc_msgSend(v55, "imageByCompositingOverImage:", v10);
    v12 -= 8;
    v11 = (v11 + 8);
    v10 = v55;
  }
  if (v12 >= 4)
  {
    -[CIMeshGenerator extentOfMeshStart:count:halfWidth:](self, "extentOfMeshStart:count:halfWidth:", v11, 4, v6);
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    for (m = 0; m != 4; ++m)
      *((_QWORD *)&v118 + m) = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", (int)v11 + m);
    v65 = -[CIMeshGenerator _CIMesh4](self, "_CIMesh4");
    v102[0] = v118;
    v102[1] = v119;
    v66 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
    v67 = self->inputColor;
    v103 = v66;
    v104 = v67;
    *(float *)&v68 = v9;
    v105 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
    v69 = (void *)objc_msgSend(v65, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 7), v57, v59, v61, v63);
    if (v10)
      v69 = (void *)objc_msgSend(v69, "imageByCompositingOverImage:", v10);
    v12 -= 4;
    v11 = (v11 + 4);
    v10 = v69;
  }
  if (v12 > 1)
  {
    -[CIMeshGenerator extentOfMeshStart:count:halfWidth:](self, "extentOfMeshStart:count:halfWidth:", v11, 2, v6);
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;
    *(_QWORD *)&v118 = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", (int)v11);
    *((_QWORD *)&v118 + 1) = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", (int)v11 + 1);
    v78 = -[CIMeshGenerator _CIMesh2](self, "_CIMesh2");
    v98 = v118;
    v79 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
    v80 = self->inputColor;
    v99 = v79;
    v100 = v80;
    *(float *)&v81 = v9;
    v101 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v81);
    v82 = (void *)objc_msgSend(v78, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 5), v71, v73, v75, v77);
    if (v10)
      v82 = (void *)objc_msgSend(v82, "imageByCompositingOverImage:", v10);
    v11 = (v11 + 2);
    v12 -= 2;
    v10 = v82;
  }
  if (v12 >= 1)
  {
    -[CIMeshGenerator extentOfMeshStart:count:halfWidth:](self, "extentOfMeshStart:count:halfWidth:", v11, 1, v6);
    v84 = v83;
    v86 = v85;
    v88 = v87;
    v90 = v89;
    v91 = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", (int)v11);
    *(_QWORD *)&v118 = v91;
    v92 = -[CIMeshGenerator _CIMesh1](self, "_CIMesh1");
    v97[0] = v91;
    v93 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
    v94 = self->inputColor;
    v97[1] = v93;
    v97[2] = v94;
    *(float *)&v95 = v9;
    v97[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v95);
    v96 = (void *)objc_msgSend(v92, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 4), v84, v86, v88, v90);
    if (v10)
      return (id)objc_msgSend(v96, "imageByCompositingOverImage:", v10);
    return v96;
  }
  return v10;
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSArray)inputMesh
{
  return self->inputMesh;
}

- (void)setInputMesh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
