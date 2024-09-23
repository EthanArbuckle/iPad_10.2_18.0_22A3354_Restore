@implementation C3DAuthoringEnvironmentDrawStats

uint64_t __C3DAuthoringEnvironmentDrawStats_block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD *a4)
{
  char *v7;
  float v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  _DWORD *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _DWORD *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _DWORD *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t result;
  double v31;
  _DWORD *v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  *a2 = 7;
  v7 = (char *)malloc_type_malloc(0x70uLL, 0x1000040451B5BE8uLL);
  *a4 = v7;
  *(_DWORD *)v7 = 0;
  *(_QWORD *)(v7 + 12) = 0x4180000041800000;
  *(_QWORD *)(v7 + 4) = 0x4180000000000000;
  *((_DWORD *)v7 + 7) = 1098907648;
  *(_QWORD *)(v7 + 20) = 0x4180000000000000;
  v8 = (float)(*((float *)v7 + 6) + 16.0) + 1.0;
  *((float *)v7 + 8) = v8;
  *(_QWORD *)(v7 + 36) = 0x4120000000000000;
  *((_DWORD *)v7 + 11) = 1092616192;
  v9 = (float)(v8 + 10.0);
  v10 = __statisticsFont();
  v11 = *MEMORY[0x1E0CEA0A0];
  v36[0] = *MEMORY[0x1E0CEA098];
  v36[1] = v11;
  v37[0] = v10;
  v37[1] = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  objc_msgSend(CFSTR("◆"), "boundingRectWithSize:options:attributes:context:", 3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0, 1000.0, 1000.0);
  *(float *)&v12 = v12 + 1.0 + v9;
  v13 = (_DWORD *)*a4;
  *(float *)&v14 = v14 + -1.0;
  v13[12] = LODWORD(v12);
  v13[13] = LODWORD(v14);
  *(float *)&v14 = v15;
  *(float *)&v15 = v16;
  v13[14] = LODWORD(v14);
  v13[15] = LODWORD(v15);
  v17 = (float)(*(float *)&v14 + *(float *)&v12);
  objc_msgSend(CFSTR("▲"), "boundingRectWithSize:options:attributes:context:", 3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0, 1000.0, 1000.0);
  *(float *)&v18 = v18 + v17;
  v19 = (_DWORD *)*a4;
  *(float *)&v20 = v20 + -1.0;
  v19[16] = LODWORD(v18);
  v19[17] = LODWORD(v20);
  *(float *)&v20 = v21;
  *(float *)&v21 = v22;
  v19[18] = LODWORD(v20);
  v19[19] = LODWORD(v21);
  v23 = (float)(*(float *)&v20 + *(float *)&v18);
  objc_msgSend(CFSTR("."), "boundingRectWithSize:options:attributes:context:", 3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0, 1000.0, 1000.0);
  *(float *)&v24 = v24 + v23;
  v25 = (_DWORD *)*a4;
  *(float *)&v26 = v26 + -3.0;
  v25[20] = LODWORD(v24);
  v25[21] = LODWORD(v26);
  *(float *)&v26 = v27;
  *(float *)&v27 = v28;
  v25[22] = LODWORD(v26);
  v25[23] = LODWORD(v27);
  v29 = (float)(*(float *)&v26 + *(float *)&v24);
  result = objc_msgSend(CFSTR("✸"), "boundingRectWithSize:options:attributes:context:", 3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0, 1000.0, 1000.0);
  *(float *)&v31 = v31 + v29;
  v32 = (_DWORD *)*a4;
  *(float *)&v33 = v33 + -1.0;
  v32[24] = LODWORD(v31);
  v32[25] = LODWORD(v33);
  *(float *)&v33 = v34;
  *(float *)&v34 = v35;
  v32[26] = LODWORD(v33);
  v32[27] = LODWORD(v34);
  *(double *)a3 = (float)(*(float *)&v33 + *(float *)&v31) + 32.0;
  *(_QWORD *)(a3 + 8) = 0x4030000000000000;
  return result;
}

void __C3DAuthoringEnvironmentDrawStats_block_invoke_2(uint64_t a1, double a2, double a3)
{
  void *v5;
  void *v6;
  CGContext *CurrentContext;
  id v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("+"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v5, "drawAtPoint:", 0.0, 0.0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("-"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v6, "drawAtPoint:", 16.0, 0.0);

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", 33.0, 0.0, 10.0, 10.0), "fill");
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, 4.0 - a3);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("◆▲.✸"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v8, "drawAtPoint:", 44.0, 0.0);

}

@end
