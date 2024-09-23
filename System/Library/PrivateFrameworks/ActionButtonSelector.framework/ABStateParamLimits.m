@implementation ABStateParamLimits

void __ABStateParamLimits_block_invoke()
{
  ABParameterLimits *v0;
  ABParameterLimits *v1;
  ABParameterLimits *v2;
  ABParameterLimits *v3;
  char *v4;
  void *v5;
  ABParameterLimits *v6;
  char *v7;
  void *v8;
  ABParameterLimits *v9;
  char *v10;
  void *v11;
  ABParameterLimits *v12;
  char *v13;
  void *v14;
  ABParameterLimits *v15;
  char *v16;
  void *v17;
  ABParameterLimits *v18;
  char *v19;
  void *v20;
  ABParameterLimits *v21;
  char *v22;
  void *v23;
  ABParameterLimits *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  ABParameterLimits *v29;
  ABParameterLimits *v30;
  ABParameterLimits *v31;
  objc_super v32;
  _QWORD v33[11];
  _QWORD v34[13];

  v34[11] = *MEMORY[0x24BDAC8D0];
  v33[0] = CFSTR("Scale");
  v0 = [ABParameterLimits alloc];
  if (v0)
  {
    v32.receiver = v0;
    v32.super_class = (Class)ABParameterLimits;
    v0 = (ABParameterLimits *)objc_msgSendSuper2(&v32, sel_init);
    if (v0)
      *(_OWORD *)&v0->_minValue = xmmword_235E80AE0;
  }
  v31 = v0;
  v34[0] = v0;
  v33[1] = CFSTR("Damping");
  v1 = [ABParameterLimits alloc];
  if (v1)
  {
    v32.receiver = v1;
    v32.super_class = (Class)ABParameterLimits;
    v1 = (ABParameterLimits *)objc_msgSendSuper2(&v32, sel_init);
    if (v1)
      *(_OWORD *)&v1->_minValue = xmmword_235E80AF0;
  }
  v30 = v1;
  v34[1] = v1;
  v33[2] = CFSTR("DampingSmooth");
  v2 = [ABParameterLimits alloc];
  if (v2)
  {
    v32.receiver = v2;
    v32.super_class = (Class)ABParameterLimits;
    v2 = (ABParameterLimits *)objc_msgSendSuper2(&v32, sel_init);
    if (v2)
      *(_OWORD *)&v2->_minValue = xmmword_235E80AF0;
  }
  v29 = v2;
  v34[2] = v2;
  v33[3] = CFSTR("Response");
  v3 = [ABParameterLimits alloc];
  if (v3)
  {
    v32.receiver = v3;
    v32.super_class = (Class)ABParameterLimits;
    v4 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v5 = v4;
    if (v4)
      *(_OWORD *)(v4 + 8) = xmmword_235E80AF0;
  }
  else
  {
    v5 = 0;
  }
  v34[3] = v5;
  v33[4] = CFSTR("ResponseSmooth");
  v6 = [ABParameterLimits alloc];
  if (v6)
  {
    v32.receiver = v6;
    v32.super_class = (Class)ABParameterLimits;
    v7 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v8 = v7;
    if (v7)
      *(_OWORD *)(v7 + 8) = xmmword_235E80AF0;
  }
  else
  {
    v8 = 0;
  }
  v34[4] = v8;
  v33[5] = CFSTR("TimeFactor");
  v9 = [ABParameterLimits alloc];
  if (v9)
  {
    v32.receiver = v9;
    v32.super_class = (Class)ABParameterLimits;
    v10 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v11 = v10;
    if (v10)
      *(_OWORD *)(v10 + 8) = xmmword_235E80AF0;
  }
  else
  {
    v11 = 0;
  }
  v34[5] = v11;
  v33[6] = CFSTR("FocusDistance");
  v12 = [ABParameterLimits alloc];
  if (v12)
  {
    v32.receiver = v12;
    v32.super_class = (Class)ABParameterLimits;
    v13 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v14 = v13;
    if (v13)
      *(_OWORD *)(v13 + 8) = xmmword_235E80AE0;
  }
  else
  {
    v14 = 0;
  }
  v34[6] = v14;
  v33[7] = CFSTR("FocalLength");
  v15 = [ABParameterLimits alloc];
  if (v15)
  {
    v32.receiver = v15;
    v32.super_class = (Class)ABParameterLimits;
    v16 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v17 = v16;
    if (v16)
      *(_OWORD *)(v16 + 8) = xmmword_235E80AE0;
  }
  else
  {
    v17 = 0;
  }
  v34[7] = v17;
  v33[8] = CFSTR("ApertureBlades");
  v18 = [ABParameterLimits alloc];
  if (v18)
  {
    v32.receiver = v18;
    v32.super_class = (Class)ABParameterLimits;
    v19 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v20 = v19;
    if (v19)
      *(_OWORD *)(v19 + 8) = xmmword_235E80AF0;
  }
  else
  {
    v20 = 0;
  }
  v34[8] = v20;
  v33[9] = CFSTR("fStop");
  v21 = [ABParameterLimits alloc];
  if (v21)
  {
    v32.receiver = v21;
    v32.super_class = (Class)ABParameterLimits;
    v22 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v23 = v22;
    if (v22)
      *(_OWORD *)(v22 + 8) = xmmword_235E80AE0;
  }
  else
  {
    v23 = 0;
  }
  v34[9] = v23;
  v33[10] = CFSTR("LightingIntensity");
  v24 = [ABParameterLimits alloc];
  if (v24)
  {
    v32.receiver = v24;
    v32.super_class = (Class)ABParameterLimits;
    v25 = (char *)objc_msgSendSuper2(&v32, sel_init);
    v26 = v25;
    if (v25)
      *(_OWORD *)(v25 + 8) = xmmword_235E80AF0;
  }
  else
  {
    v26 = 0;
  }
  v34[10] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 11);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)ABStateParamLimits_limits;
  ABStateParamLimits_limits = v27;

}

@end
