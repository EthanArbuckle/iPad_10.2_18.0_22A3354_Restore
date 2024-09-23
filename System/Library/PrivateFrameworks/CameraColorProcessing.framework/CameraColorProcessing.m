void sub_2308EAC40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  MEMORY[0x2348BC8E0](v4, 0x10F1C407C02B2AFLL);

  _Unwind_Resume(a1);
}

void CAWBAFEH14::CAWBAFEH14(CAWBAFEH14 *this, const char *a2, CObject *a3)
{
  char *v5;
  void (**v6)(CAWBAFEH14 *__hidden);
  _QWORD *v7;

  v5 = (char *)this + 21191;
  CAWBAFE::CAWBAFE((CAWBAFE *)this, a2, a3);
  v6 = &off_24FEC6090;
  *v7 = &off_24FEC6090;
  if (v5[2697] >= 0x32u)
  {
    printf("MSG: AWB RESET: CAWBAFEH14::CAWBAFEH14 name(%s)\n", a2);
    v6 = *(void (***)(CAWBAFEH14 *__hidden))this;
  }
  *v5 = 1;
  ((void (*)(CAWBAFEH14 *, uint64_t))v6[2])(this, 1);
}

void sub_2308EAD00(_Unwind_Exception *a1)
{
  CAWBAFE *v1;

  CAWBAFE::~CAWBAFE(v1);
  _Unwind_Resume(a1);
}

void CAWBAFE::CAWBAFE(CAWBAFE *this, const char *a2, CObject *a3)
{
  BOOL *p_var82;
  CDualLEDsWhitePointProjector *v5;
  CAWBAFEFDAssist *v6;
  fdAWBMetaData *v7;
  CAWBAFEPhotometerAssistPenrose *v8;

  p_var82 = &this->var82;
  CObject::CObject((CObject *)&this->var1);
  this->var0 = (void **)off_24FEC61E8;
  *p_var82 = 0;
  p_var82[3184] = 0;
  v5 = (CDualLEDsWhitePointProjector *)operator new();
  CDualLEDsWhitePointProjector::CDualLEDsWhitePointProjector(v5);
  this->var2 = v5;
  v6 = (CAWBAFEFDAssist *)operator new();
  CAWBAFEFDAssist::CAWBAFEFDAssist(v6, 1);
  this->var4 = v6;
  v7 = (fdAWBMetaData *)malloc_type_calloc(1uLL, 0xC80uLL, 0x106004042EFCC3AuLL);
  this->var112 = v7;
  if (v7)
    *((_QWORD *)v7 + 382) = 0;
  *(_QWORD *)&this->var141.var3.var6 = 0;
  *(_OWORD *)this->var141.var3.var2 = 0u;
  *(_OWORD *)&this->var141.var3.var3[1] = 0u;
  *(_OWORD *)&this->var141.var0 = 0u;
  v8 = (CAWBAFEPhotometerAssistPenrose *)operator new();
  CAWBAFEPhotometerAssistPenrose::CAWBAFEPhotometerAssistPenrose(v8, 1);
  this->var5 = v8;
  this->var6 = (sPhotometerAWBMetadata *)malloc_type_calloc(1uLL, 0x13CuLL, 0x1000040CB74CE18uLL);
}

void sub_2308EAE2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348BC8E0](v1, 0x10E1C40E14DAD52);
  _Unwind_Resume(a1);
}

void CObject::CObject(CObject *this)
{
  *(_DWORD *)this = 0;
}

BOOL CAWBAFE::InitialReset(CAWBAFE *this, BOOL a2)
{
  sTuningCurvePoint *p_var99;
  unsigned __int8 *p_var67;
  unsigned __int16 *p_var62;
  BOOL *p_var48;
  unsigned int *p_var20;
  fdAWBMetaData *var112;
  sPhotometerAWBMetadata *var6;

  p_var99 = &this->var99;
  p_var67 = &this->var67;
  p_var62 = &this->var62;
  this->var125 = 0;
  p_var48 = &this->var48;
  p_var20 = &this->var20;
  this->var83 = 0;
  this->var127 = 0;
  this->var51 = 0.5;
  bzero(this->var52, 0x1000uLL);
  *(_DWORD *)&this->var17 = 1114128;
  this->var15 = 1;
  this->var26 = a2;
  *(_QWORD *)&this->var109 = 0;
  this->var25 = 100;
  *((_WORD *)p_var67 + 22) = 2560;
  *((_DWORD *)p_var67 + 3) = 1065353216;
  *((_QWORD *)p_var67 + 2) = 0x1000100010001;
  *((_DWORD *)p_var67 + 1) = 65537;
  *((_WORD *)p_var67 + 4) = 1;
  var112 = this->var112;
  if (var112)
  {
    *(_DWORD *)((char *)var112 + 1598) = 0;
    *((_QWORD *)var112 + 382) = 0;
    *((_OWORD *)var112 + 194) = 0uLL;
    *((_DWORD *)var112 + 780) = 0;
    *((_DWORD *)var112 + 795) = 4;
    *((_QWORD *)var112 + 384) = 0;
    *((_QWORD *)this->var112 + 383) = 0;
    *((_QWORD *)this->var112 + 386) = 0;
    *((_QWORD *)this->var112 + 385) = 0;
  }
  bzero(this->var140, 0x300uLL);
  this->var37 = 4000;
  this->var29 = 4000;
  *(_OWORD *)p_var20 = xmmword_23092FC30;
  *((_OWORD *)p_var20 + 1) = xmmword_23092FC40;
  *((_OWORD *)p_var20 + 2) = xmmword_23092FC50;
  *((_OWORD *)p_var20 + 3) = xmmword_23092FC60;
  *((_OWORD *)p_var20 + 4) = xmmword_23092FC70;
  this->var24[1][1] = 6600;
  *(_OWORD *)&this->var24[1][2] = xmmword_23092FC60;
  __asm { FMOV            V0.2S, #15.5 }
  *(_QWORD *)&this->var40 = _D0;
  *(_QWORD *)this->var111 = 0x100000001DBBLL;
  p_var99[2].var2[0] = 9183;
  *(_QWORD *)this->var78 = 0x100000001DBBLL;
  *(_QWORD *)(p_var67 + 36) = 9183;
  *(_DWORD *)&this->var33[1] = 268439552;
  *((_QWORD *)p_var20 + 15) = 0x100023DF10001DBBLL;
  *((_DWORD *)p_var67 + 88) = 1073758208;
  *((_QWORD *)p_var67 + 48) = 0xB400000100;
  p_var67[24] = 0;
  *(_QWORD *)&this->var35 = 0x400F7C003FEDD800;
  *(_OWORD *)this->var133 = 0u;
  *(_OWORD *)&this->var133[4] = 0u;
  *(_OWORD *)&this->var134[2] = 0u;
  *((_QWORD *)p_var67 + 43) = 0x4000400040004000;
  memset(this->var65, 1, sizeof(this->var65));
  *(_QWORD *)this->var66 = 0x5DC0190003C0001;
  *(_DWORD *)&this->var66[4] = 1310726400;
  *p_var67 = 6;
  *(_OWORD *)&this->var84[16][0] = xmmword_23092DCFC;
  *(_OWORD *)&this->var84[20][0] = unk_23092DD0C;
  *(_OWORD *)&this->var84[24][0] = xmmword_23092DD1C;
  *(_QWORD *)&this->var84[28][0] = 0x117C0C08117C0C62;
  *(_OWORD *)&this->var84[0][0] = projPosDefault;
  *(_OWORD *)&this->var84[4][0] = unk_23092DCCC;
  *(_OWORD *)&this->var84[8][0] = xmmword_23092DCDC;
  *(_OWORD *)&this->var84[12][0] = unk_23092DCEC;
  *(_OWORD *)&this->var132[16][0] = xmmword_23092DD74;
  *(_OWORD *)&this->var132[20][0] = unk_23092DD84;
  *(_OWORD *)&this->var132[24][0] = xmmword_23092DD94;
  *(_QWORD *)&this->var132[28][0] = 0x113E0BEB113E0C44;
  *(_OWORD *)&this->var132[0][0] = dayProjPosDefault;
  *(_OWORD *)&this->var132[4][0] = unk_23092DD44;
  *(_OWORD *)&this->var132[8][0] = xmmword_23092DD54;
  *(_OWORD *)&this->var132[12][0] = unk_23092DD64;
  *(_OWORD *)&this->var86[2][2] = unk_23092DDC8;
  *(_OWORD *)&this->var86[5][1] = xmmword_23092DDD8;
  *(_OWORD *)&this->var86[0][0] = x2CCTLutDefault;
  *(_OWORD *)&this->var88[0][0] = ccm2DCoefficientDefault;
  *(_OWORD *)&this->var88[0][8] = unk_23092DDF8;
  *(_OWORD *)&this->var88[5][1] = unk_23092DE44;
  *(_OWORD *)&this->var88[3][5] = xmmword_23092DE28;
  *(_OWORD *)&this->var88[4][4] = unk_23092DE38;
  *(_OWORD *)&this->var88[1][7] = xmmword_23092DE08;
  *(_OWORD *)&this->var88[2][6] = unk_23092DE18;
  *(_OWORD *)&this->var54[2][0] = unk_23092E066;
  *(_OWORD *)&this->var54[4][0] = xmmword_23092E076;
  *(_OWORD *)&this->var54[0][0] = awbPostTintParamDefault;
  *p_var62 = ccmLuxClipDefault;
  this->var14.var3 = 64;
  this->var14.var5 = 256;
  *((_DWORD *)p_var67 + 45) = 30;
  *((_DWORD *)p_var67 + 58) = 8;
  this->var55[2] = 4381;
  *(_DWORD *)this->var55 = 314510488;
  this->var56[8] = 800;
  *(_OWORD *)this->var56 = awbMixLightingParam_ccmDefault;
  *(_DWORD *)this->var57 = -587202304;
  *(_DWORD *)this->var58 = 131073;
  *(_OWORD *)&this->var59[5] = *(__int128 *)((char *)&awbHistTrimFilterVDefault + 10);
  *(_OWORD *)this->var59 = awbHistTrimFilterVDefault;
  this->var60[2] = 64;
  *(_DWORD *)this->var60 = 8388672;
  *(_OWORD *)&this->var61[16] = xmmword_23092E0E6;
  *(_OWORD *)&this->var61[24] = unk_23092E0F6;
  *(_OWORD *)this->var61 = awbHistTrimScaleProfileDefault;
  *(_OWORD *)&this->var61[8] = unk_23092E0D6;
  memcpy(&this->var3, &ledWhitePointProjectionConfigDefault, sizeof(this->var3));
  *(_QWORD *)this->var136 = 0x8B608B608B60780;
  *(_DWORD *)&this->var136[4] = 192022957;
  p_var99[20].var1[6] = 106;
  memcpy(this->var113, &skin2whiteLUTDefault, 0x350uLL);
  var6 = this->var6;
  if (var6)
  {
    *((_OWORD *)var6 + 17) = 0u;
    *((_OWORD *)var6 + 18) = 0u;
    *((_OWORD *)var6 + 15) = 0u;
    *((_OWORD *)var6 + 16) = 0u;
    *((_OWORD *)var6 + 13) = 0u;
    *((_OWORD *)var6 + 14) = 0u;
    *((_OWORD *)var6 + 11) = 0u;
    *((_OWORD *)var6 + 12) = 0u;
    *((_OWORD *)var6 + 9) = 0u;
    *((_OWORD *)var6 + 10) = 0u;
    *((_OWORD *)var6 + 7) = 0u;
    *((_OWORD *)var6 + 8) = 0u;
    *((_OWORD *)var6 + 5) = 0u;
    *((_OWORD *)var6 + 6) = 0u;
    *((_OWORD *)var6 + 3) = 0u;
    *((_OWORD *)var6 + 4) = 0u;
    *((_OWORD *)var6 + 1) = 0u;
    *((_OWORD *)var6 + 2) = 0u;
    *(_OWORD *)var6 = 0u;
    *(_OWORD *)((char *)var6 + 300) = 0u;
  }
  LOBYTE(p_var99[25].var1[2]) = 0;
  *p_var48 = 0;
  BYTE1(p_var99[20].var1[7]) = 0;
  LOBYTE(p_var99[29].var1[1]) = 0;
  *(unsigned int *)((char *)&p_var99[2].var1[1] + 1) = 0;
  p_var99->var0 = 3;
  memcpy(this->var99.var1, &unk_23092E45C, 0xCuLL);
  memcpy(this->var99.var2, &unk_23092E47C, 0xCuLL);
  *(_OWORD *)&this->var100.var1[7] = xmmword_23092E4BC;
  *(_OWORD *)&this->var100.var2[3] = unk_23092E4CC;
  this->var100.var2[7] = 0;
  *(_OWORD *)&this->var100.var0 = defaultCCMStrengthTuningTable;
  *(_OWORD *)&this->var100.var1[3] = unk_23092E4AC;
  LOBYTE(p_var99[2].var1[1]) = 0;
  p_var99[2].var1[0] = 0;
  memcpy(&this->var117, &defaultWPStabeZoneControlTable, sizeof(this->var117));
  *(_OWORD *)&this->var141.var0 = 0u;
  *(_OWORD *)this->var141.var3.var2 = 0u;
  *(_OWORD *)&this->var141.var3.var3[1] = 0u;
  *(_OWORD *)&this->var141.var3.var5 = 0u;
  return this->var2 && this->var4 && this->var5 && this->var6 && this->var112 != 0;
}

void CAWBAFEPhotometerAssistPenrose::CAWBAFEPhotometerAssistPenrose(CAWBAFEPhotometerAssistPenrose *this, char a2)
{
  uint64_t v3;

  CAWBAFEPhotometerAssistPenrose::CAWBAFEPhotometerAssistPenrose(this);
  *(_BYTE *)(v3 + 32) = a2;
}

void CAWBAFEPhotometerAssistPenrose::CAWBAFEPhotometerAssistPenrose(CAWBAFEPhotometerAssistPenrose *this)
{
  unsigned __int8 v2;
  void *v3;
  int v4;
  char v5;
  int v6;

  *(_QWORD *)this = &off_24FEC61C8;
  *((_QWORD *)this + 3) = &tfChromaHistTuningParamsDefault;
  *((_BYTE *)this + 8) = 0;
  {
    CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
  }
  v3 = &photometerTuningParamsPenroseJ5x;
  v4 = 3;
  if (dword_2540627FC <= 65)
  {
    if (dword_2540627FC > 29)
    {
      if ((dword_2540627FC - 51) < 4 || (dword_2540627FC - 30) < 2)
      {
LABEL_24:
        *((_BYTE *)this + 8) = 1;
        goto LABEL_25;
      }
      if (dword_2540627FC == 55)
        goto LABEL_21;
LABEL_28:
      v4 = 0;
      v3 = &photometerTuningParamsDefault;
      goto LABEL_27;
    }
    if ((dword_2540627FC - 19) >= 4 && (dword_2540627FC - 26) >= 2)
    {
      if (dword_2540627FC != 13)
        goto LABEL_28;
      v3 = &photometerTuningParamsHawking;
      v4 = 1;
    }
  }
  else
  {
    v5 = dword_2540627FC - 69;
    if ((dword_2540627FC - 69) > 0x22)
      goto LABEL_7;
    if (((1 << v5) & 0xF) != 0)
    {
      *((_BYTE *)this + 8) = 1;
LABEL_25:
      v3 = &photometerTuningParamsPenroseV2_CEPSTRUM;
      goto LABEL_26;
    }
    if (((1 << v5) & 0x780000) == 0)
    {
      if (((1 << v5) & 0x780000000) != 0)
        goto LABEL_21;
LABEL_7:
      if ((dword_2540627FC - 231) <= 0xA)
      {
        v6 = 1 << (dword_2540627FC + 25);
        if ((v6 & 0x6F) != 0)
        {
          *((_BYTE *)this + 8) = 1;
LABEL_22:
          v3 = &photometerTuningParamsPenroseOrangeMask;
LABEL_26:
          v4 = 4;
          goto LABEL_27;
        }
        if ((v6 & 0x600) != 0)
        {
LABEL_21:
          *((_BYTE *)this + 8) = 1;
          goto LABEL_22;
        }
      }
      if ((dword_2540627FC - 66) < 2)
        goto LABEL_24;
      goto LABEL_28;
    }
  }
LABEL_27:
  *((_DWORD *)this + 3) = v4;
  *((_QWORD *)this + 2) = v3;
  *((_BYTE *)this + 32) = 0;
}

void sub_2308EB5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CDualLEDsWhitePointProjector::CDualLEDsWhitePointProjector(CDualLEDsWhitePointProjector *this)
{
  *(_QWORD *)this = &off_24FEC61A8;
  *((_QWORD *)this + 1) = &ledWhitePointProjectionConfigDefault;
  *((_DWORD *)this + 10) = 0;
}

void CAWBAFEFDAssist::CAWBAFEFDAssist(CAWBAFEFDAssist *this, char a2)
{
  *(_QWORD *)this = &off_24FEC6188;
  *((_BYTE *)this + 8) = 0;
  *(_QWORD *)((char *)this + 12) = 0x2000000020;
  *(_OWORD *)((char *)this + 40028) = 0u;
  *(_OWORD *)((char *)this + 40044) = 0u;
  *((_WORD *)this + 20030) = 0;
  *((_BYTE *)this + 40064) = a2;
}

int32x4_t CAWBAFEH14::InitialReset(CAWBAFE *this, BOOL a2)
{
  unsigned __int8 *p_var147;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  int32x4_t result;
  float32x4_t v9;
  int32x4_t v15;

  p_var147 = &this->var147;
  if (this->var147 >= 0x32u)
    puts("MSG: AWB RESET: CAWBAFEH14::InitialReset");
  (*((void (**)(CAWBAFE *))this->var0 + 3))(this);
  CAWBAFE::InitialReset(this, a2);
  v5 = 0;
  *((_DWORD *)p_var147 + 1) = 0;
  p_var147[1] = 1;
  do
  {
    v6 = (_OWORD *)((char *)&this[1] + v5);
    *(_OWORD *)((char *)v6 + 12) = *(__int128 *)((char *)&slaveCameraListColorMatchingModelDefault + 12);
    *v6 = slaveCameraListColorMatchingModelDefault;
    v5 += 28;
  }
  while (v5 != 112);
  v7 = 0;
  result = (int32x4_t)xmmword_23092FA90;
  v9.i64[0] = 0x4000000040000000;
  v9.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #1.0 }
  v15.i64[0] = 0x400000004;
  v15.i64[1] = 0x400000004;
  do
  {
    *(float32x4_t *)((char *)&this[1].var3.var2[0].var4 + v7) = vmlaq_f32(_Q2, v9, vcvtq_f32_s32(result));
    result = vaddq_s32(result, v15);
    v7 += 16;
  }
  while (v7 != 128);
  return result;
}

double CAWBAFE::MinimalReset(CAWBAFE *this)
{
  int v2;
  unsigned __int16 *var126;
  float *p_var101;
  BOOL *p_var45;
  fdAWBMetaData *var112;
  _QWORD *v7;
  fdAWBMetaData *v8;
  fdAWBMetaData *v9;
  sPhotometerAWBMetadata *var6;
  double result;

  if (this->var82)
    v2 = 1;
  else
    v2 = 2;
  this->var81 = v2;
  this->var16 = 0;
  *(_WORD *)&this->var27 = 0;
  var126 = this->var126;
  this->var19 = 0;
  this->var34 = -559038737;
  p_var101 = &this->var101;
  *(_QWORD *)&this->var30 = 3735928559;
  p_var45 = &this->var45;
  *(_WORD *)&this->var118 = 0;
  this->var94 = 0;
  this->var120 = 0;
  this->var68 = 0;
  bzero(&this->var44, 0x105CuLL);
  *(_QWORD *)&this->var46.var8 = 0;
  *(_OWORD *)&this->var46.var0 = 0u;
  *(_OWORD *)&this->var46.var4 = 0u;
  *(_DWORD *)var126 = -217972737;
  var126[2] = -8233;
  *((_DWORD *)var126 + 4) = 0;
  p_var101[4] = 0.0;
  *p_var101 = 1.0;
  var112 = this->var112;
  if (var112)
  {
    *((_DWORD *)var112 + 9) = 0;
    *((_DWORD *)var112 + 11) = -1;
    *((_DWORD *)var112 + 1) = 5;
    *((_BYTE *)var112 + 1596) = 0;
    bzero((char *)var112 + 1604, 0x409uLL);
    v7 = (_QWORD *)((char *)this->var112 + 3164);
    *(_QWORD *)((char *)v7 + 6) = 0;
    *v7 = 0;
    v8 = this->var112;
    *((_BYTE *)v8 + 3160) = 0;
    v8 = (fdAWBMetaData *)((char *)v8 + 2637);
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((_OWORD *)v8 + 8) = 0u;
    *((_OWORD *)v8 + 9) = 0u;
    *((_OWORD *)v8 + 10) = 0u;
    *((_OWORD *)v8 + 11) = 0u;
    *((_OWORD *)v8 + 12) = 0u;
    *((_OWORD *)v8 + 13) = 0u;
    *((_OWORD *)v8 + 14) = 0u;
    *((_OWORD *)v8 + 15) = 0u;
    v9 = this->var112;
    *((_QWORD *)v9 + 382) = 0;
    bzero(this->var140, 0x300uLL);
    *((_DWORD *)v9 + 795) = 4;
  }
  var6 = this->var6;
  if (var6)
  {
    *((_BYTE *)var6 + 212) = 0;
    *(_DWORD *)var6 = 0;
    *((_QWORD *)var6 + 28) = 0;
    *((_QWORD *)var6 + 29) = 0;
    *((_QWORD *)var6 + 27) = 0;
  }
  *((_BYTE *)var126 + 200) = 0;
  *p_var45 = 0;
  result = 0.0;
  *(_OWORD *)&this->var137 = 0u;
  *(_OWORD *)&this->var138[7] = 0u;
  *(_OWORD *)&this->var138[15] = 0u;
  *(_OWORD *)&this->var138[23] = 0u;
  this->var138[31] = 0;
  this->var47 = 1;
  *((_BYTE *)var126 + 1132) = 1;
  *((_DWORD *)var126 + 285) = 2;
  return result;
}

double CAWBAFEH14::MinimalReset(CAWBAFE *this)
{
  if (this->var147 >= 0x32u)
    printf("MSG: AWB RESET: CAWBAFEH14 (%p)::MinimalReset\n", this);
  return CAWBAFE::MinimalReset(this);
}

void LTMCompute::LTMCompute(LTMCompute *this, int a2)
{
  this->var0 = (void **)&off_24FEC6148;
  this->var1 = a2;
  bzero(this->var5, 0x1564uLL);
  this->var2 = (sLtmTuningParams *)&LTMCompute::tuningParamsSDR;
}

void LTMCompute::calculateDisplayModel(LTMCompute *this, float a2, float a3, const float *a4, float *a5)
{
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float32x4_t v17;
  uint64_t i;

  v8 = 0;
  v9 = a2 * 0.015625;
  *((_OWORD *)a5 + 14) = 0u;
  *((_OWORD *)a5 + 15) = 0u;
  *((_OWORD *)a5 + 12) = 0u;
  *((_OWORD *)a5 + 13) = 0u;
  *((_OWORD *)a5 + 10) = 0u;
  *((_OWORD *)a5 + 11) = 0u;
  *((_OWORD *)a5 + 8) = 0u;
  *((_OWORD *)a5 + 9) = 0u;
  *((_OWORD *)a5 + 6) = 0u;
  *((_OWORD *)a5 + 7) = 0u;
  *((_OWORD *)a5 + 4) = 0u;
  *((_OWORD *)a5 + 5) = 0u;
  *((_OWORD *)a5 + 2) = 0u;
  *((_OWORD *)a5 + 3) = 0u;
  *(_OWORD *)a5 = 0u;
  *((_OWORD *)a5 + 1) = 0u;
  a5[64] = 0.0;
  do
  {
    v10 = 0;
    v11 = v8++;
    v12 = a3 + (float)((float)(int)v8 * v9);
    do
    {
      v13 = a3 + (float)((float)(int)v10 * v9);
      v14 = vabds_f32(v13, v12);
      if (v13 >= v12)
      {
        v15 = 8.22;
        v16 = v14 / (float)(v12 + 0.39);
      }
      else
      {
        v15 = -7.07;
        v16 = (float)(v14 * 0.945) / (float)((float)(v13 + 0.39) + (float)(v14 * 0.055));
      }
      a5[v10] = a5[v10] + (float)((float)(v15 * log10f((float)(v16 * 6.58) + 1.0)) * a4[v11]);
      ++v10;
    }
    while (v10 != 65);
  }
  while (v8 != 64);
  v17 = vld1q_dup_f32(a5);
  for (i = 1; i != 65; i += 4)
    *(float32x4_t *)&a5[i] = vsubq_f32(*(float32x4_t *)&a5[i], v17);
  *a5 = 0.0;
}

void LTMCompute::interpolate(LTMCompute *this, float *a2, float *a3, int a4, const float *a5, float *a6, int a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  const float *v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  float v16;
  float v17;

  if (a7 >= 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3 - 1;
    do
    {
      v11 = a5[v7];
      if (v11 <= *a2)
      {
        v17 = *a3;
      }
      else if (v11 >= a2[v9])
      {
        v17 = a3[v9];
      }
      else
      {
        v12 = v8--;
        do
        {
          v13 = v12;
          v14 = a2[v12++];
          ++v8;
        }
        while (v13 < a4 && v11 > v14);
        if (v8 < 1)
          goto LABEL_15;
        v15 = (v12 - 2);
        v16 = a2[v15];
        if (vabds_f32(v14, v16) >= 0.00000011921)
          v17 = a3[v15] + (float)((float)((float)(v11 - v16) / (float)(v14 - v16)) * (float)(v10[v12] - a3[v15]));
        else
          v17 = v10[v12];
      }
      a6[v7] = v17;
LABEL_15:
      ++v7;
    }
    while (v7 != a7);
  }
}

void sub_2308ED2D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CEnvironment::CEnvironment(CEnvironment *this)
{
  CObject::CObject((CEnvironment *)((char *)this + 8));
  *(_QWORD *)this = &off_24FEC6168;
  *((_DWORD *)this + 3) = 0;
}

BOOL useLowerLocalHistogramThreshold()
{
  int (*v0)(void);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (int (*)(void))getFigCapturePlatformIdentifierSymbolLoc_ptr;
  v6 = getFigCapturePlatformIdentifierSymbolLoc_ptr;
  if (!getFigCapturePlatformIdentifierSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getFigCapturePlatformIdentifierSymbolLoc_block_invoke;
    v2[3] = &unk_24FEC6318;
    v2[4] = &v3;
    __getFigCapturePlatformIdentifierSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (int (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    useLowerLocalHistogramThreshold_cold_1();
  return v0() > 9;
}

void sub_2308ED5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFigCapturePlatformIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CMCaptureLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FEC6338;
    v5 = 0;
    CMCaptureLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CMCaptureLibraryCore_frameworkLibrary)
    __getFigCapturePlatformIdentifierSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CMCaptureLibraryCore_frameworkLibrary, "FigCapturePlatformIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getFigCapturePlatformIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2308EF6E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308EF8EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t compareFloat4Luma(uint64_t a1, uint64_t a2)
{
  if (*(float *)(a1 + 12) > *(float *)(a2 + 12))
    return 1;
  else
    return 0xFFFFFFFFLL;
}

void sub_2308F0868(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308F0A1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CAWBAFEFDAssist::~CAWBAFEFDAssist(CAWBAFEFDAssist *this)
{
  JUMPOUT(0x2348BC8E0);
}

void CAWBAFEFDAssist::CalculateWhiteColorHist(CAWBAFEFDAssist *this)
{
  uint64_t v2;
  _WORD *v3;
  _BYTE *v4;
  uint64_t i;
  float v6;
  uint64_t v7;
  int64x2_t v8;
  float v9;
  uint64x2_t v10;
  int64x2_t v11;
  uint64_t v12;
  int64x2_t v13;
  float v14;
  uint64x2_t v15;
  int64x2_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  float v23;
  float v25;
  unsigned int v27;
  unsigned int v28;
  float v29;
  float v30;
  _BYTE v31[636];
  uint64_t v32;

  v2 = 0;
  v32 = *MEMORY[0x24BDAC8D0];
  v3 = &unk_23092D568;
  v4 = v31;
  do
  {
    for (i = 0; i != 7; ++i)
    {
      v6 = 0.0;
      if (v2 != 18 && v2 && i && i != 6)
      {
        LOWORD(v6) = v3[i];
        v6 = (float)LODWORD(v6);
      }
      *(float *)&v4[4 * i] = v6;
    }
    ++v2;
    v4 += 28;
    v3 += 5;
  }
  while (v2 != 19);
  v7 = 0;
  v8 = (int64x2_t)xmmword_23092D460;
  v9 = *((float *)this + 10011);
  v10 = (uint64x2_t)vdupq_n_s64(7uLL);
  v11 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v10, (uint64x2_t)v8)).u8[0] & 1) != 0)
      *(float *)&v31[4 * v7 + 608] = (float)((float)((float)(unsigned __int16)v7 + 0.5) + -3.5) + v9;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(7uLL), *(uint64x2_t *)&v8)).i32[1] & 1) != 0)
      *(float *)&v31[4 * v7 + 612] = (float)((float)((float)((unsigned __int16)v7 | 1u) + 0.5) + -3.5) + v9;
    v7 += 2;
    v8 = vaddq_s64(v8, v11);
  }
  while (v7 != 8);
  v12 = 0;
  v13 = (int64x2_t)xmmword_23092D460;
  v14 = *((float *)this + 10012);
  v15 = (uint64x2_t)vdupq_n_s64(0x13uLL);
  v16 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v15, (uint64x2_t)v13)).u8[0] & 1) != 0)
      *(float *)&v31[4 * v12 + 532] = (float)((float)((float)(unsigned __int16)v12 + 0.5) + -9.5) + v14;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x13uLL), *(uint64x2_t *)&v13)).i32[1] & 1) != 0)
      *(float *)&v31[4 * v12 + 536] = (float)((float)((float)((unsigned __int16)v12 | 1u) + 0.5) + -9.5) + v14;
    v12 += 2;
    v13 = vaddq_s64(v13, v16);
  }
  while (v12 != 20);
  v17 = (char *)this + 35932;
  bzero((char *)this + 35932, 0x1000uLL);
  v18 = 0;
  v19 = 32;
  do
  {
    v20 = 0;
    v21 = v18 + 1;
    do
    {
      *(_DWORD *)&v17[v20] = 0;
      v23 = *(float *)&v31[v20 + 608];
      if (v23 >= -0.5 && v23 < 31.5)
      {
        v25 = *(float *)&v31[4 * v18 + 532];
        if (v25 >= -0.5 && v25 < 31.5)
        {
          v27 = (int)(float)(v23 + 0.5);
          v28 = (int)(float)(v25 + 0.5);
          v29 = (float)(*(float *)&v31[v20 + 612] - (float)v27) + -0.5;
          v30 = (float)(*(float *)&v31[4 * v21 + 532] - (float)v28) + -0.5;
          v22 = &v31[v19];
          *((_DWORD *)this + 32 * v28 + v27 + 8983) = (float)((float)((float)((float)(*(float *)&v22[v20 - 28]
                                                                                                  * (float)((float)((float)((float)v27 + 0.5) - v23) * v30))
                                                                                          + (float)((float)(v29 * v30)
                                                                                                  * *(float *)&v22[v20 - 32]))
                                                                                  + (float)((float)((float)((float)((float)v28 + 0.5) - v25)
                                                                                                  * v29)
                                                                                          * *(float *)&v22[v20 - 4]))
                                                                          + (float)((float)((float)((float)((float)v27 + 0.5)
                                                                                                  - v23)
                                                                                          * (float)((float)((float)v28 + 0.5)
                                                                                                  - v25))
                                                                                  * *(float *)&v22[v20]));
        }
      }
      v20 += 4;
    }
    while (v20 != 24);
    v17 += 128;
    v19 += 28;
    ++v18;
  }
  while (v21 != 18);
}

CAWBAFEFDAssist *CAWBAFEFDAssist::GetfdWindowRGB(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const _AEAWB_Stat_Elem *a3, const unsigned int *a4, double a5)
{
  uint64_t v5;
  unsigned __int16 v6;
  unsigned int *v7;
  float32x2_t *v8;
  uint32x2_t v9;

  v5 = 0;
  v6 = 0;
  v7 = (unsigned int *)((char *)a3 + 244);
  do
  {
    if (a4[v5 + 2] && *v7)
    {
      *(float *)&a5 = (float)*v7;
      v8 = (float32x2_t *)((char *)this + 12 * v6);
      v9.i32[0] = *(v7 - 12);
      v9.i32[1] = *(v7 - 8);
      v8[1539] = vdiv_f32(vcvt_f32_u32(v9), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0));
      v8[1540].f32[0] = (float)*(v7 - 4) / *(float *)&a5;
      ++v6;
    }
    ++v5;
    v7 += 24;
  }
  while (v5 != 2);
  *((_WORD *)this + 7704) = v6;
  return this;
}

CAWBAFEFDAssist *CAWBAFEFDAssist::GetfdHiResWindowRGB(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const _HighResAWBAE_Stat_Elem *a3, const unsigned int *a4)
{
  uint64_t v4;
  unsigned __int16 v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unsigned __int16 v11;
  char *v12;
  unsigned int v13;
  float v14;
  float *v15;
  int v16;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = (char *)a3 + 8;
  do
  {
    if (a4[v4])
    {
      v9 = 0;
      v10 = &v8[256 * (unint64_t)v6];
      v11 = v7;
      do
      {
        v12 = &v10[v9];
        v13 = *(_DWORD *)&v10[v9 + 4];
        if (v13 && *((unsigned __int8 *)a2 + v11 + 2637) >= 0xC1u)
        {
          v14 = (float)(*((_DWORD *)v12 - 2) / v13);
          v15 = (float *)((char *)this + 12 * v5);
          v15[3853] = v14;
          v15[3854] = (float)(*(_DWORD *)&v10[v9 - 4] / *((_DWORD *)v12 + 1));
          v15[3855] = (float)(*(_DWORD *)&v10[v9] / *((_DWORD *)v12 + 1));
          ++v5;
        }
        ++v11;
        v9 += 16;
      }
      while (v9 != 256);
      v7 += 16;
      ++v6;
    }
    ++v4;
  }
  while (v4 != 16);
  *((_WORD *)a2 + 799) = v5;
  if (v5)
    v16 = *((_DWORD *)a2 + 401) + 1;
  else
    v16 = *((_DWORD *)a2 + 401);
  *((_DWORD *)a2 + 401) = v16;
  return this;
}

CAWBAFEFDAssist *CAWBAFEFDAssist::MapSkinColorToWhiteWeighted(CAWBAFEFDAssist *this, fdAWBMetaData *a2, unsigned __int16 (*a3)[4], double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  float v11;
  float v12;
  float32x2_t v13;
  unsigned int v14;
  float32x2_t v15;
  unsigned __int16 v16;
  int32x2_t v17;
  uint32x2_t v18;
  float v19;
  float32x2_t v20;
  unsigned __int16 *v21;
  int32x2_t v22;
  float32x2_t v23;
  float v24;
  float32x4_t v25;
  int16x4_t v26;
  unsigned int v27;
  float v28;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  float v33;
  float v34;
  int v35;
  BOOL v36;
  float v37;
  uint32x2_t v38;
  char v39;

  v13 = *(float32x2_t *)((char *)this + 40028);
  *((_DWORD *)a2 + 778) = 1148846080;
  v14 = *((_DWORD *)this + 10018);
  v15 = 0;
  if (!v14)
    goto LABEL_22;
  v16 = 0;
  v17 = vcvt_s32_f32(vmla_f32((float32x2_t)0x3F0000003F000000, (float32x2_t)vdup_n_s32(0x43800000u), v13));
  v18 = 0;
  v19 = 1000.0;
  v20 = (float32x2_t)vdup_n_s32(0x3B800000u);
  LODWORD(a11) = 0;
  do
  {
    v21 = &(*a3)[4 * v16];
    v22.i32[0] = v21[2];
    v22.i32[1] = v21[3];
    v23 = vmul_f32(vcvt_f32_s32(vsub_s32(v17, v22)), v20);
    v24 = fabsf(sqrtf(vmlas_n_f32(vmuls_lane_f32(v23.f32[1], v23, 1), v23.f32[0], v23.f32[0])));
    if (v24 < v19)
    {
      *((float *)a2 + 778) = v24;
      v19 = v24;
    }
    *(float32x2_t *)v25.f32 = v23;
    *(float32x2_t *)&v25.u32[2] = v23;
    v26.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_23092D470, v25)).u32[0];
    v26.i32[1] = vmovn_s32(vcgtq_f32(v25, (float32x4_t)xmmword_23092D470)).i32[1];
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v26, 0xFuLL))) & 1) != 0)
    {
      v27 = (int)(float)(v23.f32[0] + 3.0);
      v28 = (float)(int)v23.f32[0];
      if ((float)(v23.f32[0] - v28) != 0.0 && v23.f32[0] < 0.0)
        v28 = (float)((int)v23.f32[0] - 1);
      v23.f32[0] = v23.f32[0] - v28;
      v30 = (char *)&fdSkinChistDist + 14 * (int)(float)(v23.f32[1] + 5.0);
      LOWORD(v28) = *(_WORD *)&v30[2 * v27];
      v31 = 2 * v27 + 2;
      LOWORD(v11) = *(_WORD *)&v30[v31];
      *(float *)&v32 = v23.f32[0] * (float)LODWORD(v11);
      v33 = *(float *)&v32 + (float)((float)LODWORD(v28) * (float)(1.0 - v23.f32[0]));
      v30 += 14;
      LOWORD(v32) = *(_WORD *)&v30[2 * v27];
      LOWORD(v12) = *(_WORD *)&v30[v31];
      v12 = (float)LODWORD(v12);
      v23.f32[0] = (float)(v23.f32[0] * v12) + (float)((float)v32 * (float)(1.0 - v23.f32[0]));
      v34 = (float)(int)v23.f32[1];
      v35 = (int)v23.f32[1] - 1;
      v36 = (float)(v23.f32[1] - v34) != 0.0 && v23.f32[1] < 0.0;
      v11 = (float)v35;
      if (v36)
        v34 = (float)v35;
      v37 = (float)((float)(v23.f32[1] - v34) * v23.f32[0]) + (float)(v33 * (float)(1.0 - (float)(v23.f32[1] - v34)));
      *(float *)&a11 = *(float *)&a11 + v37;
      v38.i32[0] = *v21;
      v38.i32[1] = v21[1];
      v18 = vcvt_u32_f32(vmla_n_f32(vcvt_f32_u32(v18), vcvt_f32_u32(v38), v37));
    }
    ++v16;
  }
  while (v14 > v16);
  if (*(float *)&a11 > 0.0)
  {
    v39 = 0;
    v15 = vmul_f32(vdiv_f32(vcvt_f32_u32(v18), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a11, 0)), (float32x2_t)vdup_n_s32(0x3B800000u));
  }
  else
  {
LABEL_22:
    v39 = 2;
  }
  *(float32x2_t *)((char *)this + 40044) = v15;
  *((_BYTE *)this + 8) = v39;
  return this;
}

float CAWBAFEFDAssist::EstimateCurve(float a1, uint64_t a2, uint64_t a3)
{
  float *v3;
  unint64_t i;
  float *v5;
  float v6;
  float v7;
  float v8;
  float result;

  v3 = (float *)(a3 + 8);
  for (i = 1; i != 3; ++i)
  {
    if (*v3 > a1)
      break;
    v3 += 2;
  }
  if (i >= 2)
    i = 2;
  v5 = (float *)(a3 + 8 * i);
  v6 = v5[1];
  v7 = *(v5 - 2);
  if (*v5 != v7)
  {
    v8 = (float)(a1 - v7) / (float)(*v5 - v7);
    if (v8 > 1.0)
      v8 = 1.0;
    if (v8 < 0.0)
      v8 = 0.0;
    v6 = (float)((float)(1.0 - v8) * *(v5 - 1)) + (float)(v8 * v6);
  }
  result = 1.0;
  if (v6 <= 1.0)
    result = v6;
  if (result < 0.0)
    return 0.0;
  return result;
}

void CAWBAFEFDAssist::FaceMaskDetection(CAWBAFEFDAssist *this, unsigned __int16 *a2, float *a3, float *a4, float *a5, float *a6)
{
  unsigned int v8;
  unsigned int v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  __int16 v19;
  uint64_t v20;
  float v21;
  float *v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;

  v8 = *a2;
  v9 = a2[1];
  if (v8 >= v9)
  {
    v11 = 0;
    v10 = 0;
    v18 = 0.0;
    v17 = 0.0;
    v16 = 0.0;
    v15 = 0.0;
    v14 = 0.0;
    v13 = 0.0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = a2[3];
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      if (a2[2] < v12)
      {
        v19 = v8 * *((_WORD *)this + 6);
        v20 = a2[2];
        do
        {
          v21 = (float)((float)((float)(unsigned __int16)v8 - *a3) * *a4)
              + (float)((float)((float)(unsigned __int16)v20 - a3[1]) * a4[1]);
          v22 = (float *)((char *)this + 12 * (unsigned __int16)(v19 + v20));
          v23 = v22 + 5;
          v24 = fmaxf(v22[6], 1.0);
          if (v21 >= -0.2)
          {
            if (v21 > 0.15)
            {
              v15 = v15 + (float)(*v23 / v24);
              v14 = v14 + (float)(v24 / 255.0);
              v13 = v13 + (float)(*((float *)this + 3 * (unsigned __int16)(v19 + v20) + 7) / v24);
              ++v10;
            }
          }
          else
          {
            v18 = v18 + (float)(*v23 / v24);
            v17 = v17 + (float)(v24 / 255.0);
            v16 = v16 + (float)(*((float *)this + 3 * (unsigned __int16)(v19 + v20) + 7) / v24);
            ++v11;
          }
          ++v20;
        }
        while (v12 != v20);
      }
      LOWORD(v8) = v8 + 1;
    }
    while (v9 > (unsigned __int16)v8);
  }
  v25 = v18 / (float)v11;
  v26 = v17 / (float)v11;
  v27 = v16 / (float)v11;
  v28 = 1.0
      - (float)(1.0
              / (float)(expf((float)((float)((float)(vabds_f32(v15 / (float)v10, v25) * 22.954) + -4.6162)+ (float)(vabds_f32(v14 / (float)v10, v26) * 28.714))+ (float)(vabds_f32(v13 / (float)v10, v27) * 10.882))+ 1.0));
  if (v28 > 1.0)
    v28 = 1.0;
  if (v28 < 0.0)
    v28 = 0.0;
  *a6 = v28;
  *a5 = v25;
  a5[1] = v26;
  a5[2] = v27;
}

uint64_t CAWBAFEFDAssist::FaceSkinDetection(uint64_t result, unsigned __int16 *a2, float *a3, float *a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9)
{
  float32x2_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned __int16 v12;
  uint64_t v13;
  uint64_t v14;
  float32x2_t v15;
  float v16;
  __int16 v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  float32x2_t v21;

  v10 = *a2;
  v11 = a2[1];
  if (v10 >= v11)
  {
    v15 = 0;
    v16 = 0.0;
  }
  else
  {
    v12 = 0;
    v13 = a2[2];
    v14 = a2[3];
    v15 = 0;
    v16 = 0.0;
    do
    {
      if (v13 < v14)
      {
        v17 = v10 * *(_WORD *)(result + 12);
        v18 = v13;
        do
        {
          v19 = (float)((float)((float)(unsigned __int16)v10 - *a3) * *a4)
              + (float)((float)((float)(unsigned __int16)v18 - a3[1]) * a4[1]);
          v20 = result + 12 * (unsigned __int16)(v17 + v18);
          if (v19 < -0.2 && (*(_DWORD *)(a6 + 116) & 0xFF000u) < 0x19000
            || v19 > 0.15 && (*(_DWORD *)(a6 + 116) & 0x3FCu) <= 0x63)
          {
            v21.f32[0] = fmaxf(*(float *)(v20 + 24), 1.0);
            v16 = v16 + (float)(*(float *)(v20 + 20) / v21.f32[0]);
            v9.i32[0] = 1132396544;
            v9.i32[0] = vdup_lane_s32((int32x2_t)v9, 0).u32[0];
            v9.i32[1] = v21.i32[0];
            v21.i32[1] = *(_DWORD *)(result + 12 * (unsigned __int16)(v17 + v18) + 28);
            v15 = vadd_f32(v15, vdiv_f32(v21, v9));
            ++v12;
          }
          ++v18;
        }
        while (v14 != v18);
      }
      LOWORD(v10) = v10 + 1;
    }
    while (v11 > (unsigned __int16)v10);
    if (v12)
    {
      *(float *)&a9 = (float)v12;
      v16 = v16 / *(float *)&a9;
      v15 = vdiv_f32(v15, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a9, 0));
    }
  }
  *(float *)a5 = v16;
  *(float32x2_t *)(a5 + 4) = v15;
  return result;
}

uint64_t CAWBAFEFDAssist::UpdateANODTileProbTable(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const _FE_3A_Stats_H15 *a3)
{
  unsigned __int16 *v5;
  unsigned int v6;
  unsigned __int16 i;
  char *v8;
  unsigned int v9;
  _BYTE *v10;
  BOOL v11;
  char v12;
  uint64_t result;
  int v14;
  int v15;
  unsigned __int16 v16;
  BOOL v17;
  char *v18;
  uint64_t v19;
  unsigned int v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  char *v23;
  char *v24;

  v5 = (unsigned __int16 *)((char *)this + 15408);
  if (!*((_BYTE *)this + 40064))
  {
    v6 = *((_DWORD *)a2 + 396);
    if (v6)
    {
      for (i = 0; i < v6; ++i)
      {
        v8 = (char *)a2 + i;
        v9 = v8[1613];
        if (v8[1613])
        {
          v10 = v8 + 1613;
          v11 = v9 >= 0x1F;
          v12 = v9 - 31;
          if (!v11)
            v12 = 0;
          *v10 = v12;
        }
      }
    }
  }
  result = CAWBAFEFDAssist::CalculateSkinTileANODProbMap(this, a2, a3, 1.0);
  v14 = *((unsigned __int16 *)a2 + 1588);
  v15 = *((_DWORD *)a2 + 401);
  if (*((_WORD *)a2 + 1588))
    ++v15;
  *((_DWORD *)a2 + 401) = v15;
  v16 = *v5;
  if (*v5)
    v17 = v14 == 0;
  else
    v17 = 1;
  if (v17)
  {
    v16 = 0;
  }
  else
  {
    v18 = (char *)this + 12312;
    v19 = *v5;
    do
    {
      *(_QWORD *)(v18 + 3100) = *(_QWORD *)v18;
      *((_DWORD *)v18 + 777) = *((_DWORD *)v18 + 2);
      v18 += 12;
      --v19;
    }
    while (v19);
  }
  v20 = *((_DWORD *)a2 + 396);
  if (v20)
  {
    v21 = 0;
    do
    {
      v22 = v21;
      if (*((unsigned __int8 *)a2 + v21 + 1613) >= 0xC1u)
      {
        v23 = (char *)this + 12 * v21;
        v24 = (char *)this + 12 * v16;
        *(_QWORD *)(v24 + 15412) = *(_QWORD *)(v23 + 20);
        *((_DWORD *)v24 + 3855) = *((_DWORD *)v23 + 7);
        ++v16;
      }
      v21 = v22 + 1;
    }
    while (v20 > (unsigned __int16)(v22 + 1));
  }
  *((_WORD *)a2 + 799) = v16;
  return result;
}

uint64_t CAWBAFEFDAssist::CalculateSkinTileANODProbMap(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const _FE_3A_Stats_H15 *a3, float a4)
{
  fdAWBMetaData *v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;
  unsigned int v10;
  uint64_t v11;
  long double v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  _DWORD *v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  float v28;
  unsigned int v29;
  float v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  float v34;
  unsigned int v35;
  float v36;
  unint64_t v37;
  unsigned int v38;
  int v39;
  unsigned __int8 v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  _BOOL4 v44;
  uint64_t v45;
  int v46;
  int v47;
  __double2 v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  char *v57;
  int v58;
  uint64_t v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  char *v65;
  unsigned int v66;
  float v67;
  float v68;
  float v69;
  float *v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  unsigned int v78;
  float *v79;
  char *v80;
  fdAWBMetaData *v81;
  uint64_t v82;
  int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unint64_t v89;
  unint64_t v90;
  _BOOL4 v91;
  uint64_t v92;
  int v93;
  unsigned int v94;
  float v95;
  float v96;
  uint64_t v97;
  float v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  float v102;
  float v103;
  float v104;
  float v105;
  uint64_t v106;
  float v107;
  char v108;
  float v109;
  int v110;
  float v112;
  float v113;
  unsigned __int16 v114[4];
  float v115[2];
  float v116;
  float v117;
  uint64_t v118;
  float v119;
  uint64_t v120;

  v4 = a2;
  v91 = 0;
  v120 = *MEMORY[0x24BDAC8D0];
  v119 = 0.0;
  v118 = 0;
  v113 = 0.0;
  v110 = *((_DWORD *)a2 + 795);
  if (v110 != 4)
    v91 = *((_BYTE *)a2 + 3152) != 0;
  v87 = *((_DWORD *)a2 + 394);
  *((_DWORD *)this + 3) = v87;
  v86 = *((_DWORD *)a2 + 395);
  *((_DWORD *)this + 4) = v86;
  v6 = *((_DWORD *)a2 + 9);
  if (v6)
  {
    v7 = *((_DWORD *)a2 + 11);
    if (v7 != -1)
    {
      v8 = 0;
      result = 0;
      v10 = *((_DWORD *)v4 + 38 * v7 + 17) * *((_DWORD *)v4 + 38 * v7 + 16);
      v85 = *((_DWORD *)a3 + 4071) >> *((_BYTE *)a3 + 342);
      v84 = *((_DWORD *)a3 + 4072) >> *((_BYTE *)a3 + 343);
      if (v6 >= 0xA)
        v11 = 10;
      else
        v11 = v6;
      v90 = v87 - 1;
      v89 = v86 - 1;
      v79 = (float *)((char *)v4 + 3164);
      v80 = (char *)v4 + 1613;
      HIDWORD(v12) = 1080459264;
      v102 = 0.0;
      v103 = 0.0;
      v95 = 0.0;
      v96 = 0.0;
      v83 = *((_DWORD *)v4 + 38 * v7 + 17) * *((_DWORD *)v4 + 38 * v7 + 16);
      v81 = v4;
      v82 = v11;
      while (1)
      {
        v13 = (_DWORD *)((char *)v4 + 152 * v8);
        v15 = v13[16];
        v14 = v13[17];
        if (v10 < 4 * v15 * v14)
        {
          v16 = *((_DWORD *)v4 + 38 * v8 + 43);
          if ((v16 & 0x3FCu) < 0x64 || (v16 & 0xFF000u) >> 12 <= 0x18)
            break;
        }
LABEL_92:
        if (++v8 == v11)
          goto LABEL_95;
      }
      v18 = v13 + 14;
      v19 = 5 * v15;
      v20 = 5 * v14;
      v21 = ((v13[14] + 4 * v19 / 0xC8u) * v85) >> 16;
      v22 = ((v18[1] + 4 * v20 / 0xC8u) * v84) >> 16;
      v23 = 16 * v19 / 0x64u * v85;
      v24 = 16 * v20 / 0x64u * v84;
      v25 = *((unsigned __int16 *)a3 + 174);
      v26 = *((unsigned __int16 *)a3 + 178);
      v27 = (v21 - v26) & ~((int)(v21 - v26) >> 31);
      if (v27 >= v25)
        v27 = *((unsigned __int16 *)a3 + 174);
      v28 = (float)(v27 * v87) / (float)v25;
      v29 = v21 + HIWORD(v23) - v26;
      if (v29 >= v25)
        v29 = *((unsigned __int16 *)a3 + 174);
      v30 = (float)(v29 * v87) / (float)v25;
      v31 = *((unsigned __int16 *)a3 + 175);
      v32 = *((unsigned __int16 *)a3 + 179);
      v33 = (v22 - v32) & ~((int)(v22 - v32) >> 31);
      if (v33 >= v31)
        v33 = *((unsigned __int16 *)a3 + 175);
      v34 = (float)(v33 * v86) / (float)v31;
      v35 = v22 + HIWORD(v24) - v32;
      if (v35 >= v31)
        v35 = *((unsigned __int16 *)a3 + 175);
      v36 = (float)(v35 * v86) / (float)v31;
      v112 = v28;
      v37 = (int)v28;
      v38 = (int)v30;
      if (v90 >= v37)
        v39 = (int)v28;
      else
        v39 = v87 - 1;
      v101 = v39;
      if (v87 > v38)
        v40 = v38 + 1;
      else
        v40 = v87;
      v98 = v34;
      v41 = (int)v34;
      if (v89 >= v41)
        v42 = v41;
      else
        v42 = v89;
      if (v86 > (int)v36)
        v43 = (int)v36 + 1;
      else
        LOBYTE(v43) = v86;
      v92 = v8;
      if (v110 == 4)
      {
        if ((v16 & 0xFFC00) != 0)
        {
          v44 = 1;
          goto LABEL_40;
        }
        v44 = (v16 & 0x3FF) != 0;
      }
      else
      {
        v44 = 0;
      }
      if (!v91 && !v44)
      {
        v44 = 0;
LABEL_50:
        result = (result + 1);
        v100 = v43;
        if (v43 > v42)
        {
          v94 = result;
          v99 = v40;
          v52 = v91;
          if (v113 < 0.4623)
            v52 = 0;
          v53 = v44 || v52;
          v109 = *(float *)&v118;
          v105 = v119;
          v107 = *((float *)&v118 + 1);
          if (v37 >= v90)
            v54 = v87 - 1;
          else
            v54 = v37;
          if (v41 >= v89)
            v55 = v86 - 1;
          else
            v55 = v41;
          v56 = v54 - v40;
          v57 = &v80[32 * v55];
          v97 = v42;
          v58 = v42;
          do
          {
            if (v99 > v101)
            {
              v59 = 0;
              v60 = (float)(unsigned __int16)v58;
              v61 = v98;
              if (v55 != v97)
                v61 = (float)(unsigned __int16)v58;
              v104 = (float)(v60 - v95) * v96;
              v62 = v60 + 1.0;
              v63 = (float)(v60 + 1.0) - v61;
              v64 = v36 - v61;
              v65 = &v57[v54];
              do
              {
                v66 = (unsigned __int16)(v54 + v59);
                v67 = (float)v66;
                if (v59)
                  v68 = (float)v66;
                else
                  v68 = v112;
                v69 = 0.0;
                if (v53 && (v110 == 4 || (float)(v104 + (float)((float)(v67 - v102) * v103)) >= -0.2))
                {
                  v70 = (float *)((char *)this + 12 * (unsigned __int16)(v54 + v59 + v58 * *((_WORD *)this + 6)));
                  v71 = fmaxf(v70[6], 1.0);
                  *(float *)&v12 = 1.0
                                 - (float)(1.0
                                         / (float)(expf((float)((float)((float)(vabds_f32(v70[5] / v71, v109) * 22.954)+ -4.6162)+ (float)(vabds_f32(v71 / 255.0, v107) * 28.714))+ (float)(vabds_f32(v70[7] / v71, v105) * 10.882))+ 1.0));
                  if (*(float *)&v12 > 1.0)
                    *(float *)&v12 = 1.0;
                  if (*(float *)&v12 < 0.0)
                    *(float *)&v12 = 0.0;
                  if (*(float *)&v12 < 0.4623)
                    v69 = 0.0;
                  else
                    v69 = 1.0;
                }
                v72 = (float)(v67 + 1.0) - v68;
                v73 = v63 * v72;
                v74 = v64 * v72;
                if (v36 >= v62)
                  v74 = v73;
                v75 = v64 * (float)(v30 - v68);
                if (v36 >= v62)
                  v75 = v63 * (float)(v30 - v68);
                if (v30 < (float)(v67 + 1.0))
                  v76 = v75;
                else
                  v76 = v74;
                v77 = (float)(1.0 - v69) * (float)(v76 * a4);
                if (*((_BYTE *)this + 40064))
                {
                  v12 = pow(v77, 0.9) * 255.0;
                  v78 = (int)v12;
                }
                else
                {
                  v78 = v65[v59] + (int)(float)((float)(v77 * 64.0) + 0.5);
                  if (v78 >= 0xFF)
                    LOBYTE(v78) = -1;
                }
                v65[v59++] = v78;
              }
              while (v56 + (_DWORD)v59);
            }
            ++v58;
            ++v55;
            v57 += 32;
          }
          while (v58 != v100);
          v4 = v81;
          result = v94;
        }
        v8 = v92;
        v10 = v83;
        v11 = v82;
        goto LABEL_92;
      }
LABEL_40:
      v45 = v42;
      v93 = result;
      v46 = v40 - v101;
      if (v46 < 3 || (v47 = v43 - (_DWORD)v42, v47 < 3))
      {
        v113 = 0.0;
      }
      else
      {
        v108 = v43;
        v106 = (uint64_t)v18;
        v114[0] = v42;
        v114[1] = v43;
        v114[2] = v101;
        v114[3] = v40;
        LODWORD(v12) = *((_DWORD *)v4 + 38 * v8 + 36);
        v48 = __sincos_stret((double)*(unint64_t *)&v12 * 3.1415927 / 180.0);
        v49 = (float)v47;
        *(float *)&v49 = v48.__cosval / v49;
        v51 = (float)v46;
        v50 = -v48.__sinval / v51;
        *(float *)&v50 = v50;
        v96 = *(float *)&v49;
        v115[0] = *(float *)&v49;
        v115[1] = *(float *)&v50;
        v103 = *(float *)&v50;
        LODWORD(v51) = 0.5;
        v95 = (float)(v36 + v98) * 0.5;
        v116 = v95;
        v117 = (float)(v30 + v112) * 0.5;
        v102 = v117;
        if (v110 == 4)
        {
          *(float *)&v50 = (float)(v30 + v112) * 0.5;
          *(float *)&v49 = (float)(v36 + v98) * 0.5;
          CAWBAFEFDAssist::FaceSkinDetection((uint64_t)this, v114, &v116, v115, (uint64_t)&v118, v106, v50, v51, v49);
          v113 = 0.0;
        }
        else
        {
          CAWBAFEFDAssist::FaceMaskDetection(this, v114, &v116, v115, (float *)&v118, &v113);
        }
        LODWORD(result) = v93;
        LOBYTE(v43) = v108;
      }
      v42 = v45;
      if (!*((_BYTE *)v4 + 3160))
      {
        *((_BYTE *)v4 + 3160) = v113 >= 0.4623;
        *(_QWORD *)v79 = v118;
        v79[2] = v119;
      }
      goto LABEL_50;
    }
  }
  result = 0;
LABEL_95:
  *((_WORD *)v4 + 1588) = result;
  return result;
}

void CAWBAFEFDAssist::UpdateSemanticTileProbTable(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const sMetaData *a3, const _FE_3A_Stats_H15 *a4)
{
  _WORD *v7;
  unsigned int v8;
  unsigned __int16 i;
  char *v10;
  unsigned int v11;
  _BYTE *v12;
  BOOL v13;
  char v14;
  const unsigned __int8 *v15;
  unsigned int v16;
  float v17;
  unsigned int v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  char *v22;
  char *v23;
  BOOL v24;
  int v25;
  sBTRect v26;

  v7 = (_WORD *)((char *)this + 40062);
  v26 = (sBTRect)*((_OWORD *)a2 + 199);
  if (!*((_BYTE *)this + 40064))
  {
    v8 = *((_DWORD *)a2 + 396);
    if (v8)
    {
      for (i = 0; i < v8; ++i)
      {
        v10 = (char *)a2 + i;
        v11 = v10[1613];
        if (v10[1613])
        {
          v12 = v10 + 1613;
          v13 = v11 >= 0x1F;
          v14 = v11 - 31;
          if (!v13)
            v14 = 0;
          *v12 = v14;
        }
      }
    }
  }
  v15 = CAWBAFEFDAssist::CalculateSkinTileSemanticProbMap(this, (unint64_t)a2, a3, *(const unsigned __int8 **)(*((_QWORD *)a2 + 382) + 16), &v26, a3, (unsigned __int8 *)a2 + 1613);
  LOWORD(v16) = *v7;
  v17 = CAWBAFEFDAssist::EstimateCurve((float)v16, (uint64_t)v15, (uint64_t)&ANODTileWeightInSemantic);
  if (v17 > 0.0)
    CAWBAFEFDAssist::CalculateSkinTileANODProbMap(this, a2, a4, v17);
  v18 = *((_DWORD *)a2 + 396);
  if (v18)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = v19;
      if (*((char *)a2 + v19 + 1613) < 0)
      {
        v22 = (char *)this + 12 * v19;
        v23 = (char *)this + 12 * v20;
        *(_QWORD *)(v23 + 15412) = *(_QWORD *)(v22 + 20);
        *((_DWORD *)v23 + 3855) = *((_DWORD *)v22 + 7);
        ++v20;
      }
      v19 = v21 + 1;
    }
    while (v18 > (unsigned __int16)(v21 + 1));
  }
  else
  {
    v20 = 0;
  }
  *((_WORD *)a2 + 799) = v20;
  v24 = v20 == 0;
  v25 = *((_DWORD *)a2 + 401);
  if (!v24)
    ++v25;
  *((_DWORD *)a2 + 401) = v25;
}

const unsigned __int8 *CAWBAFEFDAssist::CalculateSkinTileSemanticProbMap(CAWBAFEFDAssist *this, unint64_t a2, unsigned int a3, const unsigned __int8 *a4, const sBTRect *a5, const sMetaData *a6, unsigned __int8 *a7)
{
  char *v9;
  unsigned int width;
  unsigned int height;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float x;
  float y;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const unsigned __int8 *result;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  const unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  const unsigned __int8 *v32;
  int v33;
  float v34;
  uint64_t v35;
  unsigned int v36;
  sBTRect v37;

  v9 = (char *)this + 40062;
  width = a6->FESOutputSize.width;
  height = a6->FESOutputSize.height;
  v37 = *a5;
  CAWBAFEFDAssist::LimitCropRect(this, &v37, width, height);
  v12 = 0;
  v13 = 256.0 / (float)width;
  v14 = (float)v37.width * 0.03125;
  v15 = (float)v37.height * 0.03125;
  *(_WORD *)v9 = 0;
  x = (float)v37.x;
  y = (float)v37.y;
  v18 = 192.0 / (float)height;
  do
  {
    v19 = 0;
    v20 = (int)(float)(v18 * (float)(y + (float)((float)(unsigned __int16)v12 * v15)));
    v21 = 32 * v12++;
    LODWORD(v22) = (int)(float)(v18 * (float)(y + (float)((float)(int)v12 * v15)));
    if (v22 >= 0xC0)
      v22 = 192;
    else
      v22 = v22;
    result = &a4[256 * v20];
    do
    {
      v24 = v19++;
      if (v22 > v20)
      {
        v25 = 0;
        v26 = 0;
        LODWORD(v27) = (int)(float)(v13 * (float)(x + (float)((float)(int)v19 * v14)));
        if (v27 >= 0x100)
          v27 = 256;
        else
          v27 = v27;
        v28 = (int)(float)(v13 * (float)(x + (float)((float)(unsigned __int16)v24 * v14)));
        v29 = &result[v28];
        v30 = v20;
        do
        {
          v31 = v27 - v28;
          v32 = v29;
          if (v27 > v28)
          {
            do
            {
              v33 = *v32++;
              v26 += v33;
              ++v25;
              --v31;
            }
            while (v31);
          }
          ++v30;
          v29 += 256;
        }
        while (v30 != v22);
        if (v25)
        {
          v34 = (float)v26 / (float)v25;
          if (v9[2])
          {
            if (v34 > 255.0)
              v34 = 255.0;
            if ((int)v34 >= 0x7F)
              ++*(_WORD *)v9;
            a7[v24 + v21] = (int)v34;
          }
          else
          {
            v35 = v24 + v21;
            v36 = a7[v35] + (int)(float)((float)((float)(v34 / 255.0) * 64.0) + 0.5);
            if (v36 >= 0xFF)
              v36 = 255;
            a7[v35] = v36;
            if (v36 >= 0x7F)
              ++*(_WORD *)v9;
          }
        }
      }
    }
    while (v19 != 32);
  }
  while (v12 != 32);
  return result;
}

void CAWBAFEFDAssist::CalculateSemanticSpatialCCMMap(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const sMetaData *a3, float *a4)
{
  uint64_t i;
  float v7;
  float v8;
  unsigned int width;
  unsigned int height;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float x;
  float y;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  float v34;
  sBTRect tileStatsRegionInRaw;

  for (i = 0; i != 192; ++i)
  {
    v7 = a4[i];
    if (v7 > 0.0)
    {
      v8 = v7 + -0.1;
      if (v8 < 0.0)
        v8 = 0.0;
      a4[i] = v8;
    }
  }
  width = a3->FESOutputSize.width;
  height = a3->FESOutputSize.height;
  tileStatsRegionInRaw = a3->awb.tileStatsRegionInRaw;
  CAWBAFEFDAssist::LimitCropRect(this, &tileStatsRegionInRaw, width, height);
  v11 = 0;
  v12 = 256.0 / (float)width;
  v13 = 192.0 / (float)height;
  v14 = (float)tileStatsRegionInRaw.width * 0.0625;
  x = (float)tileStatsRegionInRaw.x;
  y = (float)tileStatsRegionInRaw.y;
  v17 = (float)tileStatsRegionInRaw.height / 12.0;
  do
  {
    v18 = 0;
    v19 = (int)(float)(v13 * (float)(y + (float)((float)(unsigned __int16)v11 * v17)));
    v20 = 16 * v11++;
    LODWORD(v21) = (int)(float)(v13 * (float)(y + (float)((float)(int)v11 * v17)));
    if (v21 >= 0xC0)
      v21 = 192;
    else
      v21 = v21;
    do
    {
      v22 = v18++;
      v23 = 0.0;
      if (v21 > v19)
      {
        v24 = 0;
        v25 = 0;
        LODWORD(v26) = (int)(float)(v12 * (float)(x + (float)((float)(int)v18 * v14)));
        if (v26 >= 0x100)
          v26 = 256;
        else
          v26 = v26;
        v27 = (int)(float)(v12 * (float)(x + (float)((float)(unsigned __int16)v22 * v14)));
        v28 = ((unint64_t)v19 << 8) + v27;
        v29 = v19;
        do
        {
          if (v26 > v27)
          {
            v30 = (unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)a2 + 382) + 16) + v28);
            v31 = v26 - v27;
            do
            {
              v32 = *v30++;
              v25 += v32;
              ++v24;
              --v31;
            }
            while (v31);
          }
          ++v29;
          v28 += 256;
        }
        while (v29 != v21);
        if (v24)
          v23 = (float)((float)((float)v25 * 0.5) / (float)v24) / 255.0;
      }
      v33 = v22 + v20;
      v34 = v23 + a4[v33];
      if (v34 > 1.0)
        v34 = 1.0;
      a4[v33] = v34;
    }
    while (v18 != 16);
  }
  while (v11 != 12);
}

void CAWBAFEFDAssist::LimitCropRect(CAWBAFEFDAssist *this, sBTRect *a2, int a3, unsigned int a4)
{
  int32x2_t v4;
  unsigned __int32 v5;
  BOOL v6;
  unsigned int height;
  BOOL v8;

  v4 = vmax_s32(*(int32x2_t *)&a2->x, 0);
  *(int32x2_t *)&a2->x = v4;
  v5 = a2->width + v4.i32[0];
  v6 = a3 <= v4.i32[0] || v5 == 0;
  if (v6 || ((height = a2->height, (int)a4 > v4.i32[1]) ? (v8 = v4.i32[1] == -height) : (v8 = 1), v8))
  {
    *(_QWORD *)&a2->x = 0;
    *(_QWORD *)&a2->width = 0;
  }
  else
  {
    if (v5 > a3)
      a2->width = a3 - v4.i32[0];
    if (height + v4.i32[1] > a4)
      a2->height = a4 - v4.i32[1];
  }
}

CAWBAFEFDAssist *CAWBAFEFDAssist::GetfdTileRGBFDProbApproach(CAWBAFEFDAssist *this, fdAWBMetaData *a2, const _TILE_Stat_Elem *a3, double a4, double a5)
{
  unsigned int v5;
  __int16 v6;
  unsigned __int16 i;
  _DWORD *v8;
  unsigned int v9;
  uint32x2_t v10;
  float32x2_t v11;
  float v12;
  char *v13;

  v5 = *((_DWORD *)a2 + 396);
  if (v5)
  {
    v6 = 0;
    for (i = 0; i < v5; ++i)
    {
      v8 = (_DWORD *)((char *)a3 + 64 * (unint64_t)i);
      v9 = v8[13];
      if (v9)
      {
        *(float *)&a5 = (float)v9;
        v10.i32[0] = v8[1];
        v10.i32[1] = v8[5];
        v11 = vdiv_f32(vcvt_f32_u32(v10), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0));
        v12 = (float)v8[9] / (float)v9;
        ++v6;
      }
      else
      {
        v11 = 0;
        v12 = 0.0;
      }
      v13 = (char *)this + 12 * i;
      *(float32x2_t *)(v13 + 20) = v11;
      *((float *)v13 + 7) = v12;
    }
  }
  else
  {
    v6 = 0;
  }
  *((_WORD *)this + 6154) = v6;
  return this;
}

float CAWBAFEFDAssist::GetfdSkinRGB(CAWBAFEFDAssist *this, float *a2, unsigned int a3)
{
  uint64_t v3;
  float *v4;
  float *v5;
  float v6;
  float result;

  if (a3)
  {
    v3 = a3;
    v4 = (float *)((char *)this + 15420);
    v5 = a2 + 2;
    do
    {
      *(v5 - 2) = *(v4 - 2);
      *(v5 - 1) = *(v4 - 1);
      v6 = *v4;
      v4 += 3;
      result = v6;
      *v5 = v6;
      v5 += 3;
      --v3;
    }
    while (v3);
  }
  return result;
}

float CAWBAFEFDAssist::SetfdSkinC1C2(CAWBAFEFDAssist *this, float *a2, unsigned int a3)
{
  uint64_t v3;
  float *v4;
  float *v5;
  float v6;
  float result;

  if (a3)
  {
    v3 = a3;
    v4 = a2 + 1;
    v5 = (float *)((char *)this + 27728);
    do
    {
      *(v5 - 1) = *(v4 - 1);
      v6 = *v4;
      v4 += 2;
      result = v6;
      *v5 = v6;
      v5 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

float CAWBAFEFDAssist::MapSkinColorToWhiteProbWeighted(CAWBAFEFDAssist *this, fdAWBMetaData *a2, unsigned __int16 (*a3)[4])
{
  float *v3;
  unsigned int v4;
  float v5;
  float v6;
  unsigned __int8 v9;
  float v10;
  float v11;
  float v12;
  float v13;
  unsigned __int16 *v14;
  unsigned int v15;
  unsigned int v16;
  float v17;
  uint64_t v18;
  float v19;
  float result;

  v3 = (float *)((char *)this + 40028);
  *((_DWORD *)a2 + 778) = 1148846080;
  v4 = *((_DWORD *)this + 10018);
  v6 = *((float *)this + 10007);
  v5 = *((float *)this + 10008);
  if (v4)
  {
    v9 = 0;
    v10 = 0.0;
    v11 = 1000.0;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      v14 = &(*a3)[4 * v9];
      v15 = v14[2];
      v16 = v14[3];
      v17 = fabsf(sqrtf((float)((float)(v5 - (float)(v16 >> 8)) * (float)(v5 - (float)(v16 >> 8)))+ (float)((float)(v6 - (float)(v15 >> 8)) * (float)(v6 - (float)(v15 >> 8)))));
      if (v17 < v11)
      {
        *((float *)a2 + 778) = v17;
        v11 = v17;
      }
      v18 = v9;
      v19 = CAWBAFEFDAssist::EstimateCurve(v17, (uint64_t)this, (uint64_t)&unk_23092D4FC);
      v12 = v12 + (float)((float)((float)(int)(*v14 - v15) * 0.0039062) * v19);
      v10 = v10 + (float)((float)((float)(int)((*a3)[4 * v18 + 1] - v16) * 0.0039062) * v19);
      v13 = v13 + v19;
      v9 = v18 + 1;
    }
    while (v4 > (v18 + 1));
  }
  else
  {
    v13 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
  }
  result = (float)(v12 / v13) + v6;
  v3[4] = result;
  v3[5] = (float)(v10 / v13) + v5;
  return result;
}

float CAWBAFEFDAssist::CalculateSkinSampleStats(CAWBAFEFDAssist *this, unsigned int a2, float *a3, float *a4)
{
  float v6;
  uint64_t v8;
  float *v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float result;
  float v29;
  float v30;

  v6 = (float)a2;
  if (!a2)
  {
    *(_QWORD *)a3 = 0;
    v18 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
LABEL_9:
    v27 = sqrtf((float)(v18 - (float)((float)(v19 * v19) / v6)) / (float)(v6 + -1.0));
    goto LABEL_10;
  }
  v8 = a2;
  v9 = (float *)((char *)this + 27728);
  v10 = 0.0;
  v11 = a2;
  v12 = 0.0;
  do
  {
    v12 = v12 + *(v9 - 1);
    v13 = *v9;
    v9 += 2;
    v10 = v10 + v13;
    --v11;
  }
  while (v11);
  v14 = v12 / v6;
  *(_QWORD *)a3 = 0;
  v15 = (float *)((char *)this + 27728);
  v16 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v30 = (float)a2;
  v21 = v10 / v6;
  do
  {
    v22 = *(v15 - 1);
    v23 = (float)((float)(*v15 - v21) * (float)(*v15 - v21)) + (float)((float)(v22 - v14) * (float)(v22 - v14));
    v18 = v18 + v23;
    v24 = sqrtf(v23);
    v19 = v19 + v24;
    v25 = CAWBAFEFDAssist::EstimateCurve(v24, (uint64_t)this, (uint64_t)&unk_23092D4E4);
    v20 = v20 + v25;
    v17 = v17 + (float)(v25 * v22);
    *a3 = v17;
    v26 = *v15;
    v15 += 2;
    v16 = v16 + (float)(v25 * v26);
    a3[1] = v16;
    --v8;
  }
  while (v8);
  v27 = 0.0;
  v6 = v30;
  if (a2 != 2)
    goto LABEL_9;
LABEL_10:
  *a4 = v27;
  result = *a3 / v20;
  v29 = a3[1] / v20;
  *a3 = result;
  a3[1] = v29;
  return result;
}

void CAWBAFEFDAssist::ModifyColorHistogramProbApproach(CAWBAFEFDAssist *this, fdAWBMetaData *a2, unsigned __int16 (*a3)[4], unsigned int *a4, unsigned int a5)
{
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  float v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  _BOOL4 v36;
  unsigned int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float32x2_t v44;
  double v45;
  float v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  float v53;
  char *v54;
  unsigned int v55;
  unsigned int v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  uint64_t v65;
  float v66;
  uint64_t v67;
  float v68;
  uint64_t v69;
  float v70;
  float v71;
  float v72;
  _BOOL4 v73;
  float v74;
  float v75;
  float v76;
  _BOOL4 v77;
  uint64_t v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  _BOOL4 v84;
  uint64_t i;
  float32x2_t v86;
  float v87;

  v10 = (char *)this + 40028;
  if (CAWBAFEFDAssist::UseProvidedMatchSkinGains(this, a2))
  {
    *((_DWORD *)a2 + 766) = *((_DWORD *)v10 + 2);
    *((_DWORD *)a2 + 767) = *((_DWORD *)v10 + 3);
    *((_DWORD *)a2 + 770) = *((_DWORD *)v10 + 6);
    *((_DWORD *)a2 + 771) = *((_DWORD *)v10 + 7);
    *((_DWORD *)a2 + 401) = *((_DWORD *)a2 + 402);
    *((_WORD *)a2 + 799) = *((_WORD *)a2 + 800);
    *((_DWORD *)a2 + 776) = *((_DWORD *)a2 + 777);
    *((_DWORD *)a2 + 778) = *((_DWORD *)a2 + 779);
    CAWBAFEFDAssist::CalculateWhiteColorHist(this);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = (float)(*((unsigned __int16 *)a2 + 797) * *((unsigned __int16 *)a2 + 796)) / 3193300.0;
    v17 = (char *)this + 35932;
    do
    {
      v18 = a4[v12];
      v19 = *(_DWORD *)&v17[v12 * 4];
      if (v19)
      {
        v20 = (float)((float)v19 * v16) + 0.5;
        v14 += (int)v20;
        *(_DWORD *)&v17[v12 * 4] = (int)v20;
        v13 += a4[v12];
      }
      v15 += v18;
      ++v12;
    }
    while (v12 != 1024);
    v21 = (float)v15;
    v22 = (float)v14;
    if (v14)
      v23 = (float)v15 / (float)v14;
    else
      v23 = 0.0;
    v24 = (float)v13;
    v25 = 1.0;
    if (v21 >= 1.0)
      v25 = (float)v15;
    v26 = v24 / v25;
    *((float *)a2 + 780) = v24 / v25;
    *((_DWORD *)a2 + 785) = v15;
    *((_DWORD *)a2 + 786) = v14;
    *((_DWORD *)a2 + 787) = v13;
    LOWORD(v24) = *((_WORD *)a2 + 799);
    v27 = CAWBAFEFDAssist::EstimateCurve((float)LODWORD(v24), v11, (uint64_t)&unk_23092D514);
    *((float *)a2 + 781) = v27;
    v29 = CAWBAFEFDAssist::EstimateCurve(*((float *)a2 + 776), v28, (uint64_t)&unk_23092D52C);
    *((float *)a2 + 782) = v29;
    v31 = CAWBAFEFDAssist::EstimateCurve(*((float *)a2 + 778), v30, (uint64_t)&unk_23092D544);
    *((float *)a2 + 783) = v31;
    v33 = CAWBAFEFDAssist::EstimateCurve(v26, v32, (uint64_t)&unk_23092D55C);
    *((float *)a2 + 784) = v33;
    v34 = v23 * (float)((float)((float)(v27 * v29) * v31) * v33);
    *((float *)a2 + 775) = v34;
    if (v10[36])
    {
      if (*((_DWORD *)v10 + 10) != 1)
      {
        v35 = 1.0;
        v36 = v34 < 0.0 || v34 > 1.0;
        if (v34 <= 1.0 || v34 < 0.0)
          v35 = 0.0;
        if (v36)
          v34 = v35;
      }
    }
    else
    {
      v74 = *((float *)a2 + 774);
      if (*((_DWORD *)a2 + 401))
      {
        v75 = v34 - v74;
        v76 = v34 - (float)(v74 + 0.03125);
        if (v75 > 0.03125)
          v74 = v74 + 0.03125;
        else
          v76 = v75;
        if (v76 < -0.03125)
          v74 = v74 + -0.03125;
      }
      v34 = 1.0;
      v77 = v74 < 0.0 || v74 > 1.0;
      if (v74 <= 1.0 || v74 < 0.0)
        v34 = 0.0;
      if (!v77)
        v34 = v74;
    }
    *((float *)a2 + 774) = v34;
    if (v34 > 0.0)
    {
      v78 = 0;
      v79 = v21 / (float)(v21 + (float)(v22 * v34));
      v80 = v34 * v79;
      do
      {
        a4[v78] = (float)((float)((float)(v80 * (float)*(unsigned int *)((char *)this + v78 * 4 + 35932))
                                              + (float)((float)a4[v78] * v79))
                                      + 0.5);
        ++v78;
      }
      while (v78 != 1024);
    }
    *((_BYTE *)a2 + 1612) = 1;
    *((_DWORD *)a2 + 1) = 0;
    return;
  }
  v37 = *((unsigned __int16 *)a2 + 799);
  if (v37 <= 1)
  {
    *((_BYTE *)a2 + 1612) = 0;
    *((_DWORD *)a2 + 401) = 0;
    *((_DWORD *)a2 + 774) = 0;
    *((_DWORD *)a2 + 776) = 0;
    *((_DWORD *)a2 + 778) = 0;
    *((_DWORD *)a2 + 780) = 0;
    *((_QWORD *)a2 + 383) = 0;
    *((_QWORD *)a2 + 385) = 0;
    *(_QWORD *)((char *)a2 + 4) = 1;
    return;
  }
  CAWBAFEFDAssist::CalculateSkinSampleStats(this, v37, (float *)a2 + 768, (float *)a2 + 776);
  v44.i32[0] = 0.25;
  if (*((_DWORD *)a2 + 789))
    *(float *)&v38 = 0.05;
  else
    *(float *)&v38 = 0.25;
  v87 = *(float *)&v38;
  if (a5 <= 1 && *((_BYTE *)a2 + 1612) && !v10[36])
  {
    v86 = *(float32x2_t *)((char *)a2 + 3064);
    v44 = vsub_f32(*(float32x2_t *)((char *)a2 + 3072), v86);
    v45 = COERCE_DOUBLE(vmla_n_f32(v86, v44, *(float *)&v38));
  }
  else
  {
    v45 = *((double *)a2 + 384);
  }
  *((double *)a2 + 383) = v45;
  *(_DWORD *)v10 = LODWORD(v45);
  LODWORD(v45) = *((_DWORD *)a2 + 767);
  *((_DWORD *)v10 + 1) = LODWORD(v45);
  CAWBAFEFDAssist::MapSkinColorToWhiteWeighted(this, a2, a3, v45, *(double *)&v44, v38, v39, v40, v41, v42, v43);
  v46 = *((float *)v10 + 4);
  if (v46 == 0.0)
  {
    CAWBAFEFDAssist::MapSkinColorToWhiteProbWeighted(this, a2, a3);
    v46 = *((float *)v10 + 4);
  }
  *((float *)a2 + 772) = v46;
  v47 = *((float *)v10 + 5);
  *((float *)a2 + 773) = v47;
  if (a5 > 1 || !*((_BYTE *)a2 + 1612) || v10[36])
  {
    *((float *)a2 + 770) = v46;
LABEL_36:
    *((float *)a2 + 771) = v47;
    goto LABEL_37;
  }
  if (*((_DWORD *)a2 + 401))
  {
    v46 = *((float *)a2 + 770) + (float)((float)(v46 - *((float *)a2 + 770)) * v87);
    *((float *)a2 + 770) = v46;
    v47 = *((float *)a2 + 771) + (float)((float)(v47 - *((float *)a2 + 771)) * v87);
    goto LABEL_36;
  }
  v46 = *((float *)a2 + 770);
LABEL_37:
  *((float *)v10 + 4) = v46;
  *((_DWORD *)v10 + 5) = *((_DWORD *)a2 + 771);
  CAWBAFEFDAssist::CalculateWhiteColorHist(this);
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v53 = (float)(*((unsigned __int16 *)a2 + 797) * *((unsigned __int16 *)a2 + 796)) / 3193300.0;
  v54 = (char *)this + 35932;
  do
  {
    v55 = a4[v49];
    v56 = *(_DWORD *)&v54[v49 * 4];
    if (v56)
    {
      v57 = (float)((float)v56 * v53) + 0.5;
      v51 += (int)v57;
      *(_DWORD *)&v54[v49 * 4] = (int)v57;
      v50 += a4[v49];
    }
    v52 += v55;
    ++v49;
  }
  while (v49 != 1024);
  v58 = (float)v52;
  v59 = (float)v51;
  if (v51)
    v60 = (float)v52 / (float)v51;
  else
    v60 = 0.0;
  v61 = (float)v50;
  v62 = 1.0;
  if (v58 >= 1.0)
    v62 = (float)v52;
  v63 = v61 / v62;
  *((float *)a2 + 780) = v61 / v62;
  *((_DWORD *)a2 + 785) = v52;
  *((_DWORD *)a2 + 786) = v51;
  *((_DWORD *)a2 + 787) = v50;
  LOWORD(v61) = *((_WORD *)a2 + 799);
  v64 = CAWBAFEFDAssist::EstimateCurve((float)LODWORD(v61), v48, (uint64_t)&unk_23092D514);
  *((float *)a2 + 781) = v64;
  v66 = CAWBAFEFDAssist::EstimateCurve(*((float *)a2 + 776), v65, (uint64_t)&unk_23092D52C);
  *((float *)a2 + 782) = v66;
  v68 = CAWBAFEFDAssist::EstimateCurve(*((float *)a2 + 778), v67, (uint64_t)&unk_23092D544);
  *((float *)a2 + 783) = v68;
  v70 = CAWBAFEFDAssist::EstimateCurve(v63, v69, (uint64_t)&unk_23092D55C);
  *((float *)a2 + 784) = v70;
  v71 = v60 * (float)((float)((float)(v64 * v66) * v68) * v70);
  *((float *)a2 + 775) = v71;
  if (v10[36])
  {
    if (*((_DWORD *)v10 + 10) != 1)
    {
      v72 = 1.0;
      v73 = v71 < 0.0 || v71 > 1.0;
      if (v71 <= 1.0 || v71 < 0.0)
        v72 = 0.0;
      if (v73)
        v71 = v72;
    }
  }
  else
  {
    v81 = *((float *)a2 + 774);
    if (*((_DWORD *)a2 + 401))
    {
      v82 = v71 - v81;
      v83 = v71 - (float)(v81 + 0.03125);
      if (v82 > 0.03125)
        v81 = v81 + 0.03125;
      else
        v83 = v82;
      if (v83 < -0.03125)
        v81 = v81 + -0.03125;
    }
    v71 = 1.0;
    v84 = v81 < 0.0 || v81 > 1.0;
    if (v81 <= 1.0 || v81 < 0.0)
      v71 = 0.0;
    if (!v84)
      v71 = v81;
  }
  *((float *)a2 + 774) = v71;
  if (v71 > 0.0)
  {
    for (i = 0; i != 1024; ++i)
      a4[i] = (float)((float)((float)((float)(v71 * (float)(v58 / (float)(v58 + (float)(v59 * v71))))
                                                  * (float)*(unsigned int *)((char *)this + i * 4 + 35932))
                                          + (float)((float)a4[i] * (float)(v58 / (float)(v58 + (float)(v59 * v71)))))
                                  + 0.5);
  }
  *((_BYTE *)a2 + 1612) = 1;
  *((_DWORD *)a2 + 1) = 0;
  *((float *)a2 + 2) = v71;
}

BOOL CAWBAFEFDAssist::UseProvidedMatchSkinGains(CAWBAFEFDAssist *this, fdAWBMetaData *a2)
{
  unsigned int v3;
  float v5;
  float v6;
  float v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = *((unsigned __int16 *)a2 + 799);
  v8[0] = *((_QWORD *)a2 + 384);
  v7 = *((float *)a2 + 776);
  if (!*((_BYTE *)a2 + 1596))
    return 0;
  if (v3 <= 1)
    return *((unsigned __int16 *)a2 + 800) > 1u;
  CAWBAFEFDAssist::CalculateSkinSampleStats(this, v3, (float *)v8, &v7);
  v5 = *((float *)a2 + 777);
  v6 = v5 >= v7 ? v5 - v7 : v7 - v5;
  return v6 > 0.5;
}

CAWBAFEFDAssist *CAWBAFEFDAssist::SetNumAwbSkin2WhiteLUT(CAWBAFEFDAssist *this, int a2)
{
  *((_DWORD *)this + 10018) = a2;
  return this;
}

uint64_t CAWBAFEFDAssist::SetDigitalFlashBehaviorMode(uint64_t result, int a2)
{
  *(_DWORD *)(result + 40068) = a2;
  return result;
}

float CAWBAFEFDAssist::GetWhitePointCenter(CAWBAFEFDAssist *this, float *a2)
{
  float result;

  *a2 = *((float *)this + 10011);
  result = *((float *)this + 10012);
  a2[1] = result;
  return result;
}

float CAWBAFEFDAssist::SetMatchWhitePointCenter(CAWBAFEFDAssist *this, float *a2)
{
  float result;

  *((float *)this + 10013) = *a2;
  result = a2[1];
  *((float *)this + 10014) = result;
  return result;
}

float CAWBAFEFDAssist::GetSkinPointCenter(CAWBAFEFDAssist *this, float *a2)
{
  float result;

  *a2 = *((float *)this + 10007);
  result = *((float *)this + 10008);
  a2[1] = result;
  return result;
}

float CAWBAFEFDAssist::SetMatchSkinPointCenter(CAWBAFEFDAssist *this, float *a2)
{
  float result;

  *((float *)this + 10009) = *a2;
  result = a2[1];
  *((float *)this + 10010) = result;
  return result;
}

float AuxCompute::CalcTotalGainDown(AuxCompute *this, const sRefDriverInputs *a2, float a3)
{
  if (!*(_BYTE *)this)
    return 1.0;
  LOWORD(a3) = *((_WORD *)this + 1);
  return (float)LODWORD(a3) * 0.00024414;
}

float AuxCompute::CalcExposureRatio(AuxCompute *this, const sRefDriverInputs *a2, float a3)
{
  unsigned int v3;
  float v4;
  float v5;
  float v6;
  float result;
  unsigned int v8;

  LOWORD(a3) = *((_WORD *)this + 14);
  *(float *)&v3 = (float)*((unsigned int *)this + 3) * 0.0039062;
  v4 = (float)((float)LODWORD(a3) * 0.0039062) * *(float *)&v3;
  LOWORD(v3) = *((_WORD *)this + 15);
  v5 = fmaxf(*((float *)this + 9), 1.0)
     * (float)((float)(v4 * (float)((float)v3 * 0.0039062)) * (float)((float)*((unsigned int *)this + 8) * 0.0039062));
  v6 = (float)*((unsigned __int16 *)this + 20) * 0.0039062;
  if (!*((_WORD *)this + 20))
    v6 = 1.0;
  result = v5 * v6;
  if (*((_BYTE *)this + 42))
  {
    if (*((_BYTE *)this + 43) != 1)
    {
      v8 = *((unsigned __int8 *)this + 44);
      if (v8 <= 0x11 && ((1 << v8) & 0x38042) != 0)
      {
        v6 = (float)*((unsigned int *)this + 12) * 0.0039062;
        result = result * v6;
      }
    }
  }
  if (*(_BYTE *)this)
  {
    LOWORD(v6) = *((_WORD *)this + 1);
    result = result * fmaxf(fminf((float)LODWORD(v6) * 0.00024414, 15.999), 1.0);
  }
  if (*((_BYTE *)this + 1348))
    return result / *((float *)this + 338);
  return result;
}

float32_t AuxCompute::levelSmooth3x3SinglePlane(AuxCompute *this, float *a2, int a3, float *a4, const float *a5, const float *a6, double a7, int8x16_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  char *v12;
  const float *v13;
  float32x4_t v14;
  float v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  float32x4_t v22;
  int8x16_t v23;
  float32x4_t v24;
  uint64_t i;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  float *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  _DWORD v44[10];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v44[0] = 0;
  if ((int)a2 >= 1)
  {
    v8 = 0;
    do
    {
      v44[v8 + 1] = v8;
      ++v8;
    }
    while (a2 != v8);
  }
  v44[(int)a2 + 1] = (_DWORD)a2 - 1;
  if ((int)a2 >= -1)
  {
    v9 = ((_DWORD)a2 + 2);
    v10 = v44;
    do
    {
      v11 = *v10++;
      v12 = (char *)this + 4 * v11 * a3;
      a8.i64[0] = *(_QWORD *)(v12 + 20);
      v13 = a5;
      v14 = vld1q_dup_f32(v13++);
      v15 = a5[2];
      v16 = *(float32x4_t *)(v12 + 4);
      v17 = v16;
      v17.i32[3] = *(_DWORD *)v12;
      v18.i64[0] = *(_QWORD *)(v12 + 4);
      v18.i32[2] = *(_DWORD *)v12;
      v19 = (int8x16_t)vmulq_n_f32(v17, *v13);
      v18.i32[3] = *(_DWORD *)v12;
      v20 = (int8x16_t)vdupq_laneq_s32((int32x4_t)v16, 3);
      v21 = (int8x16_t)vmlaq_f32((float32x4_t)vextq_s8(v19, v19, 4uLL), v14, v18);
      v22 = (float32x4_t)vextq_s8(vextq_s8(v20, v20, 4uLL), a8, 0xCuLL);
      v23 = vextq_s8((int8x16_t)v22, (int8x16_t)v16, 4uLL);
      v22.i32[3] = *((_DWORD *)v12 + 7);
      a8.i32[2] = v22.i32[3];
      a8.i32[3] = v22.i32[3];
      v24 = vmlaq_n_f32(vmlaq_f32(vmulq_n_f32(v22, *v13), v14, (float32x4_t)vextq_s8((int8x16_t)v16, v23, 8uLL)), (float32x4_t)a8, v15);
      *(float32x4_t *)v12 = vmlaq_n_f32((float32x4_t)vextq_s8(v21, v21, 8uLL), v16, v15);
      *((float32x4_t *)v12 + 1) = v24;
      --v9;
    }
    while (v9);
  }
  v44[0] = 0;
  if (a3 >= 1)
  {
    for (i = 0; i != a3; ++i)
      v44[i + 1] = i;
  }
  v44[a3 + 1] = a3 - 1;
  if (a3 >= -1)
  {
    v26 = (a3 + 2);
    v27 = v44;
    do
    {
      v28 = *v27++;
      v29 = (float *)((char *)this + 4 * v28);
      v30 = v29[a3];
      v31 = v29[2 * a3];
      v32 = v29[3 * a3];
      v33 = v29[4 * a3];
      v34 = v29[5 * a3];
      v35 = a4[1];
      v36 = a4[2];
      v37 = (float)((float)(*v29 * v35) + (float)(*v29 * *a4)) + (float)(v30 * v36);
      v38 = (float)((float)(v30 * v35) + (float)(*v29 * *a4)) + (float)(v31 * v36);
      v39 = (float)((float)(v31 * v35) + (float)(v30 * *a4)) + (float)(v32 * v36);
      v40 = (float)((float)(v32 * v35) + (float)(v31 * *a4)) + (float)(v33 * v36);
      v41 = (float)((float)(v33 * v35) + (float)(v32 * *a4)) + (float)(v34 * v36);
      v42 = (float)(v34 * v35) + (float)(v33 * *a4);
      *v29 = v37;
      v29[a3] = v38;
      v29[2 * a3] = v39;
      v29[3 * a3] = v40;
      v24.f32[0] = v42 + (float)(v34 * v36);
      v29[4 * a3] = v41;
      v29[5 * a3] = v24.f32[0];
      --v26;
    }
    while (v26);
  }
  return v24.f32[0];
}

__n128 AuxCompute::CalcLTMspatialCCMSize(uint64_t a1, uint64_t a2)
{
  int32x2_t v2;
  __int16 v3;
  __int16 v4;
  int32x2_t v5;
  __n128 result;

  *(_DWORD *)(a2 + 44) = 786448;
  v2 = *(int32x2_t *)a1;
  result.n128_u64[0] = (unint64_t)vcvt_s32_f32(vrndm_f32(vdiv_f32(vcvt_f32_u32(*(uint32x2_t *)(a1 + 8)), (float32x2_t)0x4130000041700000)));
  v3 = *(_QWORD *)a1;
  v4 = WORD2(*(_QWORD *)a1);
  v5 = vneg_s32((int32x2_t)vcvt_n_u32_f32(vdiv_f32(vcvt_f32_s32(*(int32x2_t *)a1), vcvt_f32_s32((int32x2_t)result.n128_u64[0])), 0x10uLL));
  *(_WORD *)(a2 + 34) = v4;
  *(int32x2_t *)(a2 + 24) = v5;
  result.n128_u64[1] = result.n128_u64[0];
  *(_WORD *)(a2 + 32) = v2.i16[0];
  *(_WORD *)(a2 + 40) = 16 * result.n128_u16[0];
  *(_WORD *)(a2 + 42) = 12 * result.n128_u16[2];
  *(_WORD *)(a2 + 36) = v3 + 16 * result.n128_u16[0];
  *(_WORD *)(a2 + 38) = v4 + 12 * result.n128_u16[2];
  *(int32x2_t *)a2 = v2;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void AuxCompute::CalcAntiAliasingSettings(AuxCompute *this, sRefDriverInputs *a2, unsigned int *a3, AuxCompute *a4, sRefDriverInputs *a5, float a6)
{
  float v9;
  float v10;
  unsigned int v11;
  int8x8_t v12;
  float32x2_t v13;
  float32x2_t v14;
  uint64_t v15;
  int32x2_t v16;
  __int128 *v17;
  uint64_t v18;
  __int128 *v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = fminf(AuxCompute::CalcExposureRatio(a4, a2, a6) / *((float *)a4 + 4), 28.0);
  *(_BYTE *)this = 1;
  v10 = fmaxf(v9, 1.0);
  *(_DWORD *)&a2->HROn = 3;
  v23 = xmmword_23092D740;
  v24 = unk_23092D750;
  v25 = xmmword_23092D760;
  v26 = unk_23092D770;
  v21 = xmmword_23092D720;
  v22 = unk_23092D730;
  v27 = 15;
  if (v10 <= 6.0)
  {
    v11 = (int)fmaxf((float)((float)((float)(v10 * v10) * 0.0) + (float)(v10 * 0.0)) + 0.0, 0.0);
    v13 = vmla_n_f32(vmul_n_f32((float32x2_t)0x3F2A48B03FA48073, v10 * v10), (float32x2_t)0xC0AA5200C1688D12, v10);
    v14 = (float32x2_t)0x40FFA109424BC1CELL;
LABEL_6:
    v12 = (int8x8_t)vcvt_s32_f32(vmaxnm_f32(vadd_f32(v13, v14), 0));
    goto LABEL_7;
  }
  if (v10 >= 9.0)
  {
    v11 = (int)fmaxf((float)((float)((float)(v10 * v10) * 0.0) + (float)(v10 * 0.0)) + 0.0, 0.0);
    v13 = vmla_n_f32(vmul_n_f32((float32x2_t)0x3B736566BE2015ACLL, v10 * v10), (float32x2_t)0xBDAD73FF4104C70CLL, v10);
    v14 = (float32x2_t)0x3EEB4166C2771041;
    goto LABEL_6;
  }
  v11 = 0;
  v12 = 0;
LABEL_7:
  v15 = 0;
  HIDWORD(v24) = v11;
  *(int8x8_t *)((char *)&v22 + 4) = vand_s8(v12, (int8x8_t)0xFFFF0000FFFFLL);
  v16.i32[0] = vadd_s32((int32x2_t)(v11 | 0xFFFF00000000), *(int32x2_t *)((char *)&v22 + 4)).u32[0];
  v16.i32[1] = vadd_s32(*(int32x2_t *)(&v22 + 4), *(int32x2_t *)(&v22 + 4)).i32[1];
  *((int32x2_t *)&v23 + 1) = vsub_s32((int32x2_t)0x10000000100, v16);
  HIDWORD(v22) = v11;
  LODWORD(v24) = DWORD2(v23);
  *(int32x2_t *)&v25 = vrev64_s32(*(int32x2_t *)((char *)&v22 + 4));
  v17 = &v21;
  do
  {
    v18 = 0;
    v19 = v17;
    do
    {
      v20 = *(_DWORD *)v19;
      v19 = (__int128 *)((char *)v19 + 20);
      a3[v18++] = v20;
    }
    while (v18 != 5);
    ++v15;
    a3 += 5;
    v17 = (__int128 *)((char *)v17 + 4);
  }
  while (v15 != 5);
}

void sub_2308F3710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void soft_FigCaptureGetModelSpecificName(void)
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getFigCaptureGetModelSpecificNameSymbolLoc(void)::ptr;
  v8 = getFigCaptureGetModelSpecificNameSymbolLoc(void)::ptr;
  if (!getFigCaptureGetModelSpecificNameSymbolLoc(void)::ptr)
  {
    v1 = CMCaptureLibrary();
    v0 = dlsym(v1, "FigCaptureGetModelSpecificName");
    v6[3] = (uint64_t)v0;
    getFigCaptureGetModelSpecificNameSymbolLoc(void)::ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    ((void (*)(void))v0)();
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *soft_FigCaptureGetModelSpecificName()");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("AWBAlgorithm.mm"), 50, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_2308F3864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2308F3994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2308F4134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_2308F4F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, _Unwind_Exception *exception_object)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_2308F51AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308F54D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2308F5794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2308F5A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2308F66A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27)
{
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_2308F692C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2308F6E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2308F7B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_2308F7F48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308F8038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2308F9784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30)
{
  void *v30;

  _Unwind_Resume(a1);
}

void sub_2308F9EDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308FB3F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308FB8E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308FBB24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2308FC230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_2308FC744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2308FD920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_2308FE92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void *CMCaptureLibrary(void)
{
  void *v0;
  void *v2;
  void *v3;

  if (!CMCaptureLibraryCore(char **)::frameworkLibrary)
    CMCaptureLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = (void *)CMCaptureLibraryCore(char **)::frameworkLibrary;
  if (!CMCaptureLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CMCaptureLibrary()");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AWBAlgorithm.mm"), 49, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_2308FEC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2308FEE0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23090053C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_230900D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2309017EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_230901CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_230901D94()
{
  JUMPOUT(0x230901D80);
}

void sub_230901EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void LTMDriver::LTMDriver(LTMDriver *this)
{
  this->var0 = (void **)&off_24FEC62A0;
}

void LTMDriver::~LTMDriver(LTMDriver *this)
{
  JUMPOUT(0x2348BC8E0);
}

void LTMDriver::ComputeThumbnailHistogram(LTMDriver *this, const sCLRProcHITHStat *a2, float a3, sLtmComputeInput *a4)
{
  float *thumbnailHist;
  unsigned int thumbnailDownsampleY;
  unsigned int v9;
  uint64_t v10;
  float v11;
  _WORD *thumbnailStat;
  float *thumbnailHistEV0;
  uint64_t thumbnailTotal;
  float v15;
  int v16;
  unsigned int v17;
  float v18;
  int v19;
  uint64_t v20;
  float *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  float32x4_t *v25;
  unint64_t v26;
  float32x4_t v27;
  float32x4_t *v28;
  unint64_t v29;
  float32x4_t v30;
  float v31;
  float v32;
  uint64_t v33;
  float v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  uint64_t v39;
  unint64_t v40;
  float *v41;
  float32x4_t *v42;
  float32x4_t v43;
  uint64_t v44;
  uint64_t v45;
  float *v46;
  float *v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float32x4_t *v54;
  unint64_t v55;
  float32x4_t v56;
  float v57;

  thumbnailHist = a4->thumbnailHist;
  thumbnailDownsampleY = a2->thumbnailDownsampleY;
  if (a2->thumbnailDownsampleY)
    thumbnailDownsampleY = (unsigned __int16)a2->thumbnailWindow / thumbnailDownsampleY;
  if (a2->thumbnailDownsampleX)
    v9 = HIWORD(a2->thumbnailWindow) / a2->thumbnailDownsampleX;
  else
    v9 = 0;
  v10 = v9 * thumbnailDownsampleY;
  v11 = (float)(int)v10;
  v57 = 1.0 / (float)(int)v10;
  thumbnailStat = a2->thumbnailStat;
  thumbnailHistEV0 = a4->thumbnailHistEV0;
  bzero(a4->thumbnailHist, 0x304uLL);
  if ((_DWORD)v10)
  {
    v16 = 4;
    thumbnailTotal = a2->thumbnailTotal;
    do
    {
      v17 = (unsigned __int16)thumbnailStat[v16 - 4];
      v18 = (float)v17;
      v19 = vcvtms_s32_f32((float)v17 * 0.00097656);
      if (v19 >= 63)
        v19 = 63;
      v20 = v19;
      v21 = &a4->localHist[v19];
      LOWORD(v15) = thumbnailStat[v16];
      v15 = v21[4384] + (float)LODWORD(v15);
      v22 = v17 >> 4;
      v21[4256] = v21[4256] + 1.0;
      v23 = vcvtms_s32_f32((float)(v18 * a3) * 0.00097656);
      if (v23 >= 63)
        v23 = 63;
      v21[4384] = v15;
      if (v22 <= 0xFFE)
        v24 = v23;
      else
        v24 = v20;
      a4->thumbnailHistEV0[v24] = a4->thumbnailHistEV0[v24] + 1.0;
      v16 += thumbnailTotal;
      --v10;
    }
    while (v10);
    if (*thumbnailHist > 0.0)
      thumbnailHist[242] = thumbnailHist[64] / *thumbnailHist;
  }
  v25 = (float32x4_t *)&a4->thumbnailHist[4];
  v26 = -8;
  do
  {
    v27 = vmulq_n_f32(*v25, v57);
    v25[-1] = vmulq_n_f32(v25[-1], v57);
    *v25 = v27;
    v26 += 8;
    v25 += 2;
  }
  while (v26 < 0x38);
  v28 = (float32x4_t *)&a4->thumbnailLumaHist[4];
  v29 = -8;
  do
  {
    v30 = vmulq_n_f32(*v28, v57);
    v28[-1] = vmulq_n_f32(v28[-1], v57);
    *v28 = v30;
    v29 += 8;
    v28 += 2;
  }
  while (v29 < 0x38);
  if (a3 < 1.0)
  {
    LODWORD(thumbnailTotal) = vcvtps_s32_f32(a3 * 64.0);
    if ((int)thumbnailTotal <= 63)
    {
      v31 = 0.0;
      v32 = 0.0;
      if ((int)thumbnailTotal >= 1)
      {
        v33 = thumbnailTotal;
        do
        {
          v34 = *thumbnailHistEV0++;
          v32 = v32 + v34;
          --v33;
        }
        while (v33);
      }
      v35 = v57 * v32;
      v36 = (int)thumbnailTotal;
      v37 = (int)thumbnailTotal;
      do
        v31 = v31 + LTMDriver::defaultHist[v37++];
      while ((_DWORD)v37 != 64);
      v38 = (float)((float)(1.0 - v35) * v11) / v31;
      v39 = (64 - (_DWORD)thumbnailTotal) & ~((64 - (int)thumbnailTotal) >> 31);
      if ((v39 & 0x7FFFFFF8) != 0)
      {
        v40 = 0;
        v41 = &a4->thumbnailHistEV0[v36 + 4];
        v42 = (float32x4_t *)&LTMDriver::defaultHist[v36 + 4];
        do
        {
          v43 = vaddq_f32(vmulq_n_f32(*v42, v38), (float32x4_t)0);
          *((float32x4_t *)v41 - 1) = vaddq_f32(vmulq_n_f32(v42[-1], v38), (float32x4_t)0);
          *(float32x4_t *)v41 = v43;
          v40 += 8;
          v41 += 8;
          v42 += 2;
        }
        while (v40 < (v39 & 0x7FFFFFF8));
      }
      else
      {
        LODWORD(v40) = 0;
      }
      if ((int)v40 < (int)v39)
      {
        v44 = v39 - v40;
        v45 = 4 * v36 + 4 * v40;
        v46 = (float *)((char *)a4->thumbnailHistEV0 + v45);
        v47 = (float *)((char *)LTMDriver::defaultHist + v45);
        do
        {
          v48 = *v47++;
          *v46++ = (float)(v48 * v38) + 0.0;
          --v44;
        }
        while (v44);
      }
    }
  }
  v49 = thumbnailHist[127];
  v50 = v11 - v49;
  v51 = fminf(v49, 1.0);
  v52 = v50 + v51;
  v53 = 2.0 / (float)(v52 + v11);
  thumbnailHist[127] = v51;
  thumbnailHist[243] = v52 / v11;
  v54 = (float32x4_t *)&a4->thumbnailHistEV0[4];
  v55 = -8;
  do
  {
    v56 = vmulq_n_f32(*v54, v53);
    v54[-1] = vmulq_n_f32(v54[-1], v53);
    *v54 = v56;
    v55 += 8;
    v54 += 2;
  }
  while (v55 < 0x38);
}

uint64_t LTMDriver::Process(LTMDriver *this, const sCLRProcHITHStat *a2, sRefDriverInputs *a3, sLtmComputeInput *a4)
{
  BOOL *p_useSpatialCCM;
  float *p_sceneLux;
  LTMDriver *v10;
  LTMDriver *v11;
  LTMDriver *v12;
  LTMDriver *v13;
  double v14;
  float v15;
  const sRefDriverInputs *v16;
  float v17;
  float v18;
  uint64_t exposureTime;
  float hardIspDGain;
  unsigned int v21;
  unsigned int v22;
  float v23;
  float v24;
  const sRefDriverInputs *v25;
  float v26;
  float v27;
  float v28;
  unsigned int expBias;
  unsigned int realizedExpBias;
  float v31;
  float v32;
  LTMDriver *v33;
  LTMDriver *v34;
  BOOL v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  *(_OWORD *)&this->var2.tuningParametersOverride[3].darkSceneLux = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[3].sceneBlackMax = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[3].minSceneLux = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[3].sceneModelSmoothing = 0u;
  p_useSpatialCCM = &this->var2.useSpatialCCM;
  *(_OWORD *)&this->var2.tuningParametersOverride[3].dispRangeActiveRatio = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[3].desatStrength = 0u;
  p_sceneLux = &a4->sceneLux;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].ambientViewingChromaticityY = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[3].histDampingExponentHighlight = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].dispRangeDarkRatio = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].shadowDesat = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].sceneBgOffset = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].shadowSuppressMax = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].dispBlack = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].maxPaddingRange = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].fstart = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].ambientViewingChromaticityX = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].shadowSuppressBase = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].smoothingStrength = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].hmaxHeadroom = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].sceneBlackRatioDark = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].ambientViewingLux = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].dispLum = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].histSmoothingMax = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].nonFaceRatioFloor = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].sceneBlackRatio = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].minFlareDark = 0u;
  *(_OWORD *)&this->var2.levelSmoothNumPasses = 0u;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].histDampingExponentMax = 0u;
  *(_OWORD *)&this->var2.useLinearLTCs = 0u;
  bzero(a4, 0x4A6CuLL);
  LTMDriver::ComputeLocalHistograms(v10, a2, a4);
  LTMDriver::ComputeGlobalHistogram(v11, a2, a4);
  v13 = (LTMDriver *)LTMDriver::computeFaceWeightForTone(v12, a3, a4);
  LTMDriver::HFFThumbnailDownscaleConvert(v13, a2, a4, v14, v15);
  *((_WORD *)p_sceneLux + 434) = *(_WORD *)&a3->LTMHazeCorrectionOff;
  v18 = AuxCompute::CalcTotalGainDown((AuxCompute *)a3, v16, v17);
  exposureTime = a3->exposureTime;
  p_sceneLux[216] = (float)(a3->gainAnal.v16
                          * (unint64_t)a3->gainDigi
                          * a3->overflowDGain
                          * a3->ev0Ratio
                          * exposureTime)
                  / 4.295e15;
  *p_sceneLux = fmaxf(a3->luxLevel, 0.0001);
  hardIspDGain = a3->hardIspDGain;
  v21 = 20.0;
  p_sceneLux[9] = 1.0 - fminf(fmaxf(a3->softIspDGain + -12.0, 0.0) / 20.0, 1.0);
  LOWORD(v21) = a3->gainDigiSensor.v16;
  *(float *)&v22 = (float)v21;
  v23 = (float)exposureTime * *(float *)&v22;
  LOWORD(v22) = a3->gainAnal.v16;
  v24 = (float)(hardIspDGain * (float)(v23 * (float)v22)) / v18;
  p_sceneLux[215] = v24;
  v26 = AuxCompute::CalcExposureRatio((AuxCompute *)a3, v25, v24);
  v27 = a3->hardIspDGain;
  v28 = v26 / v27;
  p_sceneLux[3] = v28;
  expBias = a3->expBias;
  realizedExpBias = a3->realizedExpBias;
  if (expBias > 0xFF)
  {
    if (expBias >= realizedExpBias)
      expBias = a3->realizedExpBias;
    v31 = fmaxf((float)expBias * 0.0039062, 1.0);
  }
  else
  {
    if (expBias <= realizedExpBias)
      expBias = a3->realizedExpBias;
    v31 = fminf((float)expBias * 0.0039062, 1.0);
  }
  p_sceneLux[4] = v31;
  p_sceneLux[5] = v28 / fmaxf(v31, 1.0);
  v32 = fmaxf(p_sceneLux[216] * 0.5, 1.0);
  p_sceneLux[6] = fmaxf(a3->faceExpRatioFiltered, 1.0);
  p_sceneLux[7] = v32;
  p_sceneLux[8] = powf(fmaxf((float)((float)(a3->overflowDGain * a3->gainDigi) / 65535.0) + -16.0, 0.0) / 80.0, 1.5);
  v34 = (LTMDriver *)LTMDriver::ComputeLumaFromThumbnail(v33, a2, v27, a4);
  LTMDriver::ComputeThumbnailHistogram(v34, a2, p_sceneLux[5], a4);
  v35 = a3->ltmProcMode == 1;
  *(_DWORD *)(p_useSpatialCCM + 7) = a3->gammaCurve;
  p_useSpatialCCM[2] = v35;
  *p_useSpatialCCM = a3->useSpatialCCM;
  p_useSpatialCCM[1] = 0;
  p_useSpatialCCM[3] = a3->flashStatus;
  *(_QWORD *)(p_useSpatialCCM + 15) = 0x4000000000000001;
  v36 = *(_OWORD *)a3[1].flashMixPercentage;
  v37 = *(_OWORD *)&a3[1].flashMixPercentage[8];
  v38 = *(_OWORD *)&a3[1].LTMGridConfigWidth;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].ambientViewingChromaticityY = *(_OWORD *)&a3[1].flashMixPercentage[14];
  *(_OWORD *)&this->var2.tuningParametersOverride[0].minSceneLux = v38;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].darkSceneLux = v37;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].sceneModelSmoothing = v36;
  v39 = *(_OWORD *)&a3[1].hardIspDGain;
  v40 = *(_OWORD *)&a3[1].overflowDGain;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].desatStrength = *(_OWORD *)&a3[1].bracketingExpRatio;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].dispRangeActiveRatio = v40;
  *(_OWORD *)&this->var2.tuningParametersOverride[0].histDampingExponentHighlight = v39;
  v41 = *(_OWORD *)&a3[1].flashMixPercentage[54];
  v42 = *(_OWORD *)&a3[1].flashMixPercentage[62];
  v43 = *(_OWORD *)&a3[1].flashMixPercentage[68];
  *(_OWORD *)&this->var2.tuningParametersOverride[1].minSceneLux = *(_OWORD *)&a3[1].flashMixPercentage[46];
  *(_OWORD *)&this->var2.tuningParametersOverride[1].ambientViewingChromaticityY = v43;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].darkSceneLux = v42;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].sceneModelSmoothing = v41;
  v44 = *(_OWORD *)&a3[1].flashMixPercentage[22];
  v45 = *(_OWORD *)&a3[1].flashMixPercentage[30];
  *(_OWORD *)&this->var2.tuningParametersOverride[1].desatStrength = *(_OWORD *)&a3[1].flashMixPercentage[38];
  *(_OWORD *)&this->var2.tuningParametersOverride[1].dispRangeActiveRatio = v45;
  *(_OWORD *)&this->var2.tuningParametersOverride[1].histDampingExponentHighlight = v44;
  v46 = *(_OWORD *)&a3[1].flashMixPercentage[76];
  v47 = *(_OWORD *)&a3[1].flashMixPercentage[84];
  *(_OWORD *)&this->var2.tuningParametersOverride[2].desatStrength = *(_OWORD *)&a3[1].flashMixPercentage[92];
  *(_OWORD *)&this->var2.tuningParametersOverride[2].dispRangeActiveRatio = v47;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].histDampingExponentHighlight = v46;
  v48 = *(_OWORD *)&a3[1].flashMixPercentage[100];
  v49 = *(_OWORD *)&a3[1].flashMixPercentage[108];
  v50 = *(_OWORD *)&a3[1].flashMixPercentage[116];
  *(_OWORD *)&this->var2.tuningParametersOverride[2].ambientViewingChromaticityY = *(_OWORD *)&a3[1].flashMixPercentage[122];
  *(_OWORD *)&this->var2.tuningParametersOverride[2].sceneModelSmoothing = v49;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].darkSceneLux = v50;
  *(_OWORD *)&this->var2.tuningParametersOverride[2].minSceneLux = v48;
  p_useSpatialCCM[459] = a3[1].flashMixPercentage[130];
  p_useSpatialCCM[23] = a3->channel;
  LTMDriver::UpdateColorInformation(this, a4, a3, a2);
  return 0;
}

void LTMDriver::ComputeLocalHistograms(LTMDriver *this, const sCLRProcHITHStat *a2, sLtmComputeInput *a3)
{
  unsigned int v4;
  char *localHistStat;
  unsigned __int16 *v6;
  int v7;
  float v8;
  sLtmComputeInput *v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned int v20;
  uint64_t v21;
  float v22;
  unint64_t v23;
  float32x4_t *v24;
  unint64_t v25;
  float32x4_t v26;
  float32x4_t v27;

  v4 = (a2->localHistBlockSizeY * a2->localHistBlockSizeX) >> (a2->localHistCountBitShift + 1);
  localHistStat = (char *)a2->localHistStat;
  v6 = (unsigned __int16 *)malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
  v7 = 0;
  v8 = 1.0 / (float)v4;
  v9 = a3;
  do
  {
    v10 = 0;
    v11 = 0;
    v12 = *(_OWORD *)(localHistStat + 20);
    v13 = *(_OWORD *)(localHistStat + 52);
    v14 = *(_OWORD *)(localHistStat + 4);
    *((_OWORD *)v6 + 2) = *(_OWORD *)(localHistStat + 36);
    *((_OWORD *)v6 + 3) = v13;
    *(_OWORD *)v6 = v14;
    *((_OWORD *)v6 + 1) = v12;
    v15 = *(_OWORD *)(localHistStat + 68);
    v16 = *(_OWORD *)(localHistStat + 84);
    v17 = *(_OWORD *)(localHistStat + 116);
    *((_OWORD *)v6 + 6) = *(_OWORD *)(localHistStat + 100);
    *((_OWORD *)v6 + 7) = v17;
    *((_OWORD *)v6 + 4) = v15;
    *((_OWORD *)v6 + 5) = v16;
    v18 = *v6 + *(_WORD *)localHistStat;
    *v6 = v18;
    *v6 = v18 + *((_WORD *)localHistStat + 1);
    v19 = v6[63] + *((_WORD *)localHistStat + 67);
    v6[63] = v19;
    v6[63] = v19 + *((_WORD *)localHistStat + 66);
    do
    {
      v20 = v6[v10];
      v11 += v20;
      v9->localHist[v10++] = v8 * (float)v20;
    }
    while (v10 != 63);
    v21 = 0;
    v22 = fmax((double)(int)(v4 - v11), 0.0) * v8;
    v9->localHist[63] = v22;
    v23 = -4;
    do
    {
      *(float32x4_t *)&a3->averageLocalHist[v21] = vaddq_f32(*(float32x4_t *)&a3->averageLocalHist[v21], *(float32x4_t *)&v9->localHist[v21]);
      v23 += 4;
      v21 += 4;
    }
    while (v23 < 0x3C);
    localHistStat += 136;
    v9 = (sLtmComputeInput *)((char *)v9 + 256);
    ++v7;
  }
  while (v7 != 48);
  free(v6);
  v24 = (float32x4_t *)&a3->averageLocalHist[4];
  v25 = -8;
  v26 = (float32x4_t)vdupq_n_s32(0x3CAAAAABu);
  do
  {
    v27 = vmulq_f32(*v24, v26);
    v24[-1] = vmulq_f32(v24[-1], v26);
    *v24 = v27;
    v25 += 8;
    v24 += 2;
  }
  while (v25 < 0x38);
}

void LTMDriver::ComputeGlobalHistogram(LTMDriver *this, const sCLRProcHITHStat *a2, sLtmComputeInput *a3)
{
  int v3;
  float *globalHist;
  unsigned int v5;
  char *globalHistStat;
  float v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  float v11;

  v3 = 0;
  globalHist = a3->globalHist;
  v5 = (HIWORD(a2->globalHistWindow) * (unsigned __int16)a2->globalHistWindow) >> 1;
  globalHistStat = (char *)a2->globalHistStat;
  v7 = 1.0 / (float)v5;
  do
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *(_DWORD *)&globalHistStat[v8 * 4];
      v9 += v10;
      globalHist[v8++] = v7 * (float)v10;
    }
    while (v8 != 255);
    v11 = fmax((double)(int)(v5 - v9), 0.0) * v7;
    globalHist[255] = v11;
    globalHistStat += 1024;
    globalHist += 256;
    ++v3;
  }
  while (v3 != 4);
}

uint64_t LTMDriver::computeFaceWeightForTone(LTMDriver *this, const sRefDriverInputs *a2, sLtmComputeInput *a3)
{
  float LTMGridConfigHeight;
  float LTMGridConfigWidth;
  float32x4_t v5;
  uint64_t numFaces;
  uint64_t v8;
  float v9;
  float v10;
  float *faceWeightForTone;
  float32x4_t v17;
  float32x4_t v19;
  uint64_t v20;
  sCIspFDRect *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  int32x4_t v26;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  float v30;
  float32x4_t v31;
  int32x4_t v32;
  uint64_t v33;
  float v34;
  float32x2_t v35;
  float32x2_t v36;
  uint64x2_t v37;
  int32x2_t v38;
  float32x2_t v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const float *v45;
  char *v46;
  int32x2_t v48;
  int64x2_t v49;
  float v50;
  uint64x2_t v51;
  float32x4_t v52;
  float v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float v57;
  float v58;
  float32x4_t v59;
  float32x4_t v60;
  float v61;
  float32x4_t v62;
  unsigned __int8 v63;
  int32x4_t v64;
  int64x2_t v65;
  _QWORD v66[3];
  _OWORD v67[2];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  LTMGridConfigWidth = a2->LTMGridConfigWidth;
  LTMGridConfigHeight = a2->LTMGridConfigHeight;
  v5.i32[1] = 0;
  memset(v67, 0, sizeof(v67));
  memset(v66, 0, sizeof(v66));
  *(_OWORD *)a3->faceWeightForTone = 0u;
  *(_OWORD *)&a3->faceWeightForTone[4] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[8] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[12] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[16] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[20] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[24] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[28] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[32] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[36] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[40] = 0u;
  *(_OWORD *)&a3->faceWeightForTone[44] = 0u;
  if (!a2->forceDisableFaceBoost)
  {
    numFaces = a2->faceInfo.numFaces;
    if ((_DWORD)numFaces)
    {
      v8 = 0;
      v9 = sqrtf(LTMGridConfigHeight * LTMGridConfigWidth);
      v10 = LTMGridConfigWidth / v9;
      faceWeightForTone = a3->faceWeightForTone;
      __asm { FMOV            V4.4S, #1.0 }
      v17 = (float32x4_t)vdupq_n_s64(6uLL);
      __asm { FMOV            V12.2S, #1.0 }
      v50 = LTMGridConfigHeight / v9;
      v51 = (uint64x2_t)v17;
      v19 = (float32x4_t)vdupq_n_s64(2uLL);
      v49 = (int64x2_t)v19;
      v52 = _Q4;
      v53 = v10;
      do
      {
        v20 = 0;
        v21 = &a2->faceInfo.rectArray[v8];
        v22 = a2->LTMGridConfigWidth;
        v23 = a2->LTMGridConfigHeight;
        v24 = (float)v21->height / v23;
        v25 = fmaxf((float)v21->y - a2->LTMGridConfigY, 0.0);
        v19.f32[0] = v24 * 0.5;
        v48 = *(int32x2_t *)v19.f32;
        v19.f32[0] = (float)v21->width / v22;
        v17.f32[0] = fminf(v19.f32[0], 1.0);
        v19.f32[0] = v19.f32[0] * 0.5;
        v5.f32[0] = v19.f32[0] + (float)(fmaxf((float)v21->x - a2->LTMGridConfigX, 0.0) / v22);
        v17.f32[0] = sqrtf(v17.f32[0]);
        v55 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 0);
        v56 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 0);
        v54 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 0);
        v26 = (int32x4_t)xmmword_23092FA90;
        do
        {
          v64 = v26;
          v62 = vaddq_f32(vmulq_n_f32(vmaxnmq_f32(vsubq_f32(vabdq_f32(vcvtq_f32_s32(v26), v56), v55), (float32x4_t)0), v53), v52);
          v58 = powf(v62.f32[1], 4.0);
          v27.f32[0] = powf(v62.f32[0], 4.0);
          v27.f32[1] = v58;
          v59 = v27;
          v28 = powf(v62.f32[2], 4.0);
          v29 = v59;
          v29.f32[2] = v28;
          v60 = v29;
          v30 = powf(v62.f32[3], 4.0);
          v31 = v60;
          v31.f32[3] = v30;
          v67[v20] = vdivq_f32(v54, v31);
          v32.i64[0] = 0x400000004;
          v32.i64[1] = 0x400000004;
          v26 = vaddq_s32(v64, v32);
          ++v20;
        }
        while (v20 != 2);
        v33 = 0;
        *(float *)v26.i32 = *(float *)v48.i32 + (float)(v25 / v23);
        v34 = sqrtf(fminf(v24, 1.0));
        v35 = (float32x2_t)vdup_lane_s32(v48, 0);
        v36 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 0);
        v37 = (uint64x2_t)xmmword_23092D460;
        do
        {
          v63 = vmovn_s64((int64x2_t)vcgtq_u64(v51, v37)).u8[0];
          v65 = (int64x2_t)v37;
          v38.i32[0] = v33 * 2;
          v38.i32[1] = v33 * 2 + 1;
          v39 = vadd_f32(vmul_n_f32(vmaxnm_f32(vsub_f32(vabd_f32(vcvt_f32_s32(v38), v36), v35), 0), v50), _D12);
          v57 = v39.f32[0];
          v61 = powf(v39.f32[1], 4.0);
          v40 = powf(v57, 4.0);
          if ((v63 & 1) != 0)
            *(float *)&v66[v33] = v34 / v40;
          if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v65)).i32[1] & 1) != 0)
            *((float *)&v66[v33] + 1) = v34 / v61;
          ++v33;
          v37 = (uint64x2_t)vaddq_s64(v65, v49);
        }
        while (v33 != 3);
        v41 = 0;
        v42 = 0;
        do
        {
          v43 = 0;
          v44 = v42 << 32;
          v45 = (const float *)v66 + v41;
          v42 = (int)v42 + 8;
          v19 = vld1q_dup_f32(v45);
          v46 = (char *)faceWeightForTone + (v44 >> 30);
          do
          {
            v17 = (float32x4_t)v67[v43];
            v5 = vmlaq_f32(*(float32x4_t *)&v46[v43 * 16], v19, v17);
            *(float32x4_t *)&v46[v43 * 16] = v5;
            ++v43;
          }
          while (v43 != 2);
          ++v41;
        }
        while (v41 != 6);
        ++v8;
      }
      while (v8 != numFaces);
    }
  }
  return 0;
}

void LTMDriver::HFFThumbnailDownscaleConvert(LTMDriver *this, const sCLRProcHITHStat *a2, sLtmComputeInput *a3, double a4, float a5)
{
  _WORD *thumbnailStat;
  float *ltcGridScaleLogLumaThumb;
  int v7;
  unsigned int thumbnailTotal;
  int v9;
  int i;
  signed int v11;
  uint64_t v12;
  float32x2_t v13;
  float32x2_t v14;
  uint64_t v15;
  float64x2_t v16;
  float v17;
  float v18;

  thumbnailStat = a2->thumbnailStat;
  ltcGridScaleLogLumaThumb = a3->ltcGridScaleLogLumaThumb;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[40] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[44] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[32] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[36] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[24] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[28] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[16] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[20] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[8] = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[12] = 0u;
  *(_OWORD *)a3->ltcGridScaleLogLumaThumb = 0u;
  *(_OWORD *)&a3->ltcGridScaleLogLumaThumb[4] = 0u;
  v7 = 1;
  thumbnailTotal = a2->thumbnailTotal;
  do
  {
    v9 = thumbnailTotal * ((34 * v7) | 1);
    for (i = 1; i != 33; ++i)
    {
      LOWORD(a5) = thumbnailStat[v9];
      v11 = ((2 * v7 - 2) & 0xFFFFFFF8) + ((char)(i - 1 + (((char)(i - 1) >> 13) & 3)) >> 2);
      a5 = ltcGridScaleLogLumaThumb[v11] + (float)((float)LODWORD(a5) / 65535.0);
      ltcGridScaleLogLumaThumb[v11] = a5;
      v9 += thumbnailTotal;
    }
    ++v7;
  }
  while (v7 != 25);
  v12 = 0;
  v13 = (float32x2_t)vdup_n_s32(0x3D800000u);
  v16 = (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL);
  do
  {
    v14 = vcvt_f32_f64(vaddq_f64(vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&ltcGridScaleLogLumaThumb[v12], v13)), v16));
    v17 = v14.f32[0];
    v18 = logf(v14.f32[1]);
    *(float *)&v15 = logf(v17);
    *((float *)&v15 + 1) = v18;
    *(_QWORD *)&ltcGridScaleLogLumaThumb[v12] = v15;
    v12 += 2;
  }
  while (v12 != 48);
}

uint64_t LTMDriver::ComputeLumaFromThumbnail(LTMDriver *this, const sCLRProcHITHStat *a2, float a3, sLtmComputeInput *a4)
{
  int v4;
  int v5;
  signed int v6;
  signed int v7;
  float v8;
  _WORD *thumbnailStat;
  int v10;
  int v11;
  int v12;
  uint64_t result;
  int v14;
  signed int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  int v23;
  uint64_t v24;
  int v25;
  signed int v26;
  unsigned int thumbnailTotal;
  uint64_t v28;
  int v29;
  signed int v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  float v35;
  float *v36;
  int v37;

  v4 = 0;
  v5 = 0;
  v6 = (unsigned __int16)a2->thumbnailWindow / a2->thumbnailDownsampleY;
  v7 = HIWORD(a2->thumbnailWindow) / a2->thumbnailDownsampleX;
  v8 = a3 / 65535.0;
  thumbnailStat = a2->thumbnailStat;
  v10 = v6 - 24;
  if (v6 < 24)
    v10 = v6 - 23;
  v11 = (int)(float)(v10 >> 1);
  v12 = v7 - 32;
  if (v7 < 32)
    v12 = v7 - 31;
  v37 = (int)(float)(v12 >> 1);
  result = 16640;
  do
  {
    if (v11 <= 2)
      v14 = 2;
    else
      v14 = v11;
    if (v6 >= v11 + 6)
      v15 = v11 + 6;
    else
      v15 = v6;
    v16 = v14 - 2;
    v17 = v5;
    v5 += 8;
    v18 = v37;
    v19 = 34 * v14 - 70;
    do
    {
      if (v18 <= 2)
        v20 = 2;
      else
        v20 = v18;
      if (v16 >= v15)
      {
        v22 = 0;
        v21 = 0;
      }
      else
      {
        v21 = 0;
        v22 = 0;
        v23 = v19 + v20;
        v24 = v20 - 2;
        v25 = v20 - 2;
        v26 = v18 + 6;
        if (v7 < v18 + 6)
          v26 = v7;
        thumbnailTotal = a2->thumbnailTotal;
        v28 = v26;
        v29 = thumbnailTotal * v23 + 1;
        v30 = v16;
        do
        {
          v31 = v29;
          v32 = v24;
          if (v25 < (int)v28)
          {
            do
            {
              v33 = (unsigned __int16)thumbnailStat[v31 + 1];
              if ((unsigned __int16)thumbnailStat[v31] > v33)
                v33 = (unsigned __int16)thumbnailStat[v31];
              v34 = (unsigned __int16)thumbnailStat[v31 + 2];
              if (v34 <= v33)
                v34 = v33;
              if (v34 > v22)
              {
                v21 = thumbnailStat[v31 - 1];
                v22 = v34;
              }
              ++v32;
              v31 += thumbnailTotal;
            }
            while (v32 < v28);
          }
          ++v30;
          v29 += 34 * thumbnailTotal;
        }
        while (v30 < v15);
      }
      v35 = fminf(v8 * (float)v22, 1.0);
      v36 = &a4->localHist[v17];
      v36[4160] = v35;
      v36[4208] = fminf((float)v21, 65535.0) / 65535.0;
      ++v17;
      v18 += 4;
    }
    while (v5 != (_DWORD)v17);
    v11 += 4;
    ++v4;
  }
  while (v4 != 6);
  return result;
}

__int16 LTMDriver::UpdateColorInformation@<H0>(LTMDriver *this@<X0>, sLtmComputeInput *a2@<X1>, const sRefDriverInputs *a3@<X2>, const sCLRProcHITHStat *a4@<X3>)
{
  float *p_rGainRatio;
  LTMDriver *v7;
  uint64_t v8;
  unsigned int v9;
  float v10;
  unsigned int v11;
  float v12;
  float v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  p_rGainRatio = &a2->rGainRatio;
  if (a3->awbColorspace)
    v7 = (LTMDriver *)LTMDriver::GamutBoundaryRatio(this, a4);
  else
    v7 = 0;
  v8 = 0;
  *((_WORD *)p_rGainRatio + 4) = (_WORD)v7;
  do
  {
    v9 = a3->ccm.coeff[v8].v16;
    v10 = (float)v9;
    if ((a3->ccm.coeff[v8].v16 & 0x8000u) != 0)
      v10 = (float)v9 + -65536.0;
    HIWORD(v11) = 14720;
    v12 = v10 * 0.00024414;
    a2->ccm[v8++] = v12;
  }
  while (v8 != 9);
  if (a3->useSpatialCCM)
  {
    LOWORD(v12) = *(_WORD *)(&a3->isLEDMainFlashforAWB + 1);
    v13 = (float)LODWORD(v12);
    if (a3->isLEDMainFlashforAWB)
    {
      LOWORD(v11) = *(unsigned __int16 *)((char *)&a3->awbGainsSkinOnly.b.v16 + 1);
      *(float *)&v14 = (float)v11;
      *(float *)&v15 = *(float *)&v14 / v13;
      *p_rGainRatio = *(float *)&v15;
      LOWORD(v15) = *(unsigned __int16 *)((char *)&a3->awbGainsFlashProj.gb.v16 + 1);
      LOWORD(v14) = *(unsigned __int16 *)((char *)&a3->awbGains.gb.v16 + 1);
      p_rGainRatio[1] = (float)v15 / (float)v14;
      p_rGainRatio[204] = 1.0;
      LTMDriver::CalculateSpatialCCMWeightMapForLEDFlash(v7, a3, a2);
    }
    else
    {
      LOWORD(v11) = *(unsigned __int16 *)((char *)&a3->awbGains.b.v16 + 1);
      *(float *)&v16 = (float)v11;
      *(float *)&v17 = *(float *)&v16 / v13;
      *p_rGainRatio = *(float *)&v17;
      LOWORD(v17) = *(unsigned __int16 *)((char *)&a3->awbGainsSkinOnly.gb.v16 + 1);
      LOWORD(v16) = *(unsigned __int16 *)((char *)&a3->awbGains.gb.v16 + 1);
      p_rGainRatio[1] = (float)v17 / (float)v16;
      p_rGainRatio[204] = (float)a3->fdAWBChistMixFactor * 0.0039062;
      LTMDriver::ComputeSpatialCCMWeightMap(v7, a3, a2);
    }
  }
  return LOWORD(v12);
}

unsigned int LTMDriver::GamutBoundaryRatio(LTMDriver *this, const sCLRProcHITHStat *a2)
{
  float v2;
  float v3;
  unsigned int v4;
  unsigned int v5;
  _WORD *thumbnailStat;
  int v7;
  uint64_t v8;
  float v9;
  unsigned int thumbnailTotal;
  int v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  int v18;
  BOOL v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  signed int v30;
  float v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  float v37;
  float v38;
  _OWORD v40[4];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (a2->thumbnailDownsampleY)
    v4 = (unsigned __int16)a2->thumbnailWindow / a2->thumbnailDownsampleY;
  else
    v4 = 0;
  if (a2->thumbnailDownsampleX)
    v5 = HIWORD(a2->thumbnailWindow) / a2->thumbnailDownsampleX;
  else
    v5 = 0;
  thumbnailStat = a2->thumbnailStat;
  memset(v40, 0, sizeof(v40));
  if (v4)
  {
    v7 = 0;
    v8 = 0;
    HIWORD(v9) = 14208;
    do
    {
      if (v5)
      {
        thumbnailTotal = a2->thumbnailTotal;
        v11 = thumbnailTotal * v7 + 3;
        v12 = v5;
        do
        {
          LOWORD(v9) = thumbnailStat[v11 - 2];
          v13 = (float)LODWORD(v9);
          LOWORD(v2) = thumbnailStat[v11 - 1];
          v14 = (float)LODWORD(v2);
          LOWORD(v3) = thumbnailStat[v11];
          v3 = (float)LODWORD(v3);
          v15 = (float)((float)(v14 * -0.22499) + (float)(v13 * 1.225)) + (float)(v3 * -0.000005);
          v16 = (float)((float)(v14 * 1.0421) + (float)(v13 * -0.042061)) + (float)(v3 * -0.000001);
          v2 = v14 * -0.078641;
          v9 = v2 + (float)(v13 * -0.019641);
          v17 = v9 + (float)(v3 * 1.0983);
          if (v15 < 0.0)
            v18 = -1;
          else
            v18 = 0;
          if (v15 > 65535.0)
            v18 = 1;
          if ((v16 <= 65535.0 || v17 <= 65535.0) && v15 < 0.0)
            v18 = -1;
          if (v17 > 65535.0 || (v16 <= 65535.0 ? (v21 = v18 == 0) : (v21 = 0), !v21))
          {
            v22 = (float)((float)(v16 * 0.17757) + (float)(v15 * 0.82243)) + (float)(v17 * 0.000004);
            v23 = vabds_f32(v15, v22);
            v24 = 0.0;
            if (v18 == 1)
              v24 = (float)(v15 + -65535.0) / v23;
            v25 = (float)((float)(v16 * 0.9668) + (float)(v15 * 0.033196)) + (float)(v17 * 0.000001);
            if (v16 > 65535.0)
              v24 = fmaxf(v24, (float)(v16 + -65535.0) / vabds_f32(v16, v25));
            v9 = (float)((float)(v16 * 0.072402) + (float)(v15 * 0.017085)) + (float)(v17 * 0.91051);
            if (v17 > 65535.0)
              v24 = fmaxf(v24, (float)(v17 + -65535.0) / vabds_f32(v17, v9));
            if (v18 == -1)
              v24 = fmaxf(v24, (float)-v15 / v23);
            v3 = 1.0;
            v2 = fminf(v24, 1.0);
            if (v2 > 0.0)
            {
              v26 = fmaxf(fminf(v15, 65535.0), 0.0);
              v27 = fmaxf(fminf(v16, 65535.0), 0.0);
              v28 = fmaxf(fminf(v17, 65535.0), 0.0);
              v29 = (float)((float)((float)(vabds_f32(v22, fmaxf(fminf((float)((float)(v27 * 0.17757) + (float)(v26 * 0.82243))+ (float)(v28 * 0.000004), 65535.0), 0.0))* 27.217)+ (float)(vabds_f32(v25, fmaxf(fminf((float)((float)(v27 * 0.9668) + (float)(v26 * 0.033196))+ (float)(v28 * 0.000001), 65535.0), 0.0))* 6.7213))+ (float)(vabds_f32(v9,
                                      fmaxf(fminf((float)((float)(v27 * 0.072402) + (float)(v26 * 0.017085))+ (float)(v28 * 0.91051), 65535.0), 0.0))* 50.482))* 0.000015259;
              v3 = v2 + 1.0;
              v30 = llroundf(v2 * 15.0);
              v31 = (float)(v29 * v29) / (float)(v2 + 1.0);
              v2 = *((float *)v40 + v30);
              v9 = v31 + v2;
              *((float *)v40 + v30) = v9;
            }
          }
          v11 += thumbnailTotal;
          --v12;
        }
        while (v12);
      }
      ++v8;
      v7 += v5;
    }
    while (v8 != v4);
  }
  v32 = 0;
  v33 = 0.0;
  do
  {
    v33 = v33 + *(float *)((char *)v40 + v32);
    v32 += 4;
  }
  while (v32 != 64);
  v34 = 0.0;
  if (v33 > 1.0)
  {
    v35 = 0.0;
    v36 = 15;
    while (1)
    {
      v37 = v35 + *((float *)v40 + v36);
      if (v37 > 1.0)
        break;
      --v36;
      v35 = v37;
      if (v36 == -1)
      {
        v38 = 16.0;
        v35 = v37;
        goto LABEL_50;
      }
    }
    v38 = (float)(int)v36;
LABEL_50:
    v34 = (float)((float)(int)(float)(v38 - (float)((float)(1.0 - v35) / (float)(v37 - v35))) * 0.0625) * 10.0;
  }
  return llroundf(v34);
}

void LTMDriver::ComputeSpatialCCMWeightMap(LTMDriver *this, const sRefDriverInputs *a2, sLtmComputeInput *a3)
{
  uint64_t numFaces;
  uint64_t v6;
  float v7;
  float v8;
  int v9;
  int v10;
  float v11;
  uint64_t v12;
  int v13;
  sCIspFDRect *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  int v24;
  float v25;
  float v26;
  float v27;
  BOOL v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  char v34;
  float v35;
  int v36;
  float *ccmWeights;
  uint64_t v38;
  _DWORD v39[8];
  unsigned __int16 v40;
  unsigned __int16 v41;

  numFaces = a2->faceInfo.numFaces;
  AuxCompute::CalcLTMspatialCCMSize((uint64_t)&a2->tileStatsRegionInRaw, (uint64_t)v39);
  if ((int)numFaces < 1)
  {
    v11 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = (float)(16 * v39[4]);
    v8 = (float)(12 * v39[5]);
    v9 = v40;
    v10 = v41;
    v11 = 0.0;
    do
    {
      LODWORD(v12) = 0;
      v13 = 0;
      v14 = &a2->faceInfo.rectArray[v6];
      v15 = fmaxf((float)(v14->x - v9) / v7, 0.0);
      v16 = fmaxf((float)(v14->y - v10) / v8, 0.0);
      v17 = v15 * 16.0;
      v18 = v16 * 12.0;
      v19 = (float)(v15 + fminf((float)v14->width / v7, 1.0)) * 16.0;
      v20 = (float)(v16 + fminf((float)v14->height / v8, 1.0)) * 12.0;
      v21 = (float)((float)(v15 * 16.0) + v19) * 0.5;
      v22 = (float)((float)(v16 * 12.0) + v20) * 0.5;
      v23 = (float)(fmaxf(v21, 16.0 - v21) + -0.5) + (float)(fmaxf(v22, 12.0 - v22) + -0.5);
      do
      {
        v24 = 0;
        v25 = (float)v13;
        v26 = (float)v13 + 0.5;
        if (v26 <= v22)
          v27 = (float)(v22 - (float)v13) + -0.5;
        else
          v27 = v26 - v22;
        v28 = v18 > v25;
        if (v20 < v25)
          v28 = 1;
        v29 = fminf((float)++v13, v20) - fmaxf(v25, v18);
        v12 = (int)v12;
        do
        {
          v30 = (float)v24;
          v31 = (float)v24 + 0.5;
          if (v31 <= v21)
            v32 = (float)(v21 - (float)v24) + -0.5;
          else
            v32 = v31 - v21;
          v33 = fmaxf(fminf(1.0 - (float)((float)(v27 + v32) / v23), 1.0), 0.0);
          v34 = v17 > v30 || v28;
          if ((v34 & 1) != 0 || v19 < v30)
          {
            ++v24;
          }
          else
          {
            v35 = v29 * (float)(fminf((float)++v24, v19) - fmaxf(v30, v17));
            if (v35 > v33)
              v33 = v35;
          }
          if (v33 > v11)
            v11 = v33;
          a3->ccmWeights[v12] = fmaxf(v33, a3->ccmWeights[v12]);
          ++v12;
        }
        while (v24 != 16);
      }
      while (v13 != 12);
      ++v6;
    }
    while (v6 != numFaces);
  }
  v36 = 0;
  ccmWeights = a3->ccmWeights;
  do
  {
    v38 = 0;
    do
    {
      if (v11 > 0.0)
        ccmWeights[v38] = ccmWeights[v38] / v11;
      ++v38;
    }
    while ((_DWORD)(v38 * 4) != 64);
    ++v36;
    ccmWeights += 16;
  }
  while (v36 != 12);
}

uint64_t LTMDriver::CalculateSpatialCCMWeightMapForLEDFlash(LTMDriver *this, const sRefDriverInputs *a2, sLtmComputeInput *a3)
{
  uint64_t v3;
  uint16x8_t v4;
  uint64_t v5;
  float *p_flashProjMixWeighting;
  float32x4_t v7;
  float32x4_t v8;
  unsigned __int16 *flashMixPercentage;
  uint16x8_t v10;
  float32x4_t *v11;
  uint64_t v12;
  uint64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint64_t v16;
  uint64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  uint64_t v27;
  int v28;
  float v29;
  int v30;
  uint64_t v31;
  float *v32;
  uint64_t v33;
  float v34;
  _DWORD v35[17];
  _DWORD v36[273];
  uint64_t v37;

  v3 = 0;
  v37 = *MEMORY[0x24BDAC8D0];
  v4.i64[0] = 0x1000100010001;
  v4.i64[1] = 0x1000100010001;
  do
  {
    v4 = vmaxq_u16(*(uint16x8_t *)&a2->flashMixPercentage[v3], v4);
    v3 += 8;
  }
  while (v3 != 256);
  v5 = 0;
  v4.i16[0] = vmaxvq_u16(v4);
  p_flashProjMixWeighting = &a2->flashProjMixWeighting;
  *(float *)v4.i32 = (float)v4.u32[0];
  v7 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.i8, 0);
  v8 = vld1q_dup_f32(p_flashProjMixWeighting);
  flashMixPercentage = a2->flashMixPercentage;
  do
  {
    v10 = *(uint16x8_t *)flashMixPercentage;
    flashMixPercentage += 8;
    v11 = (float32x4_t *)&v36[v5 + 17];
    *v11 = vmulq_f32(v8, vdivq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v10.i8)), v7));
    v11[1] = vmulq_f32(v8, vdivq_f32(vcvtq_f32_u32(vmovl_high_u16(v10)), v7));
    v5 += 8;
  }
  while (v5 != 256);
  v12 = 0;
  v13 = (uint64x2_t)vdupq_n_s64(0x11uLL);
  v14 = (int64x2_t)xmmword_23092D460;
  v15 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v13, (uint64x2_t)v14)).u8[0] & 1) != 0)
      *(float *)&v36[v12] = (float)(int)v12 * 0.0625;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x11uLL), *(uint64x2_t *)&v14)).i32[1] & 1) != 0)
      *(float *)&v36[v12 + 1] = (float)(v12 + 1) * 0.0625;
    v12 += 2;
    v14 = vaddq_s64(v14, v15);
  }
  while (v12 != 18);
  v16 = 0;
  v36[0] = 0;
  v36[16] = 1065353216;
  v17 = (uint64x2_t)vdupq_n_s64(0x11uLL);
  v18 = (int64x2_t)xmmword_23092D460;
  v19 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v17, (uint64x2_t)v18)).u8[0] & 1) != 0)
      *(float *)&v35[v16] = (float)(int)v16 * 0.0625;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x11uLL), *(uint64x2_t *)&v18)).i32[1] & 1) != 0)
      *(float *)&v35[v16 + 1] = (float)(v16 + 1) * 0.0625;
    v16 += 2;
    v18 = vaddq_s64(v18, v19);
  }
  while (v16 != 18);
  LODWORD(v20) = 0;
  v21 = 0;
  v22 = 0;
  v35[0] = 0;
  v35[16] = 1065353216;
  do
  {
    ++v22;
    if (v21 >= 17)
    {
      v23 = v21;
      LODWORD(v24) = v21;
    }
    else
    {
      v23 = v21;
      v24 = v21;
      do
      {
        if ((float)((float)v22 / 12.0) <= *(float *)&v35[v24])
          break;
        ++v24;
      }
      while (v24 != 17);
    }
    v25 = 0;
    LODWORD(result) = 0;
    v20 = (int)v20;
    if ((int)v24 >= 16)
      LODWORD(v24) = 16;
    do
    {
      result = (result + 1);
      LODWORD(v27) = v25;
      if (v25 <= 16)
      {
        v27 = v25;
        do
        {
          if ((float)((float)(int)result * 0.0625) <= *(float *)&v36[v27])
            break;
          ++v27;
        }
        while (v27 != 17);
      }
      if ((int)v27 >= 16)
        LODWORD(v27) = 16;
      if (v21 >= (int)v24)
      {
        v28 = 0;
        v29 = 0.0;
      }
      else
      {
        v28 = 0;
        v29 = 0.0;
        v30 = 16 * v23;
        v31 = v23;
        do
        {
          if ((int)v27 > v25)
          {
            v32 = (float *)&v36[v25 + 17 + (uint64_t)v30];
            v33 = (int)v27 - (uint64_t)v25;
            do
            {
              v34 = *v32++;
              v29 = v29 + v34;
              --v33;
            }
            while (v33);
            v28 += v27 - v25;
          }
          ++v31;
          v30 += 16;
        }
        while (v31 != (int)v24);
      }
      v25 = v27 - 1;
      a3->ccmWeights[v20++] = v29 / (float)v28;
    }
    while ((_DWORD)result != 16);
    v21 = v24 - 1;
  }
  while (v22 != 12);
  return result;
}

void CAWBAFE::~CAWBAFE(CAWBAFE *this)
{
  CDualLEDsWhitePointProjector *var2;
  CAWBAFEFDAssist *var4;
  CAWBAFEPhotometerAssistPenrose *var5;
  sPhotometerAWBMetadata *var6;
  fdAWBMetaData *var112;

  this->var0 = (void **)off_24FEC61E8;
  var2 = this->var2;
  if (var2)
    (*(void (**)(CDualLEDsWhitePointProjector *))(*(_QWORD *)var2 + 8))(var2);
  var4 = this->var4;
  if (var4)
    (*(void (**)(CAWBAFEFDAssist *))(*(_QWORD *)var4 + 8))(var4);
  var5 = this->var5;
  if (var5)
    (*(void (**)(CAWBAFEPhotometerAssistPenrose *))(*(_QWORD *)var5 + 8))(var5);
  var6 = this->var6;
  if (var6)
    free(var6);
  var112 = this->var112;
  if (var112)
    free(var112);
}

uint64_t CAWBAFE::SmoothingActivate(CAWBAFE *this, _BOOL4 a2)
{
  if (!this->var141.var1 && a2)
  {
    *(_OWORD *)&this->var141.var3.var4 = 0u;
    *(_OWORD *)this->var141.var3.var3 = 0u;
    *(_OWORD *)&this->var141.var3.var1 = 0u;
    this->var141.var3.var0 = this->var142;
  }
  if (!a2)
  {
    *(_OWORD *)&this->var141.var3.var4 = 0u;
    *(_OWORD *)&this->var141.var3.var2[2] = 0u;
    *(_OWORD *)&this->var141.var3.var0 = 0u;
  }
  this->var141.var1 = a2;
  return 0;
}

uint64_t CAWBAFE::SetSmoothingSamplingRate(CAWBAFE *this, unsigned int a2)
{
  this->var141.var2 = a2;
  return 0;
}

void *CAWBAFE::SetFaceData(uint64_t a1, __int128 *a2, void *__src)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  size_t v7;

  v4 = *(_QWORD *)(a1 + 21224);
  v5 = *a2;
  v6 = a2[1];
  *(_OWORD *)(v4 + 40) = *(__int128 *)((char *)a2 + 28);
  *(_OWORD *)(v4 + 28) = v6;
  *(_OWORD *)(v4 + 12) = v5;
  if (*(_DWORD *)(a1 + 23880) == 1)
    v7 = 160;
  else
    v7 = 1520;
  return memcpy((void *)(*(_QWORD *)(a1 + 21224) + 56), __src, v7);
}

uint64_t CAWBAFE::setUnagiSkyDetected(uint64_t result, _DWORD *a2)
{
  *(_DWORD *)(result + 23884) = *a2;
  return result;
}

BOOL CAWBAFE::GetLargestFaceRect(CAWBAFE *this, sCIspFDRect *a2)
{
  fdAWBMetaData *var112;
  int v3;

  var112 = this->var112;
  v3 = *((_DWORD *)var112 + 9);
  if (v3)
  {
    *(_QWORD *)&a2->x = *((_QWORD *)var112 + 7);
    a2->width = *((_DWORD *)var112 + 17);
    a2->height = *((_DWORD *)var112 + 16);
  }
  return v3 != 0;
}

void CAWBAFE::ComputeSkinColor_fdProbApproach(CAWBAFE *this, unsigned int *a2, const sMetaData *a3, double a4)
{
  int *p_var109;
  unsigned __int16 *p_var68;
  fdAWBMetaData *var112;
  _FE_3A_Stats_H15 *var7;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int x;
  int y;
  uint64_t v17;
  double v18;
  double v19;
  CAWBAFEFDAssist *updated;
  fdAWBMetaData *v21;
  int v22;
  fdAWBMetaData *v23;
  uint64_t v24;
  uint64_t v25;
  float *v26;
  uint64_t v27;
  float *v28;
  unsigned int v29;
  double v30;
  double v31;
  float v32;
  double v33;
  unint64_t v34;
  int v35;
  _DWORD *v36;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  p_var109 = &this->var109;
  p_var68 = &this->var68;
  var112 = this->var112;
  *(_BYTE *)var112 = this->var121;
  var7 = this->var7;
  v11 = *((unsigned __int16 *)var7 + 176);
  *((_DWORD *)var112 + 394) = v11;
  v12 = *((unsigned __int16 *)var7 + 177);
  *((_DWORD *)var112 + 395) = v12;
  *((_DWORD *)var112 + 396) = v12 * v11;
  *((_BYTE *)var112 + 3160) = 0;
  *((_BYTE *)var112 + 3178) = this->var105;
  v13 = *((_DWORD *)var7 + 4071) >> *((_BYTE *)var7 + 342);
  v14 = *((_DWORD *)var7 + 4072) >> *((_BYTE *)var7 + 343);
  x = a3->sensorCrop.x;
  y = a3->sensorCrop.y;
  if (!a3->zoom.isFEStatOTF)
  {
    x += a3->DMACrop.x;
    y += a3->DMACrop.y;
  }
  *((_DWORD *)var112 + 796) = (*((unsigned __int16 *)var7 + 178) << 16) / v13 + x;
  *((_DWORD *)var112 + 797) = (*((unsigned __int16 *)var7 + 179) << 16) / v14 + y;
  *((_DWORD *)var112 + 798) = (*((unsigned __int16 *)var7 + 174) << 16) / v13;
  *((_DWORD *)var112 + 799) = (*((unsigned __int16 *)var7 + 175) << 16) / v14;
  *((_DWORD *)var112 + 398) = *((_DWORD *)var7 + 90);
  *p_var109 = 0;
  LODWORD(v17) = this->var139;
  if (this->var139)
  {
    if (a3->awb.semanticFrameCount == -1)
    {
      LODWORD(v17) = 0;
    }
    else
    {
      v17 = *((_QWORD *)var112 + 382);
      if (v17)
      {
        LODWORD(v17) = this->var110;
        *p_var109 = v17;
      }
    }
  }
  *((_DWORD *)var112 + 789) = v17;
  CAWBAFEFDAssist::GetfdWindowRGB(this->var4, var112, this->var10, (const unsigned int *)var7 + 9, a4);
  updated = CAWBAFEFDAssist::GetfdTileRGBFDProbApproach(this->var4, this->var112, this->var9, v18, v19);
  v21 = this->var112;
  v22 = *((_DWORD *)v21 + 789);
  switch(v22)
  {
    case 2:
      updated = CAWBAFEFDAssist::GetfdHiResWindowRGB(this->var4, v21, this->var11, (const unsigned int *)this->var7 + 49);
      break;
    case 1:
      CAWBAFEFDAssist::UpdateSemanticTileProbTable(this->var4, v21, a3, this->var7);
      break;
    case 0:
      updated = (CAWBAFEFDAssist *)CAWBAFEFDAssist::UpdateANODTileProbTable(this->var4, v21, this->var7);
      break;
  }
  v23 = this->var112;
  if (*((_BYTE *)p_var68 + 536) && (*((_DWORD *)v23 + 789) - 1) <= 1)
  {
    CAWBAFEFDAssist::CalculateSemanticSpatialCCMMap(this->var4, v23, a3, this->var140);
    v23 = this->var112;
  }
  if (*((_WORD *)v23 + 799))
  {
    v39 = 0;
    v24 = MEMORY[0x24BDAC7A8](updated);
    v26 = (float *)((char *)&v39 - v25);
    MEMORY[0x24BDAC7A8](v24);
    v28 = (float *)((char *)&v39 - v27);
    CAWBAFEFDAssist::GetfdSkinRGB(this->var4, v26, v29);
    if (*((_WORD *)this->var112 + 799))
    {
      v34 = 0;
      v35 = 0;
      v36 = v26 + 2;
      do
      {
        v40 = *((_QWORD *)v36 - 1);
        v41 = *v36;
        CAWBAFE::GetBinIndices((uint64_t)this, (float *)&v39 + 1, (float *)&v39, (float *)&v40, 2, COERCE_DOUBLE(__PAIR64__(HIDWORD(v40), v41)), v30, v31, v32, v33);
        if (*((float *)&v39 + 1) > 0.0 && *((float *)&v39 + 1) < 32.0)
        {
          LODWORD(v30) = v39;
          if (*(float *)&v39 > 0.0 && *(float *)&v39 < 32.0)
          {
            v28[2 * v35] = *((float *)&v39 + 1);
            v28[(2 * v35++) | 1] = *(float *)&v30;
          }
        }
        ++v34;
        v36 += 3;
      }
      while (v34 < *((unsigned __int16 *)this->var112 + 799));
    }
    else
    {
      LOWORD(v35) = 0;
    }
    CAWBAFEFDAssist::SetfdSkinC1C2(this->var4, v28, (unsigned __int16)v35);
    *((_WORD *)this->var112 + 799) = v35;
  }
  CAWBAFEFDAssist::SetNumAwbSkin2WhiteLUT(this->var4, p_var109[308]);
  CAWBAFEFDAssist::ModifyColorHistogramProbApproach(this->var4, this->var112, this->var113, a2, *p_var68);
}

uint64_t CAWBAFE::GetBinIndices(uint64_t result, float *a2, float *a3, float *a4, int a5, double a6, double a7, double a8, float a9, double a10)
{
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  unsigned int v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  unsigned int v30;
  float v31;
  unsigned int v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  unsigned int v41;
  float v42;
  float v43;
  float v44;
  __int16 v45;
  float v46;
  unsigned int v47;
  float v48;

  v12 = result;
  v14 = *a4;
  v13 = a4[1];
  v15 = a4[2];
  if (a5 <= 0)
  {
    if ((v14 == 0.0 || v13 == 0.0 || v15 == 0.0) && *(int *)(result + 8) >= 10)
      result = printf("ERR: CAWBAFEH9::calculateC1C2FromWBGain: input WBGain = %f %f %f \n\n", v14, v13, v15);
    if (v13 >= v15)
      v16 = v15;
    else
      v16 = v13;
    if (v14 < v16)
      v16 = v14;
    v17 = v16 * 200.0;
    v14 = v17 / v14;
    v13 = v17 / v13;
    v15 = v17 / v15;
    goto LABEL_18;
  }
  if (a5 == 1)
  {
LABEL_18:
    v18 = (float)*(__int16 *)(v12 + 542);
    v19 = (float)*(__int16 *)(v12 + 544);
    v20 = (float)*(__int16 *)(v12 + 546);
    a9 = (float)(v18 + v19) + v20;
    v21 = (float)((float)((float)(v13 * v19) + (float)(v14 * v18)) + (float)(v15 * v20)) / a9;
    if (v21 <= 255.0)
      v13 = v21;
    else
      v13 = 255.0;
    goto LABEL_21;
  }
  if (a5 <= 2)
  {
LABEL_21:
    v22 = 0.0;
    if (v14 >= 0.0)
      v22 = v14;
    v23 = 255.0;
    if (v22 > 255.0)
      v22 = 255.0;
    v24 = (int)v22;
    v25 = v22 + 1.0;
    if ((float)(v22 + 1.0) <= 255.0)
      v23 = v22 + 1.0;
    if ((int)v23 <= v24)
      v26 = (float)v24;
    else
      v26 = (float)(v22 - (float)v24) / (float)(int)((int)v23 - v24);
    LOWORD(v25) = log2Lut[v24];
    LOWORD(a9) = log2Lut[v23];
    v27 = (float)LODWORD(a9);
    v28 = 0.0;
    if (v13 >= 0.0)
      v28 = v13;
    v29 = 255.0;
    if (v28 > 255.0)
      v28 = 255.0;
    v30 = (int)v28;
    v31 = v28 + 1.0;
    if ((float)(v28 + 1.0) <= 255.0)
      v29 = v28 + 1.0;
    v32 = (int)v29;
    v33 = (float)v30;
    if (v32 > v30)
    {
      v28 = v28 - v33;
      v33 = v28 / (float)(int)(v32 - v30);
    }
    v34 = 1.0 - v26;
    v35 = (float)LODWORD(v25);
    v36 = v26 * v27;
    v37 = 1.0 - v33;
    LOWORD(v28) = log2Lut[v30];
    LOWORD(v31) = log2Lut[v32];
    v38 = (float)LODWORD(v28);
    v39 = v33 * (float)LODWORD(v31);
    v40 = 0.0;
    if (v15 >= 0.0)
      v40 = v15;
    if (v40 > 255.0)
      v40 = 255.0;
    v41 = (int)v40;
    v42 = v40 + 1.0;
    if ((float)(v40 + 1.0) > 255.0)
      v42 = 255.0;
    if ((int)v42 <= v41)
      v43 = (float)v41;
    else
      v43 = (float)(v40 - (float)v41) / (float)(int)((int)v42 - v41);
    v14 = v36 + (float)(v34 * v35);
    v13 = v39 + (float)(v37 * v38);
    LOWORD(v34) = log2Lut[v41];
    LOWORD(v35) = log2Lut[v42];
    v15 = (float)(v43 * (float)LODWORD(v35)) + (float)((float)(1.0 - v43) * (float)LODWORD(v34));
    goto LABEL_48;
  }
  if (a5 != 3)
  {
    if (a5 > 4)
      return result;
    goto LABEL_49;
  }
LABEL_48:
  *(float *)&a10 = v14 - v13;
  v44 = v15 - v13;
  v13 = (float)((float)((float)(v15 - v13) * (float)*(__int16 *)(v12 + 564))
              + (float)((float)(v14 - v13) * (float)*(__int16 *)(v12 + 560)))
      * 0.00024414;
  v15 = (float)((float)(v44 * (float)*(__int16 *)(v12 + 570)) + (float)(*(float *)&a10 * (float)*(__int16 *)(v12 + 566)))
      * 0.00024414;
LABEL_49:
  v45 = *(_WORD *)(v12 + 576);
  v46 = 1.0;
  v47 = *(_DWORD *)(v12 + 652);
  LODWORD(a6) = 1.0;
  v48 = 1.0;
  if (*(_BYTE *)(v12 + 594))
  {
    LOWORD(a6) = *(_WORD *)(v12 + 590);
    *(float *)&a6 = (double)*(unint64_t *)&a6 * 255.0 * 0.000122070312;
    LOWORD(a10) = *(_WORD *)(v12 + 592);
    v48 = (double)*(unint64_t *)&a10 * 255.0 * 0.000122070312;
  }
  if (*(unsigned __int16 *)(v12 + 596) > 0x100u)
    v46 = 256.0;
  *a2 = (float)((float)*(unsigned int *)(v12 + 644) * 0.000015259)
      * (float)((float)((float)*(__int16 *)(v12 + 574) - (float)(1048600.0 / (float)*(unsigned int *)(v12 + 644)))
              + (float)((float)(v13 * *(float *)&a6) * v46));
  *a3 = (float)((float)v47 * 0.000015259)
      * (float)((float)((float)v45 - (float)(1048600.0 / (float)v47)) + (float)((float)(v15 * v48) * v46));
  return result;
}

void CAWBAFE::calculateSkinOnlyWBGain(CAWBAFE *this, unsigned int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  unsigned int v9;
  float *p_var108;
  unsigned __int16 *p_var68;
  fdAWBMetaData *var112;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  CAWBAFE *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  fdAWBMetaData *v30;
  float v31;
  float v33;
  CAWBAFE *v34;
  float v36;
  float v37;
  CAWBAFE *v38;
  float var40;
  float v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  p_var108 = &this->var108;
  p_var68 = &this->var68;
  LOWORD(v9) = this->var80;
  v43 = 0;
  CAWBAFE::ComputeChannelGainsfromHistWP(this, this->var40, this->var41, (float *)&v43 + 1, (float *)&v43, a5, a6, a7, a8, a9);
  if (this->var16 < this->var18 || *p_var68 >= 2u)
  {
    v17 = *((float *)&v43 + 1);
    v18 = *(float *)&v43;
    v16 = *p_var108;
  }
  else
  {
    var112 = this->var112;
    v15 = 768.0 / (float)v9;
    if (*((_DWORD *)var112 + 1))
    {
      v16 = 0.0;
      if (*((_BYTE *)p_var108 + 2680) && *((_DWORD *)p_var108 + 671) == 1 && (float)(*p_var108 - v15) >= 0.0)
        v16 = *p_var108 - v15;
      v17 = (float)*((unsigned int *)p_var108 + 3) * 0.00024414;
      v18 = (float)*((unsigned int *)p_var108 + 5) * 0.00024414;
      *p_var108 = v16;
    }
    else
    {
      v42 = 0;
      v45[0] = *((_QWORD *)var112 + 385);
      v29 = CAWBAFE::ComputeProjection(this, a2, (float *)&v42 + 1, (float *)&v42, (float *)v45, (float *)v45 + 1, (uint64_t)this->var84, &this->var83);
      v30 = this->var112;
      v31 = *((float *)v30 + 770);
      if (v31 > v29 && v31 > *(float *)&v42)
      {
        v33 = CAWBAFE::calculateWeightFromTuningTable(v23, &stru_23092FD54, (float)((float)(v31 - v29) + 0.5));
        v29 = v29
            + (float)((float)((float)((float)(v31 - v29) * v33)
                            * CAWBAFE::calculateWeightFromTuningTable(v34, &stru_23092FD98, a2))
                    * *((float *)v30 + 2));
      }
      if (*((_BYTE *)p_var68 + 537))
      {
        if (v31 < v29 && v31 < *((float *)&v42 + 1))
        {
          v36 = v29 - v31;
          v37 = CAWBAFE::calculateWeightFromTuningTable(v23, &stru_23092FDDC, (float)(v36 + 0.5));
          v29 = v29
              + (float)((float)-(float)(v36 * v37) * CAWBAFE::calculateWeightFromTuningTable(v38, &stru_23092FE20, a2));
        }
      }
      v44 = 0;
      var40 = this->var40;
      v40 = v29 - var40;
      if (v29 <= var40)
        v40 = var40 - v29;
      v41 = 0.5 - (float)((float)(v40 / 20.0) * (float)(v40 / 20.0));
      if (v41 < 0.0)
        v41 = 0.0;
      v16 = 1.0;
      LODWORD(v25) = HIDWORD(v45[0]);
      *(float *)&v26 = this->var41;
      *(float *)&v24 = *(float *)&v26 * (float)(1.0 - v41);
      CAWBAFE::ComputeChannelGainsfromHistWP(this, (float)(var40 * (float)(1.0 - v41)) + (float)(v41 * v29), *(float *)&v24 + (float)(v41 * *((float *)v45 + 1)), (float *)&v44 + 1, (float *)&v44, v24, v25, v26, v27, v28);
      if (*((_BYTE *)p_var108 + 2680) && *((_DWORD *)p_var108 + 671) == 1 && (float)(v15 + *p_var108) <= 1.0)
        v16 = v15 + *p_var108;
      *p_var108 = v16;
      v17 = *((float *)&v44 + 1);
      v18 = *(float *)&v44;
    }
  }
  v19 = (float)((float)(1.0 - v16) * *(float *)&v43) + (float)(v18 * v16);
  v20 = (float)((float)((float)((float)((float)(1.0 - v16) * *((float *)&v43 + 1)) + (float)(v17 * v16))
                                    * 4096.0)
                            + 0.5);
  if (v20 >= 0xFFFF)
    v20 = 0xFFFF;
  if (v20 <= 0x800)
    v20 = 2048;
  if ((float)((float)(v19 * 4096.0) + 0.5) >= 0xFFFF)
    v21 = 0xFFFF;
  else
    v21 = (float)((float)(v19 * 4096.0) + 0.5);
  if (v21 <= 0x800)
    v22 = 2048;
  else
    v22 = v21;
  *((_DWORD *)p_var108 + 3) = v20;
  *((_DWORD *)p_var108 + 4) = 4096;
  *((_DWORD *)p_var108 + 5) = v22;
}

float CAWBAFE::ComputeChannelGainsfromHistWP(CAWBAFE *this, float a2, float a3, float *a4, float *a5, double a6, double a7, double a8, double a9, double a10)
{
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float result;

  v13 = 1.0;
  LODWORD(a6) = 1.0;
  v14 = 1.0;
  if (this->var13.var6)
  {
    LOWORD(a6) = this->var13.var5[0];
    *(float *)&a6 = (double)*(unint64_t *)&a6 * 255.0 * 0.000122070312;
    LOWORD(a10) = this->var13.var5[1];
    v14 = (double)*(unint64_t *)&a10 * 255.0 * 0.000122070312;
  }
  if (this->var14.var0[0] > 0x100u)
    v13 = 256.0;
  v15 = (float)((float)(a2 / (float)((float)this->var14.var3 * 0.000015259))
              - (float)((float)this->var13.var2[1] - (float)(1048600.0 / (float)this->var14.var3)))
      / (float)(v13 * *(float *)&a6);
  v16 = (float)((float)(a3 / (float)((float)this->var14.var5 * 0.000015259))
              - (float)((float)this->var13.var2[2] - (float)(1048600.0 / (float)this->var14.var5)))
      / (float)(v13 * v14);
  v17 = (float)this->var13.var1[3] * 0.00024414;
  v18 = (float)this->var13.var1[6] * 0.00024414;
  v19 = (float)this->var13.var1[5] * 0.00024414;
  v20 = (float)this->var13.var1[8] * 0.00024414;
  v21 = (float)(v19 * v19) + (float)(v17 * v17);
  v22 = v19 / v21;
  v23 = (float)(v20 * v20) + (float)(v18 * v18);
  v24 = v20 / v23;
  v25 = exp2f((float)((float)(v16 * (float)(v18 / v23)) + (float)(v15 * (float)(v17 / v21))) * 0.03125);
  v26 = exp2f((float)((float)(v16 * v24) + (float)(v15 * v22)) * 0.03125);
  v27 = (float)((float)(__int16)(this->var13.var0[4] + this->var13.var0[3] + this->var13.var0[5])
              - (float)((float)this->var13.var0[5] * v26))
      - (float)((float)this->var13.var0[3] * v25);
  v28 = (float)this->var13.var0[4];
  *a4 = v27 / (float)(v25 * v28);
  result = v27 / (float)(v26 * v28);
  *a5 = result;
  return result;
}

float CAWBAFE::ComputeProjection(CAWBAFE *a1, signed int a2, float *a3, float *a4, float *a5, float *a6, uint64_t a7, int *a8)
{
  float v8;
  uint64_t var67;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  signed __int16 *v17;
  uint64_t v18;
  int v19;
  signed int v20;
  int v21;
  float *v22;
  float *v23;
  int *v24;
  float v25;
  uint64_t v26;
  int v27;
  int v28;
  _WORD *v29;
  int v30;
  int v31;
  __int16 v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  float v38;
  int v39;
  float v40;
  int v42;
  int v43;
  int v44;
  float *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v8 = *a5;
  var67 = a1->var67;
  if (a2 >= *(__int16 *)&a1->var65[5][2 * var67 + 1022])
  {
    v12 = 0;
    v13 = a7 + 20 * a1->var67;
    do
    {
      *(_DWORD *)((char *)&v46 + v12) = *(_DWORD *)(v13 + v12 - 20);
      v12 += 4;
    }
    while (v12 != 20);
  }
  else if (a2 >= a1->var66[0])
  {
    if (var67 >= 2)
    {
      v15 = 0;
      v16 = (var67 - 1);
      v17 = &a1->var66[(var67 - 2)];
      v18 = a7 + 2;
      v45 = a3;
      do
      {
        v19 = a1->var66[v15++];
        if (a2 >= v19)
        {
          v20 = a1->var66[v15];
          if (a2 < v20)
          {
            if (a2 >= *v17)
            {
              v22 = a4;
              v23 = a6;
              v24 = a8;
              v25 = CAWBAFE::calculateWeightFromTuningTable(a1, &stru_23092FE64, a2);
              a8 = v24;
              a6 = v23;
              a3 = v45;
              a4 = v22;
              v21 = (int)(float)((float)(v25 * 4096.0) + 0.5);
            }
            else
            {
              v21 = ((a2 - v19) << 12) / (v20 - v19);
            }
            v26 = 0;
            v27 = (unsigned __int16)v21;
            v28 = 4096 - (unsigned __int16)v21;
            do
            {
              v29 = (_WORD *)((char *)&v46 + v26);
              *v29 = (*(__int16 *)(v18 + v26 + 18) * v27 + v28 * *(__int16 *)(v18 + v26 - 2)) >> 12;
              v29[1] = (*(__int16 *)(v18 + v26 + 20) * v27 + v28 * *(__int16 *)(v18 + v26)) >> 12;
              v26 += 4;
            }
            while (v26 != 20);
          }
        }
        v18 += 20;
      }
      while (v15 != v16);
    }
  }
  else
  {
    for (i = 0; i != 20; i += 4)
      *(_DWORD *)((char *)&v46 + i) = *(_DWORD *)(a7 + i);
  }
  v30 = (int)(float)((float)(v8 * 256.0) + 0.5);
  v31 = (int)(float)((float)(*a6 * 256.0) + 0.5);
  *a8 = 0;
  if (v31 >= SWORD1(v46))
  {
    v31 = WORD1(v46);
    v32 = WORD2(v46);
    if (v30 <= (__int16)v46)
      v30 = (__int16)v46;
    if (v30 > SWORD2(v46))
      LOWORD(v30) = WORD2(v46);
    v37 = 1;
    goto LABEL_35;
  }
  v32 = WORD2(v46);
  if (SWORD2(v46) >= (__int16)v47)
    v33 = (__int16)v47;
  else
    v33 = SWORD2(v46);
  if (v30 >= v33 && v31 >= SWORD1(v47))
  {
    v44 = WORD2(v46) + (v31 - SHIWORD(v46)) * ((__int16)v47 - SWORD2(v46)) / (SWORD1(v47) - SHIWORD(v46));
    if (v30 > (unsigned __int16)(WORD2(v46)
                                              + (v31 - SHIWORD(v46))
                                              * ((__int16)v47 - SWORD2(v46))
                                              / (SWORD1(v47) - SHIWORD(v46))))
      *a8 = 2;
    if ((unsigned __int16)v44 < v30)
      LOWORD(v30) = v44;
    goto LABEL_36;
  }
  v34 = v30 - SWORD2(v47);
  if (v30 >= SWORD2(v47))
  {
    if (v31 < SWORD1(v47))
    {
      if (v30 < (__int16)v47)
      {
        LOWORD(v35) = HIWORD(v47) + (SWORD1(v47) - SHIWORD(v47)) * v34 / ((__int16)v47 - SWORD2(v47));
        if (v31 >= (unsigned __int16)v35)
          goto LABEL_52;
        v36 = 4;
LABEL_51:
        *a8 = v36;
LABEL_52:
        if ((unsigned __int16)v35 > v31)
          v31 = (unsigned __int16)v35;
        goto LABEL_36;
      }
      LOWORD(v30) = v47;
      v31 = WORD1(v47);
      v37 = 3;
LABEL_35:
      *a8 = v37;
LABEL_36:
      v8 = (float)(unsigned __int16)v30 * 0.0039062;
      *a6 = (float)v31 * 0.0039062;
      goto LABEL_37;
    }
  }
  else if (v31 < SHIWORD(v48))
  {
    if (v30 > (__int16)v48)
    {
      v35 = SHIWORD(v47) + (SHIWORD(v48) - SHIWORD(v47)) * v34 / ((__int16)v48 - SWORD2(v47));
      if (v31 >= (unsigned __int16)v35)
        goto LABEL_52;
      v36 = 7;
      goto LABEL_51;
    }
    v31 = HIWORD(v48);
    LOWORD(v30) = v48;
    v37 = 6;
    goto LABEL_35;
  }
  v42 = (__int16)v48;
  if ((__int16)v48 <= (__int16)v46)
    v42 = (__int16)v46;
  if (v30 <= v42 && v31 >= SHIWORD(v48))
  {
    v43 = (__int16)v46 + ((__int16)v48 - (__int16)v46) * (v31 - SWORD1(v46)) / (SHIWORD(v48) - SWORD1(v46));
    if (v30 < (unsigned __int16)v43)
    {
      *a8 = 5;
      LOWORD(v30) = v43;
    }
    goto LABEL_36;
  }
LABEL_37:
  if (v31 >= SHIWORD(v48))
    v38 = (float)(__int16)v48;
  else
    v38 = (float)(unsigned __int16)(v48
                                  + (SWORD2(v47) - (__int16)v48)
                                  * (unsigned __int16)((v31 - HIWORD(v48)) & ~(unsigned __int16)((v31 - SHIWORD(v48)) >> 31))
                                  / (SHIWORD(v47) - SHIWORD(v48)));
  *a3 = v38 * 0.0039062;
  if (v31 >= SHIWORD(v46))
  {
    v40 = (float)v32;
  }
  else
  {
    if (v31 >= SWORD1(v47))
      v39 = (__int16)v47 + ((__int16)v47 - v32) * (v31 - SWORD1(v47)) / (SWORD1(v47) - SHIWORD(v46));
    else
      v39 = SWORD2(v47)
          + (unsigned __int16)((v31 - HIWORD(v47)) & ~(unsigned __int16)((v31 - SHIWORD(v47)) >> 31))
          * ((__int16)v47 - SWORD2(v47))
          / (SWORD1(v47) - SHIWORD(v47));
    v40 = (float)(unsigned __int16)v39;
  }
  *a4 = v40 * 0.0039062;
  return v8;
}

float CAWBAFE::calculateWeightFromTuningTable(CAWBAFE *this, const sTuningCurvePoint *a2, unsigned int a3)
{
  uint64_t var0;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  float v7;
  float v8;
  float result;

  var0 = a2->var0;
  if (var0 < 2)
  {
    v5 = 1;
  }
  else
  {
    v4 = 0;
    while (a2->var1[v4 + 1] <= a3)
    {
      if (var0 - 1 == ++v4)
      {
        v5 = a2->var0;
        goto LABEL_8;
      }
    }
    v5 = v4 + 1;
  }
LABEL_8:
  v6 = var0 - 1;
  if (v5 < v6)
    v6 = v5;
  v7 = (float)a2->var1[v6 - 1];
  v8 = (float)((float)a3 - v7) / (float)((float)a2->var1[v6] - v7);
  if (v8 > 1.0)
    v8 = 1.0;
  if (v8 < 0.0)
    v8 = 0.0;
  result = (float)((float)(v8 * (float)a2->var2[v6]) + (float)((float)(1.0 - v8) * (float)a2->var1[v6 + 7])) * 0.0039062;
  if (result < 0.0)
    return 0.0;
  return result;
}

uint64_t CAWBAFE::ProcessSchemeGrayworld(CAWBAFE *this, double a2, double a3, double a4, float a5, double a6)
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  unsigned int v12;

  CAWBAFE::ComputeAWBGainsGrayworld(this, 256, 256, a2, a3, a4, a5, a6);
  this->var27 = 1;
  v7 = *(_QWORD *)&this->var38;
  *(_QWORD *)&this->var40 = v7;
  LOWORD(v8) = this->var33[0];
  LOWORD(v9) = this->var33[1];
  *(float *)&v9 = (float)LODWORD(v9);
  *(float *)&v8 = (float)LODWORD(v8) / *(float *)&v9;
  this->var35 = *(float *)&v8;
  LOWORD(v10) = this->var33[2];
  *(float *)&v9 = (float)LODWORD(v10) / *(float *)&v9;
  this->var36 = *(float *)&v9;
  LODWORD(v10) = 1166016512;
  v11 = (float)((float)(*(float *)&v8 * 4096.0) + 0.5);
  if (v11 >= 0xFFFF)
    v11 = 0xFFFF;
  if (v11 <= 0x800)
    v11 = 2048;
  this->var21[0] = v11;
  *(float *)&v8 = (float)(*(float *)&v9 * 4096.0) + 0.5;
  v12 = *(float *)&v8;
  if (*(float *)&v8 >= 0xFFFF)
    v12 = 0xFFFF;
  if (v12 <= 0x800)
    v12 = 2048;
  this->var21[2] = v12;
  this->var21[1] = 4096;
  this->var20 = CAWBAFE::GetCCTFromColorRatio(this, *(float *)&v7, this->var86, v8, v9, v10, 0.5);
  return 1;
}

uint64_t CAWBAFE::ComputeAWBGainsGrayworld(CAWBAFE *this, int a2, int a3, double a4, double a5, double a6, float a7, double a8)
{
  _FE_3A_Stats_H15 *var7;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  float v14;
  float v15;
  __int16 v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned int v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned __int16 v48;
  float v50;
  float v51;
  float v52[3];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  var7 = this->var7;
  v10 = *((unsigned __int16 *)var7 + 177);
  if (v10 * a3 >= 0x200)
    v11 = (v10 * a3) >> 8;
  else
    v11 = 2;
  if (v11 >= v10)
    v11 = *((unsigned __int16 *)var7 + 177);
  v12 = v10 - v11;
  if ((int)v10 < (int)v11)
    ++v12;
  v13 = (v11 + v10) >> 1;
  v14 = 2.2419;
  v15 = 1.8582;
  if (v13 > (unsigned __int16)(v12 >> 1))
  {
    v16 = 0;
    v17 = *((unsigned __int16 *)var7 + 176);
    v18 = (unsigned __int16)(v12 >> 1);
    if (v17 * a2 >= 0x200)
      v19 = (v17 * a2) >> 8;
    else
      v19 = 2;
    if (v19 >= v17)
      v20 = v17;
    else
      v20 = v19;
    v21 = this->var13.var0[4];
    v22 = this->var13.var0[5];
    v23 = (v20 + v17) >> 1;
    v24 = __OFSUB__(v17, v20);
    v25 = v17 - v20;
    if (v25 < 0 != v24)
      ++v25;
    v26 = (unsigned __int16)(v25 >> 1);
    *(float *)&a8 = (float)this->var13.var0[3];
    v27 = 0.0;
    a7 = 0.0;
    LODWORD(a6) = 0;
    do
    {
      if (v23 > v26)
      {
        v28 = v26;
        do
        {
          v29 = (unsigned int *)((char *)this->var9 + 64 * (unint64_t)(unsigned __int16)(v17 * v18 + v28));
          v30 = v29[13];
          if (v30)
          {
            v31 = (float)v29[1] / (float)v30;
            v32 = (float)v29[5] / (float)v30;
            v33 = (float)v29[9] / (float)v30;
          }
          else
          {
            v31 = 0.0;
            v33 = 0.0;
            v32 = 0.0;
          }
          v34 = (float)((float)((float)((float)(__int16)(this->var13.var0[4] + this->var13.var0[3] + this->var13.var0[5])
                                      * v32)
                              - (float)(v31 * *(float *)&a8))
                      + (float)((float)-(float)v22 * v33))
              / (float)v21;
          if (v34 > 0.0 && v34 <= 255.0)
          {
            *(float *)&a6 = *(float *)&a6 + v31;
            a7 = a7 + v34;
            v27 = v27 + v33;
            ++v16;
          }
          ++v28;
        }
        while (v23 != v28);
      }
      ++v18;
    }
    while (v18 != v13);
    if (v16)
    {
      v36 = 1.0;
      if (v27 < 1.0)
        v27 = 1.0;
      if (a7 < 1.0)
        a7 = 1.0;
      if (*(float *)&a6 >= 1.0)
        v36 = *(float *)&a6;
      v15 = a7 / v36;
      v14 = a7 / v27;
    }
  }
  v50 = 0.0;
  v51 = 0.0;
  if (v15 >= v14)
    v37 = v14;
  else
    v37 = v15;
  if (v37 <= 1.0)
    v38 = v37;
  else
    v38 = 1.0;
  *(float *)&a5 = (float)(v38 * 200.0) / v15;
  v52[0] = *(float *)&a5;
  v52[1] = v38 * 200.0;
  *(float *)&a4 = (float)(v38 * 200.0) / v14;
  v52[2] = *(float *)&a4;
  CAWBAFE::GetBinIndices((uint64_t)this, &v51, &v50, v52, 1, a4, a5, a6, a7, a8);
  v40 = v50;
  v39 = v51;
  if (v51 < 1.0)
    v39 = 1.0;
  v41 = 30.0;
  if (v39 > 30.0)
    v39 = 30.0;
  if (v50 < 1.0)
    v40 = 1.0;
  if (v40 <= 30.0)
    v41 = v40;
  this->var38 = v39;
  this->var39 = v41;
  v42 = (float)((float)((float)(v15 / v38) * 4096.0) + 0.5);
  if (v42 >= 0x10000)
    LOWORD(v43) = -1;
  else
    v43 = (float)((float)((float)(v15 / v38) * 4096.0) + 0.5);
  if (v42 < 0x1000)
    LOWORD(v43) = 4096;
  v44 = (float)((float)((float)(1.0 / v38) * 4096.0) + 0.5);
  this->var33[0] = v43;
  if (v44 >= 0x10000)
    LOWORD(v45) = -1;
  else
    v45 = (float)((float)((float)(1.0 / v38) * 4096.0) + 0.5);
  if (v44 < 0x1000)
    LOWORD(v45) = 4096;
  this->var33[1] = v45;
  v46 = (float)((float)((float)(v14 / v38) * 4096.0) + 0.5);
  if (v46 >= 0x10000)
    LOWORD(v47) = -1;
  else
    v47 = (float)((float)((float)(v14 / v38) * 4096.0) + 0.5);
  if (v46 >= 0x1000)
    v48 = v47;
  else
    v48 = 4096;
  this->var33[2] = v48;
  return 1;
}

uint64_t CAWBAFE::GetCCTFromColorRatio(CAWBAFE *this, float a2, const unsigned __int16 (*a3)[3], double a4, double a5, double a6, float a7)
{
  float v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  const unsigned __int16 *v13;
  float v14;
  float v15;
  float v16;

  v7 = (float)(a2 * 256.0) + 0.5;
  v8 = (int)v7;
  if ((*a3)[0] <= (int)v7)
    return (*a3)[2];
  v9 = this->var87 - 1;
  if ((*a3)[3 * v9] >= v8)
    return (*a3)[3 * v9 + 2];
  v10 = -1;
  do
  {
    v11 = v10 + 2;
    v12 = (*a3)[3 * (v10 + 2)];
    ++v10;
  }
  while (v12 > v8);
  v13 = &(*a3)[3 * v10];
  LOWORD(v7) = *v13;
  LOWORD(a7) = (*a3)[3 * v11 + 2];
  v14 = (float)LODWORD(a7);
  v15 = (float)v12 - (float)LODWORD(v7);
  v16 = 0.0;
  if (v15 != 0.0)
    v16 = (float)((float)v8 - (float)LODWORD(v7)) / v15;
  LOWORD(v7) = v13[2];
  return (float)((float)(1000000.0
                                     / (float)((float)(1000000.0 / (float)LODWORD(v7))
                                             + (float)(v16
                                                     * (float)((float)(1000000.0 / v14)
                                                             - (float)(1000000.0 / (float)LODWORD(v7))))))
                             + 0.5);
}

uint64_t CAWBAFE::ProcessSchemeTapToWB(CAWBAFE *this, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  char v9;

  if (this->var16 <= this->var17)
    v9 = CAWBAFE::ProcessSchemeGrayworld(this, a2, a3, a4, *(float *)&a5, a6);
  else
    v9 = CAWBAFE::ComputeNeutralTargetAWB(this, a2, a3, a4, a5, a6, a7, a8);
  this->var27 = v9;
  return 1;
}

uint64_t CAWBAFE::ComputeNeutralTargetAWB(CAWBAFE *this, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _AEAWB_Stat_Elem *var10;
  unsigned int v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int v17;
  float v18;
  float v19;
  float v22;
  unsigned int v23;
  unsigned int v24;
  float v25;
  float v26;
  float v27;
  unsigned int var3;
  float var5;
  float v30;
  float v31;
  float v32;
  double v33;
  float v34;
  double v35;
  double v36;
  unsigned int v37;
  unsigned int v38;

  var10 = this->var10;
  v10 = *((_DWORD *)var10 + 12);
  if (v10)
  {
    v11 = 0.5;
    v12 = (float)((float)*(_DWORD *)var10 / (float)v10) * 0.5;
    v13 = (float)((float)*((unsigned int *)var10 + 4) / (float)v10) * 0.5;
    v14 = (float)((float)*((unsigned int *)var10 + 8) / (float)v10) * 0.5;
  }
  else
  {
    v11 = 0.0;
    v14 = 0.0;
    v13 = 0.0;
    v12 = 0.0;
  }
  if (v10 < (HIWORD(*((_DWORD *)this->var7 + 10)) * (unsigned __int16)*((_DWORD *)this->var7 + 10)) >> 6)
    return 0;
  v15 = v12 / v11;
  v16 = v14 / v11;
  v17 = (int)(float)((float)((float)((float)((float)((float)(v13 / v11) * (float)this->var13.var0[4])
                                           + (float)(v15 * (float)this->var13.var0[3]))
                                   + (float)(v16 * (float)this->var13.var0[5]))
                           / (float)(__int16)(this->var13.var0[4] + this->var13.var0[3] + this->var13.var0[5]))
                   + 0.5);
  v18 = (float)v17;
  if (v17 >= 256)
    v18 = 255.0;
  v19 = 0.0;
  if (v17 >= 0)
    v19 = v18;
  LODWORD(a2) = 1.0;
  if (v19 < 1.0 || v19 > 255.0)
    return 0;
  v22 = (float)(__int16)log2Lut[v19];
  *(float *)&v23 = v15 + 0.5;
  LOWORD(v23) = log2Lut[*(float *)&v23];
  *(float *)&v24 = v16 + 0.5;
  LOWORD(v24) = log2Lut[*(float *)&v24];
  v25 = (float)v23 - v22;
  v26 = (float)v24 - v22;
  v27 = (float)((float)(v26 * (float)this->var13.var1[5]) + (float)(v25 * (float)this->var13.var1[3])) * 0.00024414;
  *(float *)&a7 = (float)this->var13.var1[6];
  *(float *)&a4 = (float)((float)(v26 * (float)this->var13.var1[8]) + (float)(v25 * *(float *)&a7)) * 0.00024414;
  var3 = this->var14.var3;
  LODWORD(a5) = 1.0;
  if (this->var13.var6)
  {
    LOWORD(a2) = this->var13.var5[0];
    HIDWORD(a6) = 1059061760;
    *(float *)&a2 = (double)*(unint64_t *)&a2 * 255.0 * 0.000122070312;
    LOWORD(a7) = this->var13.var5[1];
    a7 = (double)*(unint64_t *)&a7;
    a5 = a7 * 255.0 * 0.000122070312;
    *(float *)&a5 = a5;
  }
  LODWORD(a6) = 1132462080;
  var5 = (float)this->var14.var5;
  if (this->var14.var0[0] <= 0x100u)
    *(float *)&a6 = 1.0;
  v30 = var5 * 0.000015259;
  *(float *)&a7 = (float)var3 * 0.000015259;
  *(float *)&a8 = (float)this->var13.var2[2] - (float)(1048600.0 / var5);
  v31 = *(float *)&a7
      * (float)((float)((float)this->var13.var2[1] - (float)(1048600.0 / (float)var3))
              + (float)((float)(v27 * *(float *)&a2) * *(float *)&a6));
  this->var38 = v31;
  v32 = v30 * (float)(*(float *)&a8 + (float)((float)(*(float *)&a4 * *(float *)&a5) * *(float *)&a6));
  this->var39 = v32;
  if (!this->var144)
  {
    v31 = (float)((127 * (int)this->var40 + ((int)v31 << 7)) / 0xFFu);
    this->var38 = v31;
    v32 = (float)((127 * (int)this->var41 + ((int)v32 << 7)) / 0xFFu);
    this->var39 = v32;
  }
  this->var40 = v31;
  this->var41 = v32;
  CAWBAFE::ComputeChannelGainsfromHistWP(this, v31, v32, &this->var35, &this->var36, a4, a5, a6, a7, a8);
  LODWORD(v35) = 1166016512;
  LODWORD(v36) = 0.5;
  v37 = (float)((float)(this->var35 * 4096.0) + 0.5);
  if (v37 >= 0xFFFF)
    v37 = 0xFFFF;
  if (v37 <= 0x800)
    v37 = 2048;
  this->var21[0] = v37;
  v38 = (float)((float)(this->var36 * 4096.0) + 0.5);
  if (v38 >= 0xFFFF)
    v38 = 0xFFFF;
  if (v38 <= 0x800)
    v38 = 2048;
  this->var21[2] = v38;
  this->var21[1] = 4096;
  this->var20 = CAWBAFE::GetCCTFromColorRatio(this, this->var40, this->var86, v35, v36, v33, v34);
  return 1;
}

uint64_t CAWBAFE::ProcessSchemeManualWB(CAWBAFE *this, double a2, double a3, double a4, double a5, double a6)
{
  int var31;

  var31 = this->var31;
  if (var31 == 1)
  {
    CAWBAFE::ComputeAWBGainsfromCCT(this, *(float *)&a2);
  }
  else if (!var31)
  {
    CAWBAFE::ApplyManualWBGains(this, a2, a3, a4, a5, a6);
  }
  return 1;
}

uint64_t CAWBAFE::ApplyManualWBGains(CAWBAFE *this, double a2, double a3, double a4, double a5, double a6)
{
  unsigned int v7;
  float v8;
  unsigned __int16 (*var86)[3];
  uint32x2_t v10;
  int32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float v14;
  double v15;
  float32x2_t v16;
  int8x8_t v22;
  int8x8_t v24;
  int8x8_t v25;
  int8x8_t v26;
  __int128 v27;
  uint64_t result;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float v32;
  float32x2_t v33;
  double v34;
  float v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = this->var32[2];
  if (v7 <= 0x1000)
    v7 = 4096;
  v8 = (float)v7;
  this->var32[2] = v7;
  var86 = this->var86;
  v10.i32[0] = this->var32[0];
  v10.i32[1] = this->var32[1];
  v11 = (int32x2_t)vmax_u32(v10, (uint32x2_t)0x100000001000);
  v12 = vcvt_f32_u32((uint32x2_t)v11);
  this->var32[0] = v11.i16[0];
  this->var32[1] = v11.u16[2];
  if (v11.i32[1] < v7)
    v7 = v11.u32[1];
  if (v11.i32[0] < v7)
    v7 = v11.i32[0];
  *(float *)v11.i32 = (float)v7;
  v33 = vdiv_f32(v12, (float32x2_t)vdup_lane_s32(v11, 0));
  v13 = (float32x2_t)vdup_n_s32(0x43480000u);
  v14 = v8 / (float)v7;
  v15 = COERCE_DOUBLE(vdiv_f32(v13, v33));
  v34 = v15;
  *(float *)&v15 = 200.0 / v14;
  v35 = 200.0 / v14;
  CAWBAFE::GetBinIndices((uint64_t)this, &this->var38, &this->var39, (float *)&v34, 1, v15, *(double *)&v11, *(double *)&v13, v33.f32[0], a6);
  v16 = *(float32x2_t *)&this->var38;
  __asm { FMOV            V1.2S, #1.0 }
  v22 = (int8x8_t)vcgt_f32(_D1, v16);
  __asm { FMOV            V3.2S, #30.0 }
  v24 = (int8x8_t)vcgt_f32(v16, _D3);
  v25 = vbic_s8(v24, v22);
  v26 = vorr_s8(v24, v22);
  *(int8x8_t *)&v27 = vbsl_s8(v26, vbsl_s8(v25, (int8x8_t)_D3, (int8x8_t)_D1), (int8x8_t)v16);
  *((_QWORD *)&v27 + 1) = v27;
  *(_OWORD *)&this->var38 = v27;
  result = CAWBAFE::GetCCTFromColorRatio(this, *(float *)&v27, var86, *(double *)&v27, *(double *)&v26, *(double *)&_D3, *(float *)v24.i32);
  this->var20 = result;
  v29 = vmla_f32((float32x2_t)0x3F0000003F000000, (float32x2_t)vdup_n_s32(0x45800000u), v33);
  v30 = (float32x2_t)vdup_n_s32(0x477FFF00u);
  v31 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v29, v30), (int8x8_t)v30, (int8x8_t)v29);
  *(uint32x2_t *)this->var21 = vcvt_u32_f32((float32x2_t)vbsl_s8((int8x8_t)vcge_f32((float32x2_t)0x4500000045000000, v31), (int8x8_t)0x4500000045000000, (int8x8_t)v31));
  v32 = (float)(v14 * 4096.0) + 0.5;
  if (v32 > 65535.0)
    v32 = 65535.0;
  if (v32 <= 2048.0)
    v32 = 2048.0;
  this->var21[2] = v32;
  LODWORD(this->var35) = v33.i32[0];
  this->var36 = v14;
  return result;
}

void CAWBAFE::ComputeAWBGainsfromCCT(CAWBAFE *this, float a2)
{
  unsigned int var29;
  unsigned int v4;
  float ColorRatioXFromCCT;
  float ColorRatioYFromCCT;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  unsigned int v13;

  var29 = this->var29;
  if (var29 >= 0x1964)
    var29 = 6500;
  if (var29 <= 0x9C4)
    v4 = 2500;
  else
    v4 = var29;
  this->var20 = v4;
  ColorRatioXFromCCT = CAWBAFE::GetColorRatioXFromCCT(this, v4, a2);
  this->var38 = ColorRatioXFromCCT;
  ColorRatioYFromCCT = CAWBAFE::GetColorRatioYFromCCT(this, v4, ColorRatioXFromCCT);
  this->var39 = ColorRatioYFromCCT;
  this->var40 = ColorRatioXFromCCT;
  this->var41 = ColorRatioYFromCCT;
  CAWBAFE::ComputeChannelGainsfromHistWP(this, ColorRatioXFromCCT, ColorRatioYFromCCT, &this->var35, &this->var36, v7, v8, v9, v10, v11);
  v12 = (float)((float)(this->var35 * 4096.0) + 0.5);
  if (v12 >= 0xFFFF)
    v12 = 0xFFFF;
  if (v12 <= 0x800)
    v12 = 2048;
  this->var21[0] = v12;
  v13 = (float)((float)(this->var36 * 4096.0) + 0.5);
  if (v13 >= 0xFFFF)
    v13 = 0xFFFF;
  if (v13 <= 0x800)
    v13 = 2048;
  this->var21[2] = v13;
  this->var21[1] = 4096;
}

CAWBAFE *CAWBAFE::SetStats(CAWBAFE *this, _FE_3A_Stats_H15 *a2, _TILE_Stat_Elem *a3, _AEAWB_Stat_Elem *a4, unsigned int *a5, _FE_3A_Stats_H15 *a6)
{
  CAWBAFE *v7;
  unsigned int v8;
  _DWORD *v9;
  unsigned int v10;

  v7 = this;
  this->var7 = a2;
  this->var8 = a6;
  this->var9 = a3;
  this->var10 = a4;
  if (a3 && *((unsigned __int16 *)this->var7 + 177) * *((unsigned __int16 *)this->var7 + 176))
  {
    v8 = 0;
    v9 = (_DWORD *)((char *)a3 + 32);
    do
    {
      v10 = *(v9 - 8);
      if (v10 >> 30)
      {
        if (v7->var1 >= 10)
        {
          this = (CAWBAFE *)printf("ERR: CAWBAFE::SetStats TileNo=%d PF0 [R G B N]: %d %d %d %d\n", v8, v10, *(v9 - 4), *v9, v9[4]);
          if (v7->var1 >= 10)
          {
            this = (CAWBAFE *)printf("ERR: CAWBAFE::SetStats TileNo=%d PF1 [R G B N]: %d %d %d %d\n", v8, *(v9 - 7), *(v9 - 3), v9[1], v9[5]);
            if (v7->var1 >= 10)
              this = (CAWBAFE *)printf("ERR: CAWBAFE::SetStats TileNo=%d PF2 [R G B N]: %d %d %d %d\n", v8, *(v9 - 6), *(v9 - 2), v9[2], v9[6]);
          }
        }
      }
      ++v8;
      v9 += 16;
    }
    while (v8 < *((unsigned __int16 *)v7->var7 + 177) * *((unsigned __int16 *)v7->var7 + 176));
  }
  v7->var12 = a5;
  return this;
}

CAWBAFE *CAWBAFE::SetFlashStateForHistAWB(CAWBAFE *this, int a2, unsigned __int16 a3, unsigned __int16 a4, unsigned __int16 a5)
{
  this->var68 = this->var68 & 0xFFFC | (a2 != 0) | (2 * ((this->var68 & 1) != a2));
  this->var69 = a3;
  this->var70 = a4;
  this->var71 = a5;
  return this;
}

CAWBAFE *CAWBAFE::SetFrameRateForHistAWB(CAWBAFE *this, unsigned __int16 a2)
{
  this->var80 = a2;
  return this;
}

void CAWBAFE::GetNewCSensorCalGains(CAWBAFE *this, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, const sCSensorCalGain *a5)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  if (a4 <= 0x9C4)
    v5 = 2500;
  else
    v5 = a4;
  if (v5 >= 0x1388)
    v5 = 5000;
  v6 = 5000 - v5;
  v7 = v5 - 2500;
  *a2 = (v6 * a5->var0 + v7 * a5->var2) / 0x9C4;
  *a3 = (v6 * a5->var1 + v7 * a5->var3) / 0x9C4;
}

CAWBAFE *CAWBAFE::GetInterpolatedCSensorCalGains(CAWBAFE *this, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  if (a4 <= 0x9C4)
    v4 = 2500;
  else
    v4 = a4;
  if (v4 >= 0x1388)
    v4 = 5000;
  v5 = 5000 - v4;
  v6 = v4 - 2500;
  *a2 = (v5 * this->var89.var0 + v6 * this->var89.var2) / 0x9C4;
  *a3 = (v5 * this->var89.var1 + v6 * this->var89.var3) / 0x9C4;
  return this;
}

void CAWBAFE::GetMetaData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float32x2_t *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  _WORD *v29;
  BOOL v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  int16x8_t v45;
  uint64_t v46;
  __int16 v47;
  __int16 v48;
  __int16 v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int16x8_t *v55;
  uint64_t i;
  uint64_t j;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t k;
  uint64_t m;
  __int32 v64;
  BOOL v65;
  uint64_t v67;
  char v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  uint64_t v79;
  uint64_t n;
  uint64_t ii;
  uint64_t v82;
  unsigned int v83;
  _DWORD *v84;
  uint64_t jj;
  int16x8_t v86;
  int16x8_t v87;
  int v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v6 = (float32x2_t *)(a1 + 20996);
  v7 = a1 + 20654;
  *(_BYTE *)(a2 + 916) = 0;
  v8 = *(_DWORD *)(a1 + 668);
  *(_DWORD *)(a2 + 800) = v8;
  *(_WORD *)(a2 + 804) = *(_WORD *)(a1 + 812);
  v9 = *(unsigned __int16 *)(a1 + 21000);
  *(_WORD *)(a2 + 936) = 0x10000000 / v9;
  v10 = *(unsigned __int16 *)(a1 + 21002);
  *(_WORD *)(a2 + 938) = 0x10000000 / v10;
  v11 = *(unsigned __int16 *)(a1 + 20996);
  *(_WORD *)(a2 + 932) = 0x10000000 / v11;
  v12 = *(unsigned __int16 *)(a1 + 20998);
  *(_WORD *)(a2 + 934) = 0x10000000 / v12;
  if (*(_BYTE *)(a1 + 21012))
  {
    LOWORD(v13) = *(_WORD *)(a1 + 21004);
    *(_WORD *)(a1 + 21008) = v13;
    LOWORD(v14) = *(_WORD *)(a1 + 21006);
  }
  else
  {
    if (v8 <= 0x9C4)
      v8 = 2500;
    if (v8 >= 0x1388)
      v8 = 5000;
    v15 = 5000 - v8;
    v16 = v8 - 2500;
    v13 = (v15 * v11 + v16 * v9) / 0x9C4;
    *(_WORD *)(a1 + 21008) = v13;
    v14 = (v15 * v12 + v16 * v10) / 0x9C4;
    *(_WORD *)(a1 + 21004) = v13;
    *(_WORD *)(a1 + 21006) = v14;
  }
  *(_WORD *)(a1 + 21010) = v14;
  *(_WORD *)(a2 + 806) = v13;
  *(_WORD *)(a2 + 808) = v14;
  *(_WORD *)(a2 + 38) = 0x4000;
  *(_WORD *)(a2 + 6) = *(_DWORD *)(a1 + 672);
  *(_WORD *)(a2 + 8) = *(_DWORD *)(a1 + 676);
  *(_WORD *)(a2 + 10) = *(_DWORD *)(a1 + 676);
  *(_WORD *)(a2 + 12) = *(_DWORD *)(a1 + 680);
  v17 = *(_DWORD *)(a1 + 672) * *(unsigned __int16 *)(a1 + 21008);
  v18 = (unsigned __int16)(v17 >> 14);
  if (v17 >> 30)
    v18 = 0xFFFF;
  *(_DWORD *)(a1 + 684) = v18;
  *(_DWORD *)(a1 + 688) = *(unsigned __int16 *)(a1 + 676);
  v19 = *(_DWORD *)(a1 + 680) * *(unsigned __int16 *)(a1 + 21010);
  if (v19 >> 30)
    v20 = 0xFFFF;
  else
    v20 = (unsigned __int16)(v19 >> 14);
  *(_DWORD *)(a1 + 692) = v20;
  *(_WORD *)(a2 + 14) = v18;
  v21 = *(_DWORD *)(a1 + 688);
  v22 = (unsigned __int16)v21;
  *(_WORD *)(a2 + 16) = v21;
  v23 = *(_DWORD *)(a1 + 688);
  *(_WORD *)(a2 + 18) = v23;
  v24 = *(_DWORD *)(a1 + 692);
  v25 = (unsigned __int16)v24;
  if ((unsigned __int16)v24 >= (unsigned __int16)v21)
    LOWORD(v21) = v24;
  if (v22 <= (unsigned __int16)v24)
    v26 = (unsigned __int16)*(_DWORD *)(a1 + 692);
  else
    v26 = v22;
  if (v22 < (unsigned __int16)v24)
    v25 = v22;
  if (v18 <= (unsigned __int16)v21)
    v27 = v26;
  else
    v27 = v18;
  if (v25 >= v18)
    v25 = v18;
  v28 = (v27 << 12) / v25;
  v29 = (_WORD *)(a2 + 737);
  *(_WORD *)(a2 + 20) = v24;
  *(_WORD *)(a2 + 36) = v28;
  *(_WORD *)(a2 + 22) = (v18 << 12) / (unsigned __int16)v28;
  *(_WORD *)(a2 + 24) = (v22 << 12) / (unsigned __int16)v28;
  *(_WORD *)(a2 + 26) = ((unsigned __int16)v23 << 12) / (unsigned __int16)v28;
  *(_WORD *)(a2 + 28) = ((unsigned __int16)v24 << 12) / (unsigned __int16)v28;
  if (*(_BYTE *)(a1 + 21190))
    v30 = 1;
  else
    v30 = *(_BYTE *)(a1 + 20676) != 0;
  *(_BYTE *)(a2 + 736) = v30;
  v31 = *(_DWORD *)(a1 + 21208) * *(unsigned __int16 *)(a1 + 21008);
  v32 = v31 >> 30;
  v33 = v31 >> 14;
  if (v32)
    LOWORD(v33) = -1;
  *v29 = v33;
  *(_WORD *)(a2 + 739) = *(_DWORD *)(a1 + 21212);
  *(_WORD *)(a2 + 741) = *(_DWORD *)(a1 + 21212);
  v34 = *(_DWORD *)(a1 + 21216) * *(unsigned __int16 *)(a1 + 21010);
  v35 = v34 >> 30;
  v36 = v34 >> 14;
  if (v35)
    LOWORD(v36) = -1;
  *(_WORD *)(a2 + 743) = v36;
  memcpy((void *)(a2 + 1064), (const void *)(a1 + 23028), 0x300uLL);
  v37 = *(unsigned __int8 *)(v7 + 22);
  *(_BYTE *)(a2 + 746) = v37;
  if (v37)
  {
    *(_DWORD *)(a2 + 748) = *(_DWORD *)(v7 + 38);
    v38 = *(_DWORD *)(v7 + 26) * v6[1].u16[2];
    v39 = v38 >> 30;
    v40 = v38 >> 14;
    if (v39)
      LOWORD(v40) = -1;
    *(_WORD *)(a2 + 752) = v40;
    *(_WORD *)(a2 + 754) = *(_DWORD *)(v7 + 30);
    *(_WORD *)(a2 + 756) = *(_DWORD *)(v7 + 30);
    v41 = *(_DWORD *)(v7 + 34) * v6[1].u16[3];
    v42 = v41 >> 30;
    v43 = v41 >> 14;
    if (v42)
      LOWORD(v43) = -1;
    *(_WORD *)(a2 + 758) = v43;
    if (a3)
    {
      *(_WORD *)(a3 + 824) = 1;
      *(_WORD *)(a3 + 576) = *(_WORD *)(a2 + 752);
      *(_WORD *)(a3 + 578) = *(_WORD *)(a2 + 754);
      *(_WORD *)(a3 + 580) = *(_WORD *)(a2 + 758);
    }
  }
  v44 = v6[219].i32[1];
  *(_DWORD *)(a2 + 732) = v44;
  v45 = *(int16x8_t *)(a1 + 712);
  v86 = *(int16x8_t *)(a1 + 696);
  v87 = v45;
  v88 = *(_DWORD *)(a1 + 728);
  CAWBAFE::RGBColorSpaceConversion((CAWBAFE *)a1, v44, (uint64_t)&v86);
  *(int16x8_t *)(a2 + 761) = vuzp1q_s16(v86, v87);
  *(_WORD *)(a2 + 777) = v88;
  if (*(_WORD *)v7)
  {
    *(_WORD *)(a2 + 779) = *(_DWORD *)(a1 + 732);
    *(_WORD *)(a2 + 781) = *(_DWORD *)(a1 + 736);
    *(_WORD *)(a2 + 783) = *(_DWORD *)(a1 + 740);
    *(_WORD *)(a2 + 785) = *(_DWORD *)(a1 + 744);
    *(_WORD *)(a2 + 787) = *(_DWORD *)(a1 + 748);
    *(_WORD *)(a2 + 789) = *(_DWORD *)(a1 + 752);
    *(_WORD *)(a2 + 791) = *(_DWORD *)(a1 + 756);
    *(_WORD *)(a2 + 793) = *(_DWORD *)(a1 + 760);
    *(_WORD *)(a2 + 795) = *(_DWORD *)(a1 + 764);
  }
  *(_WORD *)(a2 + 810) = *(unsigned __int8 *)(a1 + 773);
  *(_WORD *)(a2 + 2) = 5;
  *(_BYTE *)(a2 + 812) = *(_BYTE *)(a1 + 845);
  *(_BYTE *)(a2 + 760) = a3 != 0;
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a1 + 800);
  *(_DWORD *)(a2 + 44) = *(_DWORD *)(a1 + 780);
  *(_DWORD *)(a2 + 904) = 0;
  *(uint32x2_t *)(a2 + 908) = vcvt_n_u32_f32(*(float32x2_t *)(a1 + 876), 0xCuLL);
  v46 = *(_QWORD *)(a1 + 22736);
  if (v46)
  {
    v47 = *(unsigned __int8 *)(v46 + 4);
    *(_WORD *)(a2 + 904) = v47;
    v48 = v47 & 0xFEFF | ((*(_BYTE *)(*(_QWORD *)(a1 + 22736) + 330) & 1) << 8);
    *(_WORD *)(a2 + 904) = v48;
    v49 = v48 & 0xF1FF | ((*(_BYTE *)(*(_QWORD *)(a1 + 22736) + 331) & 7) << 9);
    *(_WORD *)(a2 + 904) = v49;
    v50 = v49 & 0xEFFF | ((*(_BYTE *)(*(_QWORD *)(a1 + 22736) + 104) & 1) << 12);
    *(_WORD *)(a2 + 904) = v50;
    *(_WORD *)(a2 + 904) = v50 | (*(_WORD *)(*(_QWORD *)(a1 + 22736) + 102) << 13);
    v51 = *(_QWORD *)(a1 + 22736);
    *(_DWORD *)(a2 + 920) = *(_DWORD *)(v51 + 4);
    *(_BYTE *)(a2 + 1036) = *(_BYTE *)(v51 + 3868);
    *(_OWORD *)(a2 + 1020) = *(_OWORD *)(v51 + 3852);
  }
  if (a3)
  {
    v52 = 0;
    *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 668);
    *(_WORD *)a3 = 1;
    *(_WORD *)(a3 + 2) = *(unsigned __int8 *)(a1 + 772);
    *(_WORD *)(a3 + 4) = *(unsigned __int8 *)(a1 + 773);
    *(_DWORD *)(a3 + 42) = v6[1].i32[1];
    *(_DWORD *)(a3 + 48) = 0;
    *(_DWORD *)(a3 + 56) = *(unsigned __int16 *)(v7 + 14);
    *(_DWORD *)(a3 + 156) = *(unsigned __int16 *)(v7 + 16);
    *(_DWORD *)(a3 + 160) = *(unsigned __int16 *)(v7 + 18);
    *(_DWORD *)(a3 + 92) = *(unsigned __int16 *)(v7 + 2);
    *(_DWORD *)(a3 + 164) = *(unsigned __int16 *)(v7 + 4);
    *(_DWORD *)(a3 + 168) = *(unsigned __int16 *)(v7 + 6);
    *(_WORD *)(a3 + 68) = *(unsigned __int8 *)(a1 + 845);
    do
    {
      *(_WORD *)(a3 + 12 + 2 * v52) = *(_DWORD *)(a1 + 672 + 4 * v52);
      ++v52;
    }
    while (v52 != 3);
    v53 = 0;
    v54 = a3 + 24;
    v55 = &v86;
    do
    {
      for (i = 0; i != 3; ++i)
        *(_WORD *)(v54 + 2 * i) = v55->i32[i];
      ++v53;
      v54 += 6;
      v55 = (int16x8_t *)((char *)v55 + 12);
    }
    while (v53 != 3);
    for (j = 0; j != 16; j += 4)
      *(_DWORD *)(a3 + 96 + j) = *(_DWORD *)(a1 + 21020 + j);
    v58 = 0;
    *(_WORD *)(a3 + 112) = *(unsigned __int8 *)(a1 + 844);
    v59 = *(_QWORD *)(a1 + 21224);
    *(_WORD *)(a3 + 118) = *(_DWORD *)(v59 + 4);
    *(_DWORD *)(a3 + 120) = vcvts_n_u32_f32(*(float *)(v59 + 8), 8uLL);
    *(_WORD *)(a3 + 834) = *(unsigned __int8 *)(v59 + 3160);
    do
    {
      *(_WORD *)(a3 + 828 + 2 * v58) = vcvts_n_s32_f32(*(float *)(v59 + 3164 + 4 * v58), 8uLL);
      ++v58;
    }
    while (v58 != 3);
    if (!*(_DWORD *)(v59 + 36) || (v60 = *(_DWORD *)(v59 + 44), v60 == -1))
    {
      *(_WORD *)(a3 + 826) = 0;
      *(_QWORD *)(a3 + 132) = 0;
      *(_QWORD *)(a3 + 124) = 0;
    }
    else
    {
      v61 = v59 + 152 * v60;
      *(_DWORD *)(a3 + 124) = *(_DWORD *)(v61 + 56);
      *(_DWORD *)(a3 + 128) = *(_DWORD *)(v61 + 60);
      *(_DWORD *)(a3 + 132) = *(_DWORD *)(v61 + 64);
      *(_DWORD *)(a3 + 136) = *(_DWORD *)(v61 + 68);
      *(_WORD *)(a3 + 826) = *(_DWORD *)(v61 + 144);
      *(_WORD *)(a3 + 848) = *(_WORD *)(v61 + 172) & 0x3FF;
      *(_WORD *)(a3 + 850) = (*(_DWORD *)(v61 + 172) >> 10) & 0x3FF;
    }
    for (k = 0; k != 6; k += 2)
      *(_WORD *)(a3 + 140 + k) = *(_WORD *)(a1 + 794 + k);
    for (m = 0; m != 6; m += 2)
      *(_WORD *)(a3 + 172 + m) = *(_WORD *)(a1 + 22744 + m);
    v64 = v6[25].i32[1];
    if (*(_DWORD *)(v59 + 36))
      v65 = v64 == 0;
    else
      v65 = 0;
    if (v65 || (v64 - 1) <= 1)
    {
      v67 = 0;
      *(_WORD *)(a3 + 180) = *(unsigned __int8 *)(v59 + 1612);
      *(_WORD *)(a3 + 182) = *(_DWORD *)(v59 + 1604);
      *(_WORD *)(a3 + 184) = *(_WORD *)(v59 + 1598);
      *(_WORD *)(a3 + 186) = vcvts_n_s32_f32(*(float *)(v59 + 3104), 8uLL);
      *(_WORD *)(a3 + 188) = vcvts_n_s32_f32(*(float *)(v59 + 3112), 8uLL);
      *(_WORD *)(a3 + 190) = vcvts_n_s32_f32(*(float *)(v59 + 3120), 8uLL);
      v68 = 1;
      do
      {
        v69 = v68;
        v70 = v59 + 4 * v67;
        v71 = a3 + 2 * v67;
        *(_WORD *)(v71 + 192) = vcvts_n_s32_f32(*(float *)(v70 + 3064), 8uLL);
        *(_WORD *)(v71 + 196) = vcvts_n_s32_f32(*(float *)(v70 + 3080), 8uLL);
        v67 = 1;
        v68 = 0;
      }
      while ((v69 & 1) != 0);
      *(_WORD *)(a3 + 560) = (int)(float)((float)((int)(float)(*(float *)(a1 + 864) * 255.0) << 8)
                                        + (float)(*(float *)(a1 + 860) * 255.0));
      *(_WORD *)(a3 + 568) = *v29;
      *(_WORD *)(a3 + 570) = *(_WORD *)(a2 + 739);
      *(_WORD *)(a3 + 572) = *(_WORD *)(a2 + 743);
      *(_WORD *)(a3 + 846) = *(_DWORD *)(v59 + 3156);
    }
    v72 = 0;
    *(_WORD *)(a3 + 562) = (int)(float)((float)(*(float *)(a1 + 884) * 256.0) + 0.5);
    *(_WORD *)(a3 + 564) = (int)(float)((float)(*(float *)(a1 + 888) * 256.0) + 0.5);
    *(_WORD *)(a3 + 146) = 1;
    *(uint32x2_t *)(a3 + 200) = vcvt_n_u32_f32(*(float32x2_t *)(a1 + 876), 0xCuLL);
    *(_BYTE *)(a3 + 179) = v6[219].i32[1];
    *(_WORD *)(a3 + 46) = v6[243].u8[4];
    *(_WORD *)(a3 + 412) = v6[245].i16[1];
    do
    {
      *(_WORD *)(a3 + 348 + v72) = *(_WORD *)(a1 + 22960 + v72);
      v72 += 2;
    }
    while (v72 != 64);
    *(_WORD *)(a3 + 852) = *(_WORD *)(a1 + 840);
    v73.i64[0] = *(_QWORD *)(a1 + 916);
    v74.i64[0] = *(_QWORD *)(a1 + 904);
    v73.i32[2] = *(_DWORD *)(a1 + 924);
    v73.i32[3] = *(_DWORD *)(a1 + 900);
    v74.i32[2] = *(_DWORD *)(a1 + 912);
    v74.i32[3] = *(_DWORD *)(a1 + 824);
    v75 = (float32x4_t)vdupq_n_s32(0x43800000u);
    v76.i64[0] = 0x3F0000003F000000;
    v76.i64[1] = 0x3F0000003F000000;
    v77.i64[0] = 0x3F0000003F000000;
    v77.i64[1] = 0x3F0000003F000000;
    v78 = vmlaq_f32(v77, v75, v73);
    v73.i64[0] = 0x3F0000003F000000;
    v73.i64[1] = 0x3F0000003F000000;
    *(int16x8_t *)(a3 + 854) = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(v78), (int16x8_t)vcvtq_u32_f32(vmlaq_f32(v73, v75, v74)));
    *(_WORD *)(a3 + 870) = (int)(float)((float)(*(float *)(a1 + 828) * 256.0) + 0.5);
    v73.i64[0] = *(_QWORD *)(a1 + 852);
    v73.i64[1] = *(_QWORD *)(a1 + 868);
    v74.i64[0] = 0x3F0000003F000000;
    v74.i64[1] = 0x3F0000003F000000;
    *(int16x4_t *)(a3 + 872) = vmovn_s32((int32x4_t)vcvtq_u32_f32(vmlaq_f32(v74, v75, v73)));
    *(_BYTE *)(a3 + 415) = v6[220].i32[1];
    *(int32x2_t *)(a3 + 416) = vcvt_s32_f32(vmla_f32((float32x2_t)0x3F0000003F000000, (float32x2_t)vdup_n_s32(0x47800000u), v6[221]));
    *(_DWORD *)(a3 + 424) = (int)(float)((float)(v6[222].f32[0] * 65536.0) + 0.5);
    *(_WORD *)(a3 + 880) = *(_DWORD *)(a1 + 5032);
    *(_WORD *)(a3 + 882) = *(unsigned __int8 *)(a1 + 5036);
    v78.i64[0] = 0x3F0000003F000000;
    v78.i64[1] = 0x3F0000003F000000;
    *(int16x8_t *)(a3 + 884) = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmlaq_f32(v78, v75, *(float32x4_t *)(a1 + 5040))), (int16x8_t)vcvtq_u32_f32(vmlaq_f32(v76, v75, *(float32x4_t *)(a1 + 5056))));
  }
  v79 = 0;
  *(_WORD *)(a2 + 814) = *(unsigned __int8 *)(a1 + 772);
  *(_DWORD *)(a2 + 824) = *(unsigned __int16 *)(v7 + 14);
  *(_DWORD *)(a2 + 828) = *(unsigned __int16 *)(v7 + 16);
  *(_DWORD *)(a2 + 832) = *(unsigned __int16 *)(v7 + 18);
  *(_DWORD *)(a2 + 840) = *(unsigned __int16 *)(v7 + 2);
  *(_DWORD *)(a2 + 844) = *(unsigned __int16 *)(v7 + 4);
  *(_DWORD *)(a2 + 848) = *(unsigned __int16 *)(v7 + 6);
  *(_BYTE *)(a2 + 812) = *(_BYTE *)(a1 + 845);
  do
  {
    *(_WORD *)(a2 + 816 + 2 * v79) = *(_DWORD *)(a1 + 672 + 4 * v79);
    ++v79;
  }
  while (v79 != 3);
  for (n = 0; n != 6; n += 2)
    *(_WORD *)(a2 + 892 + n) = *(_WORD *)(a1 + 794 + n);
  for (ii = 0; ii != 16; ii += 4)
    *(_DWORD *)(a2 + 852 + ii) = *(_DWORD *)(a1 + 21020 + ii);
  *(_WORD *)(a2 + 868) = *(unsigned __int8 *)(a1 + 844);
  v82 = *(_QWORD *)(a1 + 21224);
  *(_WORD *)(a2 + 870) = *(_DWORD *)(v82 + 4);
  *(_DWORD *)(a2 + 872) = vcvts_n_u32_f32(*(float *)(v82 + 8), 8uLL);
  if (!*(_DWORD *)(v82 + 36) || (v83 = *(_DWORD *)(v82 + 44), v83 == -1))
  {
    *(_OWORD *)(a2 + 876) = 0u;
  }
  else
  {
    v84 = (_DWORD *)(v82 + 152 * v83);
    *(_DWORD *)(a2 + 876) = v84[14];
    *(_DWORD *)(a2 + 880) = v84[15];
    *(_DWORD *)(a2 + 884) = v84[16];
    *(_DWORD *)(a2 + 888) = v84[17];
  }
  for (jj = 0; jj != 6; jj += 2)
    *(_WORD *)(a2 + 898 + jj) = *(_WORD *)(a1 + 22744 + jj);
  *(_BYTE *)(a2 + 1060) = v6[25].i32[1];
}

void CAWBAFE::RGBColorSpaceConversion(CAWBAFE *a1, int a2, uint64_t a3)
{
  uint64_t v3;
  __int128 *v4;
  __int128 v5;
  uint64_t v6;
  float *v7;
  uint64_t v8;
  uint64_t i;
  float *v10;
  uint64_t j;
  uint64_t k;
  float v13;
  int v14;
  int v15;
  _OWORD v16[2];
  int v17;
  float v18[9];
  float v19[9];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return;
  v3 = a3;
  if (a2 == 2)
  {
    v4 = &sRGB_to_Rec2020_Transform;
    goto LABEL_6;
  }
  if (a2 == 1)
  {
    v4 = &sRGB_to_P3D65_Transform;
LABEL_6:
    v5 = v4[1];
    v16[0] = *v4;
    v16[1] = v5;
    v17 = *((_DWORD *)v4 + 8);
  }
  v6 = 0;
  v7 = v18;
  v8 = a3;
  do
  {
    for (i = 0; i != 3; ++i)
      v7[i] = (float)*(int *)(v8 + i * 4);
    ++v6;
    v7 += 3;
    v8 += 12;
  }
  while (v6 != 3);
  v10 = v19;
  CAWBAFE::Multiply3by3Matrix(a1, (float *)v16, v18, v19);
  for (j = 0; j != 3; ++j)
  {
    for (k = 0; k != 3; ++k)
    {
      v13 = v10[k];
      v14 = (int)(float)(v13 + -0.5);
      v15 = (int)(float)(v13 + 0.5);
      if (v15 >= 0x3FFF)
        v15 = 0x3FFF;
      if (v13 > 0.0)
        v14 = v15;
      *(_DWORD *)(v3 + k * 4) = v14;
    }
    v3 += 12;
    v10 += 3;
  }
}

float CAWBAFE::GetColorRatioXFromCCT(CAWBAFE *this, unsigned int a2, float a3)
{
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned __int16 *v7;
  unsigned int v8;
  float v9;
  float v10;
  unsigned int v11;
  float v12;
  float v13;
  float v14;
  float v15;

  if (this->var86[0][2] >= a2)
  {
    LOWORD(a3) = this->var86[0][0];
LABEL_10:
    v15 = (float)LODWORD(a3);
    return v15 * 0.0039062;
  }
  v3 = this->var87 - 1;
  if (this->var86[v3][2] <= a2)
  {
    LOWORD(a3) = this->var86[v3][0];
    goto LABEL_10;
  }
  v4 = -1;
  do
  {
    v5 = v4 + 2;
    v6 = this->var86[v4 + 2][2];
    ++v4;
  }
  while (v6 < (unsigned __int16)a2);
  v7 = this->var86[v4];
  LOWORD(a3) = v7[2];
  *(float *)&v8 = (float)LODWORD(a3);
  v9 = 1000000.0 / *(float *)&v8;
  LOWORD(v8) = *v7;
  v10 = (float)v8;
  *(float *)&v11 = (float)v6;
  LOWORD(v11) = this->var86[v5][0];
  v12 = (float)v11;
  v13 = (float)(1000000.0 / (float)v6) - v9;
  v14 = 0.0;
  if (v13 != 0.0)
    v14 = (float)((float)(1000000.0 / (float)a2) - v9) / v13;
  v15 = v10 + (float)(v14 * (float)(v12 - v10));
  return v15 * 0.0039062;
}

float CAWBAFE::GetColorRatioYFromCCT(CAWBAFE *this, unsigned int a2, float a3)
{
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned __int16 *v7;
  unsigned int v8;
  float v9;
  float v10;
  unsigned int v11;
  float v12;
  float v13;
  float v14;
  float v15;

  if (this->var86[0][2] >= a2)
  {
    LOWORD(a3) = this->var86[0][1];
LABEL_10:
    v15 = (float)LODWORD(a3);
    return v15 * 0.0039062;
  }
  v3 = this->var87 - 1;
  if (this->var86[v3][2] <= a2)
  {
    LOWORD(a3) = this->var86[v3][1];
    goto LABEL_10;
  }
  v4 = -1;
  do
  {
    v5 = v4 + 2;
    v6 = this->var86[v4 + 2][2];
    ++v4;
  }
  while (v6 < (unsigned __int16)a2);
  v7 = this->var86[v4];
  LOWORD(a3) = v7[2];
  *(float *)&v8 = (float)LODWORD(a3);
  v9 = 1000000.0 / *(float *)&v8;
  LOWORD(v8) = v7[1];
  v10 = (float)v8;
  *(float *)&v11 = (float)v6;
  LOWORD(v11) = this->var86[v5][1];
  v12 = (float)v11;
  v13 = (float)(1000000.0 / (float)v6) - v9;
  v14 = 0.0;
  if (v13 != 0.0)
    v14 = (float)((float)(1000000.0 / (float)a2) - v9) / v13;
  v15 = v10 + (float)(v14 * (float)(v12 - v10));
  return v15 * 0.0039062;
}

float CAWBAFE::ComputeHistWPFromChannelGains(CAWBAFE *this, float a2, float a3, float *a4, float *a5, double a6, double a7)
{
  signed __int16 v9;
  signed __int16 v10;
  signed __int16 v11;
  unsigned int var3;
  unsigned int var5;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float result;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;

  v9 = this->var13.var0[3];
  v10 = this->var13.var0[4];
  v11 = this->var13.var0[5];
  var3 = this->var14.var3;
  var5 = this->var14.var5;
  v14 = 1.0;
  LODWORD(a7) = 1.0;
  if (this->var13.var6)
  {
    LOWORD(a7) = this->var13.var5[0];
    a7 = (double)*(unint64_t *)&a7 * 255.0 * 0.000122070312;
    v14 = a7;
    LOWORD(a7) = this->var13.var5[1];
    *(float *)&a7 = (double)*(unint64_t *)&a7 * 255.0 * 0.000122070312;
  }
  v28 = v14;
  v35 = *(float *)&a7;
  if (this->var14.var0[0] <= 0x100u)
    v15 = 1.0;
  else
    v15 = 256.0;
  v32 = (float)var5 * 0.000015259;
  v33 = v15;
  v34 = (float)var3 * 0.000015259;
  v30 = (float)this->var13.var2[1] - (float)(1048600.0 / (float)var3);
  v31 = (float)this->var13.var2[2] - (float)(1048600.0 / (float)var5);
  v16 = (float)this->var13.var1[8] * 0.00024414;
  v17 = (float)this->var13.var1[6];
  v18 = (float)(v16 * v16) + (float)((float)(v17 * 0.00024414) * (float)(v17 * 0.00024414));
  v29 = v16 / v18;
  v19 = (float)this->var13.var1[5] * 0.00024414;
  v20 = (float)this->var13.var1[3] * 0.00024414;
  v21 = (float)(v19 * v19) + (float)(v20 * v20);
  v22 = v19 / v21;
  v23 = (float)(a3 / a2)
      * (float)((float)(__int16)(v10 + v9 + v11)
              / (float)((float)((float)((float)v9 * a3) / a2) + (float)((float)v11 + (float)((float)v10 * a3))));
  v24 = v20 / v21;
  v25 = log2f((float)(__int16)(v10 + v9 + v11)/ (float)((float)((float)((float)v9 * a3) / a2) + (float)((float)v11 + (float)((float)v10 * a3))))* 32.0;
  v26 = (float)((float)(v22 * (float)(log2f(v23) * -32.0)) + (float)(v25 * v24))
      / (float)((float)(v22 * (float)((float)-(float)(v17 * 0.00024414) / v18)) + (float)(v29 * v24));
  *a5 = v32 * (float)(v31 + (float)(v26 * (float)(v33 * v35)));
  result = v34 * (float)(v30 + (float)((float)((float)(v25 - (float)(v26 * v29)) / v22) * (float)(v33 * v28)));
  *a4 = result;
  return result;
}

uint64_t CAWBAFE::TrimHistogram(CAWBAFE *this, int8x16_t *a2, int a3)
{
  unsigned int *v3;
  unint64_t v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  int v8;
  int v9;
  unsigned __int16 v10;
  unsigned int *var53;
  char *var63;
  int8x16_t *v13;
  unsigned int *v14;
  int8x16_t v15;
  int8x16_t v16;
  int16x8_t v17;
  BOOL v18;
  unint64_t var67;
  uint64_t v20;
  int v21;
  unsigned __int16 v22;
  int v23;
  const __int16 *v24;
  uint64_t v25;
  signed __int16 *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  size_t v32;
  uint64_t v33;
  unsigned int *v34;
  int v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  unsigned int *v41;
  unsigned int *v42;
  unsigned int *v43;
  unsigned int *v44;
  unsigned int v45;
  int v46;
  int v47;
  unsigned int *v48;
  int v49;
  unsigned int *v50;
  int v51;
  unsigned int *v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  unsigned int *v56;
  unsigned int *v57;
  unsigned int *v58;
  unsigned int *v59;
  unsigned int *v60;
  unsigned int *v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unint64_t v69;
  int v71;
  unsigned int *v72;
  unsigned int *v73;
  unsigned int *v74;
  unsigned int *v75;
  unsigned int *v76;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  uint64_t v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  int v94;
  int v95;
  unsigned int v96;
  uint64_t v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int *v100;
  int v101;
  uint64_t v102;
  unsigned int *v103;
  unsigned int v104;
  unint64_t v105;
  unint64_t v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unint64_t v110;
  unint64_t v111;
  unsigned int *v112;
  unsigned int i;
  uint64_t result;
  int v115;
  char *v116;
  unsigned int *v117;
  uint64_t v118;
  char *v119;
  unint64_t v120;
  int v121;
  int j;
  uint64_t v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  const __int16 *v129;
  int32x4_t v130;
  int16x8_t v131;
  int16x8_t v132;
  int16x4x2_t v133;
  int16x4x2_t v134;

  v3 = (unsigned int *)a2;
  v5 = 0;
  v6 = this->var60;
  v7 = (unsigned __int16 *)&this->var53[4];
  v8 = *(__int16 *)&this->var65[5][2 * this->var67 + 1020];
  v9 = this->var66[1];
  if (a3 >= v8)
    v10 = *(_WORD *)&this->var65[5][2 * this->var67 + 1020];
  else
    v10 = a3;
  var53 = this->var53;
  var63 = this->var63;
  v13 = a2 + 1;
  v14 = &this->var53[4];
  do
  {
    v15 = (int8x16_t)vmovl_u8(*(uint8x8_t *)&var63[v5]);
    v16 = vandq_s8(v13[-1], (int8x16_t)vmovl_s16(vceqz_s16(*(int16x4_t *)v15.i8)));
    v17 = (int16x8_t)vandq_s8(*v13, (int8x16_t)vmovl_s16(vceqz_s16((int16x4_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL))));
    *((int8x16_t *)v14 - 1) = v16;
    *(int16x8_t *)v14 = v17;
    v14 += 8;
    v13 += 2;
    v18 = v5 >= 0x3F8;
    v5 += 8;
  }
  while (!v18);
  var67 = this->var67;
  if (var67 < 3)
  {
LABEL_18:
    v132 = 0u;
    v29 = 0;
    v30 = -1;
    v31 = -1;
  }
  else
  {
    v20 = (var67 - 1);
    if (a3 >= v8)
      v21 = v8;
    else
      v21 = a3;
    if (v21 <= v9)
      v22 = v9;
    else
      v22 = v10;
    v23 = v22;
    v24 = this->var84[5];
    v25 = v20 - 1;
    v26 = &this->var66[2];
    while (1)
    {
      v27 = *(v26 - 1);
      if (v23 >= v27)
      {
        v28 = *v26;
        if (v23 <= v28)
          break;
      }
      v24 += 10;
      ++v26;
      if (!--v25)
        goto LABEL_18;
    }
    v127 = ((v23 - v27) << 12) / (v28 - v27);
    v128 = 4096 - (__int16)v127;
    *(int16x4_t *)v17.i8 = vdup_n_s16(v127);
    v129 = v24 + 10;
    v133 = vld2_s16(v129);
    v130 = vdupq_n_s32(v128);
    v134 = vld2_s16(v24);
    v131 = (int16x8_t)vmlal_s16(vmulq_s32(v130, vmovl_s16(v134.val[0])), *(int16x4_t *)v17.i8, v133.val[0]);
    *(int16x4_t *)v131.i8 = vshrn_n_s32((int32x4_t)v131, 0xCuLL);
    *(int16x4_t *)v17.i8 = vshrn_n_s32(vmlal_s16(vmulq_s32(v130, vmovl_s16(v134.val[1])), *(int16x4_t *)v17.i8, v133.val[1]), 0xCuLL);
    v132 = vzip1q_s16(v131, v17);
    v29 = v131.u16[0];
    v30 = (v17.i16[0] - 128) >> 8;
    v31 = (v17.i16[3] - 128) >> 8;
  }
  if (v30 >= 31)
    LOBYTE(v30) = 31;
  if (v31 <= v30)
  {
    if ((__int16)v29 <= 8319)
      v32 = (((v29 + 65408) >> 6) & 0x3FCLL) + 4;
    else
      v32 = 128;
    v33 = v30 - v31 + 1;
    v34 = &this->var53[32 * v31];
    do
    {
      bzero(v34, v32);
      v34 += 32;
      --v33;
    }
    while (v33);
  }
  v35 = (v132.i16[3] - 128) >> 8;
  if (v35 >= 31)
    LOBYTE(v35) = 31;
  if (v31 <= v35)
  {
    v36 = v132.i16[2] - 128;
    if (v36 >= v132.i16[4] - 128)
      v36 = v132.i16[4] - 128;
    if (v36 >= 0)
      v37 = BYTE1(v36);
    else
      v37 = 0;
    v38 = 4 * v37 + 128 * v31;
    v39 = v35 - v31 + 1;
    v40 = (char *)this->var53 + v38;
    do
    {
      if (v37 <= 0x1F)
        bzero(v40, 4 * (31 - v37) + 4);
      v40 += 128;
      --v39;
    }
    while (v39);
  }
  v41 = &this->var53[1023];
  v42 = &this->var53[991];
  v43 = &this->var53[959];
  v44 = &this->var53[927];
  v45 = v7[2087];
  v46 = v7[2088];
  v47 = v7[2089];
  v48 = &this->var53[895];
  v49 = v7[2090];
  v50 = &this->var53[863];
  v51 = v7[2091];
  v52 = &this->var53[831];
  v53 = v7[2092];
  v54 = 31;
  do
  {
    v55 = 0;
    v56 = v41;
    v57 = v42;
    v58 = v43;
    v59 = v44;
    v60 = v48;
    v61 = v50;
    v62 = -32;
    do
    {
      v63 = v57[v55];
      v64 = v58[v55];
      v65 = v59[v55];
      v66 = v60[v55];
      v67 = v61[v55];
      v68 = v52[v55];
      if (v64 | v63 | v65 | v66 | v67 | v68)
        v69 = v63 * v45
            + (unint64_t)(v64 * v46)
            + v65 * v47
            + (unint64_t)(v66 * v49)
            + v67 * v51
            + (unint64_t)(v68 * v53)
            + 128;
      else
        v69 = 128;
      v56[v55--] = v69 >> 8;
      v18 = __CFADD__(v62++, 1);
    }
    while (!v18);
    v52 = (unsigned int *)((char *)v52 + v55 * 4);
    v50 = &v61[v55];
    v48 = &v60[v55];
    v44 = &v59[v55];
    v43 = &v58[v55];
    v42 = &v57[v55];
    v41 = &v56[v55];
  }
  while (v54-- > 6);
  v71 = -32;
  do
  {
    v56[v55] = (v57[v55] * v45
              + (unint64_t)(v58[v55] * v46)
              + v59[v55] * v47
              + (unint64_t)(v60[v55] * v49)
              + v61[v55] * v51
              + 128) >> 8;
    --v55;
    v18 = __CFADD__(v71++, 1);
  }
  while (!v18);
  v72 = &v60[v55];
  v73 = &v59[v55];
  v74 = &v58[v55];
  v75 = &v57[v55];
  v76 = &v56[v55];
  v77 = -32;
  do
  {
    v78 = *v75--;
    v79 = v78 * v45;
    v80 = *v74--;
    v81 = (v80 * v46);
    v82 = *v73--;
    v83 = (v82 * v47);
    v84 = *v72--;
    *v76-- = (v79 + v81 + v83 + (unint64_t)(v84 * v49) + 128) >> 8;
    v18 = __CFADD__(v77++, 1);
  }
  while (!v18);
  v85 = -32;
  do
  {
    v87 = *v75--;
    v86 = v87;
    v88 = *v74--;
    v89 = (v88 * v46);
    v90 = *v73--;
    *v76-- = (v86 * v45 + v89 + (unint64_t)(v90 * v47) + 128) >> 8;
    v18 = __CFADD__(v85++, 1);
  }
  while (!v18);
  v91 = -32;
  do
  {
    v92 = *v75--;
    v93 = v92 * v45;
    v94 = *v74--;
    *v76-- = (v93 + (unint64_t)(v94 * v46) + 128) >> 8;
    v18 = __CFADD__(v91++, 1);
  }
  while (!v18);
  v95 = -32;
  do
  {
    v96 = *v75--;
    *v76-- = (v96 * (unint64_t)v45 + 128) >> 8;
    v18 = __CFADD__(v95++, 1);
  }
  while (!v18);
  v97 = 0;
  *(_OWORD *)(v76 - 3) = 0u;
  *(_OWORD *)(v76 - 7) = 0u;
  *(_OWORD *)(v76 - 11) = 0u;
  *(_OWORD *)(v76 - 15) = 0u;
  *(_OWORD *)(v76 - 19) = 0u;
  *(_OWORD *)(v76 - 23) = 0u;
  *(_OWORD *)(v76 - 27) = 0u;
  *(_OWORD *)(v76 - 31) = 0u;
  v98 = *v6;
  v99 = v6[1];
  v100 = &this->var53[3];
  v101 = v6[2];
  do
  {
    v102 = 0;
    v103 = &var53[32 * v97];
    v104 = v103[1];
    v105 = v104 * v101 + *v103 * (unint64_t)v99 + 128;
    v106 = v104 * v99 + *v103 * (unint64_t)v98 + v103[2] * v101 + 128;
    do
    {
      v108 = v100[v102 - 2];
      v107 = v100[v102 - 1];
      v109 = v100[v102];
      if (v107 | v108 | v109)
        v110 = v108 * v98 + (unint64_t)(v107 * v99) + v109 * v101 + 128;
      else
        v110 = 128;
      v100[v102 - 3] = v110 >> 8;
      ++v102;
    }
    while ((_DWORD)(v102 * 4) != 116);
    v111 = v105 >> 8;
    v103[31] = (v103[31] * v99 + v103[30] * (unint64_t)v98 + 128) >> 8;
    v112 = v103 + 28;
    for (i = 31; i > 2; --i)
    {
      result = *v112;
      v112[2] = result;
      --v112;
    }
    *v103 = v111;
    v103[1] = v106 >> 8;
    ++v97;
    v100 += 32;
  }
  while (v97 != 32);
  v115 = 0;
  v116 = this->var63;
  v117 = var53;
  do
  {
    v118 = 0;
    v119 = v116;
    do
    {
      v121 = *v119++;
      LODWORD(v120) = v121;
      if (v121)
        v120 = (*v117 * (unint64_t)this->var61[v118] + 128) >> 8;
      *v117++ = v120;
      ++v118;
    }
    while (v118 != 32);
    ++v115;
    v116 += 32;
  }
  while (v115 != 32);
  for (j = 0; j != 32; ++j)
  {
    v123 = 0;
    do
    {
      v124 = var53[v123];
      v125 = v3[v123];
      v18 = v125 >= v124;
      v126 = v125 - v124;
      if (!v18)
        v126 = 0;
      var53[v123++] = v126;
    }
    while ((_DWORD)(v123 * 4) != 128);
    v3 += 32;
    var53 = (unsigned int *)((char *)var53 + v123 * 4);
  }
  return result;
}

float CAWBAFE::calcMixLightingScore(CAWBAFE *this)
{
  uint64_t v1;
  unsigned int v2;
  unsigned __int16 *var55;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int *var53;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  float result;
  float v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned __int8 *var64;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned __int8 *v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v39;
  int v41;
  int v42;
  unsigned int v43;
  int v44;
  float v45;
  float v46;
  float v47;
  float v48;

  v1 = 0;
  v2 = 0;
  var55 = this->var55;
  v4 = this->var55[0];
  v5 = this->var55[2];
  v6 = v5 + v4;
  var53 = this->var53;
  do
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v9 += var53[v8];
      v8 += 32;
    }
    while (v8 != 1024);
    if (v2 <= v9)
      v2 = v9;
    ++v1;
    ++var53;
  }
  while (v1 != 32);
  v10 = 0;
  v11 = 0;
  v12 = v6 >> 9;
  v13 = (v6 >> 9) - 1;
  do
  {
    v11 += this->var53[(v13 + v10)];
    v10 += 32;
  }
  while (v10 != 1024);
  v14 = &this->var53[v12];
  v15 = v12;
  do
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v17 += v14[v16];
      v16 += 32;
    }
    while (v16 != 1024);
    if (v11 >= v17)
      v11 = v17;
    ++v15;
    ++v14;
  }
  while (v15 != (_DWORD)v12 + 2);
  result = 0.0;
  if (v2)
  {
    v19 = (float)v11 / (float)v2;
    if (v19 < 0.5)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = (_DWORD)v12 << 8;
      if (v27 >= v4)
        v28 = this->var55[0];
      else
        v28 = v27;
      if (v27 > v5)
        v5 = v27;
      var64 = this->var64;
      v30 = this->var53;
      do
      {
        v31 = 128;
        v32 = v30;
        v33 = var64;
        do
        {
          v35 = *v32++;
          v34 = v35;
          if (v35)
          {
            v20 += v34;
            if (*v33)
            {
              v36 = var55[1];
              v37 = v34 * *v33;
              if (v31 < v36 && v31 > v5)
                v39 = v34 * *v33;
              else
                v39 = 0;
              v21 += v34;
              if (v31 <= v36 && v31 >= v4)
                v41 = 0;
              else
                v41 = v34 * *v33;
              v23 += v41;
              if (v31 >= v28)
                v42 = 0;
              else
                v42 = v37;
              v22 += v42;
              if (v27 <= v36)
                v43 = var55[1];
              else
                v43 = v27;
              if (v31 <= v43)
                v44 = 0;
              else
                v44 = v37;
              v25 += v44;
              v24 += v39;
            }
          }
          ++v33;
          v31 += 256;
        }
        while (v31 != 8320);
        ++v26;
        var64 += 32;
        v30 += 32;
      }
      while (v26 != 32);
      result = 0.0;
      v45 = 0.0;
      v46 = 0.0;
      v47 = 0.0;
      if (v23)
      {
        v45 = fminf(sqrtf((float)v22 / (float)v23), 1.0);
        v46 = (float)((float)(v25 - v24) / (float)v23) * 10.0;
        if (v46 < 0.0)
          v46 = 0.0;
        if (v46 > 1.0)
          v46 = 1.0;
        v47 = (float)v21 / (float)v20;
      }
      if ((float)(v45 * v46) != 0.0)
      {
        result = 1.0;
        v48 = (float)((float)((float)((float)(v19 * -2.0) + 1.0) * v45) * v46) * v47;
        if (v48 <= 1.0)
          result = v48;
        if (result < 0.0)
          return 0.0;
      }
    }
  }
  return result;
}

float CAWBAFE::blendGrayWorldforMixLighting(CAWBAFE *this, float result)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned __int16 v6;
  int v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned int v10;
  float v11;
  float var38;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = 1;
    v8 = v6;
    do
    {
      v9 = v8;
      if (this->var64[v8])
      {
        v10 = this->var53[v8];
        v4 += v10 * v7;
        v3 += v10 * ((2 * v2) | 1);
        v5 += v10;
      }
      v8 = v9 + 1;
      v7 += 2;
    }
    while (v7 != 65);
    v6 += 32;
    ++v2;
  }
  while (v2 != 32);
  if (v5)
  {
    v11 = (float)(v4 >> 1) / (float)v5;
    var38 = this->var38;
    if (v11 > var38)
    {
      this->var38 = (float)(v11 * result) + (float)((float)(1.0 - result) * var38);
      result = (float)((float)((float)(v3 >> 1) / (float)v5) * result) + (float)((float)(1.0 - result) * this->var39);
      this->var39 = result;
    }
  }
  return result;
}

float CAWBAFE::postWPCalcTinting(CAWBAFE *this, unsigned int *a2, int a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  signed __int16 (*var54)[4];
  unsigned __int8 (*var65)[1024];
  float var38;
  uint64_t i;
  BOOL v11;
  uint64_t var67;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned __int8 *v22;
  uint64_t j;
  signed __int16 *v24;
  float v25;
  float v26;
  int v27;
  unsigned int v28;
  unsigned __int8 *v29;
  uint64_t k;
  float v31;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned __int8 *v36;
  float v37;
  int v38;
  unsigned int *v39;
  uint64_t m;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  float v44;
  unsigned __int8 *v45;
  float v46;
  uint64_t n;
  float v48;
  float v49;
  float v50;
  int v51;
  int v52;

  if (a3 < this->var66[0])
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    var54 = this->var54;
    var65 = this->var65;
    var38 = this->var38;
    do
    {
      for (i = 0; i != 32; ++i)
      {
        if ((*var65)[i])
        {
          v4 += a2[i];
        }
        else if ((__int16)i < (__int16)((int)(float)(var38 + -0.5) + 1))
        {
          v5 += a2[i];
        }
      }
      var65 = (unsigned __int8 (*)[1024])((char *)var65 + 32);
      a2 += 32;
      v11 = v6++ >= 0x1F;
    }
    while (!v11);
LABEL_44:
    v25 = 1.0 - (float)((float)v5 / (float)v4);
    if (v25 < 0.0)
      v25 = 0.0;
    v26 = (float)*(_WORD *)var54;
    v27 = (*var54)[1];
LABEL_47:
    v31 = fmaxf(v25 * (float)((float)(v26 - (float)((float)v27 * var38)) * 0.0039062), 0.0);
    return (float)(1.0 - a4) * v31;
  }
  var67 = this->var67;
  v13 = var67 - 1;
  if (a3 >= *(__int16 *)&this->var65[5][2 * var67 + 1022])
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = this->var65[v13];
    var38 = this->var38;
    do
    {
      for (j = 0; j != 32; ++j)
      {
        if (v22[j])
        {
          v19 += a2[j];
        }
        else if ((__int16)j < (__int16)((int)(float)(var38 + -0.5) + 1))
        {
          v20 += a2[j];
        }
      }
      v22 += 32;
      a2 += 32;
      v11 = v21++ >= 0x1F;
    }
    while (!v11);
    v24 = this->var54[v13];
    v25 = 1.0 - (float)((float)v20 / (float)v19);
    if (v25 < 0.0)
      v25 = 0.0;
    v26 = (float)*v24;
    v27 = v24[1];
    goto LABEL_47;
  }
  if (var67 >= 2)
  {
    v14 = 0;
    v15 = 0;
    v16 = var67 - 1;
    while (1)
    {
      v17 = v15;
      v18 = this->var66[v15];
      if (a3 == v18)
        break;
      ++v15;
      if (a3 > v18)
      {
        v14 = v17;
        v16 = v17 + 1;
      }
      if ((v17 + 1) >= v13)
        goto LABEL_33;
    }
LABEL_34:
    v4 = 0;
    v5 = 0;
    v28 = 0;
    v29 = this->var65[v17];
    var38 = this->var38;
    do
    {
      for (k = 0; k != 32; ++k)
      {
        if (v29[k])
        {
          v4 += a2[k];
        }
        else if ((__int16)k < (__int16)((int)(float)(var38 + -0.5) + 1))
        {
          v5 += a2[k];
        }
      }
      v29 += 32;
      a2 += 32;
      v11 = v28++ >= 0x1F;
    }
    while (!v11);
    var54 = (signed __int16 (*)[4])this->var54[v17];
    goto LABEL_44;
  }
  v14 = 0;
  v16 = var67 - 1;
LABEL_33:
  v17 = v14;
  if (v14 == v16)
    goto LABEL_34;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = this->var65[(unint64_t)v14];
  v37 = this->var38;
  v38 = (__int16)((int)(float)(v37 + -0.5) + 1);
  v39 = a2;
  do
  {
    for (m = 0; m != 32; ++m)
    {
      if (v36[m])
      {
        v33 += v39[m];
      }
      else if ((__int16)m < v38)
      {
        v34 += v39[m];
      }
    }
    v36 += 32;
    v39 += 32;
    v11 = v35++ >= 0x1F;
  }
  while (!v11);
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 1.0 - (float)((float)v34 / (float)v33);
  if (v44 < 0.0)
    v44 = 0.0;
  v45 = this->var65[(unint64_t)v16];
  v46 = v44 * (float)((float)((float)this->var54[v17][0] - (float)((float)this->var54[v17][1] * v37)) * 0.0039062);
  do
  {
    for (n = 0; n != 32; ++n)
    {
      if (v45[n])
      {
        v41 += a2[n];
      }
      else if ((__int16)n < v38)
      {
        v42 += a2[n];
      }
    }
    v45 += 32;
    a2 += 32;
    v11 = v43++ >= 0x1F;
  }
  while (!v11);
  v48 = fmaxf(v46, 0.0);
  v49 = 1.0 - (float)((float)v42 / (float)v41);
  if (v49 < 0.0)
    v49 = 0.0;
  v50 = v49 * (float)((float)((float)this->var54[v16][0] - (float)((float)this->var54[v16][1] * v37)) * 0.0039062);
  v51 = this->var66[v16];
  v52 = this->var66[v17];
  v31 = (float)((float)(fmaxf(v50, 0.0) * (float)(a3 - v52)) + (float)(v48 * (float)(v51 - a3))) / (float)(v51 - v52);
  return (float)(1.0 - a4) * v31;
}

uint64_t CAWBAFE::ComputeAmbientLuxLevel(CAWBAFE *this, uint64_t a2)
{
  unsigned int var69;

  if (this->var68 >= 2u)
  {
    var69 = this->var69;
    if (a2 < var69)
      var69 = a2;
    if (var69 >= 0x5D2)
      return 1490;
    else
      return var69;
  }
  return a2;
}

void CAWBAFE::InterpCCMfromBases(CAWBAFE *this, float a2, float a3, float a4, int (*a5)[3], const sTuningCurvePoint *a6, const __int16 (*a7)[9], float a8)
{
  unsigned int v13;
  float v14;
  float v15;
  float v16;
  int v17;
  uint64_t v18;
  int v19;
  float v20;
  _BYTE *v21;
  uint64_t i;
  const __int16 *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  float v27;
  uint64_t j;
  float v29;
  float v30;
  _BYTE v31[36];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v13 = a6->var1[0];
  v14 = (float)a6->var1[1];
  if (v14 <= a4)
  {
    v17 = a6->var1[a6->var0 - 1];
    if ((int)(float)(a4 + 0.5) <= (unsigned __int16)v17)
      v17 = (int)(float)(a4 + 0.5);
    if ((unsigned __int16)a6->var1[0] <= (unsigned __int16)v17)
      LOWORD(v13) = v17;
    v16 = CAWBAFE::calculateWeightFromTuningTable(this, a6, (unsigned __int16)v13);
  }
  else
  {
    v15 = (float)(a4 - (float)v13) / (float)(v14 - (float)v13);
    if (v15 > 1.0)
      v15 = 1.0;
    if (v15 < 0.0)
      v15 = 0.0;
    v16 = (float)((float)(v15 * (float)a6->var2[1]) + (float)((float)(1.0 - v15) * (float)a6->var2[0])) * 0.0039062;
  }
  v18 = 0;
  v19 = 0;
  v20 = v16 * a8;
  v21 = v31;
  do
  {
    for (i = 0; i != 36; i += 12)
    {
      v23 = &(*a7)[v19];
      *(float *)&v21[i] = (float)((float)((float)((float)((float)((float)((float)v23[9] * a2) * 0.0625) + (float)*v23)
                                                + (float)((float)((float)v23[18] * a3) * 0.0625))
                                        + (float)((float)((float)((float)v23[27] * a2) * a2) * 0.0039062))
                                + (float)((float)((float)((float)v23[36] * a3) * a3) * 0.0039062))
                        + (float)((float)v23[45] * v20);
      ++v19;
    }
    ++v18;
    v21 += 4;
  }
  while (v18 != 3);
  v24 = 0;
  v25 = v31;
  do
  {
    v26 = 0;
    v27 = 0.0;
    do
    {
      v27 = *(float *)&v25[v26] + v27;
      v26 += 4;
    }
    while (v26 != 12);
    for (j = 0; j != 3; ++j)
    {
      v29 = (float)(*(float *)&v25[j * 4] * 4096.0) / v27;
      *(float *)&v25[j * 4] = v29;
      if (v29 <= 0.0)
      {
        v30 = v29 + -0.5;
      }
      else
      {
        if (v29 > 16383.0)
          v29 = 16383.0;
        *(float *)&v25[j * 4] = v29;
        v30 = v29 + 0.5;
      }
      (*a5)[j] = (int)v30;
    }
    ++v24;
    v25 += 12;
    ++a5;
  }
  while (v24 != 3);
}

uint64_t CAWBAFE::ComputePriorCCMResidualTileGains(CAWBAFE *this, unsigned int a2, unsigned int a3, const unsigned int *a4, sAWBInternalParams *a5, double a6, float a7, double a8, double a9, double a10, double a11, float a12)
{
  BOOL *p_var144;
  float var39;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float var38;
  float v21;
  float v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  int32x2_t v27;
  float v28;
  int v29;
  float v30;
  float v31;
  float v32;
  float v33;
  unsigned int v34;
  float32x2_t v35;
  float var11;

  p_var144 = &this->var144;
  var39 = this->var39;
  LOWORD(a7) = this->var58[1];
  v14 = (float)LODWORD(a7);
  v15 = var39 + v14;
  v16 = 31.0;
  if ((float)(var39 + v14) > 31.0)
    v15 = 31.0;
  v17 = var39 - v14;
  v18 = 0.0;
  if (v17 >= 0.0)
    v19 = v17;
  else
    v19 = 0.0;
  var38 = this->var38;
  LOWORD(a12) = this->var58[0];
  v21 = (float)LODWORD(a12);
  if ((float)(var38 + v21) <= 31.0)
    v16 = var38 + v21;
  v22 = var38 - v21;
  if (v22 >= 0.0)
    v18 = v22;
  v23 = (int)(float)(v19 + 1.0);
  v24 = (int)(float)(v15 + 1.0);
  if (v23 > v24)
    goto LABEL_38;
  v25 = 0;
  v26 = (int)(float)(v16 + 1.0);
  v27 = 0;
  do
  {
    if ((int)(float)(v18 + 1.0) <= v26)
    {
      v28 = (float)(unsigned __int16)v23;
      v29 = (int)(float)(v18 + 1.0);
      do
      {
        v30 = (float)(unsigned __int16)v29;
        if ((float)(v18 + 1.0) <= v30)
        {
          v31 = 1.0;
          if (v16 < v30)
            v31 = (float)(v16 + 1.0) - v30;
        }
        else
        {
          v31 = v30 - v18;
        }
        v32 = (float)((float)(v15 + 1.0) - v28) * v31;
        if (v15 >= v28)
          v32 = v31;
        v33 = (float)(v28 - v19) * v31;
        if ((float)(v19 + 1.0) <= v28)
          v33 = v32;
        v34 = (float)((float)(v33 * (float)a4[(unsigned __int16)(v29 - 1 + 32 * (v23 - 1))]) + 0.5);
        v27 = vmla_s32(v27, (int32x2_t)__PAIR64__((2 * ((unsigned __int16)v23 - 1)) | 1u, (2 * ((unsigned __int16)v29 - 1)) | 1u), vdup_n_s32(v34));
        v25 = v25 + v34;
        LOWORD(v29) = v29 + 1;
      }
      while (v26 >= (unsigned __int16)v29);
    }
    LOWORD(v23) = v23 + 1;
  }
  while (v24 >= (unsigned __int16)v23);
  if ((_DWORD)v25)
  {
    *(float *)&a9 = (float)v25;
    v35 = vdiv_f32(vcvt_f32_u32(vcvt_u32_f32(vmul_f32(vcvt_f32_u32((uint32x2_t)v27), (float32x2_t)0x3F0000003F000000))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a9, 0));
    if (this->var68 > 1u || this->var16 < this->var18 || a5->var4 || *p_var144)
    {
      *(float32x2_t *)&a5->var10 = v35;
      _D4 = v35;
    }
    else
    {
      _D4 = vadd_f32(vmul_f32(v35, (float32x2_t)0x3F0000003F000000), vmul_f32(*(float32x2_t *)&a5->var10, (float32x2_t)0x3F0000003F000000));
      *(float32x2_t *)&a5->var10 = _D4;
    }
    _S3 = (float)(*(float *)&a9 * 10.0) / (float)a3;
    if (_S3 > 1.0)
      _S3 = 1.0;
    if (v35.f32[0] < var38)
      this->var38 = vmlas_n_f32(var38 * (float)(1.0 - _S3), _S3, _D4.f32[0]);
    __asm { FMLA            S0, S3, V4.S[1] }
    this->var39 = _S0;
  }
  else
  {
LABEL_38:
    if (this->var68 > 1u || this->var16 < this->var18 || a5->var4 || (v25 = *p_var144) != 0)
    {
      v25 = 0;
    }
    else
    {
      var11 = a5->var11;
      var38 = (float)(var38 + a5->var10) * 0.5;
      this->var38 = var38;
      var39 = (float)(var39 + var11) * 0.5;
      this->var39 = var39;
    }
    a5->var10 = var38;
    a5->var11 = var39;
  }
  return v25;
}

CAWBAFE *CAWBAFE::SensorCalSet(CAWBAFE *this, float a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9)
{
  int v9;

  LOWORD(v9) = 0x4000;
  if (a4 > 0.0 && a8 > 0.0)
    v9 = (int)(float)((float)(a8 * 16384.0) / a4);
  this->var89.var0 = v9;
  LOWORD(v9) = 0x4000;
  if (a5 > 0.0 && a9 > 0.0)
    v9 = (int)(float)((float)(a9 * 16384.0) / a5);
  this->var89.var1 = v9;
  LOWORD(v9) = 0x4000;
  if (a2 > 0.0 && a6 > 0.0)
    v9 = (int)(float)((float)(a6 * 16384.0) / a2);
  this->var89.var2 = v9;
  LOWORD(v9) = 0x4000;
  if (a3 > 0.0 && a7 > 0.0)
    v9 = (int)(float)((float)(a7 * 16384.0) / a3);
  this->var89.var3 = v9;
  return this;
}

uint64_t CAWBAFE::SetScheme(uint64_t result, int a2)
{
  *(_DWORD *)(result + 20700) = a2;
  *(_BYTE *)(result + 20704) = 1;
  return result;
}

char *CAWBAFE::SetHistogramWeight(char *result, unsigned int a2, uint64_t a3)
{
  _WORD *v3;
  uint64_t v4;
  _WORD *v5;
  char *v6;

  v3 = result + 20640;
  result[20652] = a2;
  if (a2)
  {
    v4 = a2;
    v5 = (_WORD *)(a3 + 2);
    v6 = result + 14496;
    do
    {
      *v3++ = *(v5 - 1);
      result = (char *)memcpy(v6, v5, 0x400uLL);
      v5 += 513;
      v6 += 1024;
      --v4;
    }
    while (v4);
  }
  return result;
}

__n128 CAWBAFE::UpdateCSCConfig(CAWBAFE *this, const sFEStatCSCConfig *a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2->var0;
  v3 = *(_OWORD *)&a2->var0[8];
  v4 = *(_OWORD *)&a2->var1[7];
  *(_OWORD *)&this->var13.var3[1] = *(_OWORD *)&a2->var3[1];
  *(_OWORD *)&this->var13.var0[8] = v3;
  *(_OWORD *)&this->var13.var1[7] = v4;
  *(__n128 *)this->var13.var0 = result;
  return result;
}

__n128 CAWBAFE::UpdateColorHistConfig(CAWBAFE *this, const sFEStatColorHistConfig *a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2->var0;
  v3 = *(_OWORD *)&a2->var0[8];
  v4 = *(_OWORD *)&a2->var1[2];
  *(_OWORD *)&this->var14.var1[14] = *(_OWORD *)&a2->var1[14];
  *(_OWORD *)&this->var14.var0[8] = v3;
  *(_OWORD *)&this->var14.var1[2] = v4;
  *(__n128 *)this->var14.var0 = result;
  return result;
}

void *CAWBAFE::SetProjectionPoint(uint64_t a1, unsigned int a2, void *__src)
{
  *(_DWORD *)(a1 + 20832) = a2;
  return memcpy((void *)(a1 + 20712), __src, 4 * a2);
}

void *CAWBAFE::SetDaylightProjectionPoint(uint64_t a1, unsigned int a2, void *__src)
{
  *(_DWORD *)(a1 + 20832) = a2;
  return memcpy((void *)(a1 + 22776), __src, 4 * a2);
}

void *CAWBAFE::SetHistogramXToCCTLut(uint64_t a1, unsigned int a2, void *__src)
{
  *(_DWORD *)(a1 + 20884) = a2;
  return memcpy((void *)(a1 + 20836), __src, 6 * a2);
}

__n128 CAWBAFE::SetCCM2DCoefficient(CAWBAFE *this, __int16 *a2, __int16 *a3, __int16 *a4, __int16 *a5, __int16 *a6, __n128 *a7)
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 result;

  v7 = *(_OWORD *)a2;
  this->var88[0][8] = a2[8];
  *(_OWORD *)&this->var88[0][0] = v7;
  v8 = *(_OWORD *)a3;
  this->var88[1][8] = a3[8];
  *(_OWORD *)&this->var88[1][0] = v8;
  v9 = *(_OWORD *)a4;
  this->var88[2][8] = a4[8];
  *(_OWORD *)&this->var88[2][0] = v9;
  v10 = *(_OWORD *)a5;
  this->var88[3][8] = a5[8];
  *(_OWORD *)&this->var88[3][0] = v10;
  v11 = *(_OWORD *)a6;
  this->var88[4][8] = a6[8];
  *(_OWORD *)&this->var88[4][0] = v11;
  result = *a7;
  this->var88[5][8] = a7[1].n128_i16[0];
  *(__n128 *)&this->var88[5][0] = result;
  return result;
}

void *CAWBAFE::SetPostTintParam(uint64_t a1, unsigned int a2, void *__src)
{
  return memcpy((void *)(a1 + 13284), __src, 8 * a2);
}

CAWBAFE *CAWBAFE::SetMixLightingXLoc(CAWBAFE *this, const unsigned __int16 *a2)
{
  unsigned __int16 v2;

  v2 = a2[2];
  *(_DWORD *)this->var55 = *(_DWORD *)a2;
  this->var55[2] = v2;
  return this;
}

__n128 CAWBAFE::SetMixLightingCCM(CAWBAFE *this, __n128 *a2)
{
  __n128 result;

  result = *a2;
  this->var56[8] = a2[1].n128_i16[0];
  *(__n128 *)this->var56 = result;
  return result;
}

CAWBAFE *CAWBAFE::SetCCMLuxClip(CAWBAFE *this, unsigned __int16 a2)
{
  this->var62 = a2;
  return this;
}

CAWBAFE *CAWBAFE::SetTileStatsYThreshold(CAWBAFE *this, const unsigned __int16 *a2)
{
  *(_DWORD *)this->var57 = *(_DWORD *)a2;
  return this;
}

CAWBAFE *CAWBAFE::SetRatioSpace2ndGainThreshold(CAWBAFE *this, const unsigned __int16 *a2)
{
  *(_DWORD *)this->var58 = *(_DWORD *)a2;
  return this;
}

__n128 CAWBAFE::SetHistogramTrimFilterV(CAWBAFE *this, const unsigned __int16 *a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)&this->var59[5] = *(_OWORD *)(a2 + 5);
  *(__n128 *)this->var59 = result;
  return result;
}

CAWBAFE *CAWBAFE::SetHistogramTrimFilterH(CAWBAFE *this, const unsigned __int16 *a2)
{
  int v2;

  v2 = *(_DWORD *)a2;
  this->var60[2] = a2[2];
  *(_DWORD *)this->var60 = v2;
  return this;
}

__n128 CAWBAFE::SetHistogramTrimScaleProfile(CAWBAFE *this, const unsigned __int16 *a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *((_OWORD *)a2 + 1);
  v4 = *((_OWORD *)a2 + 3);
  *(_OWORD *)&this->var61[16] = *((_OWORD *)a2 + 2);
  *(_OWORD *)&this->var61[24] = v4;
  *(__n128 *)this->var61 = result;
  *(_OWORD *)&this->var61[8] = v3;
  return result;
}

void *CAWBAFE::SetSkinToWhiteLut(uint64_t a1, unsigned int a2, void *__src)
{
  *(_DWORD *)(a1 + 22432) = a2;
  return memcpy((void *)(a1 + 21232), __src, 8 * a2);
}

CAWBAFE *CAWBAFE::SetSensorClockFreq(CAWBAFE *this, unsigned int a2)
{
  this->var95 = a2;
  return this;
}

CAWBAFE *CAWBAFE::ProcessRawHistogram(CAWBAFE *this)
{
  _FE_3A_Stats_H15 *var7;
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  int v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int32x4_t v11;
  uint64_t v12;
  int64x2_t v13;
  int32x4_t v14;
  int64x2_t v15;
  int32x4_t v16;
  int32x4_t v17;
  uint32x4_t v18;
  unsigned int v19;
  unint64_t v20;

  var7 = this->var7;
  if (*((_WORD *)var7 + 170))
  {
    v2 = (unsigned int *)((char *)var7 + 16432);
    if (*((_WORD *)var7 + 164))
      v3 = *((unsigned __int16 *)var7 + 165);
    else
      v3 = 0;
    if (*((_WORD *)var7 + 8281))
      v4 = *((unsigned __int16 *)var7 + 8282);
    else
      v4 = 0;
    v5 = 0;
    v6 = *((_WORD *)var7 + 166) != 0;
    v7 = *((unsigned __int16 *)var7 + 167);
    v8 = (char *)var7 + v3;
    v9 = 3072;
    if (!v7)
      v9 = 0;
    v10 = (uint64_t)&v8[0x4000 * v6 + v4 + *v2 + v9];
    v11.i64[0] = 0x400000004;
    v11.i64[1] = 0x400000004;
    do
    {
      v12 = 0;
      v13 = 0uLL;
      v14 = (int32x4_t)xmmword_23092FA90;
      v15 = 0uLL;
      v16 = 0uLL;
      do
      {
        v17 = *(int32x4_t *)(v10 + v12);
        v16 = vaddq_s32(v17, v16);
        v18 = (uint32x4_t)vmulq_s32(v17, v14);
        v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, v18);
        v13 = (int64x2_t)vaddw_u32((uint64x2_t)v13, *(uint32x2_t *)v18.i8);
        v14 = vaddq_s32(v14, v11);
        v12 += 16;
      }
      while (v12 != 1024);
      v19 = vaddvq_s32(v16);
      LODWORD(v20) = v19;
      if (v19)
        v20 = (vaddvq_s64(vaddq_s64(v13, v15)) << 8) / (unint64_t)v19;
      v10 += 1024;
      this->var96[v5++] = v20;
    }
    while (v5 != 4);
  }
  else
  {
    *(_OWORD *)this->var96 = 0u;
  }
  return this;
}

CAWBAFE *CAWBAFE::SetFDAWBEnable(CAWBAFE *this, BOOL a2)
{
  this->var104 = a2;
  return this;
}

BOOL CAWBAFE::GetFDAWBEnable(CAWBAFE *this)
{
  return this->var104;
}

BOOL CAWBAFE::GetFlickerAWBEnable(CAWBAFE *this)
{
  return this->var128;
}

CAWBAFE *CAWBAFE::SetSpatialCCMEnable(CAWBAFE *this, BOOL a2)
{
  this->var105 = a2;
  return this;
}

CAWBAFE *CAWBAFE::SetFlickerAWBEnable(CAWBAFE *this, BOOL a2)
{
  this->var128 = a2;
  return this;
}

CAWBAFE *CAWBAFE::SetSemanticAWBEnable(CAWBAFE *this, BOOL a2)
{
  this->var139 = a2;
  return this;
}

CAWBAFE *CAWBAFE::SetFaceMaskDetectionEnable(CAWBAFE *this, char a2)
{
  *((_BYTE *)this->var112 + 3152) = a2;
  return this;
}

int32x2_t CAWBAFE::SetFDAWBVersion(int32x2_t *a1, unsigned int a2)
{
  int32x2_t result;

  result = vdup_n_s32(a2);
  a1[2650] = result;
  return result;
}

uint64_t CAWBAFE::GetFDAWBVersion(CAWBAFE *this)
{
  return this->var109;
}

float32_t CAWBAFE::GetAdaptationMatrix(CAWBAFE *this, float *a2, float *a3, float32x4_t *a4, double a5, double a6, double a7, double a8, double a9, int32x4_t a10, double a11, int32x4_t a12)
{
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  _BOOL4 v23;
  float v24;
  float v25;
  _BOOL4 v26;
  float v27;
  float v28;
  _BOOL4 v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  __int32 v35;
  __int32 v36;
  float32x4_t v37;
  float32x4_t v38;
  float32_t result;

  v12 = a2[1];
  v13 = a2[2];
  v14 = (float)((float)(v12 * 0.2664) + (float)(*a2 * 0.8951)) + (float)(v13 * -0.1614);
  v15 = (float)((float)(v12 * 1.7135) + (float)(*a2 * -0.7502)) + (float)(v13 * 0.0367);
  v16 = (float)((float)(v12 * -0.0685) + (float)(*a2 * 0.0389)) + (float)(v13 * 1.0296);
  v17 = a3[1];
  v18 = a3[2];
  v19 = (float)((float)(v17 * 0.2664) + (float)(*a3 * 0.8951)) + (float)(v18 * -0.1614);
  v20 = (float)((float)(v17 * 1.7135) + (float)(*a3 * -0.7502)) + (float)(v18 * 0.0367);
  v21 = (float)((float)(v17 * -0.0685) + (float)(*a3 * 0.0389)) + (float)(v18 * 1.0296);
  v22 = v19 / v14;
  v23 = v22 > 10.0 || v22 < 0.0;
  if (v22 < 0.0 && v22 <= 10.0)
    v24 = 0.0;
  else
    v24 = 10.0;
  if (v23)
    v22 = v24;
  v25 = v20 / v15;
  v26 = v25 > 10.0 || v25 < 0.0;
  if (v25 < 0.0 && v25 <= 10.0)
    v27 = 0.0;
  else
    v27 = 10.0;
  if (v26)
    v25 = v27;
  v28 = v21 / v16;
  v29 = v28 > 10.0 || v28 < 0.0;
  if (v28 < 0.0 && v28 <= 10.0)
    v30 = 0.0;
  else
    v30 = 10.0;
  if (v29)
    v28 = v30;
  *(float32x2_t *)a10.i8 = vmul_n_f32((float32x2_t)0x3EDD57BC3F7CAB60, v22);
  v31 = (float32x4_t)vzip1q_s32(a10, a10);
  v31.i32[2] = a10.i32[0];
  *(float32x2_t *)a12.i8 = vmul_n_f32((float32x2_t)0x3F04B33EBE169446, v25);
  v32 = (float32x4_t)vzip1q_s32(a12, a12);
  v32.i32[2] = a12.i32[0];
  v33 = vmlaq_f32(vmulq_f32(v32, (float32x4_t)xmmword_23092FC80), (float32x4_t)xmmword_23092FC90, v31);
  *(float32x2_t *)v31.f32 = vmul_n_f32((float32x2_t)0x3D49E4503E23CC8ELL, v28);
  v34 = (float32x4_t)vzip1q_s32((int32x4_t)v31, (int32x4_t)v31);
  v34.i32[2] = v31.i32[0];
  *(float *)&v35 = v22 * -0.00853;
  *(float *)&v36 = v25 * 0.04004;
  a12.i32[0] = vdup_lane_s32(*(int32x2_t *)a12.i8, 1).u32[0];
  a12.i32[1] = v36;
  a10.i32[0] = vdup_lane_s32(*(int32x2_t *)a10.i8, 1).u32[0];
  a10.i32[1] = v35;
  v37 = (float32x4_t)vzip1q_s32(a10, a10);
  v38 = vmlaq_f32(vmulq_f32((float32x4_t)vzip1q_s32(a12, a12), (float32x4_t)xmmword_23092FCB0), (float32x4_t)xmmword_23092FCC0, v37);
  v37.i32[0] = vdup_lane_s32(*(int32x2_t *)v31.f32, 1).u32[0];
  v37.f32[1] = v28 * 0.96849;
  *a4 = vmlaq_f32(v33, (float32x4_t)xmmword_23092FCA0, v34);
  a4[1] = vmlaq_f32(v38, (float32x4_t)xmmword_23092FCD0, (float32x4_t)vzip1q_s32((int32x4_t)v37, (int32x4_t)v37));
  result = (float)((float)(*(float *)&v36 * 0.0367) + (float)(*(float *)&v35 * -0.1614))
         + (float)((float)(v28 * 0.96849) * 1.0296);
  a4[2].f32[0] = result;
  return result;
}

void CAWBAFE::GetRawRGBtoXYZCCM(CAWBAFE *this, unsigned int a2, int *a3, float a4)
{
  unsigned int var62;
  unsigned int v7;
  unsigned int v8;
  float ColorRatioXFromCCT;
  float ColorRatioYFromCCT;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CAWBAFE *v16;
  float v17;
  int v18;
  int v19;
  float v20;
  float *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  signed __int16 (*var88)[9];
  int *v30;
  CAWBAFE *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int32x4_t v37;
  double v38;
  int32x4_t v39;
  CAWBAFE *v40;
  CAWBAFE *v41;
  uint64_t v42;
  int v43;
  uint64_t i;
  uint64_t v45;
  CAWBAFE *v46;
  uint64_t j;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  float v57;
  float v58[9];
  float v59[9];
  float v60[9];
  float32x4_t v61[2];
  int v62[3];
  float v63[3];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v50 = 0.0;
  v51 = 0.0;
  v53 = 0;
  v54 = 0;
  v56 = 0;
  v55 = 0;
  var62 = this->var62;
  if (a2 >= 0x1964)
    v7 = 6500;
  else
    v7 = a2;
  if (v7 <= 0x9C4)
    v8 = 2500;
  else
    v8 = v7;
  ColorRatioXFromCCT = CAWBAFE::GetColorRatioXFromCCT(this, v8, a4);
  ColorRatioYFromCCT = CAWBAFE::GetColorRatioYFromCCT(this, v8, ColorRatioXFromCCT);
  CAWBAFE::ComputeChannelGainsfromHistWP(this, ColorRatioXFromCCT, ColorRatioYFromCCT, &v51, &v50, v11, v12, v13, v14, v15);
  v17 = 1000000.0 / (float)v8;
  v18 = 1;
  do
  {
    v19 = (unsigned __int16)v18;
    v20 = CCT2xyTable[3 * (unsigned __int16)v18++];
  }
  while (v17 > v20);
  v21 = &CCT2xyTable[3 * v19];
  v22 = *(v21 - 3);
  v23 = v20 - v22;
  v24 = 0.0;
  v25 = 0.0;
  if (v23 != 0.0)
    v25 = (float)(v17 - v22) / v23;
  v26 = *(v21 - 2) + (float)(v25 * (float)(v21[1] - *(v21 - 2)));
  if (v23 != 0.0)
    v24 = (float)(v17 - v22) / v23;
  v27 = CCT2xyTable[3 * v19 - 1];
  v28 = v27 + (float)(v24 * (float)(CCT2xyTable[3 * v19 + 2] - v27));
  v63[0] = v26 / v28;
  v63[1] = 1.0;
  v63[2] = (float)((float)(1.0 - v26) - v28) / v28;
  var88 = this->var88;
  v30 = v62;
  CAWBAFE::InterpCCMfromBases(v16, ColorRatioXFromCCT, ColorRatioYFromCCT, (float)var62, (int (*)[3])v62, (const sTuningCurvePoint *)&defaultCCMStrengthTuningTable, var88, 1.0);
  CAWBAFE::GetAdaptationMatrix(v31, flt_23092FEA8, v63, v61, v32, v33, v34, v35, v36, v37, v38, v39);
  CAWBAFE::Multiply3by3Matrix(v40, v61[0].f32, flt_23092FEB4, v60);
  v42 = 0;
  v43 = 0;
  do
  {
    for (i = 0; i != 3; ++i)
    {
      v45 = (unsigned __int16)v43++;
      v59[v45] = (float)v30[i];
    }
    ++v42;
    v30 += 3;
  }
  while (v42 != 3);
  CAWBAFE::Multiply3by3Matrix(v41, v60, v59, v58);
  v52 = v51;
  HIDWORD(v54) = 1065353216;
  v57 = v50;
  CAWBAFE::Multiply3by3Matrix(v46, v58, &v52, v60);
  for (j = 0; j != 9; ++j)
  {
    v48 = v60[j];
    if (v48 <= 0.0)
      v49 = -0.5;
    else
      v49 = 0.5;
    a3[j] = (int)(float)(v48 + v49);
  }
}

float CAWBAFE::Multiply3by3Matrix(CAWBAFE *this, float *a2, float *a3, float *a4)
{
  float result;

  *a4 = (float)((float)(a2[1] * a3[3]) + (float)(*a2 * *a3)) + (float)(a2[2] * a3[6]);
  a4[1] = (float)((float)(a2[1] * a3[4]) + (float)(*a2 * a3[1])) + (float)(a2[2] * a3[7]);
  a4[2] = (float)((float)(a2[1] * a3[5]) + (float)(*a2 * a3[2])) + (float)(a2[2] * a3[8]);
  a4[3] = (float)((float)(a2[4] * a3[3]) + (float)(a2[3] * *a3)) + (float)(a2[5] * a3[6]);
  a4[4] = (float)((float)(a2[4] * a3[4]) + (float)(a2[3] * a3[1])) + (float)(a2[5] * a3[7]);
  a4[5] = (float)((float)(a2[4] * a3[5]) + (float)(a2[3] * a3[2])) + (float)(a2[5] * a3[8]);
  a4[6] = (float)((float)(a2[7] * a3[3]) + (float)(a2[6] * *a3)) + (float)(a2[8] * a3[6]);
  a4[7] = (float)((float)(a2[7] * a3[4]) + (float)(a2[6] * a3[1])) + (float)(a2[8] * a3[7]);
  result = (float)((float)(a2[7] * a3[5]) + (float)(a2[6] * a3[2])) + (float)(a2[8] * a3[8]);
  a4[8] = result;
  return result;
}

CAWBAFE *CAWBAFE::GetCalibrationGain(CAWBAFE *this, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, unsigned __int16 *a7)
{
  *a2 = 2500;
  *a3 = 5000;
  *a4 = this->var89.var0;
  *a5 = this->var89.var1;
  *a6 = this->var89.var2;
  *a7 = this->var89.var3;
  return this;
}

void *CAWBAFE::SetLowLightWPBlending(CAWBAFE *this, unsigned int a2, const unsigned int *__src, const unsigned int *a4)
{
  size_t v6;

  this->var99.var0 = a2;
  v6 = 4 * a2;
  memcpy(this->var99.var1, __src, v6);
  return memcpy(this->var99.var2, a4, v6);
}

void *CAWBAFE::SetCCMStrengthTuningTable(CAWBAFE *this, unsigned int a2, const unsigned int *__src, const unsigned int *a4)
{
  size_t v6;

  this->var100.var0 = a2;
  v6 = 4 * a2;
  memcpy(this->var100.var1, __src, v6);
  return memcpy(this->var100.var2, a4, v6);
}

float CAWBAFE::calculateWeightFromTuningTableFloat(float a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;

  v3 = *(_DWORD *)a3 - 1;
  if (v3 >= 2 && *(float *)(a3 + 8) <= a1)
  {
    v6 = 1;
    do
      v5 = ++v6;
    while (v3 > v6 && *(float *)(a3 + 4 * v6 + 4) <= a1);
    v4 = v6 - 1;
  }
  else
  {
    v4 = 0;
    v5 = 1;
  }
  v8 = *(float *)(a3 + 4);
  v7 = a3 + 4;
  v9 = v8;
  if (*(float *)(v7 + 4 * v3) < a1)
    a1 = *(float *)(v7 + 4 * v3);
  if (v9 > a1)
    a1 = v9;
  v10 = (float)(a1 - *(float *)(v7 + 4 * v4)) / (float)(*(float *)(v7 + 4 * v5) - *(float *)(v7 + 4 * v4));
  return (float)(*(float *)(v7 + 32 + 4 * v5) * v10) + (float)((float)(1.0 - v10) * *(float *)(v7 + 32 + 4 * v4));
}

void CAWBAFE::calculateRGBFromCCT(CAWBAFE *this, unsigned int a2, unsigned __int16 *a3)
{
  float v6;
  float v7;
  float v8;
  int *v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  _BOOL4 v27;
  float v28;
  float v29;
  float v30;
  _BOOL4 v31;
  float v32;
  _BOOL4 v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  sTuningCurvePoint v41;

  memset(v41.var1, 0, sizeof(v41.var1));
  memset(&v41.var2[2], 0, 24);
  v41.var0 = 3;
  *(_QWORD *)&v41.var1[1] = 0x500000002;
  *(_QWORD *)v41.var2 = 0x8000000100;
  v6 = CAWBAFE::calculateWeightFromTuningTable(this, &v41, this->var73);
  v7 = (float)((float)(1.0 - v6) * (float)a2) + (float)(v6 * 4000.0);
  this->var37 = (int)v7;
  if (v7 >= 1.0)
    v8 = 1000000.0 / v7;
  else
    v8 = 1000000.0;
  if (v8 > 500.0)
    v8 = 500.0;
  if (v8 < 100.0)
    v8 = 100.0;
  v9 = &dword_23092E770;
  v10 = 1;
  do
  {
    v11 = *(float *)v9;
    v9 += 3;
    v12 = v11;
    if (v10 > 0xC)
      break;
    ++v10;
  }
  while (v8 > v12);
  v13 = *((float *)v9 - 6);
  v14 = v12 - v13;
  v15 = 0.0;
  v16 = 0.0;
  if (v14 != 0.0)
    v16 = (float)(v8 - v13) / v14;
  v17 = *((float *)v9 - 5) + (float)(v16 * (float)(*((float *)v9 - 2) - *((float *)v9 - 5)));
  v18 = *((float *)v9 - 4) + (float)(v16 * (float)(*((float *)v9 - 1) - *((float *)v9 - 4)));
  v19 = v17 / v18;
  v20 = (float)((float)(1.0 - v17) - v18) / v18;
  v21 = (float)((float)(3.241 * v19) + -1.5374) + (float)(-0.49861 * v20);
  v22 = (float)((float)(-0.96924 * v19) + 1.876) + (float)(0.041555 * v20);
  v23 = (float)((float)(0.05563 * v19) + -0.20398) + (float)(1.057 * v20);
  if (v22 <= v23)
    v24 = v23;
  else
    v24 = v22;
  if (v21 <= v24)
    v25 = v24;
  else
    v25 = v21;
  v26 = v21 / v25;
  v27 = (float)(v21 / v25) < 0.0 || (float)(v21 / v25) > 1.0;
  if ((float)(v21 / v25) > 1.0 && (float)(v21 / v25) >= 0.0)
    v28 = 1.0;
  else
    v28 = 0.0;
  if (v27)
    v29 = v28;
  else
    v29 = v26;
  v30 = v22 / v25;
  v31 = (float)(v22 / v25) < 0.0 || (float)(v22 / v25) > 1.0;
  if ((float)(v22 / v25) > 1.0 && (float)(v22 / v25) >= 0.0)
    v32 = 1.0;
  else
    v32 = 0.0;
  if (v31)
    v30 = v32;
  v33 = (float)(v23 / v25) < 0.0 || (float)(v23 / v25) > 1.0;
  if ((float)(v23 / v25) > 1.0 && (float)(v23 / v25) >= 0.0)
    v15 = 1.0;
  if (v33)
    v34 = v15;
  else
    v34 = v23 / v25;
  v35 = powf(v30, 0.4545);
  v36 = powf(v29, 0.4545);
  v37 = powf(v34, 0.4545);
  v38 = (float)(v36 * 65536.0) + 0.5;
  if (v38 > 65535.0)
    v38 = 65535.0;
  *a3 = (int)v38;
  v39 = (float)(v35 * 65536.0) + 0.5;
  if (v39 > 65535.0)
    v39 = 65535.0;
  a3[1] = (int)v39;
  v40 = (float)(v37 * 65536.0) + 0.5;
  if (v40 > 65535.0)
    v40 = 65535.0;
  a3[2] = (int)v40;
}

uint64_t CAWBAFE::calculateWPNoEnoughStats(CAWBAFE *this, signed int a2, unsigned int a3, unsigned int a4, double a5, double a6, double a7, double a8)
{
  uint64_t var67;
  uint64_t v13;
  float32x2_t v14;
  signed __int16 *v15;
  int32x2_t v16;
  uint64_t v17;
  unsigned int *v18;
  float32x2_t v19;
  unsigned int *v20;
  int32x2_t v21;
  uint64_t v22;
  uint64_t v23;
  signed __int16 *v24;
  float32x2_t v25;
  int v26;
  signed int v27;
  uint64_t v28;
  float v29;
  signed __int16 *v30;
  int32x2_t v31;
  int32x2_t v32;
  unsigned __int16 v33;
  uint64_t v34;
  unsigned __int16 v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  float v44;
  unsigned __int16 v45;
  uint64_t v46;
  float v47;
  CAWBAFE *v48;
  uint64_t v49;
  unsigned __int16 v50;
  uint64_t v51;
  float v52;
  _BOOL4 v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  CAWBAFE *v63;
  float v64;
  float var40;
  float var41;
  CAWBAFE *v67;
  float v68;
  CAWBAFE *v69;
  float v70;
  float v71;
  float v72;
  uint64_t result;
  float v74;
  float v75;
  float v76;
  float v77;
  CAWBAFE *v78;
  CAWBAFE *v79;
  float v80;
  float v81;
  float v82;
  float v83;
  CAWBAFE *v84;
  float v85;
  float v86;
  float v87;
  sTuningCurvePoint v88;
  sTuningCurvePoint v89;
  sTuningCurvePoint v90;
  sTuningCurvePoint v91;
  sTuningCurvePoint v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v95 = 0;
  v94 = 0u;
  v93 = 0u;
  memset(&v92.var1[2], 0, 56);
  *(_QWORD *)&v92.var0 = 0x8000000002;
  v92.var1[1] = 256;
  v92.var2[0] = 256;
  memset(&v91.var1[2], 0, 56);
  *(_QWORD *)&v91.var0 = 0x10000000002;
  v91.var1[1] = 512;
  v91.var2[1] = 128;
  memset(v90.var1, 0, 64);
  v90.var0 = 3;
  *(_QWORD *)&v90.var1[1] = 0x80000000400;
  *(_QWORD *)v90.var2 = 0x8000000080;
  v90.var2[2] = 51;
  memset(&v89.var2[2], 0, 24);
  memset(&v89.var1[2], 0, 24);
  *(_QWORD *)&v89.var0 = 0x3C00000002;
  v89.var1[1] = 20000;
  *(_QWORD *)v89.var2 = 0xFF000000FFLL;
  memset(v88.var1, 0, sizeof(v88.var1));
  memset(&v88.var2[2], 0, 24);
  v88.var0 = 3;
  *(_QWORD *)&v88.var1[1] = 0x80000000200;
  *(_QWORD *)v88.var2 = 0xFF000000FFLL;
  var67 = this->var67;
  if (a2 >= *(__int16 *)&this->var65[5][2 * var67 + 1022])
  {
    v17 = 0;
    v18 = &this->var78[5 * this->var67 + 3];
    v19 = (float32x2_t)vdup_n_s32(0x3B800000u);
    do
    {
      v20 = &v18[v17];
      v21.i32[0] = *(__int16 *)v20;
      v21.i32[1] = *((__int16 *)v20 + 1);
      *((float32x2_t *)&v93 + v17++) = vmul_f32(vcvt_f32_s32(v21), v19);
    }
    while (v17 != 5);
  }
  else if (a2 >= this->var66[0])
  {
    if (var67 >= 2)
    {
      v22 = 0;
      v23 = (var67 - 1);
      v24 = this->var84[5];
      v25 = (float32x2_t)vdup_n_s32(0x3B800000u);
      do
      {
        v26 = this->var66[v22++];
        if (a2 >= v26)
        {
          v27 = this->var66[v22];
          if (a2 < v27)
          {
            v28 = 0;
            *(float *)&a8 = (float)(a2 - v26) / (float)(v27 - v26);
            v29 = 1.0 - *(float *)&a8;
            a8 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a8, 0));
            v30 = v24;
            do
            {
              v31.i32[0] = *v30;
              v31.i32[1] = v30[1];
              v32.i32[0] = *(v30 - 10);
              v32.i32[1] = *(v30 - 9);
              *(float32x2_t *)((char *)&v93 + v28) = vmul_f32(vmla_f32(vmul_n_f32(vcvt_f32_s32(v32), v29), vcvt_f32_s32(v31), *(float32x2_t *)&a8), v25);
              v30 += 2;
              v28 += 8;
            }
            while (v28 != 40);
          }
        }
        v24 += 10;
      }
      while (v22 != v23);
    }
  }
  else
  {
    v13 = 0;
    v14 = (float32x2_t)vdup_n_s32(0x3B800000u);
    do
    {
      v15 = this->var84[v13];
      v16.i32[0] = *v15;
      v16.i32[1] = v15[1];
      *((float32x2_t *)&v93 + v13++) = vmul_f32(vcvt_f32_s32(v16), v14);
    }
    while (v13 != 5);
  }
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = v95;
  v42 = v93;
  v43 = *((float *)&v93 + 2);
  v44 = *(float *)&v94;
  v45 = a2 - 61;
  do
  {
    v46 = 0;
    v47 = (float)v33;
    if (*((float *)&v93 + 1) > v47)
      v48 = (CAWBAFE *)(*((float *)&v95 + 1) < v47);
    else
      v48 = 0;
    v50 = v35;
    do
    {
      v51 = this->var53[v50];
      if (v45 <= 0x4DE2u)
      {
        v52 = (float)(unsigned __int16)v46;
        v53 = (float)((float)(*(float *)&v93 + *(float *)&v95) * 0.5) > v52;
        v49 = (2 * v34) | 1;
        v54 = (v48 & v53) == 0;
        v55 = (v48 & v53) != 0 ? this->var53[v50] : 0;
        v40 += v55;
        v56 = v54 ? 0 : v49 * v51;
        v37 += v56;
        if (v45 <= 0x152u && (float)((float)(*((float *)&v93 + 2) + *(float *)&v94) * 0.5) < v52)
        {
          v36 += v49 * v51;
          v39 += v51;
        }
      }
      v38 += v51;
      ++v50;
      ++v46;
    }
    while (v46 != 32);
    v35 += 32;
    ++v33;
    ++v34;
  }
  while (v34 != 32);
  *(_QWORD *)&this->var49 = 0;
  if (!v38)
    return 0;
  v57 = (float)((float)((float)v38 * 0.6) + 0.5);
  if (v40 <= v57)
  {
    result = 0;
  }
  else
  {
    v58 = (float)v40;
    v59 = (float)(v37 >> 1) / (float)v40;
    if (*((float *)&v41 + 1) > v59)
      v59 = *((float *)&v41 + 1);
    if (*((float *)&v42 + 1) >= v59)
      v60 = v59;
    else
      v60 = *((float *)&v42 + 1);
    v61 = *(float *)&v41
        + (float)((float)((float)(*(float *)&v42 - *(float *)&v41) / (float)(*((float *)&v42 + 1) - *((float *)&v41 + 1)))
                * (float)(v60 - *((float *)&v41 + 1)));
    v86 = v43;
    v87 = v44;
    v62 = CAWBAFE::calculateWeightFromTuningTable(v48, &v92, (float)((float)((float)((float)a3 / (float)a4) * 256.0) + 0.5));
    v64 = v62
        * CAWBAFE::calculateWeightFromTuningTable(v63, &v91, (float)((float)((float)(v58 / (float)a4) * 256.0) + 0.5));
    var40 = this->var40;
    var41 = this->var41;
    v68 = CAWBAFE::calculateWeightFromTuningTable(v67, &v90, (float)((float)(fabsf(sqrtf((float)((float)(v60 - var41) * (float)(v60 - var41))+ (float)((float)(v61 - var40) * (float)(v61 - var40))))* 256.0)+ 0.5));
    v70 = CAWBAFE::calculateWeightFromTuningTable(v69, &v89, a2);
    v43 = v86;
    v44 = v87;
    v71 = (float)(v64 * v68) * v70;
    v72 = (float)(var40 * (float)(1.0 - v71)) + (float)(v61 * v71);
    if (var40 < v61)
      v72 = var40;
    this->var49 = v72;
    this->var50 = (float)(var41 * (float)(1.0 - v71)) + (float)(v60 * v71);
    result = 1;
  }
  if (v39 > v57)
  {
    v74 = (float)(v36 >> 1) / (float)v39;
    if (*((float *)&v94 + 1) > v74)
      v74 = *((float *)&v94 + 1);
    if (*((float *)&v93 + 3) >= v74)
      v75 = v74;
    else
      v75 = *((float *)&v93 + 3);
    v76 = v44
        + (float)((float)((float)(v43 - v44) / (float)(*((float *)&v93 + 3) - *((float *)&v94 + 1)))
                * (float)(v75 - *((float *)&v94 + 1)));
    v77 = CAWBAFE::calculateWeightFromTuningTable((CAWBAFE *)result, &v92, (float)((float)((float)((float)a3 / (float)a4) * 256.0) + 0.5));
    v80 = v77
        * CAWBAFE::calculateWeightFromTuningTable(v78, &v91, (float)((float)((float)((float)v39 / (float)a4) * 256.0) + 0.5));
    v81 = this->var40;
    v82 = (float)((float)(v76 - v81) * 256.0) + 0.5;
    if (v76 <= v81)
      v82 = (float)((float)(v81 - v76) * 256.0) + 0.5;
    v83 = CAWBAFE::calculateWeightFromTuningTable(v79, &v88, v82);
    v85 = (float)(v80 * v83) * CAWBAFE::calculateWeightFromTuningTable(v84, &stru_23092FED8, a2);
    this->var49 = (float)(v81 * (float)(1.0 - v85)) + (float)(v76 * v85);
    this->var50 = (float)((float)(1.0 - v85) * this->var41) + (float)(v75 * v85);
    return 2;
  }
  return result;
}

CAWBAFE *CAWBAFE::SetUnlockWPEnable(CAWBAFE *this, BOOL a2)
{
  this->var48 = a2;
  return this;
}

uint64_t CAWBAFE::SetFlashProjectionConfig(uint64_t result, unsigned __int8 *a2)
{
  uint64_t i;
  float *v3;
  uint64_t v4;
  float32x4_t v5;
  float32x4_t *v6;
  int *v7;
  uint64_t v8;
  float *v9;
  int v10;
  uint64_t v11;
  __int16 *v12;
  float *v13;
  float v14;
  uint64_t v15;
  __int16 *v16;
  float *v17;
  float v18;
  uint64_t v19;
  __int16 *v20;
  float *v21;
  float v22;
  uint64_t v23;
  __int16 *v24;
  float *v25;
  float v26;

  for (i = 0; i != 36; i += 4)
  {
    v3 = (float *)(result + 60 + i);
    *(v3 - 9) = (float)*(int *)&a2[i] * 0.000015259;
    *v3 = (float)*(int *)&a2[i + 36] * 0.000015259;
  }
  v4 = 0;
  v5 = (float32x4_t)vdupq_n_s32(0x37800000u);
  do
  {
    v6 = (float32x4_t *)(result + v4);
    v6[6] = vmulq_f32(vcvtq_f32_s32(*(int32x4_t *)&a2[v4 + 72]), v5);
    v6[7].f32[0] = (float)*(int *)&a2[v4 + 88] * 0.000015259;
    v4 += 20;
  }
  while (v4 != 120);
  v7 = (int *)(a2 + 212);
  v8 = -24;
  do
  {
    v9 = (float *)(result + 336 + v8);
    *(v9 - 24) = (float)*(v7 - 5) * 0.000015259;
    *(v9 - 18) = (float)*(v7 - 4) * 0.000015259;
    *(v9 - 12) = (float)*(v7 - 3) * 0.000015259;
    *(v9 - 6) = (float)*(v7 - 2) * 0.000015259;
    *v9 = (float)*(v7 - 1) * 0.000015259;
    v10 = *v7;
    v7 += 6;
    v9[6] = (float)v10 * 0.000015259;
    v8 += 4;
  }
  while (v8);
  if (a2[336] >= 3u)
    v11 = 3;
  else
    v11 = a2[336];
  if ((_DWORD)v11)
  {
    v12 = (__int16 *)(a2 + 338);
    v13 = (float *)(result + 364);
    do
    {
      v14 = (float)v12[6] * 0.000061035;
      *(v13 - 1) = (float)*v12 * 0.000061035;
      *v13 = v14;
      ++v12;
      v13 += 2;
      --v11;
    }
    while (v11);
  }
  if (a2[362] >= 3u)
    v15 = 3;
  else
    v15 = a2[362];
  if ((_DWORD)v15)
  {
    v16 = (__int16 *)(a2 + 364);
    v17 = (float *)(result + 388);
    do
    {
      v18 = (float)v16[6] * 0.000061035;
      *(v17 - 1) = (float)*v16 * 0.000061035;
      *v17 = v18;
      ++v16;
      v17 += 2;
      --v15;
    }
    while (v15);
  }
  if (a2[388] >= 3u)
    v19 = 3;
  else
    v19 = a2[388];
  if ((_DWORD)v19)
  {
    v20 = (__int16 *)(a2 + 390);
    v21 = (float *)(result + 412);
    do
    {
      v22 = (float)v20[6] * 0.000061035;
      *(v21 - 1) = (float)*v20 * 0.000061035;
      *v21 = v22;
      ++v20;
      v21 += 2;
      --v19;
    }
    while (v19);
  }
  if (a2[414] >= 3u)
    v23 = 3;
  else
    v23 = a2[414];
  if ((_DWORD)v23)
  {
    v24 = (__int16 *)(a2 + 416);
    v25 = (float *)(result + 436);
    do
    {
      v26 = (float)v24[6] * 0.000061035;
      *(v25 - 1) = (float)*v24 * 0.000061035;
      *v25 = v26;
      ++v24;
      v25 += 2;
      --v23;
    }
    while (v23);
  }
  *(_BYTE *)(result + 456) = a2[440] != 0;
  *(_BYTE *)(result + 457) = a2[441] != 0;
  return result;
}

uint64_t CAWBAFE::SetRgbColorspace(uint64_t result, int a2)
{
  *(_DWORD *)(result + 22752) = a2;
  return result;
}

float CAWBAFE::EstimateCurrentSceneLuxLevel(CAWBAFE *this)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int *v16;
  _BYTE *v17;
  unsigned int *v18;
  unsigned int v19;
  _DWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  float result;
  _DWORD __base[1024];
  uint64_t v44;

  v1 = (_QWORD *)MEMORY[0x24BDAC7A8](this);
  v2 = v1;
  v44 = *MEMORY[0x24BDAC8D0];
  v3 = v1 + 2583;
  v4 = v1[61];
  v5 = *(unsigned __int16 *)(v4 + 352);
  v6 = *(unsigned __int16 *)(v4 + 354);
  if (*(_WORD *)(v4 + 354))
  {
    v7 = 0;
    v8 = 0;
    v9 = v1[63];
    v10 = (unint64_t)*(unsigned int *)(v9 + 48) << 8;
    v11 = v1[2842];
    v12 = *(unsigned __int16 *)(v11 + 3640);
    v13 = (((((*(_DWORD *)(v11 + 2708) * *(_DWORD *)(v11 + 92)) >> 8) * *(unsigned __int16 *)(v11 + 1442)) >> 8)
         * *(unsigned __int16 *)(v11 + 254)) >> 8;
    v14 = (unint64_t)*(unsigned __int16 *)(v11 + 3638) >> 4;
    v15 = v12 >> 5;
    v16 = (unsigned int *)(v9 + 32);
    v17 = __base;
    do
    {
      if (v5)
      {
        v7 += v5;
        v18 = v16;
        v19 = v5;
        v20 = v17;
        do
        {
          v21 = v18[4];
          if ((_DWORD)v21)
          {
            v22 = (*(v18 - 8) * (unint64_t)v13) >> 13;
            if (v22 >= v10)
              v22 = v10;
            v23 = (*(v18 - 4) * (unint64_t)v13) >> 13;
            if (v23 >= v10)
              v23 = v10;
            v24 = (*v18 * (unint64_t)v13) >> 13;
            if (v24 >= v10)
              v24 = v10;
            v21 = ((v22 * v14 + 2560 * v23 + v24 * v15) >> 10) / v21;
          }
          v18 += 16;
          *v20++ = v21;
          --v19;
        }
        while (v19);
      }
      ++v8;
      v17 += 4 * v5;
      v16 += 16 * (unint64_t)v5;
    }
    while (v8 != v6);
  }
  heapsort(__base, (unsigned __int16)(v6 * v5), 4uLL, (int (__cdecl *)(const void *, const void *))CompareTileStats);
  v25 = 0;
  v26 = 0;
  v27 = (unsigned __int16)(v6 * v5) + 2;
  if ((_WORD)v6 * (_WORD)v5)
    v27 = (unsigned __int16)(v6 * v5) - 1;
  if (v5 >= v6)
    v28 = v6;
  else
    v28 = v5;
  v29 = __base[v27 >> 2];
  v30 = __base[75 * ((unsigned __int16)(v6 * v5) - 1) / 100];
  v31 = (unsigned __int16)(v6 * v5) - v28;
  if (v31 <= 1)
    v31 = 1;
  do
    v26 += __base[v25++];
  while (v31 != v25);
  v32 = v26 / v31;
  *((_DWORD *)v3 + 94) = v32;
  v33 = v2[2842];
  v34 = (_QWORD *)(v33 + 1548);
  v35 = *(unsigned __int16 *)(v33 + 306);
  v36 = (v32 << BYTE4(*(_QWORD *)(v33 + 1548))) * *(_QWORD *)(v33 + 1548);
  v37 = *((_DWORD *)v3 + 88);
  v38 = 100000 * *(_QWORD *)(v33 + 1432);
  v39 = ((v37 * (unint64_t)v36 / v38) * v35) >> 8;
  if (v39 >= 0xFFFF)
    v39 = 0xFFFF;
  *(float *)v3 = (float)v39;
  *((_WORD *)v3 + 2) = (int)(float)((float)v39 + 0.5);
  v40 = ((v37 * (unint64_t)((v29 << BYTE4(*v34)) * *v34) / v38) * v35) >> 8;
  if (v40 >= 0xFFFF)
    v40 = 0xFFFF;
  *((_WORD *)v3 + 3) = (int)(float)((float)v40 + 0.5);
  v41 = ((v37 * (unint64_t)((v30 << BYTE4(*v34)) * *v34) / v38) * v35) >> 8;
  if (v41 >= 0xFFFF)
    v41 = 0xFFFF;
  result = (float)v41 + 0.5;
  *((_WORD *)v3 + 4) = (int)result;
  return result;
}

uint64_t CompareTileStats(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

uint64_t CAWBAFE::GetSceneBrightnessForLux(CAWBAFE *this)
{
  return this->var98;
}

float CAWBAFE::SetCCMDesatForSkinEnable(CAWBAFE *this, BOOL a2, unsigned int a3)
{
  float result;

  this->var103 = a2;
  result = (float)a3 * 0.0039062;
  this->var102 = result;
  return result;
}

void *CAWBAFE::SetWPStableZoneControl(CAWBAFE *this, BOOL a2, const sWPStableZoneControlTable *__src)
{
  this->var116 = a2;
  return memcpy(&this->var117, __src, sizeof(this->var117));
}

uint64_t CAWBAFE::SetFlickerDetectionResult(uint64_t result, int a2, double a3, double a4, float a5, uint64_t a6, int a7, unsigned int a8, unsigned int a9, unsigned int a10, int a11)
{
  float v11;
  _BYTE *v12;
  float *v13;
  unsigned int v14;

  *(float *)(result + 22772) = (float)a7 * 0.000015259;
  *(_DWORD *)(result + 22760) = a2;
  v11 = 0.0;
  if (a2 == 1)
    v11 = -0.5;
  if (a2 == 3)
    v11 = 1.0;
  v12 = *(_BYTE **)(result + 480);
  v13 = (float *)&v12[4 * v12[2]];
  v13[37] = v11;
  if (a8 >= 0x10000)
    v14 = 0x10000;
  else
    v14 = a8;
  v13[5] = (float)v14;
  v13[21] = (float)a9 * 0.0039062;
  v13[13] = *(float *)(result + 22772);
  v13[29] = (float)a10;
  v13[45] = a5;
  v12[1] = a11 != 0;
  *v12 = 1;
  return result;
}

uint64_t CAWBAFE::SetSemanticConfidenceMap(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 21224) + 3056) = a2;
  return result;
}

float32x2_t CAWBAFE::blendGrayWorldforLowCCTProjection(CAWBAFE *this, sAWBInternalParams *a2)
{
  float var24;
  float v5;
  float v6;
  CAWBAFE *v7;
  float v8;
  CAWBAFE *v9;
  float v10;
  float32x2_t result;
  sTuningCurvePoint v12;
  sTuningCurvePoint v13;

  memset(&v13.var2[3], 0, 20);
  *(_OWORD *)&v13.var0 = xmmword_23092FCE0;
  memset(&v13.var1[3], 0, 24);
  *(_QWORD *)&v13.var2[1] = 0x10000000080;
  *(_OWORD *)&v12.var0 = xmmword_23092FCF0;
  memset(&v12.var1[3], 0, 52);
  *(_QWORD *)v12.var2 = 0x8000000100;
  var24 = a2->var24;
  v5 = a2->var23 - var24;
  if (v5 < 0.0)
    v5 = 0.0;
  v6 = CAWBAFE::calculateWeightFromTuningTable(this, &v13, (float)((float)(v5 * 256.0) + 0.5));
  v8 = CAWBAFE::calculateWeightFromTuningTable(v7, &v12, (float)((float)(var24 * 256.0) + 0.5));
  v10 = CAWBAFE::calculateWeightFromTuningTable(v9, &stru_23092FF1C, a2->var0);
  result = vmla_n_f32(vmul_n_f32(*(float32x2_t *)&a2->var20, (float)(v6 * v8) * v10), *(float32x2_t *)&this->var38, 1.0 - (float)((float)(v6 * v8) * v10));
  *(float32x2_t *)&this->var38 = result;
  return result;
}

float CAWBAFE::EstimateCurrentSceneLuxLevels(CAWBAFE *this, sMetaData *a2)
{
  this->var125 = a2;
  return CAWBAFE::EstimateCurrentSceneLuxLevel(this);
}

CAWBAFE *CAWBAFE::GetCurrentSceneLuxLevels(CAWBAFE *this, unsigned __int16 *a2)
{
  *a2 = this->var73;
  a2[1] = this->var74;
  a2[2] = this->var75;
  return this;
}

float CAWBAFE::updatePhotometerDetectionOutput(CAWBAFE *this, sAEMetaData *a2)
{
  float result;
  sPhotometerAWBMetadata *var6;
  float v4;

  result = a2->luxLevel;
  if (result > 65535.0)
    result = 65535.0;
  if (this->var128)
  {
    var6 = this->var6;
    if (*(_BYTE *)var6)
    {
      v4 = sqrtf(result) + 0.5;
      *((_WORD *)var6 + *((unsigned __int8 *)var6 + 2) + 2) = (int)v4;
      CAWBAFEPhotometerAssistPenrose::updatePhotometerDetectionOutput(this->var5, (float32x2_t *)var6, v4);
    }
  }
  return result;
}

CAWBAFE *CAWBAFE::GetSensorCalGain(CAWBAFE *this, sCSensorCalGain *a2)
{
  *a2 = this->var89;
  return this;
}

void CAWBAFE::ComputeDigitalFlashAWBV1(CAWBAFE *this, const unsigned int *a2, sAWBInternalParams *a3)
{
  float v6;
  float v7;
  float v8;
  float ColorRatioXFromCCT;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  float var14;
  float var15;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  const unsigned int *v27;
  unint64_t v28;
  unsigned int v29;
  float v30;
  unsigned int v32;
  float v33;
  CAWBAFE *v34;
  CAWBAFE *v35;
  float v36;
  float v37;
  double v38;
  double v39;
  double v40;
  float v41;
  CAWBAFE *CCTFromColorRatio;
  int v43;
  float v44;
  CAWBAFE *v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v51;
  float v52;
  float v53;
  float v54;
  sTuningCurvePoint v55;
  float v56;
  float v57;

  v6 = (float)this->var84[29][1] * 0.0039062;
  v7 = (float)this->var84[4][1];
  v8 = v7 * 0.0039062;
  ColorRatioXFromCCT = CAWBAFE::GetColorRatioXFromCCT(this, 0x4E20u, v7);
  v10 = CAWBAFE::GetColorRatioXFromCCT(this, 0x1F40u, ColorRatioXFromCCT);
  v11 = CAWBAFE::GetColorRatioXFromCCT(this, 0x898u, v10);
  v12 = CAWBAFE::GetColorRatioXFromCCT(this, 0xDACu, v11);
  v13 = 0;
  v14 = (int)(float)(ColorRatioXFromCCT + 0.5);
  v15 = (int)(float)(v11 + 0.5);
  this->var46.var1 = 1;
  v16 = (int)(float)(v8 + 0.5);
  var14 = a3->var14;
  this->var46.var2 = var14;
  var15 = a3->var15;
  this->var46.var3 = var15;
  v19 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  v23 = 0.0;
  do
  {
    v24 = 0;
    v25 = v13 >= v14;
    v26 = v13 > v14;
    if (v13 > v15)
      v25 = 0;
    if (v13 >= (int)(float)(v10 + 0.5))
      v26 = 0;
    v27 = a2;
    do
    {
      v29 = *v27;
      v27 += 32;
      v28 = v29;
      if (v29)
      {
        v30 = (float)v28;
        v20 = v20 + (float)v28;
        if (v24 > (int)(float)(v6 + 0.5) && v25)
        {
          v23 = v23 + (float)(v30 * (float)((float)(int)v13 + 0.5));
          v22 = v22 + v30;
          v19 = v19 + (float)(v30 * (float)((float)(int)v24 + 0.5));
        }
        v28 = v24 > v16;
        if ((v26 & v28) == 0)
          v30 = -0.0;
        v21 = v21 + v30;
      }
      ++v24;
    }
    while (v24 != 32);
    ++v13;
    ++a2;
  }
  while (v13 != 32);
  memset(&v55.var2[3], 0, 20);
  *(_OWORD *)&v55.var0 = xmmword_23092FD00;
  memset(&v55.var1[3], 0, 24);
  *(_QWORD *)&v55.var2[1] = 0xFF00000080;
  if (v20 < 1.0 || !a3->var2)
  {
    a3->var14 = v12;
    a3->var15 = v6;
    v46 = 0.0;
    var15 = v6;
LABEL_26:
    v6 = 0.0;
    goto LABEL_27;
  }
  v52 = v10;
  v32 = (float)((float)((float)(v21 / v20) * 256.0) + 0.5);
  v33 = CAWBAFE::calculateWeightFromTuningTable((CAWBAFE *)v28, &v55, (float)((float)((float)(v22 / v20) * 256.0) + 0.5));
  v36 = CAWBAFE::calculateWeightFromTuningTable(v34, &v55, v32);
  if (v33 <= 0.0)
  {
    v49 = v36;
    v46 = 0.0;
    if (v36 > 0.0 && var14 < v52)
    {
      v51 = CAWBAFE::calculateWeightFromTuningTable(v35, &stru_23092FF60, (float)((float)((float)(v52 - var14) * 256.0) + 0.5));
      v12 = (float)(v52 * (float)(v49 * v51)) + (float)(var14 * (float)(1.0 - (float)(v49 * v51)));
      a3->var14 = v12;
    }
    else
    {
      v12 = var14;
    }
    goto LABEL_26;
  }
  v23 = v23 / v22;
  v19 = v19 / v22;
  v56 = v19;
  v57 = v23;
  v37 = CAWBAFE::ComputeProjection(this, 0, &v54, &v53, &v57, &v56, (uint64_t)this->var84, &this->var83);
  CCTFromColorRatio = (CAWBAFE *)CAWBAFE::GetCCTFromColorRatio(this, v37, this->var86, v38, v39, v40, v41);
  v43 = (int)CCTFromColorRatio;
  v44 = CAWBAFE::calculateWeightFromTuningTable(CCTFromColorRatio, &stru_23092FFA4, CCTFromColorRatio);
  v46 = CAWBAFE::GetColorRatioXFromCCT(this, v43 - (float)((float)(v44 * 4096.0) + 0.5), (float)(v44 * 4096.0) + 0.5);
  var15 = a3->var15;
  if (var15 > v6)
  {
    v47 = CAWBAFE::calculateWeightFromTuningTable(v45, &stru_23092FF60, (float)((float)((float)(var15 - v6) * 256.0) + 0.5));
    var15 = (float)(v6 * (float)(v33 * v47)) + (float)(var15 * (float)(1.0 - (float)(v33 * v47)));
    a3->var15 = var15;
  }
  v12 = a3->var14;
  if (v12 < v46)
  {
    v48 = CAWBAFE::calculateWeightFromTuningTable(v45, &stru_23092FF60, (float)((float)((float)(v46 - v12) * 256.0) + 0.5));
    v12 = (float)(v46 * (float)(v33 * v48)) + (float)(v12 * (float)(1.0 - (float)(v33 * v48)));
    a3->var14 = v12;
  }
LABEL_27:
  this->var46.var4 = v23;
  this->var46.var5 = v19;
  this->var46.var6 = v46;
  this->var46.var7 = v6;
  this->var46.var8 = v12;
  this->var46.var9 = var15;
}

void CAWBAFE::ComputeDigitalFlashAWBV2(CAWBAFE *this, const unsigned int *a2, sAWBInternalParams *a3)
{
  uint64_t v5;
  float v6;
  float var14;
  float var15;
  float v9;
  int *v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  const unsigned int *v15;
  int *v16;
  unsigned int v17;
  unsigned int v18;
  float v19;
  float v20;
  float v21;
  float v22;
  unsigned int v23;
  float v24;
  CAWBAFE *v25;
  CAWBAFE *v26;
  double v27;
  double v28;
  double v29;
  float v30;
  float v31;
  float v32;
  CAWBAFE *CCTFromColorRatio;
  int v34;
  float v35;
  float ColorRatioXFromCCT;
  float v37;
  const sTuningCurvePoint *v38;
  float v39;

  v5 = 0;
  this->var46.var1 = 1;
  v6 = (float)this->var84[29][1];
  var14 = a3->var14;
  var15 = a3->var15;
  this->var46.var2 = var14;
  this->var46.var3 = var15;
  v9 = 0.0;
  v10 = &digitalFlashSkyDetectionParams;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  do
  {
    v14 = 0;
    v15 = a2;
    v16 = v10;
    do
    {
      v18 = *v15;
      v15 += 32;
      v17 = v18;
      if (v18)
      {
        v19 = (float)v17;
        v13 = v13 + (float)v17;
        if (*v16)
        {
          v11 = v11 + (float)(v19 * (float)((float)(int)v5 + 0.5));
          v9 = v9 + (float)(v19 * (float)((float)(int)v14 + 0.5));
          v12 = v12 + v19;
        }
      }
      ++v14;
      v16 += 32;
    }
    while (v14 != 32);
    ++v5;
    ++v10;
    ++a2;
  }
  while (v5 != 32);
  v20 = 0.0;
  if (v12 > 0.0)
  {
    v21 = v6 * 0.0039062;
    v9 = v9 / v12;
    v22 = v12 / v13;
    if ((float)(v12 / v13) < 0.0)
      v22 = 0.0;
    v23 = (float)((float)(v22 * 256.0) + 0.5);
    v24 = CAWBAFE::calculateWeightFromTuningTable(this, &stru_23092F894, v23);
    v39 = CAWBAFE::calculateWeightFromTuningTable(v25, &stru_23092F8D8, v23);
    v31 = 1.0;
    if (v9 < v21)
      v31 = CAWBAFE::calculateWeightFromTuningTable(v26, &stru_23092F91C, (float)((float)((float)(v21 - v9) * 256.0) + 0.5));
    v11 = v11 / v12;
    if (v24 > 0.0)
    {
      v32 = v31;
      CCTFromColorRatio = (CAWBAFE *)CAWBAFE::GetCCTFromColorRatio(this, v11, this->var86, v27, v28, v29, v30);
      v34 = (int)CCTFromColorRatio;
      v35 = CAWBAFE::calculateWeightFromTuningTable(CCTFromColorRatio, &stru_23092F960, CCTFromColorRatio);
      ColorRatioXFromCCT = CAWBAFE::GetColorRatioXFromCCT(this, v34 - (float)(v35 + 0.5), v35 + 0.5);
      v20 = ColorRatioXFromCCT;
      if (var14 < ColorRatioXFromCCT)
      {
        var14 = var14 + (float)((float)(v24 * (float)(ColorRatioXFromCCT - var14)) * v32);
        a3->var14 = var14;
      }
    }
    if (var15 > v21)
    {
      v37 = 0.0;
      if ((float)(var15 - v21) >= 0.0)
        v37 = var15 - v21;
      if (a3->var3)
        v38 = (const sTuningCurvePoint *)&unk_23092F9A4;
      else
        v38 = (const sTuningCurvePoint *)&unk_23092F9E8;
      var15 = var15
            + (float)((float)-(float)((float)(var15 - v21) * v39)
                    * CAWBAFE::calculateWeightFromTuningTable(v26, v38, (float)((float)(v37 * 256.0) + 0.5)));
      a3->var15 = var15;
    }
  }
  this->var46.var4 = v11;
  this->var46.var5 = v9;
  this->var46.var6 = v20;
  this->var46.var7 = 0.0;
  this->var46.var8 = var14;
  this->var46.var9 = var15;
}

uint64_t CAWBAFE::SetDigitalFlashBehaviorMode(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 23880) = a2;
  return CAWBAFEFDAssist::SetDigitalFlashBehaviorMode(*(_QWORD *)(a1 + 464), a2);
}

void CAWBAFE::CalculateSkinWeightForSTF(CAWBAFE *this, char a2, float *a3, float *a4, float *a5)
{
  float v6;

  v6 = 0.0;
  if ((a2 & 1) == 0)
  {
    *a5 = 1.0;
    v6 = CAWBAFE::calculateWeightFromTuningTableFloat(fminf(fmaxf(*a4 - *a3, 0.0), 2.0), (uint64_t)this, (uint64_t)&defaultSkinWeightTuningTable);
  }
  *a5 = v6;
}

void CAWBAFE::CalculateSkyWhitePoint(CAWBAFE *this, float a2, float *a3, float *a4)
{
  float ColorRatioXFromCCT;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  ColorRatioXFromCCT = CAWBAFE::GetColorRatioXFromCCT(this, (float)(1000000.0 / (float)((float)(1000000.0 / a2) + 20.0)), 1000000.0 / (float)((float)(1000000.0 / a2) + 20.0));
  LODWORD(v8) = 1.0;
  CAWBAFE::ComputeChannelGainsfromHistWP(this, ColorRatioXFromCCT, a3[1] + 1.0, a4, a4 + 2, v8, v9, v10, v11, v12);
  a4[1] = 1.0;
}

float CAWBAFE::GetDaylightScore(CAWBAFE *this, float *a2)
{
  float result;

  result = *((float *)this->var6 + 55);
  *a2 = result;
  return result;
}

float CAWBAFE::GetFaceAssistedAWBResultsForMatchProvidedSkinGains(CAWBAFE *this, float *a2, float *a3, int *a4, int *a5, float *a6, float *a7)
{
  fdAWBMetaData *var112;
  float result;

  CAWBAFEFDAssist::GetWhitePointCenter(this->var4, a2);
  CAWBAFEFDAssist::GetSkinPointCenter(this->var4, a3);
  var112 = this->var112;
  *a4 = *((unsigned __int16 *)var112 + 799);
  *a5 = *((_DWORD *)var112 + 401);
  *a6 = *((float *)var112 + 776);
  result = *((float *)var112 + 778);
  *a7 = result;
  return result;
}

void CAWBAFE::SetFaceAssistedAWBResultsForMatchProvidedSkinGains(CAWBAFE *this, float *a2, float *a3, __int16 a4, int a5, float a6, float a7)
{
  fdAWBMetaData *var112;

  CAWBAFEFDAssist::SetMatchWhitePointCenter(this->var4, a2);
  CAWBAFEFDAssist::SetMatchSkinPointCenter(this->var4, a3);
  var112 = this->var112;
  *((_WORD *)var112 + 800) = a4;
  *((_DWORD *)var112 + 402) = a5;
  *((float *)var112 + 777) = a6;
  *((float *)var112 + 779) = a7;
  *((_BYTE *)var112 + 1596) = 1;
}

CAWBAFE *CAWBAFE::SetMasterCamera(CAWBAFE *this, unsigned __int8 a2)
{
  this->var120 = a2;
  return this;
}

CAWBAFE *CAWBAFE::SetBypassProcessFlag(CAWBAFE *this, BOOL a2)
{
  this->var119 = a2;
  return this;
}

void CAWBAFEH14::~CAWBAFEH14(CAWBAFE *this)
{
  this->var0 = (void **)&off_24FEC6090;
  if (this->var147 >= 0x32u)
    puts("MSG: AWB RESET: CAWBAFEH14::~CAWBAFEH14");
  CAWBAFE::~CAWBAFE(this);
}

{
  CAWBAFEH14::~CAWBAFEH14(this);
  JUMPOUT(0x2348BC8E0);
}

void CAWBAFEH14::Process(CAWBAFEH14 *this, sMetaData *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  unsigned __int8 *v11;
  float luxLevel;
  unsigned int v13;
  sMetaData *v14;
  float32x2_t *v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  float v37;
  double v38;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  BOOL v51;
  unint64_t v52;

  v11 = (unsigned __int8 *)this + 20652;
  *((_QWORD *)this + 2842) = a2;
  *((_DWORD *)this + 5682) = *(_DWORD *)&a2->zoom.ispInputWidth;
  *((_BYTE *)this + 22715) = a2->channel;
  *((_BYTE *)this + 5028) = a2->ae.UBMisc.awbReflow.bGenerateReflowAWB;
  *(float *)&a3 = a2->ae.luxLevel;
  LODWORD(a4) = 1199570688;
  if (*(float *)&a3 <= 65535.0)
    luxLevel = a2->ae.luxLevel;
  else
    luxLevel = 65535.0;
  v13 = (unsigned __int16)(*((_WORD *)this + 330) + 1);
  if (v13 >= *((unsigned __int16 *)this + 332))
    v13 = *((unsigned __int16 *)this + 332);
  *((_WORD *)this + 330) = v13;
  if (v13 <= *((unsigned __int16 *)this + 331) || !*((_BYTE *)this + 774))
  {
    v14 = a2;
    if (*((_BYTE *)this + 22756))
    {
      v15 = (float32x2_t *)*((_QWORD *)this + 60);
      v14 = a2;
      if (v15->i8[0])
      {
        v16 = sqrtf(luxLevel) + 0.5;
        v15->i16[v15->u8[2] + 2] = (int)v16;
        CAWBAFEPhotometerAssistPenrose::updatePhotometerDetectionOutput(*((CAWBAFEPhotometerAssistPenrose **)this + 59), v15, v16);
        v14 = (sMetaData *)*((_QWORD *)this + 2842);
      }
    }
    if (v14->awb.bBypassConvergenceFr && !*((_BYTE *)this + 666))
    {
      LOWORD(a3) = *((_WORD *)this + 3 * (*((_DWORD *)v11 + 58) - 1) + 10418);
      LODWORD(a4) = 998244352;
      *(float *)&a3 = (float)LODWORD(a3) * 0.0039062;
      v17 = *((float *)this + 223);
      if (v17 > *(float *)&a3)
      {
        LOWORD(a3) = *((_WORD *)v11 + 92);
        LODWORD(a4) = 998244352;
        if (v17 < (float)((float)LODWORD(a3) * 0.0039062))
        {
          *((_WORD *)this + 330) = *((_WORD *)this + 332);
          *((_BYTE *)this + 666) = 1;
          *((float *)this + 206) = v17;
          v18 = *((float *)this + 224);
          *((float *)this + 207) = v18;
          memcpy((char *)this + 5092, (char *)this + 932, 0x1000uLL);
          *((float *)this + 204) = v17;
          *((float *)this + 205) = v18;
          CAWBAFE::ComputeChannelGainsfromHistWP((CAWBAFE *)this, v17, v18, (float *)this + 201, (float *)this + 202, v19, v20, v21, v22, v23);
          LODWORD(v26) = 1166016512;
          LODWORD(v27) = 0.5;
          v28 = (float)((float)(*((float *)this + 201) * 4096.0) + 0.5);
          if (v28 >= 0xFFFF)
            v28 = 0xFFFF;
          if (v28 <= 0x800)
            v28 = 2048;
          *((_DWORD *)this + 168) = v28;
          v29 = (float)((float)(*((float *)this + 202) * 4096.0) + 0.5);
          if (v29 >= 0xFFFF)
            v29 = 0xFFFF;
          if (v29 <= 0x800)
            v29 = 2048;
          *((_DWORD *)this + 170) = v29;
          *((_DWORD *)this + 169) = 4096;
          *((_DWORD *)this + 167) = CAWBAFE::GetCCTFromColorRatio((CAWBAFE *)this, *((float *)this + 206), (const unsigned __int16 (*)[3])(v11 + 184), v26, v27, v24, v25);
        }
      }
    }
    v30 = *((unsigned __int16 *)this + 330);
    v31 = *((unsigned __int16 *)this + 331);
    if (v30 <= v31)
    {
      *(_QWORD *)(v11 + 12) = 0x100013F800000;
      *((_WORD *)v11 + 10) = 1;
      *(_QWORD *)&a3 = 0xB400000100;
      *((_QWORD *)v11 + 48) = 0xB400000100;
      v32 = *((_QWORD *)this + 2842);
      if (*(_BYTE *)(v32 + 4674) || *(_BYTE *)(v32 + 4675) || v11[3224])
      {
        *((_WORD *)this + 330) = v31;
      }
      else
      {
        v47 = (a2->ae.gainAnal.v16
             * (unint64_t)a2->ae.exposureTime
             * a2->ae.gainDigi.v16
             * a2->ae.gainDigiSensor.v16) >> 16;
        if (v30 == 1)
        {
          *((_QWORD *)this + 2840) = v47;
          if (v11[2104])
          {
            v48 = *((_QWORD *)this + 60);
            if (*(_BYTE *)(v48 + 1))
            {
              if (*(_DWORD *)(v48 + 216) == 1)
              {
                *((_WORD *)this + 330) = v31;
                a3 = fmin(*(float *)(v48 + 304) * 4.0, 65535.0);
                *(float *)&a3 = a3;
                *((_DWORD *)v11 + 3) = LODWORD(a3);
                *(_QWORD *)&a4 = COERCE_UNSIGNED_INT(0.5) | 0x40EFFFE000000000;
                *(float *)&a3 = *(float *)&a3 + 0.5;
                *((_WORD *)v11 + 8) = (int)*(float *)&a3;
                *((_WORD *)v11 + 9) = (int)*(float *)&a3;
                *((_WORD *)v11 + 10) = (int)*(float *)&a3;
              }
            }
          }
        }
        else
        {
          v49 = *((_QWORD *)this + 2840);
          v50 = v47 - v49;
          v51 = v49 > v47;
          v52 = v49 - v47;
          if (!v51)
            v52 = v50;
          if (v52)
          {
            *((_WORD *)this + 330) = v31;
            *(float *)&a3 = (float)*((__int16 *)this + *v11 + 10317);
            if (luxLevel > *(float *)&a3)
            {
              *(float *)&a3 = luxLevel + 0.5;
              *((_WORD *)v11 + 8) = (int)(float)(luxLevel + 0.5);
              *((float *)v11 + 3) = luxLevel;
              *(_DWORD *)(v11 + 18) = *(_DWORD *)&a2->ae.luxLevelLow;
            }
          }
        }
      }
    }
    else
    {
      if (*((unsigned __int16 *)v11 + 1) > 1u)
      {
        CAWBAFE::EstimateCurrentSceneLuxLevel((CAWBAFE *)this);
      }
      else
      {
        *((_WORD *)v11 + 8) = (int)(float)(luxLevel + 0.5);
        *((float *)v11 + 3) = luxLevel;
        *(_DWORD *)(v11 + 18) = *(_DWORD *)&a2->ae.luxLevelLow;
      }
      LODWORD(a4) = 0.5;
      *(float *)&a3 = (float)((float)(a2->ae.gainDigiSensor.v16 * a2->ae.gainDigi.v16) * 0.0039062) + 0.5;
      *((_DWORD *)v11 + 96) = *(float *)&a3;
      *((_DWORD *)v11 + 97) = a2->ae.sceneBrightnessForLux;
      v32 = *((_QWORD *)this + 2842);
    }
    v33 = *(_BYTE *)(v32 + 104) && *(_DWORD *)(v32 + 144) == 10 && *((_WORD *)v11 + 1) == 3 && !*(_BYTE *)(v32 + 213);
    v11[24] = v33;
    if (!v11[2061])
    {
      switch(*((_DWORD *)v11 + 12))
      {
        case 1:
          *((_BYTE *)this + 773) = CAWBAFEH14::ComputeAWBGains(this);
          *((_WORD *)this + 394) = *((_DWORD *)this + 168);
          *((_WORD *)this + 395) = *((_DWORD *)this + 169);
          *((_WORD *)this + 396) = *((_DWORD *)this + 170);
          break;
        case 2:
          CAWBAFE::ProcessSchemeGrayworld((CAWBAFE *)this, a3, a4, a5, *(float *)&a6, a7);
          break;
        case 3:
          CAWBAFE::ProcessSchemeTapToWB((CAWBAFE *)this, a3, a4, a5, a6, a7, a8, a9);
          break;
        case 4:
          *(float *)&a3 = luxLevel + 0.5;
          *((_WORD *)v11 + 8) = (int)(float)(luxLevel + 0.5);
          CAWBAFE::ProcessSchemeManualWB((CAWBAFE *)this, a3, a4, a5, a6, a7);
          break;
        default:
          break;
      }
    }
    CAWBAFE::InterpCCMfromBases((CAWBAFE *)this, *((float *)this + 206), *((float *)this + 207), *((float *)v11 + 3), (int (*)[3])((int *)this + 58), (const sTuningCurvePoint *)((char *)this + 21112), (const __int16 (*)[9])((char *)this + 20888), *((float *)v11 + 132));
    CAWBAFE::ProcessRawHistogram((CAWBAFE *)this);
    CAWBAFE::ComputeAWBGainsGrayworld((CAWBAFE *)this, 128, 128, v34, v35, v36, v37, v38);
    v39 = *((_DWORD *)this + 167);
    *((_WORD *)this + 406) = v39;
    CAWBAFE::calculateRGBFromCCT((CAWBAFE *)this, v39, (unsigned __int16 *)this + 11372);
    CAWBAFE::calculateSkinOnlyWBGain((CAWBAFE *)this, *((unsigned __int16 *)v11 + 8), v40, v41, v42, v43, v44, v45, v46);
    *((_BYTE *)this + 666) = 0;
    v11[2061] = 0;
    *((_WORD *)v11 + 11) = *((_WORD *)v11 + 8);
  }
}

uint64_t CAWBAFEH14::ComputeAWBGains(CAWBAFEH14 *this)
{
  CAWBAFE *v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  CAWBAFE *v5;
  signed __int16 *var66;
  BOOL *p_var45;
  unsigned int v8;
  float v9;
  BOOL v10;
  float v11;
  float v12;
  float v13;
  unsigned int v14;
  double v15;
  double v16;
  uint16x4_t v17;
  signed int v18;
  float v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint8x16_t v23;
  CAWBAFE *v24;
  int v25;
  signed int v26;
  unint64_t v27;
  uint8x16_t v28;
  int8x16_t v29;
  uint16x8_t v30;
  uint16x8_t v31;
  uint16x8_t v32;
  uint16x8_t v33;
  int8x16_t v34;
  BOOL v35;
  unsigned __int8 *var64;
  unsigned __int8 (*var65)[1024];
  unint64_t v38;
  float v39;
  signed __int16 (*var84)[2];
  float v41;
  uint16x4_t v42;
  unint64_t v43;
  uint16x4_t v44;
  char *v45;
  uint8x16_t v46;
  uint8x16_t v47;
  int8x16_t v48;
  uint16x8_t v49;
  uint16x8_t v50;
  uint16x8_t v51;
  uint16x8_t v52;
  int8x16_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  BOOL v57;
  BOOL v58;
  int v59;
  float32x2_t v60;
  float v61;
  float *var6;
  char *v63;
  signed int v64;
  int var0;
  float v66;
  float v67;
  float var23;
  float v69;
  BOOL v70;
  float v71;
  float v72;
  float v73;
  float v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  unsigned int CCTFromColorRatio;
  float v82;
  unsigned int v83;
  unsigned int v84;
  float var38;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float var40;
  float v104;
  float v105;
  float v106;
  BOOL v107;
  float v108;
  float v109;
  float var41;
  float v111;
  BOOL v112;
  float v113;
  float v114;
  float var39;
  double v116;
  float v117;
  double v118;
  double v119;
  unsigned int v120;
  unsigned int v121;
  uint64_t result;
  float v123;
  sTuningCurvePoint v124;
  sAWBInternalParams v125;
  _BYTE v126[4096];
  __int16 v127[8];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135;

  v1 = (CAWBAFE *)MEMORY[0x24BDAC7A8](this);
  v4 = v2;
  v5 = v1;
  v135 = *MEMORY[0x24BDAC8D0];
  var66 = v1->var66;
  p_var45 = &v1->var45;
  LOWORD(v8) = v1->var80;
  v9 = 7680.0 / (float)v8;
  v10 = v9 < 0.25;
  if (v9 >= 0.25)
    v11 = v9;
  else
    v11 = 0.25;
  v12 = v9 * 0.125;
  if (v10)
    v12 = 0.03125;
  if (v11 <= 2.0)
    v13 = v12;
  else
    v13 = 0.25;
  CAWBAFEH14::ComputeAWBChromaHistogram(v1, v2, v3);
  v14 = CAWBAFE::ComputeAmbientLuxLevel(v5, v4);
  v18 = v14;
  if (v5->var16 < v5->var18 || (unsigned __int16)var66[7] > 1u || *p_var45)
    v5->var44.var0 = v14;
  else
    v18 = CAWBAFEH14::updateLuxLevelFromSceneChangeDetection(v5, &v5->var44, v14, v15, v16, *(float *)v17.i32);
  v19 = *((float *)v5->var6 + 55);
  if (v18 < *var66 || v5->var16 <= v5->var17)
  {
    var64 = v5->var64;
    var65 = v5->var65;
LABEL_27:
    memcpy(var64, var65, 0x400uLL);
    goto LABEL_28;
  }
  v20 = *((unsigned __int8 *)var66 + 12);
  if (v18 >= *(__int16 *)&v5->var65[5][2 * v20 + 1022])
  {
    var64 = v5->var64;
    var65 = (unsigned __int8 (*)[1024])&v5->var64[1024 * v20];
    goto LABEL_27;
  }
  if (v20 >= 2)
  {
    v21 = 0;
    v22 = 0;
    v23.i64[0] = 0x101010101010101;
    v23.i64[1] = 0x101010101010101;
    v24 = v5;
    do
    {
      v25 = v5->var66[v22];
      if (v18 >= v25)
      {
        v26 = v5->var66[v21 + 1];
        if (v18 < v26)
        {
          v27 = 0;
          LODWORD(v16) = ((v18 - v25) << 12) / (v26 - v25);
          do
          {
            v28 = *(uint8x16_t *)&v24->var65[1][v27];
            v29 = *(int8x16_t *)&v24->var65[0][v27];
            v30 = vmovl_u8(*(uint8x8_t *)v28.i8);
            v31 = vmovl_high_u8(v28);
            v32 = vmovl_u8(*(uint8x8_t *)v29.i8);
            v33 = vmovl_high_u8((uint8x16_t)v29);
            v17.i32[0] = 4096 - LODWORD(v16);
            v34 = vuzp1q_s8((int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32((int32x4_t)vmlal_lane_u16(vmull_lane_u16(*(uint16x4_t *)v32.i8, v17, 0), *(uint16x4_t *)v30.i8, *(uint16x4_t *)&v16, 0), 0xCuLL), (int32x4_t)vmlal_high_lane_u16(vmull_high_lane_u16(v32, v17, 0), v30, *(uint16x4_t *)&v16, 0), 0xCuLL), (int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32((int32x4_t)vmlal_lane_u16(vmull_lane_u16(*(uint16x4_t *)v33.i8, v17, 0), *(uint16x4_t *)v31.i8,
                                                *(uint16x4_t *)&v16,
                                                0),
                                   0xCuLL),
                                 (int32x4_t)vmlal_high_lane_u16(vmull_high_lane_u16(v33, v17, 0), v31, *(uint16x4_t *)&v16, 0), 0xCuLL));
            *(int8x16_t *)&v5->var64[v27] = vbslq_s8(vceqzq_s8(v29), v34, (int8x16_t)vmaxq_u8((uint8x16_t)v34, v23));
            v35 = v27 >= 0x3F0;
            v27 += 16;
          }
          while (!v35);
          LODWORD(v20) = *((unsigned __int8 *)var66 + 12);
        }
      }
      v21 = (unsigned __int16)++v22;
      v24 = (CAWBAFE *)((char *)v24 + 1024);
    }
    while ((int)v20 - 1 > (unsigned __int16)v22);
  }
LABEL_28:
  if (*((_BYTE *)var66 + 2116) && v19 > 0.0 && (unsigned __int16)var66[7] <= 1u)
  {
    v38 = 0;
    v39 = 1.0 - v19;
    var84 = v5->var84;
    do
    {
      v127[v38 / 2] = llroundf((float)(v19 * (float)var84[v38 / 4 + 516][0]) + (float)((float)var84[v38 / 4][0] * v39));
      v127[v38 / 2 + 1] = llroundf((float)(v19 * (float)var84[v38 / 4 + 516][1]) + (float)((float)var84[v38 / 4][1] * v39));
      v38 += 4;
    }
    while (v38 != 120);
    if (v18 >= var66[2] && v18 < *(__int16 *)&v5->var65[5][2 * *((unsigned __int8 *)var66 + 12) + 1020])
    {
      v125.var19 = 0.0;
      *(_OWORD *)&v125.var0 = xmmword_2309301D0;
      *(_OWORD *)&v125.var7 = unk_2309301E0;
      *(_OWORD *)&v125.var11 = xmmword_2309301F0;
      *(_OWORD *)&v125.var15 = unk_230930200;
      *(_OWORD *)v126 = xmmword_230930214;
      *(_OWORD *)&v126[16] = unk_230930224;
      *(_OWORD *)&v126[32] = xmmword_230930234;
      *(_OWORD *)&v126[48] = unk_230930244;
      *(_DWORD *)&v126[64] = 0;
      v41 = CAWBAFE::calculateWeightFromTuningTable(v5, (const sTuningCurvePoint *)&v125, (int)(float)((float)(v19 * 255.0) + 0.5));
      *(float *)v44.i32 = CAWBAFE::calculateWeightFromTuningTable(v5, (const sTuningCurvePoint *)v126, v18);
      v43 = 0;
      v44.i32[0] = vcvts_n_s32_f32(v41 * *(float *)v44.i32, 0xCuLL);
      v45 = (char *)v5 + 1024 * (unint64_t)*((unsigned __int8 *)var66 + 12);
      v46.i64[0] = 0x101010101010101;
      v46.i64[1] = 0x101010101010101;
      do
      {
        v47 = *(uint8x16_t *)&v45[v43 + 12448];
        v48 = *(int8x16_t *)&v45[v43 + 10400];
        v49 = vmovl_u8(*(uint8x8_t *)v47.i8);
        v50 = vmovl_high_u8(v47);
        v51 = vmovl_u8(*(uint8x8_t *)v48.i8);
        v52 = vmovl_high_u8((uint8x16_t)v48);
        v42.i32[0] = 4096 - v44.i32[0];
        v53 = vuzp1q_s8((int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32((int32x4_t)vmlal_lane_u16(vmull_lane_u16(*(uint16x4_t *)v51.i8, v42, 0), *(uint16x4_t *)v49.i8, v44, 0), 0xCuLL), (int32x4_t)vmlal_high_lane_u16(vmull_high_lane_u16(v51, v42, 0), v49, v44, 0), 0xCuLL), (int8x16_t)vrshrn_high_n_s32(vrshrn_n_s32((int32x4_t)vmlal_lane_u16(vmull_lane_u16(*(uint16x4_t *)v52.i8, v42, 0), *(uint16x4_t *)v50.i8, v44, 0), 0xCuLL), (int32x4_t)vmlal_high_lane_u16(vmull_high_lane_u16(v52, v42, 0), v50, v44, 0),
                             0xCuLL));
        *(int8x16_t *)&v5->var64[v43] = vbslq_s8(vceqzq_s8(v48), v53, (int8x16_t)vmaxq_u8((uint8x16_t)v53, v46));
        v35 = v43 >= 0x3F0;
        v43 += 16;
      }
      while (!v35);
    }
  }
  else
  {
    v54 = *(_OWORD *)&v5->var84[20][0];
    v131 = *(_OWORD *)&v5->var84[16][0];
    v132 = v54;
    v133 = *(_OWORD *)&v5->var84[24][0];
    v55 = *(_OWORD *)&v5->var84[4][0];
    *(_OWORD *)v127 = *(_OWORD *)&v5->var84[0][0];
    v128 = v55;
    v56 = *(_OWORD *)&v5->var84[12][0];
    v129 = *(_OWORD *)&v5->var84[8][0];
    v134 = *(_QWORD *)&v5->var84[28][0];
    v130 = v56;
  }
  *((float *)var66 + 803) = v19;
  *(_QWORD *)&v5->var46.var8 = 0;
  *(_OWORD *)&v5->var46.var0 = 0u;
  *(_OWORD *)&v5->var46.var4 = 0u;
  if (*p_var45)
  {
    memcpy(v126, v5->var53, sizeof(v126));
    bzero(&v125, 0x105CuLL);
    v125.var0 = v5->var44.var0;
    v125.var2 = v5->var44.var2;
    v125.var4 = 1;
    v125.var25 = v5->var44.var25;
    CAWBAFEH14::ComputeAWBGainsCore(v5, (int8x16_t *)v126, (const __int16 (*)[2])v127, &v125);
    v57 = (*((_BYTE *)var66 + 2075) == 2 || !*((_DWORD *)v5->var112 + 1)) && v5->var47 == 1;
    v58 = !v57;
    if (*((_DWORD *)var66 + 810) != 1)
    {
      v59 = *((_DWORD *)var66 + 811);
      if (v59 != 2 && v59 != 1)
        v58 = 0;
    }
    if (v125.var0 <= 9u && v58)
    {
      if (v5->var47 == 1)
        CAWBAFE::ComputeDigitalFlashAWBV2(v5, (const unsigned int *)v126, &v125);
      else
        CAWBAFE::ComputeDigitalFlashAWBV1(v5, (const unsigned int *)v126, &v125);
      memset(v124.var1, 0, sizeof(v124.var1));
      memset(&v124.var2[2], 0, 24);
      v124.var0 = 3;
      *(_QWORD *)&v124.var1[1] = 0xA00000005;
      *(_QWORD *)v124.var2 = 0xCC00000100;
      v61 = CAWBAFE::calculateWeightFromTuningTable(v5, &v124, v125.var0);
      v60 = vmla_n_f32(vmul_n_f32(*(float32x2_t *)&v5->var46.var8, v61), *(float32x2_t *)&v5->var46.var2, 1.0 - v61);
    }
    else
    {
      v60 = *(float32x2_t *)&v125.var14;
    }
    *(float32x2_t *)&v5->var42 = v60;
  }
  memcpy(v5->var44.var26, v5->var52, sizeof(v5->var44.var26));
  if (*((_BYTE *)var66 + 2116))
  {
    var6 = (float *)v5->var6;
    if (var6[55] < 0.05)
    {
      v63 = (char *)v5 + 2 * *((unsigned __int8 *)var66 + 12);
      v64 = *((__int16 *)v63 + 10317);
      if (v18 > v64)
      {
        var0 = *((__int16 *)v63 + 10319);
        if (var0 >= v5->var44.var0)
          var0 = v5->var44.var0;
        v66 = (float)var0;
        v67 = var6[58];
        if (v67 <= var6[60])
          v67 = var6[60];
        var23 = v5->var44.var23;
        v69 = fabsf(sqrtf(var23));
        v70 = var23 == -INFINITY;
        v71 = INFINITY;
        if (!v70)
          v71 = v69;
        v72 = v67 * v71;
        v73 = log2f((float)(__int16)v64 + 1.0);
        v74 = log2f(v66 + 1.0);
        v5->var44.var0 = (int)exp2f((float)(v74 * (float)(1.0 - v72)) + (float)(v73 * v72));
      }
    }
  }
  CAWBAFEH14::ComputeAWBGainsCore(v5, (int8x16_t *)v5->var52, (const __int16 (*)[2])v127, &v5->var44);
  if (v5->var16 == v5->var18 && (unsigned __int16)var66[7] <= 1u)
  {
    CCTFromColorRatio = CAWBAFE::GetCCTFromColorRatio(v5, v5->var38, v5->var86, v75, v76, v77, *(float *)&v78);
    if (CCTFromColorRatio >= 0x1964)
      v83 = 6500;
    else
      v83 = CCTFromColorRatio;
    if (v83 <= 0x9C4)
      v84 = 2500;
    else
      v84 = v83;
    var38 = v5->var38;
    v86 = var38 - CAWBAFE::GetColorRatioXFromCCT(v5, v84 + v5->var25, v82);
    if (v86 < 0.125
      || (v87 = v5->var38, v86 = v87 - CAWBAFE::GetColorRatioXFromCCT(v5, v5->var25 + v84, v86), v88 = 0.5, v86 <= 0.5))
    {
      v89 = v5->var38;
      v90 = v89 - CAWBAFE::GetColorRatioXFromCCT(v5, v5->var25 + v84, v86);
      v88 = 0.125;
      if (v90 >= 0.125)
      {
        v91 = v5->var38;
        v88 = v91 - CAWBAFE::GetColorRatioXFromCCT(v5, v5->var25 + v84, v90);
      }
    }
    if (v84 < 0xFA1)
    {
      v96 = (float)(v84 - 2500) / 1500.0;
      v93 = 1.0 - v96;
      v94 = v96 * 0.25;
      v95 = 0.5;
    }
    else
    {
      v92 = (float)(v84 - 4000) / 2500.0;
      v93 = 1.0 - v92;
      v94 = v92 * 0.125;
      v95 = 0.25;
    }
    v97 = v94 + (float)(v93 * v95);
    if (v13 >= v88)
      v98 = v88;
    else
      v98 = v13;
    if (v13 >= v97)
      v13 = v94 + (float)(v93 * v95);
    if (*((_BYTE *)var66 + 1797))
    {
      v99 = CAWBAFE::calculateWeightFromTuningTable(v5, &v5->var117.var0, v18);
      if (v88 <= v99)
        v88 = v99;
      v100 = CAWBAFE::calculateWeightFromTuningTable(v5, &v5->var117.var1, v18);
      if (v97 <= v100)
        v97 = v100;
      v101 = CAWBAFE::calculateWeightFromTuningTable(v5, &v5->var117.var2, v18);
      if (v98 >= v101)
        v98 = v101;
      v102 = CAWBAFE::calculateWeightFromTuningTable(v5, &v5->var117.var3, v18);
      if (v13 >= v102)
        v13 = v102;
    }
    var40 = v5->var40;
    v104 = v5->var38;
    *(float *)&v76 = vabds_f32(var40, v104);
    if (*(float *)&v76 <= v88)
    {
      *(float *)&v77 = v5->var39;
      *(float *)&v76 = vabds_f32(v5->var41, *(float *)&v77);
      if (*(float *)&v76 <= v97)
        return 1;
    }
    if (!*((_BYTE *)var66 + 3236))
    {
      v105 = v104 - var40;
      v106 = v98 + var40;
      v107 = v105 <= v88;
      if (v105 > v88)
        v105 = (float)(v98 + var40) - var40;
      v108 = -v88;
      if (!v107 || v105 < v108)
      {
        v109 = var40 - v98;
        if (v105 >= v108)
          v109 = v106;
        v5->var38 = v109;
      }
      var41 = v5->var41;
      *(float *)&v76 = v5->var39 - var41;
      v111 = v13 + var41;
      v112 = *(float *)&v76 <= v97;
      if (*(float *)&v76 > v97)
        *(float *)&v76 = (float)(v13 + var41) - var41;
      *(float *)&v77 = -v97;
      if (!v112 || *(float *)&v76 < *(float *)&v77)
      {
        v113 = var41 - v13;
        if (*(float *)&v76 >= *(float *)&v77)
          v113 = v111;
        v5->var39 = v113;
      }
    }
  }
  v114 = v5->var38;
  v5->var40 = v114;
  var39 = v5->var39;
  v5->var41 = var39;
  v5->var44.var16 = v114;
  v5->var44.var17 = var39;
  CAWBAFE::ComputeChannelGainsfromHistWP(v5, v114, var39, &v5->var35, &v5->var36, v76, v77, v78, v79, v80);
  LODWORD(v118) = 1166016512;
  LODWORD(v119) = 0.5;
  v120 = (float)((float)(v5->var35 * 4096.0) + 0.5);
  if (v120 >= 0xFFFF)
    v120 = 0xFFFF;
  if (v120 <= 0x800)
    v120 = 2048;
  v5->var21[0] = v120;
  v121 = (float)((float)(v5->var36 * 4096.0) + 0.5);
  if (v121 >= 0xFFFF)
    v121 = 0xFFFF;
  if (v121 <= 0x800)
    v121 = 2048;
  v5->var21[2] = v121;
  v5->var21[1] = 4096;
  v5->var20 = CAWBAFE::GetCCTFromColorRatio(v5, v5->var40, v5->var86, v118, v119, v116, v117);
  if (!*((_BYTE *)var66 + 548))
    return 0;
  CAWBAFEH14::calculateCCMDesatFactorForSkin(v5, *((float *)var66 + 136), v18, (const __int16 (*)[2])v127);
  result = 0;
  *((float *)var66 + 135) = (float)(v123 * 0.75) + (float)(*((float *)var66 + 135) * 0.25);
  return result;
}

void CAWBAFEH14::ComputeAWBGainsCore(CAWBAFE *this, int8x16_t *a2, const __int16 (*a3)[2], sAWBInternalParams *a4)
{
  float32x4_t *p_var4;
  unsigned int *p_var98;
  signed __int16 *v9;
  unsigned int *var53;
  unsigned int v11;
  int var0;
  unsigned __int8 *var64;
  unsigned __int8 *v14;
  int8x16_t *v15;
  int32x4_t v16;
  float32x4_t v17;
  unint64_t v18;
  int32x4_t v19;
  uint16x8_t v20;
  int8x16_t v21;
  float32x4_t v22;
  int8x16_t v23;
  float32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  int8x16_t v27;
  unint64_t v28;
  int32x2_t v29;
  unsigned int v30;
  int32x2_t v31;
  int32x2_t v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  float32x4_t v37;
  char *v38;
  int64x2_t v39;
  unint64_t v40;
  float v41;
  float32x4_t *v42;
  uint32x4_t *v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  uint16x8_t v47;
  float32x4_t v48;
  float32x4_t v49;
  int8x16_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  uint32x4_t v54;
  uint32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  int8x16_t v59;
  int32x2_t v61;
  int32x2_t v62;
  uint64x2_t v63;
  unsigned int *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  float v69;
  float var50;
  uint64_t v72;
  unint64_t v73;
  int64x2_t v74;
  int32x2_t v75;
  float v76;
  unint64_t v77;
  uint32x4_t *v78;
  float32x4_t *v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  uint32x4_t v83;
  uint32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  int32x2_t v87;
  int32x2_t v88;
  float *p_var38;
  float *p_var39;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const __int16 *v98;
  __int16 *v99;
  int v100;
  int v101;
  BOOL v102;
  double v103;
  float v104;
  double v105;
  double v106;
  double v107;
  double v108;
  float v109;
  signed int v110;
  float v111;
  float var38;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  fdAWBMetaData *var112;
  float v130;
  float v131;
  unsigned int v132;
  float v133;
  float v134;
  float v135;
  unsigned int v136;
  float v137;
  float v138;
  float v139;
  float v140;
  uint64_t v141;
  int v142;
  int v143;
  _WORD *v144;
  float var40;
  float var41;
  float v147;
  float v148;
  uint64x2_t v149;
  BOOL *p_var48;
  unsigned int v152;
  sTuningCurvePoint v153;
  float var39;
  uint64_t v155;
  sTuningCurvePoint v156;
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  p_var4 = (float32x4_t *)&this[1].var3.var2[0].var4;
  p_var98 = &this->var98;
  v9 = &this->var66[1];
  var53 = this->var53;
  p_var48 = &this->var48;
  v155 = 0;
  var39 = 0.0;
  a4->var3 = 0;
  v11 = ((*((unsigned __int16 *)this->var7 + 181) >> 2) * (*((unsigned __int16 *)this->var7 + 180) >> 2)) >> 6;
  if (v11 <= 0x200)
    v11 = 512;
  v152 = v11;
  var0 = a4->var0;
  var64 = this->var64;
  if (var0 >= this->var66[3])
    v14 = this->var65[3];
  else
    v14 = this->var64;
  this->var63 = (char *)v14;
  CAWBAFE::TrimHistogram(this, a2, var0);
  v15 = (int8x16_t *)&this->var53[4];
  v16 = 0uLL;
  v17 = 0uLL;
  v18 = -8;
  v19 = 0uLL;
  do
  {
    v20 = vmovl_u8(*(uint8x8_t *)&this->var64[v18 + 8]);
    v21 = v15[-1];
    v22 = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v21), vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v20.i8)));
    v23 = (int8x16_t)vceqzq_f32(v22);
    v24 = vaddq_f32(v17, (float32x4_t)vbicq_s8((int8x16_t)v22, v23));
    v25 = *v15;
    v15 += 2;
    v26 = vmulq_f32(vcvtq_f32_u32(vmovl_high_u16(v20)), vcvtq_f32_u32((uint32x4_t)v25));
    v27 = (int8x16_t)vceqzq_f32(v26);
    v19 = vsubq_s32(vsubq_s32(v19, (int32x4_t)vmvnq_s8(v23)), (int32x4_t)vmvnq_s8(v27));
    v16 = vaddq_s32(vaddq_s32((int32x4_t)vbicq_s8(v21, v23), v16), (int32x4_t)vbicq_s8(v25, v27));
    v17 = vaddq_f32(v24, (float32x4_t)vbicq_s8((int8x16_t)v26, v27));
    v18 += 8;
  }
  while (v18 < 0x3F8);
  v28 = (unint64_t)vaddv_f32(vadd_f32(*(float32x2_t *)v17.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL)));
  v29 = vadd_s32(*(int32x2_t *)v16.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL));
  v30 = vadd_s32(v29, vdup_lane_s32(v29, 1)).u32[0];
  v31 = vadd_s32(*(int32x2_t *)v19.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v19, (int8x16_t)v19, 8uLL));
  v32 = vadd_s32(v31, vdup_lane_s32(v31, 1));
  if (v32.i32[0] <= 1u)
    v33 = 1;
  else
    v33 = v32.u32[0];
  v34 = (v28 / v33) << 6;
  if (v34)
  {
    v35 = 0;
    v36 = 0;
    *(float *)v32.i32 = (float)v34;
    v37 = (float32x4_t)vdupq_lane_s32(v32, 0);
    v38 = (char *)(var53 + 4);
    v39 = 0uLL;
    do
    {
      v40 = 0;
      v41 = (double)(unsigned __int16)v35 * 2.0 + 1.0;
      v42 = p_var4 + 1;
      v43 = (uint32x4_t *)v38;
      v44 = 0uLL;
      v45 = 0uLL;
      v46 = 0uLL;
      do
      {
        v47 = vmovl_u8(*(uint8x8_t *)&var64[v40]);
        v48 = vmulq_f32(vcvtq_f32_u32(v43[-1]), vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v47.i8)));
        v49 = vminq_f32(v48, v37);
        v50 = (int8x16_t)vceqzq_f32(v48);
        v51 = vaddq_f32(v44, (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(v42[-1], v49), v50));
        v52 = vaddq_f32(v45, (float32x4_t)vbicq_s8((int8x16_t)vmulq_n_f32(v49, v41), v50));
        v53 = vaddq_f32(v46, (float32x4_t)vbicq_s8((int8x16_t)v49, v50));
        v54 = *v43;
        v43 += 2;
        v55 = v54;
        v56 = *v42;
        v42 += 2;
        v57 = vmulq_f32(vcvtq_f32_u32(vmovl_high_u16(v47)), vcvtq_f32_u32(v55));
        v58 = vminq_f32(v57, v37);
        v59 = (int8x16_t)vceqzq_f32(v57);
        v44 = vaddq_f32(v51, (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(v56, v58), v59));
        v45 = vaddq_f32(v52, (float32x4_t)vbicq_s8((int8x16_t)vmulq_n_f32(v58, v41), v59));
        v46 = vaddq_f32(v53, (float32x4_t)vbicq_s8((int8x16_t)v58, v59));
        _CF = v40 >= 0x18;
        v40 += 8;
      }
      while (!_CF);
      v61 = (int32x2_t)vadd_f32(*(float32x2_t *)v44.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v44, (int8x16_t)v44, 8uLL));
      v62 = (int32x2_t)vadd_f32(*(float32x2_t *)v45.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v45, (int8x16_t)v45, 8uLL));
      v39 = vaddq_s64(v39, (int64x2_t)vcvtq_u64_f64(vcvtq_f64_f32(vadd_f32((float32x2_t)vzip1_s32(v61, v62), (float32x2_t)vzip2_s32(v61, v62)))));
      v36 += (unint64_t)vaddv_f32(vadd_f32(*(float32x2_t *)v46.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v46, (int8x16_t)v46, 8uLL)));
      ++v35;
      var64 += 32;
      v38 += 128;
    }
    while (v35 != 32);
    v63 = vshrq_n_u64((uint64x2_t)v39, 1uLL);
    v64 = p_var98;
    if (v30 >= v152)
    {
      if (v36)
      {
        v37.f32[0] = (float)v36;
        *(float32x2_t *)&this->var38 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v63)), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v37.f32, 0));
      }
      goto LABEL_28;
    }
LABEL_22:
    if (a4->var2 && (unsigned __int16)v9[6] <= 1u && this->var16 == this->var18)
    {
      v149 = v63;
      v69 = CAWBAFE::calculateWeightFromTuningTable(this, &this->var99, *v64);
      if (v69 < 1.0 && v36)
      {
        *(float *)&v66 = (float)v36;
        *(float32x2_t *)&this->var38 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v149)), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v66, 0));
        _D0.f32[0] = (float)(v69 * this->var40)
                   + (float)((float)(1.0 - v69)
                           * CAWBAFE::ComputeProjection(this, (unsigned __int16)*v9, (float *)&v155 + 1, (float *)&v155, &this->var38, &this->var39, (uint64_t)a3, &this->var83));
        LODWORD(this->var38) = _D0.i32[0];
        var50 = (float)(v69 * this->var41) + (float)((float)(1.0 - v69) * this->var39);
      }
      else if (*p_var48
             && (LODWORD(v66) = 0.5,
                 *(float *)&v65 = (float)v30 + 0.5,
                 CAWBAFE::calculateWPNoEnoughStats(this, a4->var0, *(float *)&v65, v152, v65, v66, v67, v68)))
      {
        _D0.i32[0] = LODWORD(this->var49);
        LODWORD(this->var38) = _D0.i32[0];
        var50 = this->var50;
      }
      else
      {
        _D0.i32[0] = LODWORD(this->var40);
        LODWORD(this->var38) = _D0.i32[0];
        var50 = this->var41;
      }
      this->var39 = var50;
      a4->var3 = 1;
    }
    else
    {
      v72 = 0;
      v73 = 0;
      v74 = 0uLL;
      v75 = COERCE_INT32X2_T(1.0);
      do
      {
        v77 = -4;
        v78 = (uint32x4_t *)var53;
        v79 = p_var4;
        v80 = 0uLL;
        v81 = 0uLL;
        v82 = 0uLL;
        do
        {
          v83 = *v78++;
          v84 = v83;
          v85 = *v79++;
          v86 = vcvtq_f32_u32(v84);
          v80 = vaddq_f32(v80, vmulq_f32(v85, v86));
          v76 = (double)(unsigned __int16)v72 * 2.0 + 1.0;
          v81 = vaddq_f32(v81, vmulq_n_f32(v86, v76));
          v82 = vaddq_f32(v82, v86);
          v77 += 4;
        }
        while (v77 < 0x1C);
        v87 = (int32x2_t)vadd_f32(*(float32x2_t *)v80.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v80, (int8x16_t)v80, 8uLL));
        v88 = (int32x2_t)vadd_f32(*(float32x2_t *)v81.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v81, (int8x16_t)v81, 8uLL));
        v74 = vaddq_s64(v74, (int64x2_t)vcvtq_u64_f64(vcvtq_f64_f32(vadd_f32((float32x2_t)vzip1_s32(v87, v88), (float32x2_t)vzip2_s32(v87, v88)))));
        v73 += (unint64_t)vaddv_f32(vadd_f32(*(float32x2_t *)v82.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v82, (int8x16_t)v82, 8uLL)));
        ++v72;
        var53 += 32;
      }
      while (v72 != 32);
      if (v73)
      {
        *(float *)v75.i32 = (float)v73;
        _D0 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(vshrq_n_u64((uint64x2_t)v74, 1uLL))), (float32x2_t)vdup_lane_s32(v75, 0));
      }
      else
      {
        __asm { FMOV            V0.2S, #15.5 }
      }
      *(float32x2_t *)&this->var38 = _D0;
      var50 = _D0.f32[1];
      if (this->var16 == this->var17)
        a4->var2 = 1;
    }
    goto LABEL_43;
  }
  v64 = p_var98;
  if (v30 < v152)
  {
    v36 = 0;
    v63 = 0uLL;
    goto LABEL_22;
  }
LABEL_28:
  a4->var2 = 1;
  _D0.i32[0] = LODWORD(this->var38);
  var50 = this->var39;
LABEL_43:
  p_var38 = &this->var38;
  p_var39 = &this->var39;
  LODWORD(a4->var12) = _D0.i32[0];
  a4->var13 = var50;
  if (!a4->var3)
    goto LABEL_59;
  if (*((_BYTE *)v64 + 1716))
  {
    v94 = a4->var0;
    if (*((float *)this->var6 + 55) <= 0.0
      || v94 <= v9[2]
      || (v95 = *((unsigned __int8 *)v9 + 10), v94 >= *(__int16 *)&this->var65[5][2 * v95 + 1020]))
    {
      v102 = 0;
    }
    else
    {
      LOWORD(v96) = 0;
      memset(&v156, 0, 20);
      if (v95 >= 5)
      {
        v97 = (v95 - 1);
        v98 = &(*a3)[41];
        v96 = v97 - 3;
        v99 = v9 + 3;
        while (1)
        {
          v100 = *(v99 - 1);
          if (v94 >= v100)
          {
            v101 = *v99;
            if (v94 < v101)
              break;
          }
          v98 += 10;
          ++v99;
          if (!--v96)
            goto LABEL_130;
        }
        v141 = 0;
        v142 = (__int16)(((v94 - v100) << 12) / (v101 - v100));
        v143 = 4096 - v142;
        do
        {
          v144 = (_WORD *)((char *)&v156 + v141);
          *v144 = (v142 * *(v98 - 1) + v143 * *(v98 - 11)) >> 12;
          v144[1] = (v142 * *v98 + v143 * *(v98 - 10)) >> 12;
          v141 += 4;
          v98 += 2;
        }
        while (v141 != 20);
        LOWORD(v96) = v156.var0;
      }
      var40 = this->var40;
      if (var40 < (float)((float)(__int16)v96 * 0.0039062))
        goto LABEL_135;
      var41 = this->var41;
      if (var41 > (float)((float)SHIWORD(v156.var0) * 0.0039062))
        goto LABEL_135;
LABEL_130:
      v147 = (float)SLOWORD(v156.var1[0]) * 0.0039062;
      v148 = (float)SLOWORD(v156.var1[1]);
      if (v147 <= (float)(v148 * 0.0039062))
        v147 = v148 * 0.0039062;
      if (var40 <= v147)
        v102 = var41 < (float)((float)SHIWORD(v156.var1[2]) * 0.0039062);
      else
LABEL_135:
        v102 = 1;
    }
  }
  else
  {
    v102 = 0;
    v94 = a4->var0;
  }
  if (v94 >= *(__int16 *)&this->var65[5][2 * *((unsigned __int8 *)v9 + 10) + 1020] || v102 || a4->var4)
  {
LABEL_59:
    *(float *)&v103 = CAWBAFE::calcMixLightingScore(this);
    if ((unsigned __int16)v9[6] <= 1u
      && this->var16 >= this->var18
      && !a4->var4
      && !*((_BYTE *)v64 + 2836))
    {
      v104 = 0.5;
      *(float *)&v103 = (float)(*(float *)&v103 + a4->var6) * 0.5;
    }
    a4->var6 = *(float *)&v103;
    if (*(float *)&v103 > 0.0)
      *(float *)&v103 = CAWBAFE::blendGrayWorldforMixLighting(this, *(float *)&v103);
    v110 = a4->var0;
    if (v110 <= *(__int16 *)&this->var65[5][2 * *((unsigned __int8 *)v9 + 10) + 1022] && !a4->var3 && v30)
    {
      v111 = (float)CAWBAFE::ComputePriorCCMResidualTileGains(this, v152, v30, (const unsigned int *)a2, a4, v103, v104, v105, v106, v107, v108, v109)/ (float)((float)a4->var25 + 1.0);
      if (v111 > 1.0)
        v111 = 1.0;
      a4->var24 = v111;
      v110 = a4->var0;
    }
    var38 = this->var38;
    var39 = this->var39;
    v113 = CAWBAFE::ComputeProjection(this, v110, (float *)&v155 + 1, (float *)&v155, &this->var38, &var39, (uint64_t)a3, (int *)(v9 + 33));
    if (*(_DWORD *)(v9 + 33) == 2
      && a4->var0 < *(__int16 *)&this->var65[5][2 * *((unsigned __int8 *)v9 + 10) + 1018]
      && a4->var20 > *p_var38)
    {
      CAWBAFE::blendGrayWorldforLowCCTProjection(this, a4);
      v114 = CAWBAFE::ComputeProjection(this, a4->var0, (float *)&v155 + 1, (float *)&v155, &this->var38, &this->var39, (uint64_t)a3, (int *)(v9 + 33));
      *(_OWORD *)&v156.var0 = xmmword_2309300AC;
      *(_OWORD *)&v156.var1[3] = unk_2309300BC;
      *(_OWORD *)&v156.var1[7] = xmmword_2309300CC;
      *(_OWORD *)&v156.var2[3] = unk_2309300DC;
      v156.var2[7] = 0;
      v115 = this->var38 - v114;
      if (v115 >= 0.0)
        v116 = v115 + 0.5;
      else
        v116 = 0.5;
      v117 = CAWBAFE::calculateWeightFromTuningTable(this, &v156, v116);
      v118 = *(float *)&v155;
      v119 = (float)((float)(1.0 - v117) * *(float *)&v155) + (float)(this->var38 * v117);
      v120 = a4->var23 / ((float)(a4->var23 + a4->var24) + 0.0001);
      v121 = (float)(v120 + -0.4) / 0.6;
      if (v121 < 0.0)
        v121 = 0.0;
      v122 = powf(v121, 0.125);
      v113 = (float)(v118 * (float)(1.0 - v122)) + (float)(v119 * v122);
    }
    else
    {
      *p_var39 = var39;
    }
    if (!a4->var3 && (unsigned __int16)v9[6] <= 1u)
    {
      v123 = CAWBAFE::postWPCalcTinting(this, (unsigned int *)a2, a4->var0, a4->var6);
      v124 = a4->var24 + -0.5;
      if (v124 >= 0.0)
        v125 = 1.0 - v124;
      else
        v125 = 1.0;
      v126 = v123 * v125;
      if (this->var16 >= this->var18 && !a4->var4 && !*((_BYTE *)v64 + 2836))
        v126 = (float)(v126 + a4->var7) * 0.5;
      a4->var7 = v126;
      if (v113 <= *p_var38)
      {
        v127 = *p_var38 - v126;
        if (v113 >= v127)
          v113 = v127;
      }
      else
      {
        v113 = v113 - v126;
      }
    }
    v128 = *((float *)&v155 + 1);
    if (v113 > *((float *)&v155 + 1))
      v128 = v113;
    *p_var38 = v128;
  }
  else
  {
    var38 = 0.0;
  }
  var112 = this->var112;
  if (!*((_DWORD *)var112 + 1))
  {
    if (*((_BYTE *)v64 + 150) || a4->var0 < v9[1] || (unsigned __int16)v9[6] > 1u)
      goto LABEL_117;
    v156.var2[7] = 0;
    *(_OWORD *)&v156.var0 = xmmword_2309300F0;
    *(_OWORD *)&v156.var1[3] = unk_230930100;
    *(_OWORD *)&v156.var1[7] = xmmword_230930110;
    *(_OWORD *)&v156.var2[3] = unk_230930120;
    memset(v153.var1, 0, 64);
    v153.var0 = 3;
    *(_QWORD *)&v153.var1[1] = 0xA00000002;
    *(_QWORD *)&v153.var2[1] = 0x8000000040;
    if (*((_DWORD *)var112 + 401) > 1u)
    {
      v130 = *((float *)var112 + 770);
      if (v130 <= *(float *)&v155)
      {
        v132 = 0;
      }
      else
      {
        if (v130 <= *p_var38)
          v131 = 0.5;
        else
          v131 = (float)(v130 - *p_var38) + 0.5;
        v132 = v131;
      }
      v133 = CAWBAFE::calculateWeightFromTuningTable(this, &v153, v132);
      v134 = (float)(a4->var8 + (float)(v133 * CAWBAFE::calculateWeightFromTuningTable(this, &v156, a4->var0))) * 0.5;
      a4->var8 = v134;
      var112 = this->var112;
      this->var38 = (float)(v134 * *((float *)var112 + 770)) + (float)(this->var38 * (float)(1.0 - v134));
      v135 = this->var39;
      if (v135 < *((float *)var112 + 773))
        *p_var39 = (float)(v134 * *((float *)var112 + 771)) + (float)(v135 * (float)(1.0 - v134));
    }
    else
    {
      a4->var8 = 0.0;
    }
    if (!*((_DWORD *)var112 + 1))
    {
LABEL_117:
      if (*((_BYTE *)v64 + 151) && a4->var0 >= v9[2] && (unsigned __int16)v9[6] <= 1u)
      {
        v156.var2[7] = 0;
        *(_OWORD *)&v156.var0 = xmmword_230930134;
        *(_OWORD *)&v156.var1[3] = unk_230930144;
        *(_OWORD *)&v156.var1[7] = xmmword_230930154;
        *(_OWORD *)&v156.var2[3] = unk_230930164;
        *(_OWORD *)&v153.var0 = xmmword_230930178;
        *(_OWORD *)&v153.var1[3] = unk_230930188;
        *(_OWORD *)&v153.var1[7] = xmmword_230930198;
        memset(&v153.var2[3], 0, 20);
        if (*((_DWORD *)var112 + 401) > 1u)
        {
          v136 = 0;
          v137 = *((float *)var112 + 770);
          if (v137 < *((float *)&v155 + 1) && var38 < *((float *)&v155 + 1))
          {
            if (v137 >= *p_var38)
              v138 = 0.5;
            else
              v138 = (float)(*p_var38 - v137) + 0.5;
            v136 = v138;
          }
          v139 = CAWBAFE::calculateWeightFromTuningTable(this, &v153, v136);
          v140 = (float)(a4->var9 + (float)(v139 * CAWBAFE::calculateWeightFromTuningTable(this, &v156, a4->var0)))
               * 0.5;
          a4->var9 = v140;
          this->var38 = (float)(v140 * *((float *)this->var112 + 770)) + (float)(this->var38 * (float)(1.0 - v140));
        }
        else
        {
          a4->var9 = 0.0;
        }
      }
    }
  }
  *(_QWORD *)&a4->var14 = *(_QWORD *)p_var38;
}

uint64_t CAWBAFEH14::ComputeAWBChromaHistogram(CAWBAFE *this, unsigned __int16 a2, unsigned int a3)
{
  unsigned __int16 *p_var68;
  unsigned int v7;
  uint64_t v8;
  float v9;
  float v10;
  BOOL v11;
  float v12;
  uint64_t v13;
  unsigned __int16 v14;
  unsigned int *v15;
  unsigned int *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned int v23;
  _BOOL4 v25;
  sPhotometerAWBMetadata *var6;
  uint64_t v27;
  unsigned int *v28;
  unsigned int v29;
  __int128 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  p_var68 = &this->var68;
  HIWORD(v7) = 0;
  v30 = xmmword_2309301BC;
  v31 = 4;
  if (!this->var144)
  {
    v8 = 0;
    LOWORD(v7) = this->var80;
    v9 = (float)((float)v7 / 30.0) * 0.0039062;
    v10 = fabsf(sqrtf(v9));
    v11 = v9 == -INFINITY;
    v12 = INFINITY;
    if (!v11)
      v12 = v10;
    if (v12 < 1.0)
      v12 = 1.0;
    do
    {
      *(_DWORD *)((char *)&v30 + v8) = (float)((float)(v12 * (float)*(int *)((char *)&v30 + v8)) * 10.0);
      v8 += 4;
    }
    while (v8 != 20);
  }
  v13 = 0;
  v14 = 0;
  v15 = this->var12 + 1040;
  do
  {
    v16 = &this->var53[v14];
    v17 = *(_OWORD *)&v15[v13];
    v18 = *(_OWORD *)&v15[v13 + 4];
    v19 = *(_OWORD *)&v15[v13 + 12];
    *((_OWORD *)v16 + 2) = *(_OWORD *)&v15[v13 + 8];
    *((_OWORD *)v16 + 3) = v19;
    *(_OWORD *)v16 = v17;
    *((_OWORD *)v16 + 1) = v18;
    v20 = *(_OWORD *)&v15[v13 + 16];
    v21 = *(_OWORD *)&v15[v13 + 20];
    v22 = *(_OWORD *)&v15[v13 + 28];
    *((_OWORD *)v16 + 6) = *(_OWORD *)&v15[v13 + 24];
    *((_OWORD *)v16 + 7) = v22;
    *((_OWORD *)v16 + 4) = v20;
    *((_OWORD *)v16 + 5) = v21;
    v14 += 32;
    v13 += 64;
  }
  while (v13 != 2048);
  if (this->var26)
    CAWBAFEH14::ComputeChromaHistfromTile((CAWBAFEH14 *)this);
  if (*((_BYTE *)p_var68 + 535))
    CAWBAFE::ComputeSkinColor_fdProbApproach(this, this->var53, this->var125, *(double *)&v20);
  v23 = a3 >> 10;
  if (a3 >> 10 >= 4)
    v23 = 4;
  this->var51 = (float)(*((_DWORD *)&v30 + v23) - 10) / (float)*((int *)&v30 + v23);
  if (this->var16 < this->var18 || *p_var68 > 1u || *((_BYTE *)p_var68 + 3222))
  {
    memcpy(this->var52, this->var53, sizeof(this->var52));
  }
  else
  {
    v25 = 1;
    if (*((_BYTE *)p_var68 + 2102))
    {
      var6 = this->var6;
      if (*((float *)var6 + 56) > 0.0)
      {
        CAWBAFEPhotometerAssistPenrose::calcTemproalFilterForChromaHist(this->var5, var6, this->var52, this->var53, this->var64, 32, 0x20u, p_var68[10], this->var40, this->var41, a2, &this->var51);
        v25 = *((_BYTE *)p_var68 + 3222) == 0;
      }
    }
    v27 = 0x7FFFFFFFFFFFF800;
    do
    {
      v28 = (unsigned int *)((char *)this + v27 * 2);
      v29 = *(_DWORD *)&this->var54[0][v27];
      if (v25)
        v29 = (float)((float)(this->var51 * (float)v28[2297])
                                  + (float)((float)v29 * (float)(1.0 - this->var51)));
      v28[2297] = v29;
      v27 += 2;
    }
    while (v27 * 2);
  }
  return CAWBAFEH14::calculateGrayIndexFromGrayworld((uint64_t)this, &this->var44, this->var52);
}

uint64_t CAWBAFEH14::ComputeChromaHistfromTile(CAWBAFEH14 *this)
{
  uint64_t v1;
  double v2;
  float v3;
  float v4;
  CAWBAFE *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  float v16;
  __int16 v17;
  float v18;
  float v19;
  _FE_3A_Stats_H15 *var7;
  unsigned int v21;
  uint64_t v22;
  unsigned __int16 v23;
  float v24;
  float v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  unsigned int v37;
  float v38;
  float v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  float v43;
  float v44;
  float v46;
  unsigned int v47;
  float v48;
  float v49;
  float v50;
  unsigned int v51;
  float v52;
  float v53;
  float v54;
  unint64_t v55;
  int v56;
  unsigned int v57;
  float v58;
  float v59;
  float v61;
  float v63;
  float v64;
  int v65;
  float v66;
  int v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  int v76;
  float v77;
  float v78;
  uint64_t v79;
  uint64_t v80;
  float32x4_t v81;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  sTuningCurvePoint v93;
  float v94[1024];
  uint64_t v95;

  v1 = MEMORY[0x24BDAC7A8](this);
  v5 = (CAWBAFE *)v1;
  v6 = 0;
  v95 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&v93.var0 = xmmword_230930258;
  *(_OWORD *)&v93.var1[3] = unk_230930268;
  *(_OWORD *)&v93.var1[7] = xmmword_230930278;
  *(_OWORD *)&v93.var2[3] = unk_230930288;
  v93.var2[7] = 0;
  v7 = *(unsigned __int16 *)(v1 + 13358);
  if (v7 <= 0x100)
    v8 = *(unsigned __int16 *)(v1 + 13356);
  else
    v8 = HIBYTE(*(unsigned __int16 *)(v1 + 13356));
  if (v7 <= 0x100)
    v9 = *(unsigned __int16 *)(v1 + 13358);
  else
    v9 = v7 >> 8;
  v92 = (float)v9;
  v10 = *(_WORD *)(v1 + 560);
  v11 = *(_WORD *)(v1 + 566);
  v12 = *(_WORD *)(v1 + 564);
  v13 = *(_WORD *)(v1 + 570);
  v14 = *(unsigned __int16 *)(v1 + 596);
  v15 = *(_WORD *)(v1 + 574);
  v16 = (float)*(unsigned int *)(v1 + 644);
  v17 = *(_WORD *)(v1 + 576);
  v18 = (float)*(unsigned int *)(v1 + 652);
  v90 = v16 * 0.000015259;
  do
  {
    *(float32x4_t *)&v94[v6] = vcvtq_f32_u32(*(uint32x4_t *)(v1 + 9188 + v6 * 4));
    v6 += 4;
  }
  while (v6 != 1024);
  if (v14 <= 0x100)
    v19 = 1.0;
  else
    v19 = 256.0;
  var7 = *(_FE_3A_Stats_H15 **)(v1 + 488);
  if (*((_WORD *)var7 + 177))
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v91 = (float)v8;
    v24 = (float)v17 - (float)(1048600.0 / v18);
    v85 = v18 * 0.000015259;
    v86 = v24;
    v88 = (float)v10;
    v89 = (float)v15 - (float)(1048600.0 / v16);
    v87 = (float)v12;
    v83 = (float)v13;
    v84 = (float)v11;
    v25 = 31.0;
    do
    {
      if (*((_WORD *)var7 + 176))
      {
        v26 = 0;
        do
        {
          v27 = v23;
          v28 = (unsigned int *)((char *)v5->var9 + 64 * (unint64_t)v23);
          v29 = v28[13];
          if (v29)
          {
            v30 = (float)v28[1] / (float)v29;
            v31 = (float)v28[5] / (float)v29;
            v32 = v19;
            v33 = (float)v28[9] / (float)v29;
            v34 = v30 + CAWBAFE::calculateWeightFromTuningTable(v5, &v93, (int)(float)((float)(v30 * 256.0) + 0.5));
            v35 = v31 + CAWBAFE::calculateWeightFromTuningTable(v5, &v93, (int)(float)((float)(v31 * 256.0) + 0.5));
            v36 = v33 + CAWBAFE::calculateWeightFromTuningTable(v5, &v93, (int)(float)((float)(v33 * 256.0) + 0.5));
            v19 = v32;
            v25 = 31.0;
            v37 = *((_DWORD *)v5->var9 + 16 * v27 + 13);
          }
          else
          {
            v37 = 0;
            v34 = 0.0;
            v35 = 0.0;
            v36 = 0.0;
          }
          if ((v34 > 257.0 || v35 > 257.0 || v36 > 257.0) && v5->var1 >= 10)
          {
            printf("ERR: CAWBAFE::ComputeChromaHistfromTile Tile ID: x=%d y=%d \n\n", v21, v26);
            if (v5->var1 >= 10)
              printf("ERR:          PF1 [R G B N]: %d %d %d %d \n\n", *((_DWORD *)v5->var9 + 16 * v27 + 1), *((_DWORD *)v5->var9 + 16 * v27 + 5), *((_DWORD *)v5->var9 + 16 * v27 + 9), *((_DWORD *)v5->var9 + 16 * v27 + 13));
          }
          v38 = 255.0;
          if (v35 <= 255.0)
            v39 = v35;
          else
            v39 = 255.0;
          v40 = (int)v39;
          v41 = 1.0;
          if ((float)(v35 + 1.0) <= 255.0)
            v38 = v35 + 1.0;
          v42 = (int)v38;
          v43 = v35 - (float)v40;
          if (v43 > 1.0)
            v43 = 1.0;
          LOWORD(v41) = log2Lut[v40];
          LOWORD(v24) = log2Lut[v42];
          v24 = (float)LODWORD(v24);
          v44 = (float)(v43 * v24) + (float)((float)(1.0 - v43) * (float)v41);
          if (v44 >= v91 && v44 <= v92)
          {
            if (v34 <= 255.0)
              v46 = v34;
            else
              v46 = 255.0;
            v47 = (int)v46;
            if ((float)(v34 + 1.0) <= 255.0)
              v48 = v34 + 1.0;
            else
              v48 = 255.0;
            v49 = v34 - (float)v47;
            if (v49 > 1.0)
              v49 = 1.0;
            if (v36 <= 255.0)
              v50 = v36;
            else
              v50 = 255.0;
            v51 = (int)v50;
            if ((float)(v36 + 1.0) <= 255.0)
              v52 = v36 + 1.0;
            else
              v52 = 255.0;
            if ((float)(v36 - (float)v51) <= 1.0)
              v53 = v36 - (float)v51;
            else
              v53 = 1.0;
            v54 = 1.0;
            LODWORD(v2) = 1.0;
            if (v5->var13.var6)
            {
              LOWORD(v2) = v5->var13.var5[0];
              HIWORD(v3) = 0;
              HIWORD(v4) = 0;
              *(double *)&v55 = (double)*(unint64_t *)&v2 * 255.0 * 0.000122070312;
              v54 = *(double *)&v55;
              LOWORD(v55) = v5->var13.var5[1];
              v2 = (double)v55 * 255.0 * 0.000122070312;
              *(float *)&v2 = v2;
            }
            v56 = (int)v48;
            *(float *)&v57 = 1.0 - v49;
            LOWORD(v3) = log2Lut[v47];
            v3 = (float)LODWORD(v3);
            LOWORD(v4) = log2Lut[v56];
            v4 = (float)LODWORD(v4);
            LOWORD(v57) = log2Lut[v51];
            LOWORD(v52) = log2Lut[v52];
            v24 = (float)((float)(v49 * v4) + (float)((float)(1.0 - v49) * v3)) - v44;
            v58 = (float)((float)(v53 * (float)LODWORD(v52)) + (float)((float)(1.0 - v53) * (float)v57)) - v44;
            v59 = v90
                * (float)(v89
                        + (float)((float)((float)((float)((float)(v58 * v87) + (float)(v24 * v88)) * 0.00024414) * v54)
                                * v19));
            if (v59 >= 0.0 && v59 <= v25)
            {
              v61 = v85
                  * (float)(v86
                          + (float)((float)((float)((float)((float)(v58 * v83) + (float)(v24 * v84)) * 0.00024414)
                                          * *(float *)&v2)
                                  * v19));
              if (v61 >= 0.0 && v61 <= v25)
              {
                v63 = (float)(v35 * (float)v37) / 138.0;
                if (v63 > 0.0)
                {
                  v64 = v59 + 0.5;
                  v65 = (int)(float)(v59 + 0.5);
                  v66 = v61 + 0.5;
                  v67 = (int)(float)(v61 + 0.5);
                  v68 = (float)v65;
                  v69 = v59 + -0.5;
                  HIWORD(v3) = 0;
                  if (v69 < 0.0)
                    v69 = 0.0;
                  v70 = v68 - v69;
                  HIWORD(v4) = 16896;
                  if (v64 <= 32.0)
                    v71 = v64;
                  else
                    v71 = 32.0;
                  v72 = (float)v67;
                  v73 = v61 + -0.5;
                  if (v73 < 0.0)
                    v73 = 0.0;
                  v74 = v72 - v73;
                  if (v66 <= 32.0)
                    v75 = v66;
                  else
                    v75 = 32.0;
                  if ((float)(v70 * v74) > 0.0)
                  {
                    v76 = v65 + 32 * v67 - 33;
                    v3 = v94[v76];
                    v94[v76] = v3 + (float)(v63 * (float)(v70 * v74));
                  }
                  v24 = v71 - v68;
                  if ((float)(v24 * v74) > 0.0)
                    v94[32 * v67 - 32 + v65] = v94[32 * v67 - 32 + v65] + (float)(v63 * (float)(v24 * v74));
                  v77 = v75 - v72;
                  v78 = v70 * v77;
                  if (v78 > 0.0)
                    v94[32 * v67 - 1 + v65] = v94[32 * v67 - 1 + v65] + (float)(v63 * v78);
                  v79 = v65 + 32 * v67;
                  if ((float)(v24 * v77) > 0.0)
                    v94[v79] = v94[v79] + (float)(v63 * (float)(v24 * v77));
                  if (v5->var64[v79])
                    v22 = v22 + (v37 >> 1);
                }
              }
            }
          }
          v23 = v27 + 1;
          ++v26;
          var7 = v5->var7;
        }
        while (v26 < *((unsigned __int16 *)var7 + 176));
      }
      ++v21;
    }
    while (v21 < *((unsigned __int16 *)var7 + 177));
  }
  else
  {
    v22 = 0;
  }
  v80 = 0;
  v81.i64[0] = 0x3F0000003F000000;
  v81.i64[1] = 0x3F0000003F000000;
  do
  {
    *(uint32x4_t *)&v5->var53[v80] = vcvtq_u32_f32(vaddq_f32(*(float32x4_t *)&v94[v80], v81));
    v80 += 4;
  }
  while (v80 != 1024);
  return v22;
}

uint64_t CAWBAFEH14::calculateGrayIndexFromGrayworld(uint64_t this, sAWBInternalParams *a2, const unsigned int *a3)
{
  int v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  __int16 v7;
  int32x4_t v8;
  int v9;
  int64x2_t v10;
  int64x2_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int32x4_t v17;
  uint32x4_t v18;
  uint32x4_t v19;
  unint64_t v20;
  unint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  float v32;
  int v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float var23;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8.i64[0] = 0x400000004;
  v8.i64[1] = 0x400000004;
  do
  {
    v9 = 0;
    v10 = (int64x2_t)v4;
    v11 = (int64x2_t)v5;
    v12 = (int32x4_t)v6;
    v13 = vdupq_n_s32((2 * v3) | 1u);
    v14 = (int32x4_t)xmmword_23092FA90;
    v15 = 0uLL;
    v16 = 0uLL;
    do
    {
      v17 = *(int32x4_t *)&a3[(unsigned __int16)(v7 + v9)];
      v18 = (uint32x4_t)vmulq_s32(v17, (int32x4_t)(*(_OWORD *)&vaddq_s32(v14, v14) | __PAIR128__(0x100000001, 0x100000001)));
      v16 = (int64x2_t)vaddw_high_u32((uint64x2_t)v16, v18);
      v11 = (int64x2_t)vaddw_u32((uint64x2_t)v11, *(uint32x2_t *)v18.i8);
      v19 = (uint32x4_t)vmulq_s32(v17, v13);
      v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, v19);
      v10 = (int64x2_t)vaddw_u32((uint64x2_t)v10, *(uint32x2_t *)v19.i8);
      v12 = vaddq_s32(v17, v12);
      v9 += 4;
      v14 = vaddq_s32(v14, v8);
    }
    while (v9 != 32);
    v6 = vaddvq_s32(v12);
    v20 = vaddvq_s64(vaddq_s64(v11, v16));
    v5 = v20;
    v21 = vaddvq_s64(vaddq_s64(v10, v15));
    v4 = v21;
    v7 += 32;
    ++v3;
  }
  while (v3 != 32);
  if (v6)
  {
    v22 = (float)(v20 >> 1) / (float)v6;
    v23 = (float)(v21 >> 1) / (float)v6;
    LOWORD(v20) = *(_WORD *)(this + 13362);
    v24 = (float)v20;
    *(float *)&v20 = v23 + (float)v20;
    if (*(float *)&v20 > 31.0)
      *(float *)&v20 = 31.0;
    v25 = v23 - v24;
    v26 = 0.0;
    if (v25 < 0.0)
      v25 = 0.0;
    v16.i16[0] = *(_WORD *)(this + 13360);
    v27 = (float)v16.u32[0];
    *(float *)v16.i32 = v22 + (float)v16.u32[0];
    if (*(float *)v16.i32 > 31.0)
      *(float *)v16.i32 = 31.0;
    if ((float)(v22 - v27) >= 0.0)
      v28 = v22 - v27;
    else
      v28 = 0.0;
    v29 = (int)(float)(v25 + 1.0);
    v30 = (int)(float)(*(float *)&v20 + 1.0);
    if (v29 <= v30)
    {
      v31 = (int)(float)(*(float *)v16.i32 + 1.0);
      do
      {
        if ((int)(float)(v28 + 1.0) <= v31)
        {
          v32 = (float)(unsigned __int16)v29;
          v33 = (int)(float)(v28 + 1.0);
          do
          {
            v34 = (float)(unsigned __int16)v33;
            if ((float)(v28 + 1.0) <= v34)
            {
              v35 = 1.0;
              if (*(float *)v16.i32 < v34)
                v35 = (float)(*(float *)v16.i32 + 1.0) - v34;
            }
            else
            {
              v35 = v34 - v28;
            }
            v36 = (float)((float)(*(float *)&v20 + 1.0) - v32) * v35;
            if (*(float *)&v20 >= v32)
              v36 = v35;
            v37 = (float)(v32 - v25) * v35;
            if ((float)(v25 + 1.0) <= v32)
              v37 = v36;
            v26 = v26 + (float)(v37 * (float)a3[(unsigned __int16)(32 * v29 - 33 + v33)]);
            LOWORD(v33) = v33 + 1;
          }
          while (v31 >= (unsigned __int16)v33);
        }
        LOWORD(v29) = v29 + 1;
      }
      while (v30 >= (unsigned __int16)v29);
    }
    v38 = v26 / (float)v6;
    if (v38 > 1.0)
      v38 = 1.0;
  }
  else
  {
    v38 = 0.0;
    v22 = 15.5;
    v23 = 15.5;
  }
  *(_QWORD *)&a2->var18 = *(_QWORD *)&a2->var20;
  var23 = a2->var23;
  a2->var20 = v22;
  a2->var21 = v23;
  a2->var22 = var23;
  a2->var23 = v38;
  a2->var25 = v6;
  return this;
}

uint64_t CAWBAFEH14::updateLuxLevelFromSceneChangeDetection(CAWBAFE *this, sAWBInternalParams *a2, unsigned int a3, double a4, double a5, float a6)
{
  BOOL *p_var128;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float var23;
  float var22;
  float v20;
  float v21;
  float v22;
  float v23;
  unsigned int var0;
  float v25;
  float v26;
  float v27;
  uint64_t result;
  sTuningCurvePoint v29;
  sTuningCurvePoint v30;
  sTuningCurvePoint v31;
  sTuningCurvePoint v32;

  p_var128 = &this->var128;
  memset(v32.var1, 0, sizeof(v32.var1));
  *(_QWORD *)&v32.var2[2] = 192;
  *(_OWORD *)&v32.var2[4] = 0u;
  *(_QWORD *)&v32.var1[1] = 0x200000001;
  *(_QWORD *)v32.var2 = 0xF0000000FCLL;
  v32.var0 = 3;
  *(_OWORD *)&v31.var0 = xmmword_2309302E0;
  *(_OWORD *)&v31.var1[3] = *(_OWORD *)algn_2309302F0;
  *(_OWORD *)&v31.var1[7] = xmmword_230930300;
  memset(&v31.var2[3], 0, 20);
  *(_OWORD *)&v30.var0 = xmmword_230930324;
  *(_OWORD *)&v30.var1[3] = *(_OWORD *)algn_230930334;
  *(_OWORD *)&v30.var1[7] = xmmword_230930344;
  memset(&v30.var2[3], 0, 20);
  *(_OWORD *)&v29.var0 = xmmword_230930368;
  *(_OWORD *)&v29.var1[3] = unk_230930378;
  *(_OWORD *)&v29.var1[7] = xmmword_230930388;
  memset(&v29.var2[3], 0, 20);
  v9 = (float)a3;
  v10 = fabsf(sqrtf((float)a3));
  v11 = 1.0;
  if (v10 < 1.0)
    v10 = 1.0;
  LOWORD(a6) = a2->var0;
  v12 = fabsf(sqrtf((float)LODWORD(a6)));
  if (v12 >= 1.0)
    v11 = v12;
  v13 = v10 <= v11;
  v14 = v11 / v10;
  v15 = v10 / v11;
  if (v13)
    v15 = v14;
  v16 = CAWBAFE::calculateWeightFromTuningTable(this, &v29, (float)(v15 + 0.5));
  v17 = CAWBAFE::calculateWeightFromTuningTable(this, &v32, (float)(fabsf(sqrtf((float)((float)(a2->var20 - a2->var18) * (float)(a2->var20 - a2->var18))+ (float)((float)(a2->var21 - a2->var19) * (float)(a2->var21 - a2->var19))))+ 0.5));
  var22 = a2->var22;
  var23 = a2->var23;
  if (var23 <= var22)
    v20 = var22 - var23;
  else
    v20 = var23 - var22;
  v21 = CAWBAFE::calculateWeightFromTuningTable(this, &v31, (float)((float)(v20 * 256.0) + 0.5));
  if (*p_var128 && (v22 = *((float *)this->var6 + 55), v22 > 0.0))
    v23 = CAWBAFE::calculateWeightFromTuningTable(this, &v30, (float)((float)(v22 * 256.0) + 0.5));
  else
    v23 = v17 * v21;
  var0 = a2->var0;
  a2->var1 = var0;
  if (!p_var128[1120])
  {
    v25 = v16 * v23;
    v26 = log2f((float)var0 + 1.0);
    v27 = log2f(v9 + 1.0);
    v9 = exp2f((float)(v27 * (float)(1.0 - v25)) + (float)(v25 * v26));
    if (v9 > 65535.0)
      v9 = 65535.0;
  }
  result = (int)v9;
  a2->var0 = result;
  return result;
}

void CAWBAFEH14::calculateCCMDesatFactorForSkin(CAWBAFE *this, float a2, unsigned int a3, const __int16 (*a4)[2])
{
  fdAWBMetaData *var112;
  float v7;
  float v8;
  float var40;
  float v10;
  int v11;
  int v12;
  int v13;
  float v14;
  sTuningCurvePoint v15;
  sTuningCurvePoint v16;
  sTuningCurvePoint v17;

  memset(&v17.var2[3], 0, 20);
  *(_OWORD *)&v17.var0 = xmmword_230930040;
  memset(&v17.var1[3], 0, 24);
  *(_OWORD *)&v16.var0 = xmmword_23093029C;
  *(_OWORD *)&v16.var1[3] = *(_OWORD *)algn_2309302AC;
  *(_OWORD *)&v16.var1[7] = xmmword_2309302BC;
  *(_QWORD *)&v17.var2[1] = 0x10000000080;
  memset(&v16.var2[3], 0, 20);
  memset(v15.var1, 0, 64);
  v15.var0 = 3;
  *(_QWORD *)&v15.var1[1] = 0x8000000040;
  *(_QWORD *)&v15.var2[1] = 0x10000000080;
  var112 = this->var112;
  if (!*((_DWORD *)var112 + 1))
  {
    v11 = 0;
    v12 = 0;
    v7 = *((float *)var112 + 770);
    v13 = *((_DWORD *)var112 + 771);
    v14 = v7;
    v8 = CAWBAFE::ComputeProjection(this, a3, (float *)&v12, (float *)&v11, &v14, (float *)&v13, (uint64_t)a4, &this->var83);
    v14 = v8;
    var40 = this->var40;
    if (v8 <= var40)
      v10 = var40 - v8;
    else
      v10 = v8 - var40;
    CAWBAFE::calculateWeightFromTuningTable(this, &v17, a3);
    CAWBAFE::calculateWeightFromTuningTable(this, &v16, (int)(float)((float)(v10 * 256.0) + 0.5));
    CAWBAFE::calculateWeightFromTuningTable(this, &v15, (int)(float)((float)(*((float *)this->var112 + 2) * 256.0) + 0.5));
  }
}

void CAWBAFEH14::GetMetaData(CAWBAFE *a1, uint64_t a2, uint64_t a3)
{
  BOOL *p_var103;
  BOOL *p_var45;
  double v8;
  float32x2_t v9;
  float32x2_t v10;
  double v11;
  float v12;
  uint64_t v13;
  sPhotometerAWBMetadata *var6;
  char *v15;
  _DWORD *v16;
  unsigned int v17;

  p_var103 = &a1->var103;
  p_var45 = &a1->var45;
  CAWBAFE::GetMetaData((uint64_t)a1, a2, a3);
  if (a3 && p_var103[1568])
  {
    v13 = 0;
    var6 = a1->var6;
    v15 = (char *)var6 + 304;
    do
    {
      v16 = (_DWORD *)(a3 + 484 + v13);
      *(v16 - 14) = vcvts_n_u32_f32(*(float *)&v15[v13 - 60], 0x10uLL);
      v17 = *(float *)&v15[v13 - 48];
      *(v16 - 11) = vcvts_n_u32_f32(*(float *)&v15[v13 - 36], 0x10uLL);
      *(v16 - 8) = v17;
      *(v16 - 5) = *(float *)&v15[v13 - 24];
      *v16 = *(float *)&v15[v13];
      v13 += 4;
    }
    while (v13 != 12);
    v9 = (float32x2_t)vdup_n_s32(0x47800000u);
    *(uint32x2_t *)(a3 + 476) = vcvt_n_u32_f32(*(float32x2_t *)((char *)var6 + 220), 0x10uLL);
    LODWORD(v11) = 0.5;
    *(_DWORD *)(a3 + 496) = (int)(float)((float)(a1->var51 * 256.0) + 0.5);
    v10 = vmla_f32((float32x2_t)0x3F0000003F000000, v9, *(float32x2_t *)((char *)var6 + 232));
    v8 = COERCE_DOUBLE(vcvt_u32_f32(v10));
    *(double *)(a3 + 500) = v8;
    v9.i32[0] = 1199570944;
    *(float *)&v8 = (float)(*((float *)var6 + 60) * 65536.0) + 0.5;
    *(_DWORD *)(a3 + 508) = *(float *)&v8;
  }
  if (a3 && *p_var103)
  {
    v9.i32[0] = 1132462080;
    v10.i32[0] = 0.5;
    *(float *)&v8 = (float)(*((float *)p_var45 + 4038) * 256.0) + 0.5;
    *(_WORD *)(a3 + 566) = (int)*(float *)&v8;
  }
  *(_BYTE *)(a2 + 945) = 0;
  if (*p_var45)
    CAWBAFEH14::GetOneFrameAWBMetaData(a1, a2, (_WORD *)a3, v8, *(double *)&v9, *(double *)&v10, v11, v12);
}

void CAWBAFEH14::GetOneFrameAWBMetaData(CAWBAFE *a1, uint64_t a2, _WORD *a3, double a4, double a5, double a6, double a7, float a8)
{
  float *p_var72;
  unsigned int CCTFromColorRatio;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  _WORD *v28;
  int16x8_t *v29;
  uint64_t i;
  uint64_t v31;
  unsigned __int16 v32[2];
  int16x8_t v33[2];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  p_var72 = &a1->var72;
  CCTFromColorRatio = CAWBAFE::GetCCTFromColorRatio(a1, a1->var42, a1->var86, a5, a6, a7, a8);
  *(_DWORD *)(a2 + 980) = CCTFromColorRatio;
  *(_DWORD *)v32 = 0;
  CAWBAFE::GetNewCSensorCalGains(a1, &v32[1], v32, CCTFromColorRatio, &a1->var89);
  *(_WORD *)(a2 + 984) = v32[1];
  *(_WORD *)(a2 + 986) = v32[0];
  *(_WORD *)(a2 + 978) = 0x4000;
  v31 = 0;
  CAWBAFE::ComputeChannelGainsfromHistWP(a1, a1->var42, a1->var43, (float *)&v31 + 1, (float *)&v31, v13, v14, v15, v16, v17);
  v18 = (float)((float)(*((float *)&v31 + 1) * 4096.0) + 0.5);
  if (v18 >= 0xFFFF)
    v18 = 0xFFFF;
  if (v18 <= 0x800)
    v19 = 2048;
  else
    v19 = v18;
  v20 = (float)((float)(*(float *)&v31 * 4096.0) + 0.5);
  if (v20 >= 0xFFFF)
    v20 = 0xFFFF;
  if (v20 <= 0x800)
    v21 = 2048;
  else
    v21 = v20;
  *(_WORD *)(a2 + 952) = v19;
  *(_DWORD *)(a2 + 954) = 268439552;
  *(_WORD *)(a2 + 958) = v21;
  v22 = (v19 * v32[1]) >> 14;
  if (v22 >= 0xFFFF)
    v22 = 0xFFFF;
  v23 = (v21 * v32[0]) >> 14;
  if (v23 >= 0xFFFF)
    v24 = 0xFFFF;
  else
    v24 = (v21 * v32[0]) >> 14;
  *(_WORD *)(a2 + 960) = v22;
  *(_DWORD *)(a2 + 962) = 268439552;
  *(_WORD *)(a2 + 966) = v24;
  if (v24 <= v22)
    v25 = v22;
  else
    v25 = v24;
  if (v25 <= 0x1000)
    v25 = 4096;
  if (v23 >= v22)
    v23 = v22;
  if (v23 >= 0x1000)
    v23 = 4096;
  v26 = (v25 << 12) / v23;
  *(_WORD *)(a2 + 976) = v26;
  *(_WORD *)(a2 + 968) = (v22 << 12) / (unsigned __int16)v26;
  *(_WORD *)(a2 + 970) = 0x1000000u / (unsigned __int16)v26;
  *(_WORD *)(a2 + 972) = 0x1000000u / (unsigned __int16)v26;
  *(_WORD *)(a2 + 974) = (v24 << 12) / (unsigned __int16)v26;
  CAWBAFE::InterpCCMfromBases(a1, a1->var42, a1->var43, *p_var72, (int (*)[3])v33, &a1->var100, a1->var88, p_var72[129]);
  CAWBAFE::RGBColorSpaceConversion(a1, *((_DWORD *)p_var72 + 522), (uint64_t)v33);
  *(int16x8_t *)(a2 + 988) = vuzp1q_s16(v33[0], v33[1]);
  *(_WORD *)(a2 + 1004) = v34;
  *(_BYTE *)(a2 + 945) = 1;
  if (a3)
  {
    v27 = 0;
    a3[291] = 1;
    a3[296] = v19;
    a3[297] = 4096;
    a3[298] = v21;
    a3[292] = (int)(float)((float)(a1->var42 * 256.0) + 0.5);
    a3[293] = (int)(float)((float)(a1->var43 * 256.0) + 0.5);
    a3[294] = v32[1];
    a3[295] = v32[0];
    v28 = a3 + 299;
    v29 = v33;
    do
    {
      for (i = 0; i != 3; ++i)
        v28[i] = v29->i32[i];
      ++v27;
      v28 += 3;
      v29 = (int16x8_t *)((char *)v29 + 12);
    }
    while (v27 != 3);
  }
}

void CAWBAFEH14::GetBinIndicesWithConfig(uint64_t a1, float *a2, float *a3, float *a4, int a5, uint64_t a6, double a7, double a8)
{
  unint64_t v8;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;

  v14 = *a4;
  v13 = a4[1];
  v15 = a4[2];
  if (a5 <= 0)
  {
    if ((v14 == 0.0 || v13 == 0.0 || v15 == 0.0) && *(int *)(a1 + 8) >= 10)
      printf("ERR: Input WBGain = %.2f %.2f %.2f\n", v14, v13, v15);
    if (v13 >= v15)
      v16 = v15;
    else
      v16 = v13;
    if (v14 < v16)
      v16 = v14;
    v17 = v16 * 200.0;
    v14 = v17 / v14;
    v13 = v17 / v13;
    v15 = v17 / v15;
    goto LABEL_18;
  }
  if (a5 == 1)
  {
LABEL_18:
    if ((float)((float)((float)((float)(v13 * (float)*(__int16 *)(a6 + 8)) + (float)(v14 * (float)*(__int16 *)(a6 + 6)))
                       + (float)(v15 * (float)*(__int16 *)(a6 + 10)))
               / (float)((float)((float)*(__int16 *)(a6 + 6) + (float)*(__int16 *)(a6 + 8))
                       + (float)*(__int16 *)(a6 + 10))) <= 255.0)
      v13 = (float)((float)((float)(v13 * (float)*(__int16 *)(a6 + 8)) + (float)(v14 * (float)*(__int16 *)(a6 + 6)))
                  + (float)(v15 * (float)*(__int16 *)(a6 + 10)))
          / (float)((float)((float)*(__int16 *)(a6 + 6) + (float)*(__int16 *)(a6 + 8)) + (float)*(__int16 *)(a6 + 10));
    else
      v13 = 255.0;
    goto LABEL_21;
  }
  if (a5 <= 2)
  {
LABEL_21:
    v14 = log2f(v14) * 32.0;
    v13 = log2f(v13) * 32.0;
    v15 = log2f(v15) * 32.0;
    goto LABEL_22;
  }
  if (a5 != 3)
  {
    if (a5 > 4)
      return;
    goto LABEL_23;
  }
LABEL_22:
  v18 = v14 - v13;
  v19 = v15 - v13;
  v13 = (float)((float)((float)(v15 - v13) * (float)*(__int16 *)(a6 + 28))
              + (float)((float)(v14 - v13) * (float)*(__int16 *)(a6 + 24)))
      * 0.00024414;
  v15 = (float)((float)(v19 * (float)*(__int16 *)(a6 + 34)) + (float)(v18 * (float)*(__int16 *)(a6 + 30))) * 0.00024414;
LABEL_23:
  v20 = 256.0;
  LODWORD(a8) = 1.0;
  if (*(unsigned __int16 *)(a1 + 596) <= 0x100u)
    v20 = 1.0;
  v21 = (float)*(unsigned int *)(a6 + 44);
  v22 = (float)*(__int16 *)(a6 + 38) - (float)(1048600.0 / v21);
  v23 = 1.0;
  if (*(_BYTE *)(a1 + 594))
  {
    LOWORD(a8) = *(_WORD *)(a1 + 590);
    *(float *)&a8 = (double)*(unint64_t *)&a8 * 255.0 * 0.000122070312;
    LOWORD(v8) = *(_WORD *)(a1 + 592);
    v23 = (double)v8 * 255.0 * 0.000122070312;
  }
  *a2 = (float)((float)*(unsigned int *)(a6 + 40) * 0.000015259)
      * (float)((float)((float)*(__int16 *)(a6 + 36) - (float)(1048600.0 / (float)*(unsigned int *)(a6 + 40)))
              + (float)((float)(v13 * *(float *)&a8) * v20));
  *a3 = (float)(v21 * 0.000015259) * (float)(v22 + (float)((float)(v15 * v23) * v20));
}

uint64_t CAWBAFEH14::calculateSlaveCameraWBGainNew(uint64_t this, const unsigned int *a2, int8x8_t *a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  int *v7;
  int v8;
  unsigned int v9;
  _DWORD *v10;
  unsigned int v11;
  float32x2_t v12;
  float v13;
  uint32x2_t v14;
  unsigned int v15;
  float v16;

  v4 = *(unsigned int *)(this + 23892);
  if ((_DWORD)v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = (int *)(this + 23896);
    do
    {
      v8 = *v7;
      v7 += 7;
      if (v8 == (a4 & 0xFFFFFF))
        v6 = v5;
      ++v5;
    }
    while (v4 != v5);
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }
  v10 = (_DWORD *)(this + 28 * v9 + 23896);
  v11 = a2[2];
  v12.f32[0] = (float)((v10[1] + ((signed int)(*a2 * v10[2] + 2048) >> 12) + ((int)(v11 * v10[3] + 2048) >> 12) + 8) >> 4);
  v13 = (float)((v10[4] + ((signed int)(v10[5] * *a2 + 2048) >> 12) + ((int)(v10[6] * v11 + 2048) >> 12) + 8) >> 4);
  v12.f32[1] = (float)a2[1];
  v14 = vcvt_u32_f32(vadd_f32(v12, (float32x2_t)0x3F0000003F000000));
  *a3 = vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)0x80000000800, v14), (int8x8_t)0x4500000045000000, vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)0x1000000010000, v14), (int8x8_t)vcvt_f32_u32(v14), (int8x8_t)vdup_n_s32(0x477FFF00u)));
  v15 = (float)(v13 + 0.5);
  v16 = (float)v15;
  if (v15 >= 0x10000)
    v16 = 65535.0;
  if (v15 < 0x800)
    v16 = 2048.0;
  *(float *)a3[1].i32 = v16;
  return this;
}

void CAWBAFEH14::setSlaveCameraCSensorCalGain(CAWBAFEH14 *this, SensorConfigAWBParams *a2)
{
  unsigned int var0;
  unsigned int var1;
  unsigned int v4;
  unsigned int var2;
  unsigned int var3;
  unsigned int v7;

  var0 = a2->var2.var0;
  if (var0 - 13108 > 0x1998 || (var1 = a2->var2.var1, var1 - 13108 > 0x1998))
  {
    LOWORD(v4) = 0x4000;
    a2->var3.var0 = 0x4000;
  }
  else
  {
    a2->var3.var0 = 0x10000000 / var0;
    v4 = 0x10000000 / var1;
  }
  a2->var3.var1 = v4;
  var2 = a2->var2.var2;
  if (var2 - 13108 > 0x1998 || (var3 = a2->var2.var3, var3 - 13108 > 0x1998))
  {
    LOWORD(v7) = 0x4000;
    a2->var3.var2 = 0x4000;
  }
  else
  {
    a2->var3.var2 = 0x10000000 / var2;
    v7 = 0x10000000 / var3;
  }
  a2->var3.var3 = v7;
}

void CAWBAFEH14::ProcessMatchSlaveAWB(uint64_t a1, const unsigned int *a2, int a3, SensorConfigAWBParams *a4, unsigned __int16 *a5, uint64_t a6)
{
  uint64_t v12;
  sCameraColorConfig *p_var6;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  _DWORD *v21;
  unsigned int v22;
  unsigned int CCTFromColorRatio;
  unsigned int v24;
  int v25;
  unsigned int v26;
  BOOL v27;
  int v28;
  char v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  float v45;
  float v46;
  int8x8_t v47;
  float v48;
  float32x2_t v49;
  float v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a1 + 20664;
  v45 = 0.0;
  v46 = 0.0;
  p_var6 = &a4->var6;
  CAWBAFEH14::setSlaveCameraCSensorCalGain((CAWBAFEH14 *)a1, a4);
  CAWBAFEH14::calculateSlaveCameraWBGainNew(a1, a2, (int8x8_t *)&v49, a4->var4);
  CAWBAFEH14::GetBinIndicesWithConfig(a1, &v46, &v45, (float *)&v49, 0, (uint64_t)p_var6, v14, v15);
  v20 = v45;
  v19 = v46;
  *((float *)a5 + 20) = v46;
  *((float *)a5 + 21) = v20;
  *((_DWORD *)a5 + 22) = *(_DWORD *)(*(_QWORD *)(a1 + 480) + 220);
  *((uint32x2_t *)a5 + 1) = vmax_u32(vmin_u32(vcvt_u32_f32(vadd_f32(v49, (float32x2_t)0x3F0000003F000000)), (uint32x2_t)0xFFFF0000FFFFLL), (uint32x2_t)0x80000000800);
  v21 = a5 + 4;
  v22 = (float)(v50 + 0.5);
  if (v22 >= 0xFFFF)
    v22 = 0xFFFF;
  if (v22 <= 0x800)
    v22 = 2048;
  *((_DWORD *)a5 + 4) = v22;
  CCTFromColorRatio = CAWBAFE::GetCCTFromColorRatio((CAWBAFE *)a1, v19, a4->var6.var6, COERCE_DOUBLE(COERCE_UNSIGNED_INT(0.5) | 0x80000000000), v16, v17, v18);
  *((_DWORD *)a5 + 1) = CCTFromColorRatio;
  CAWBAFE::GetNewCSensorCalGains((CAWBAFE *)a1, a5, a5 + 1, CCTFromColorRatio, &a4->var3);
  v24 = *v21 * *a5;
  if (v24 >> 30)
    v25 = 0xFFFF;
  else
    v25 = v24 >> 14;
  *((_DWORD *)a5 + 5) = v25;
  v26 = *((_DWORD *)a5 + 4) * a5[1];
  v27 = v26 >> 30 == 0;
  v28 = v26 >> 14;
  if (!v27)
    v28 = 0xFFFF;
  *((_DWORD *)a5 + 6) = *((_DWORD *)a5 + 3);
  *((_DWORD *)a5 + 7) = v28;
  CAWBAFE::InterpCCMfromBases((CAWBAFE *)a1, v19, v20, *(float *)v12, (int (*)[3])(a5 + 16), (const sTuningCurvePoint *)(a1 + 21112), a4->var6.var5, *(float *)(v12 + 516));
  CAWBAFE::RGBColorSpaceConversion((CAWBAFE *)a1, *(_DWORD *)(v12 + 2088), (uint64_t)(a5 + 16));
  *((_BYTE *)a5 + 68) = 1;
  v29 = *(_BYTE *)(v12 + 12);
  if (v29 && *(unsigned __int8 *)(*(_QWORD *)(a1 + 22736) + 75) == a3)
  {
    *((_BYTE *)a5 + 92) = 1;
    *((_BYTE *)a5 + 93) = v29;
    *((_DWORD *)a5 + 24) = *(_DWORD *)(v12 + 28);
    CAWBAFEH14::calculateSlaveCameraWBGainNew(a1, (const unsigned int *)(a1 + 20680), &v47, a4->var4);
    v30 = (float)(*(float *)v47.i32 + 0.5);
    if (v30 >= 0xFFFF)
      v30 = 0xFFFF;
    if (v30 <= 0x800)
      v30 = 2048;
    v31 = (float)(*(float *)&v47.i32[1] + 0.5);
    if (v31 >= 0xFFFF)
      v31 = 0xFFFF;
    if (v31 <= 0x800)
      LOWORD(v31) = 2048;
    if ((float)(v48 + 0.5) >= 0xFFFF)
      v32 = 0xFFFF;
    else
      v32 = (float)(v48 + 0.5);
    if (v32 <= 0x800)
      v32 = 2048;
    v33 = v30 * *a5;
    v34 = v33 >> 30;
    v35 = v33 >> 14;
    if (v34)
      LOWORD(v35) = -1;
    a5[50] = v35;
    a5[51] = v31;
    a5[52] = v31;
    v36 = v32 * a5[1];
    v37 = v36 >> 30;
    v38 = v36 >> 14;
    if (v37)
      LOWORD(v38) = -1;
    a5[53] = v38;
  }
  if (a6)
  {
    v39 = *(unsigned __int8 *)(a6 + 619);
    *(_BYTE *)(a6 + v39 + 616) = a3;
    v40 = a6 + 68 * v39;
    *(_DWORD *)(v40 + 620) = *(_DWORD *)a5;
    *(_DWORD *)(v40 + 624) = *((_DWORD *)a5 + 1);
    v41 = *(_QWORD *)v21;
    *(_DWORD *)(v40 + 636) = *((_DWORD *)a5 + 4);
    *(_QWORD *)(v40 + 628) = v41;
    v42 = *(_QWORD *)(a5 + 10);
    *(_DWORD *)(v40 + 648) = *((_DWORD *)a5 + 7);
    *(_QWORD *)(v40 + 640) = v42;
    v43 = *((_OWORD *)a5 + 2);
    v44 = *((_OWORD *)a5 + 3);
    *(_DWORD *)(v40 + 684) = *((_DWORD *)a5 + 16);
    *(_OWORD *)(v40 + 652) = v43;
    *(_OWORD *)(v40 + 668) = v44;
    ++*(_BYTE *)(a6 + 619);
  }
}

void *CAWBAFEH14::SetSlaveCameraListColorMatchingModel(uint64_t a1, unsigned int a2, void *__src)
{
  *(_BYTE *)(a1 + 23889) = 1;
  *(_DWORD *)(a1 + 23892) = a2;
  return memcpy((void *)(a1 + 23896), __src, 28 * a2);
}

float32_t CAWBAFEH14::calculateSTRBkeyFromWideCameraNew(CAWBAFEH14 *this, sPerModuleLEDCalibData *a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  int *v5;
  int v6;
  unsigned int v7;
  char *v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float v12;
  float v13;
  float32_t v14;
  float32x2_t v15;
  float v16;
  float32x2_t v18;
  unsigned int version;
  float *p_ww_rg;
  float *p_ww_bg;
  float v29;

  v2 = *((unsigned int *)this + 5973);
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = (int *)((char *)this + 23896);
    do
    {
      v6 = *v5;
      v5 += 7;
      if (v6 == (*((_DWORD *)this + 5724) & 0xFFFFFF))
        v4 = v3;
      ++v3;
    }
    while (v2 != v3);
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }
  v8 = (char *)this + 28 * v7;
  v9 = (float32x2_t)vdup_n_s32(0x37800000u);
  v10 = vmul_f32(vcvt_f32_s32(*(int32x2_t *)(v8 + 23904)), v9);
  v11 = vmul_f32(vcvt_f32_s32(*(int32x2_t *)(v8 + 23916)), v9);
  v12 = vmlas_n_f32((float)-v10.f32[1] * v11.f32[0], v11.f32[1], v10.f32[0]);
  if (v12 < 0.001 && (float)-v12 < 0.001)
    v12 = 1.0;
  v13 = (float)*((int *)v8 + 5975) * 0.000015259;
  v14 = 1.0 / v12;
  v15.f32[0] = -v14;
  v15.f32[1] = v14;
  v16 = (float)*((int *)v8 + 5978) * 0.000015259;
  _D0 = vmul_f32(v11, v15);
  v18 = vmul_f32(v10, (float32x2_t)vrev64_s32((int32x2_t)v15));
  version = a2->version;
  if (version <= 2)
  {
    __asm { FMOV            V4.2S, #1.0 }
    *(int32x2_t *)&a2->cw_rg = vrev64_s32((int32x2_t)vdiv_f32(_D4, vmla_n_f32(vmul_n_f32(v18, (float)(1.0 / a2->cw_bg) - v16), _D0, (float)(1.0 / a2->cw_rg) - v13)));
    p_ww_rg = &a2->ww_rg;
    p_ww_bg = &a2->ww_bg;
LABEL_15:
    _S1 = (float)(1.0 / *p_ww_rg) - v13;
    __asm { FMLA            S4, S1, V0.S[1] }
    v29 = vmlas_n_f32((float)((float)(1.0 / *p_ww_bg) - v16) * v18.f32[0], _S1, _D0.f32[0]);
    *p_ww_rg = 1.0 / _S4;
    _D0.f32[0] = 1.0 / v29;
    *p_ww_bg = 1.0 / v29;
    return _D0.f32[0];
  }
  if (version == 3)
  {
    p_ww_rg = &a2->strb_rg;
    p_ww_bg = &a2->strb_bg;
    goto LABEL_15;
  }
  return _D0.f32[0];
}

void CAWBAFEH14::ProjectFlashWP(uint64_t a1, unsigned int a2, unsigned __int8 *a3, __n128 a4, double a5, double a6, float a7, double a8)
{
  float v10;
  float v11;
  uint64_t v13;
  uint16x4_t *v14;
  unsigned __int16 *v15;
  uint64_t v16;
  float *v17;
  uint64_t i;
  unsigned int v19;
  int v20;
  int8x16_t v21;
  int v22;
  int v23;
  _DWORD *v24;
  double v25;
  double v26;
  double v27;
  float v28;
  unsigned int CCTFromColorRatio;
  unsigned int v30;
  float v31;
  unsigned int v32;
  float v33;
  double v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  float *v39;
  uint64_t j;
  int v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  float v46;
  float v47;
  uint64_t v48;
  unsigned __int16 v49;
  unsigned __int16 v50;
  uint64_t v51;
  float v52[2];
  float v53;
  float v54[9];
  uint64_t v55;

  v10 = *(float *)&a5;
  v11 = a4.n128_f32[0];
  v13 = 0;
  v55 = *MEMORY[0x24BDAC8D0];
  v14 = (uint16x4_t *)(a1 + 20996);
  v15 = (unsigned __int16 *)(a1 + 20656);
  v16 = a1 + 696;
  v17 = v54;
  do
  {
    for (i = 0; i != 3; ++i)
      v17[i] = (float)*(int *)(v16 + i * 4) * 0.00024414;
    ++v13;
    v17 += 3;
    v16 += 12;
  }
  while (v13 != 3);
  v51 = 0;
  if (!a3[1])
    goto LABEL_27;
  v19 = *a3;
  if (v19 > 2)
  {
    if (v19 != 3)
      goto LABEL_27;
    if (a3[2] != 1)
    {
      if (a3[2])
        goto LABEL_26;
      a4.n128_u64[0] = *(_QWORD *)(a3 + 20);
      *(_QWORD *)(a3 + 44) = a4.n128_u64[0];
      v22 = *(unsigned __int8 *)(a1 + 22715);
      if (v22 != 1 && v22 != 4)
        goto LABEL_26;
      goto LABEL_25;
    }
    v23 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 22736) + 75);
    if (v23 == 4)
    {
      *((_DWORD *)a3 + 11) = *((_DWORD *)a3 + 7);
      v24 = a3 + 32;
    }
    else if (v23 == 1)
    {
      *((_DWORD *)a3 + 11) = *((_DWORD *)a3 + 9);
      v24 = a3 + 40;
    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 22736) + 75))
        goto LABEL_24;
      *((_DWORD *)a3 + 11) = *((_DWORD *)a3 + 5);
      v24 = a3 + 24;
    }
    *((_DWORD *)a3 + 12) = *v24;
LABEL_24:
    if (*(unsigned __int8 *)(a1 + 22715) == v23)
    {
LABEL_26:
      v48 = 0;
      LODWORD(a5) = *((_DWORD *)a3 + 12);
      v52[0] = *((float *)a3 + 11);
      a4.n128_f32[0] = v52[0];
      v52[1] = 1.0;
      v53 = *(float *)&a5;
      CAWBAFE::GetBinIndices(a1, (float *)&v48 + 1, (float *)&v48, v52, 1, a4.n128_f64[0], a5, a6, a7, a8);
      CCTFromColorRatio = CAWBAFE::GetCCTFromColorRatio((CAWBAFE *)a1, *((float *)&v48 + 1), (const unsigned __int16 (*)[3])(a1 + 20836), v25, v26, v27, v28);
      CAWBAFE::GetNewCSensorCalGains((CAWBAFE *)a1, &v49, &v50, CCTFromColorRatio, (const sCSensorCalGain *)(a1 + 20996));
      LOWORD(v30) = v49;
      v31 = (float)(v52[0] * (float)v30) * 0.000061035;
      LOWORD(v32) = v50;
      v52[0] = v31;
      v53 = (float)(v53 * (float)v32) * 0.000061035;
      v33 = v53;
      *((float *)a3 + 11) = v31;
      *((float *)a3 + 12) = v33;
      LODWORD(v34) = 1.0;
      v46 = 0.0;
      v47 = 0.0;
      CAWBAFE::ComputeHistWPFromChannelGains((CAWBAFE *)a1, 1.0 / fmaxf(v31, 0.00000011921), 1.0 / fmaxf(v33, 0.00000011921), &v47, &v46, 3.18618444e-58, v34);
      CAWBAFE::InterpCCMfromBases((CAWBAFE *)a1, v47, v46, 0.0, (int (*)[3])(a1 + 732), (const sTuningCurvePoint *)(a1 + 21112), (const __int16 (*)[9])(a1 + 20888), 1.0);
      CAWBAFE::RGBColorSpaceConversion((CAWBAFE *)a1, v14[219].i32[1], a1 + 732);
      goto LABEL_27;
    }
LABEL_25:
    a4 = ((__n128 (*)(uint64_t, unsigned __int8 *))*(_QWORD *)(*(_QWORD *)a1 + 136))(a1, a3);
    goto LABEL_26;
  }
  v20 = *(unsigned __int8 *)(a1 + 22715);
  if (v20 == 4 || v20 == 1)
    (*(void (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)a1 + 136))(a1, a3);
  v21 = (int8x16_t)vcvtq_f32_u32(vmovl_u16(*v14));
  *(float32x4_t *)(a3 + 4) = vmulq_f32(vmulq_f32(*(float32x4_t *)(a3 + 4), (float32x4_t)vextq_s8(v21, v21, 8uLL)), (float32x4_t)vdupq_n_s32(0x38800000u));
LABEL_27:
  CDualLEDsWhitePointProjector::ParamInit(*(_QWORD *)(a1 + 16), a2, (const sPerModuleLEDCalibData *)a3, a1 + 24, v11, v10);
  CDualLEDsWhitePointProjector::WhitePointProject(*(CDualLEDsWhitePointProjector **)(a1 + 16), *v15, v15[1], v15[2], v15[6], v15[7], v15[8], (float *)(a1 + 804), (float *)(a1 + 808), (float *)&v51 + 1, (float *)&v51, v54, (float *)(a1 + 20692));
  if (a2 != 10)
  {
    v35 = 0;
    v36 = (float)((float)(*(float *)(a1 + 804) * 4096.0) + 0.5);
    if (v36 >= 0xFFFF)
      v36 = 0xFFFF;
    if (v36 <= 0x800)
      v36 = 2048;
    *(_DWORD *)(a1 + 672) = v36;
    v37 = (float)((float)(*(float *)(a1 + 808) * 4096.0) + 0.5);
    if (v37 >= 0xFFFF)
      v37 = 0xFFFF;
    if (v37 <= 0x800)
      v37 = 2048;
    *(_DWORD *)(a1 + 680) = v37;
    *(_DWORD *)(a1 + 676) = 4096;
    v38 = a1 + 696;
    v39 = v54;
    do
    {
      for (j = 0; j != 3; ++j)
      {
        v41 = (int)(float)((float)(v39[j] * 4096.0) + 0.5);
        if (v41 >= 0x3FFF)
          v42 = 0x3FFF;
        else
          v42 = (int)(float)((float)(v39[j] * 4096.0) + 0.5);
        if (v41 > 0)
          v41 = v42;
        *(_DWORD *)(v38 + j * 4) = v41;
      }
      ++v35;
      v38 += 12;
      v39 += 3;
    }
    while (v35 != 3);
  }
  v43 = (float)((float)(*((float *)&v51 + 1) * 4096.0) + 0.5);
  if (v43 >= 0xFFFF)
    v43 = 0xFFFF;
  if (v43 <= 0x800)
    v43 = 2048;
  if ((float)((float)(*(float *)&v51 * 4096.0) + 0.5) >= 0xFFFF)
    v44 = 0xFFFF;
  else
    v44 = (float)((float)(*(float *)&v51 * 4096.0) + 0.5);
  if (v44 <= 0x800)
    v45 = 2048;
  else
    v45 = v44;
  *((_DWORD *)v15 + 6) = v43;
  *((_DWORD *)v15 + 7) = 4096;
  *((_DWORD *)v15 + 8) = v45;
  if (a2 == 6)
    *(_BYTE *)(a1 + 773) = 1;
}

void *CAWBAFEH14::GetPhotometerAWBMetaData(const void **this, sPhotometerAWBMetadata *__dst)
{
  return memcpy(__dst, this[60], 0x13CuLL);
}

void *CAWBAFEH14::SetPhotometerAWBMetaData(void **this, sPhotometerAWBMetadata *a2)
{
  return memcpy(this[60], a2, 0x13CuLL);
}

__n128 CAWBAFEH14::GetFDAWBMetaData(CAWBAFEH14 *this, __n128 *__dst)
{
  __n128 *v3;
  uint64_t i;
  char *v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 result;
  __n128 v10;
  __n128 v11;

  v3 = (__n128 *)*((_QWORD *)this + 2653);
  memcpy(__dst, v3, 0xB4DuLL);
  for (i = 0; i != 160; i += 10)
  {
    v5 = (char *)__dst + i;
    v5[2894] = v3[180].n128_i8[i + 14];
    *((_QWORD *)v5 + 362) = *(unint64_t *)((char *)v3[181].n128_u64 + i);
  }
  __dst[191] = v3[191];
  v6 = v3[192];
  v7 = v3[193];
  v8 = v3[194];
  __dst[195] = v3[195];
  __dst[194] = v8;
  __dst[193] = v7;
  __dst[192] = v6;
  result = v3[196];
  v10 = v3[197];
  v11 = v3[198];
  __dst[199] = v3[199];
  __dst[198] = v11;
  __dst[197] = v10;
  __dst[196] = result;
  return result;
}

__n128 CAWBAFEH14::SetFDAWBMetaData(CAWBAFEH14 *this, __n128 *a2)
{
  __n128 *v3;
  uint64_t i;
  uint64_t v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 result;
  __n128 v10;
  __n128 v11;

  v3 = (__n128 *)*((_QWORD *)this + 2653);
  memcpy(v3, a2, 0xB4DuLL);
  for (i = 0; i != 160; i += 10)
  {
    v5 = (uint64_t)v3 + i;
    *(_BYTE *)(v5 + 2894) = a2[180].n128_u8[i + 14];
    *(_QWORD *)(v5 + 2896) = *(unint64_t *)((char *)a2[181].n128_u64 + i);
  }
  v3[191] = a2[191];
  v6 = a2[192];
  v7 = a2[193];
  v8 = a2[194];
  v3[195] = a2[195];
  v3[194] = v8;
  v3[193] = v7;
  v3[192] = v6;
  result = a2[196];
  v10 = a2[197];
  v11 = a2[198];
  v3[199] = a2[199];
  v3[198] = v11;
  v3[197] = v10;
  v3[196] = result;
  return result;
}

void *CAWBAFEH14::GetInternalAWBMetaData(CAWBAFEH14 *this, sAWBInternalParams *__dst)
{
  return memcpy(__dst, (char *)this + 840, sizeof(sAWBInternalParams));
}

uint64_t CAWBAFEH14::SetInternalAWBMetaData(CAWBAFE *this, sAWBInternalParams *a2)
{
  uint64_t result;
  float var16;
  float var17;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  unsigned int v15;
  unsigned int v16;

  result = (uint64_t)memcpy(&this->var44, a2, sizeof(this->var44));
  if (this->var68 == 2)
  {
    var16 = this->var44.var16;
    this->var40 = var16;
    var17 = this->var44.var17;
    this->var41 = var17;
    memcpy(this->var52, this->var44.var26, sizeof(this->var52));
    CAWBAFE::ComputeChannelGainsfromHistWP(this, var16, var17, &this->var35, &this->var36, v6, v7, v8, v9, v10);
    result = CAWBAFE::GetCCTFromColorRatio(this, this->var40, this->var86, v11, v12, v13, v14);
    v15 = (float)((float)(this->var35 * 4096.0) + 0.5);
    this->var20 = result;
    if (v15 >= 0xFFFF)
      v15 = 0xFFFF;
    if (v15 <= 0x800)
      v15 = 2048;
    this->var21[0] = v15;
    v16 = (float)((float)(this->var36 * 4096.0) + 0.5);
    if (v16 >= 0xFFFF)
      v16 = 0xFFFF;
    if (v16 <= 0x800)
      v16 = 2048;
    this->var21[2] = v16;
    this->var21[1] = 4096;
  }
  return result;
}

id createBufferFromMetal(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a1;
  objc_msgSend(v4, "allocator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newBufferDescriptor");

  objc_msgSend(v6, "setLength:", a3);
  objc_msgSend(v6, "setLabel:", 0);
  objc_msgSend(v4, "allocator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "newBufferWithDescriptor:", v6);
  return v8;
}

void sub_23090EE38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23090F120(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t configCCM(float32x2_t *a1, void *a2)
{
  id v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32_t v10;
  float32x2_t v11;
  float32_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  float32x2_t v19;
  float v20;
  float32x2_t v21;
  float v22;
  float32x2_t v23;
  float v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v5 = 0;
  v18 = 0;
  while (1)
  {
    v19.f32[v5] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CCMCoeff"), v5, 0, &v18);
    if (!v18)
      break;
    if (++v5 == 9)
    {
      v6 = 0;
      v7 = (float32x2_t)vdup_n_s32(0x39800000u);
      v8 = vmul_f32(v19, v7);
      v9 = vmul_f32(v21, v7);
      v10 = v22 * 0.00024414;
      v11 = vmul_f32(v23, v7);
      v12 = v24 * 0.00024414;
      a1[1].f32[0] = v20 * 0.00024414;
      *a1 = v8;
      a1[3].f32[0] = v10;
      a1[2] = v9;
      a1[5].f32[0] = v12;
      a1[4] = v11;
      v19.i8[0] = 0;
      while (1)
      {
        a1[10].f32[v6] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CCMOffsetIn"), v6, 0, &v19);
        if (!v19.i8[0])
          goto LABEL_22;
        if (++v6 == 3)
        {
          v13 = 0;
          v19.i8[0] = 0;
          while (1)
          {
            a1[12].f32[v13] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CCMOffsetOut"), v13, 0, &v19);
            if (!v19.i8[0])
              goto LABEL_22;
            if (++v13 == 3)
            {
              v14 = 0;
              v19.i8[0] = 0;
              while (1)
              {
                a1[6].f32[v14] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CCMMin"), v14, 0, &v19);
                if (!v19.i8[0])
                  goto LABEL_22;
                if (++v14 == 3)
                {
                  v15 = 0;
                  v19.i8[0] = 0;
                  while (1)
                  {
                    a1[8].f32[v15] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CCMMax"), v15, 0, &v19);
                    if (!v19.i8[0])
                      goto LABEL_22;
                    if (++v15 == 3)
                    {
                      v16 = 0;
                      goto LABEL_19;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_22:
  v16 = FigSignalErrorAt();
LABEL_19:
  if (*v4 == 1)
    kdebug_trace();

  return v16;
}

void sub_23090F494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t configGAM(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v12;
  char v13;
  char v14;
  char v15;

  v3 = a2;
  v4 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v5 = 0;
  v6 = a1 + 528;
  v15 = 0;
  do
  {
    *(_WORD *)(a1 + 2 * v5) = objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("GammaLUT"), v5, 0, &v15);
    if (!v15)
    {
      v12 = FigSignalErrorAt();
      goto LABEL_19;
    }
    ++v5;
  }
  while (v5 != 257);
  v7 = 0;
  v14 = 0;
  do
  {
    *(_DWORD *)(v6 + 4 * v7) = objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Gamma_offsetIn"), v7, 0, &v14);
    if (!v14)
    {
      v12 = FigSignalErrorAt();
      goto LABEL_19;
    }
    ++v7;
  }
  while (v7 != 3);
  v8 = 0;
  v13 = 0;
  while (1)
  {
    *(_DWORD *)(v6 + 4 * v8 + 16) = objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Gamma_offsetOut"), v8, 0, &v13);
    if (!v13)
      break;
    if (++v8 == 3)
    {
      v9 = 0;
      *(_QWORD *)(a1 + 576) = 0x100000000FFFFLL;
      *(_OWORD *)(a1 + 590) = numIntervalArrayFixedCfgLinear;
      *(_DWORD *)(a1 + 584) = 983297;
      *(_WORD *)(a1 + 572) = 0;
      *(_BYTE *)(a1 + 574) = 0;
      *(_QWORD *)(a1 + 560) = 0;
      *(_BYTE *)(a1 + 568) = 0;
      *(_WORD *)(a1 + 588) = 0;
      *(_OWORD *)(a1 + 606) = *(_OWORD *)algn_230930484;
      *(_QWORD *)&v10 = 0x8000800080008;
      *((_QWORD *)&v10 + 1) = 0x8000800080008;
      *(_OWORD *)(a1 + 622) = v10;
      *(_OWORD *)(a1 + 638) = v10;
      goto LABEL_13;
    }
  }
  v12 = FigSignalErrorAt();
LABEL_19:
  v9 = v12;
LABEL_13:
  if (*v4 == 1)
    kdebug_trace();

  return v9;
}

void sub_23090F708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t configCSC(float32x2_t *a1, void *a2)
{
  id v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32_t v11;
  float32x2_t v12;
  float32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  float32x2_t v21;
  float v22;
  float32x2_t v23;
  float v24;
  float32x2_t v25;
  float v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSCChromaScale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v20 = 0;
    while (1)
    {
      v21.f32[v6] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCCoeff"), v6, 0, &v20);
      if (!v20)
        break;
      if (++v6 == 9)
      {
        v7 = 0;
        v8 = (float32x2_t)vdup_n_s32(0x39800000u);
        v9 = vmul_f32(v21, v8);
        v10 = vmul_f32(v23, v8);
        v11 = v24 * 0.00024414;
        v12 = vmul_f32(v25, v8);
        v13 = v26 * 0.00024414;
        a1[1].f32[0] = v22 * 0.00024414;
        *a1 = v9;
        a1[3].f32[0] = v11;
        a1[2] = v10;
        a1[5].f32[0] = v13;
        a1[4] = v12;
        v21.i8[0] = 0;
        while (1)
        {
          a1[10].f32[v7] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCOffsetIn"), v7, 0, &v21);
          if (!v21.i8[0])
            goto LABEL_25;
          if (++v7 == 3)
          {
            v14 = 0;
            v21.i8[0] = 0;
            while (1)
            {
              a1[12].f32[v14] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCOffsetOut"), v14, 0, &v21);
              if (!v21.i8[0])
                goto LABEL_25;
              if (++v14 == 3)
              {
                v15 = 0;
                v21.i8[0] = 0;
                while (1)
                {
                  a1[6].f32[v15] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCMin"), v15, 0, &v21);
                  if (!v21.i8[0])
                    goto LABEL_25;
                  if (++v15 == 3)
                  {
                    v16 = 0;
                    v21.i8[0] = 0;
                    while (1)
                    {
                      a1[8].f32[v16] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCMax"), v16, 0, &v21);
                      if (!v21.i8[0])
                        goto LABEL_25;
                      if (++v16 == 3)
                      {
                        v21.i8[0] = 0;
                        a1[14].f32[0] = (float)(int)objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("Scale0"), 0, &v21);
                        if (v21.i8[0])
                        {
                          v21.i8[0] = 0;
                          a1[14].f32[1] = (float)(int)objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("Scale1"), 0, &v21);
                          if (v21.i8[0])
                          {
                            v17 = 0;
                            a1[14] = vmul_f32(a1[14], (float32x2_t)0x3900000039000000);
                            goto LABEL_22;
                          }
                        }
                        goto LABEL_25;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_25:
    v19 = FigSignalErrorAt();
  }
  else
  {
    v19 = FigSignalErrorAt();
  }
  v17 = v19;
LABEL_22:
  if (*v4 == 1)
    kdebug_trace();

  return v17;
}

void sub_23090FBA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t configCSC2(float32x2_t *a1, void *a2)
{
  id v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32_t v11;
  float32x2_t v12;
  float32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  float32x2_t v21;
  float v22;
  float32x2_t v23;
  float v24;
  float32x2_t v25;
  float v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSC2ChromaScale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v20 = 0;
    while (1)
    {
      v21.f32[v6] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSC2Coeff"), v6, 0, &v20);
      if (!v20)
        break;
      if (++v6 == 9)
      {
        v7 = 0;
        v8 = (float32x2_t)vdup_n_s32(0x39800000u);
        v9 = vmul_f32(v21, v8);
        v10 = vmul_f32(v23, v8);
        v11 = v24 * 0.00024414;
        v12 = vmul_f32(v25, v8);
        v13 = v26 * 0.00024414;
        a1[1].f32[0] = v22 * 0.00024414;
        *a1 = v9;
        a1[3].f32[0] = v11;
        a1[2] = v10;
        a1[5].f32[0] = v13;
        a1[4] = v12;
        v21.i8[0] = 0;
        while (1)
        {
          a1[10].f32[v7] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSC2OffsetIn"), v7, 0, &v21);
          if (!v21.i8[0])
            goto LABEL_25;
          if (++v7 == 3)
          {
            v14 = 0;
            v21.i8[0] = 0;
            while (1)
            {
              a1[12].f32[v14] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSC2OffsetOut"), v14, 0, &v21);
              if (!v21.i8[0])
                goto LABEL_25;
              if (++v14 == 3)
              {
                v15 = 0;
                v21.i8[0] = 0;
                while (1)
                {
                  a1[6].f32[v15] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSC2Min"), v15, 0, &v21);
                  if (!v21.i8[0])
                    goto LABEL_25;
                  if (++v15 == 3)
                  {
                    v16 = 0;
                    v21.i8[0] = 0;
                    while (1)
                    {
                      a1[8].f32[v16] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSC2Max"), v16, 0, &v21);
                      if (!v21.i8[0])
                        goto LABEL_25;
                      if (++v16 == 3)
                      {
                        v21.i8[0] = 0;
                        a1[14].f32[0] = (float)(int)objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("Scale0"), 0, &v21);
                        if (v21.i8[0])
                        {
                          v21.i8[0] = 0;
                          a1[14].f32[1] = (float)(int)objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("Scale1"), 0, &v21);
                          if (v21.i8[0])
                          {
                            v17 = 0;
                            a1[14] = vmul_f32(a1[14], (float32x2_t)0x3900000039000000);
                            goto LABEL_22;
                          }
                        }
                        goto LABEL_25;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_25:
    v19 = FigSignalErrorAt();
  }
  else
  {
    v19 = FigSignalErrorAt();
  }
  v17 = v19;
LABEL_22:
  if (*v4 == 1)
    kdebug_trace();

  return v17;
}

void sub_23091006C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t configColorHist(float32x4_t *a1, void *a2)
{
  id v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;

  v3 = a2;
  v4 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v20 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ColorHistConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a1->i8[0] = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("En"), 0, &v20) != 0;

  if (v20)
  {
    v20 = 0;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ColorHistConfig"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a1->i8[1] = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", CFSTR("CountClipEn"), 0, &v20) != 0;

    if (v20)
    {
      v7 = 0;
      v20 = 0;
      while (1)
      {
        a1[9].f32[v7] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistDB_Offset"), v7, 0, &v20);
        if (!v20)
          break;
        if (++v7 == 3)
        {
          v8 = 0;
          v20 = 0;
          while (1)
          {
            a1[8].f32[v8] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistDB_Min"), v8, 0, &v20);
            if (!v20)
              goto LABEL_35;
            if (++v8 == 3)
            {
              v9 = 0;
              v20 = 0;
              while (1)
              {
                a1[7].f32[v9] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistDB_Max"), v9, 0, &v20);
                if (!v20)
                  goto LABEL_35;
                if (++v9 == 3)
                {
                  v10 = 0;
                  v20 = 0;
                  while (1)
                  {
                    a1[6].f32[v10] = (float)(int)objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistDB_Gain"), v10, 0, &v20);
                    if (!v20)
                      goto LABEL_35;
                    if (++v10 == 3)
                    {
                      a1[6] = vmulq_f32(a1[6], (float32x4_t)vdupq_n_s32(0x38800000u));
                      v20 = 0;
                      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ColorHistRegionStartXY"));
                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                      a1->i16[1] = objc_msgSend(v11, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartX"), 0, &v20);

                      if (v20)
                      {
                        v20 = 0;
                        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ColorHistRegionStartXY"));
                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                        a1->i16[2] = objc_msgSend(v12, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartY"), 0, &v20);

                        if (v20)
                        {
                          a1->i16[1] = (unsigned __int16)a1->i16[1] >> 2;
                          a1->i16[2] = (unsigned __int16)a1->i16[2] >> 2;
                          v20 = 0;
                          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ColorHistRegionEndXY"));
                          v13 = (void *)objc_claimAutoreleasedReturnValue();
                          a1->i16[3] = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndX"), 0, &v20);

                          if (v20)
                          {
                            v20 = 0;
                            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ColorHistRegionEndXY"));
                            v14 = (void *)objc_claimAutoreleasedReturnValue();
                            a1->i16[4] = objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndY"), 0, &v20);

                            if (v20)
                            {
                              a1->i16[3] = (unsigned __int16)a1->i16[3] >> 2;
                              a1->i16[4] = (unsigned __int16)a1->i16[4] >> 2;
                              v20 = 0;
                              a1->f32[3] = (float)(int)objc_msgSend(v3, "cmi_intValueForKey:defaultValue:found:", CFSTR("ColorHistOffsetC1"), 0, &v20);
                              if (v20)
                              {
                                v20 = 0;
                                a1[1].f32[0] = (float)(int)objc_msgSend(v3, "cmi_intValueForKey:defaultValue:found:", CFSTR("ColorHistOffsetC2"), 0, &v20);
                                if (v20)
                                {
                                  v20 = 0;
                                  a1[1].f32[1] = (float)(int)objc_msgSend(v3, "cmi_intValueForKey:defaultValue:found:", CFSTR("ColorHistScaleC1"), 0, &v20);
                                  if (v20)
                                  {
                                    v20 = 0;
                                    v15 = (float)(int)objc_msgSend(v3, "cmi_intValueForKey:defaultValue:found:", CFSTR("ColorHistScaleC2"), 0, &v20);
                                    a1[1].f32[2] = v15;
                                    if (v20)
                                    {
                                      v16 = 0;
                                      a1[1].f32[1] = a1[1].f32[1] * 0.000015259;
                                      a1[1].f32[2] = v15 * 0.000015259;
                                      v20 = 0;
                                      while (1)
                                      {
                                        a1[1].i16[v16 + 6] = objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistCount"), v16, 0, &v20);
                                        if (!v20)
                                          break;
                                        if (++v16 == 16)
                                        {
                                          v17 = 0;
                                          v20 = 0;
                                          while (1)
                                          {
                                            a1[3].i16[v17 + 6] = objc_msgSend(v3, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistYThd"), v17, 0, &v20);
                                            if (!v20)
                                              goto LABEL_35;
                                            if (++v17 == 15)
                                            {
                                              v18 = 0;
                                              a1[5].i16[5] = -1;
                                              goto LABEL_32;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      goto LABEL_35;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_35:
  v18 = FigSignalErrorAt();
LABEL_32:
  if (*v4 == 1)
    kdebug_trace();

  return v18;
}

void sub_230910830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t configPixFilt(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v12 = a2;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PFConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PFLumaMinMax"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PFC1Thd"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PFC2Thd"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v24 = 0;
          *(_BYTE *)(a1 + 2) = objc_msgSend(v5, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CountClipEn"), a3, 0, &v24) != 0;
          if (v24)
          {
            v23 = 0;
            *(_BYTE *)a1 = objc_msgSend(v5, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CondSel"), a3, 0, &v23);
            if (v23)
            {
              v22 = 0;
              *(_BYTE *)(a1 + 1) = objc_msgSend(v5, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("StatSel"), a3, 0, &v22);
              if (v22)
              {
                v21 = 0;
                *(_DWORD *)(a1 + 4) = objc_msgSend(v6, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Min"), a3, 0, &v21);
                if (v21)
                {
                  v20 = 0;
                  *(_DWORD *)(a1 + 8) = objc_msgSend(v6, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Max"), a3, 0, &v20);
                  if (v20)
                  {
                    v19 = 0;
                    *(_DWORD *)(a1 + 12) = objc_msgSend(v7, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("C1min"), a3, 0, &v19);
                    if (v19)
                    {
                      v18 = 0;
                      *(_DWORD *)(a1 + 16) = objc_msgSend(v7, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("C1max"), a3, 0, &v18);
                      if (v18)
                      {
                        v17 = 0;
                        *(_DWORD *)(a1 + 20) = objc_msgSend(v8, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("C2min"), a3, 0, &v17);
                        if (v17)
                        {
                          v16 = 0;
                          *(_DWORD *)(a1 + 24) = objc_msgSend(v8, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("C2max"), a3, 0, &v16);
                          if (v16)
                          {
                            *(_DWORD *)(a1 + 28) = -1;
                            v15 = 0;
                            *(_DWORD *)(a1 + 32) = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PFLineOffset"), a3, 0, &v15);
                            if (v15)
                            {
                              v14 = 0;
                              *(_DWORD *)(a1 + 36) = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PFLineDeltaC1"), a3, 0, &v14);
                              if (v14)
                              {
                                v13 = 0;
                                *(_DWORD *)(a1 + 40) = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PFLineDeltaC2"), a3, 0, &v13);
                                if (v13)
                                {
                                  v9 = 0;
                                  goto LABEL_20;
                                }
                                v11 = FigSignalErrorAt();
                              }
                              else
                              {
                                v11 = FigSignalErrorAt();
                              }
                            }
                            else
                            {
                              v11 = FigSignalErrorAt();
                            }
                          }
                          else
                          {
                            v11 = FigSignalErrorAt();
                          }
                        }
                        else
                        {
                          v11 = FigSignalErrorAt();
                        }
                      }
                      else
                      {
                        v11 = FigSignalErrorAt();
                      }
                    }
                    else
                    {
                      v11 = FigSignalErrorAt();
                    }
                  }
                  else
                  {
                    v11 = FigSignalErrorAt();
                  }
                }
                else
                {
                  v11 = FigSignalErrorAt();
                }
              }
              else
              {
                v11 = FigSignalErrorAt();
              }
            }
            else
            {
              v11 = FigSignalErrorAt();
            }
          }
          else
          {
            v11 = FigSignalErrorAt();
          }
        }
        else
        {
          v11 = FigSignalErrorAt();
        }
        v9 = v11;
      }
      else
      {
        v9 = FigSignalErrorAt();
        v8 = 0;
      }
    }
    else
    {
      v9 = FigSignalErrorAt();
      v7 = 0;
      v8 = 0;
    }
  }
  else
  {
    v9 = FigSignalErrorAt();
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
LABEL_20:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v9;
}

void sub_230910FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t configAWBStatsDB(float32x4_t *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AWBAE_StatsDB_Gain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v13 = FigSignalErrorAt();
LABEL_15:
    v11 = v13;
LABEL_17:

    goto LABEL_11;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v6 = 0;
    v13 = FigSignalErrorAt();
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "count") != 3)
  {
    v11 = FigSignalErrorAt();
    v6 = v7;
    goto LABEL_17;
  }
  for (i = 0; objc_msgSend(v7, "count") > i; ++i)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a1[1].f32[i] = (float)(int)objc_msgSend(v9, "intValue");

  }
  v10 = 0;
  a1[1] = vmulq_f32(a1[1], (float32x4_t)vdupq_n_s32(0x38800000u));
  v14 = 0;
  while (1)
  {
    a1->i32[v10] = objc_msgSend(v5, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("ColorHistDB_Offset"), v10, 0, &v14);
    if (!v14)
      break;
    if (++v10 == 3)
    {
      v11 = 0;
      goto LABEL_11;
    }
  }
  v11 = FigSignalErrorAt();
LABEL_11:

  return v11;
}

void sub_23091120C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t configTiles(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  unsigned __int16 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  void *v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v16 = a2;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Config"), v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TileRegionStartXY"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TileRegionEndXY"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TileIntervals"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          v24 = 0;
          *(_BYTE *)a1 = objc_msgSend(v3, "cmi_intValueForKey:defaultValue:found:", CFSTR("AWBAEStatsTileBitDepth"), 0, &v24) != 0;
          if (v24)
          {
            v23 = 0;
            *(_DWORD *)(a1 + 4) = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartX"), 0, &v23);
            if (v23)
            {
              v22 = 0;
              v7 = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartY"), 0, &v22);
              *(_DWORD *)(a1 + 8) = v7;
              if (v22)
              {
                *(int *)(a1 + 4) /= 4;
                *(_DWORD *)(a1 + 8) = v7 / 4;
                v21 = 0;
                *(_DWORD *)(a1 + 12) = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndX"), 0, &v21);
                if (v21)
                {
                  v20 = 0;
                  v8 = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndY"), 0, &v20);
                  *(_DWORD *)(a1 + 16) = v8;
                  if (v20)
                  {
                    *(int *)(a1 + 12) /= 4;
                    *(_DWORD *)(a1 + 16) = v8 / 4;
                    v19 = 0;
                    *(_WORD *)(a1 + 20) = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", CFSTR("HorzInt"), 0, &v19);
                    if (v19)
                    {
                      v18 = 0;
                      v9 = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", CFSTR("VertInt"), 0, &v18);
                      *(_WORD *)(a1 + 22) = v9;
                      if (v18)
                      {
                        v10 = 0;
                        *(_WORD *)(a1 + 20) >>= 2;
                        *(_WORD *)(a1 + 22) = v9 >> 2;
LABEL_15:
                        v11 = v4;
                        v12 = v5;
                        v13 = v6;
                        goto LABEL_16;
                      }
                      v15 = FigSignalErrorAt();
                    }
                    else
                    {
                      v15 = FigSignalErrorAt();
                    }
                  }
                  else
                  {
                    v15 = FigSignalErrorAt();
                  }
                }
                else
                {
                  v15 = FigSignalErrorAt();
                }
              }
              else
              {
                v15 = FigSignalErrorAt();
              }
            }
            else
            {
              v15 = FigSignalErrorAt();
            }
          }
          else
          {
            v15 = FigSignalErrorAt();
          }
        }
        else
        {
          v15 = FigSignalErrorAt();
        }
        v10 = v15;
        goto LABEL_15;
      }
      v13 = 0;
      v10 = FigSignalErrorAt();
      v11 = v4;
      v12 = v5;
    }
    else
    {
      v12 = 0;
      v10 = FigSignalErrorAt();
      v11 = v4;
      v13 = 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = FigSignalErrorAt();
    v12 = 0;
    v13 = 0;
  }
LABEL_16:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v10;
}

void sub_2309117DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_230912608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

uint64_t configLSC(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  _DWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  double v21;
  int v22;
  uint64_t v23;
  char v25;

  v7 = a2;
  v8 = a3;
  v25 = 0;
  v9 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE11A30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    if (v12)
    {
      v13 = *(_DWORD *)(v12 + 20);
      v14 = *(_DWORD *)(v12 + 24);
      *(_WORD *)(a1 + 2) = v13;
      *(_WORD *)(a1 + 4) = v14;
      *(_WORD *)(a1 + 24) = *(_DWORD *)(v12 + 28) / (unsigned __int16)v13;
      *(_WORD *)(a1 + 26) = *(_DWORD *)(v12 + 32) / (unsigned __int16)v13;
      *(_WORD *)(a1 + 28) = *(_DWORD *)(v12 + 36) / (unsigned __int16)v13;
      *(_WORD *)(a1 + 30) = *(_DWORD *)(v12 + 40) / (unsigned __int16)v13;
      *(_BYTE *)a1 = 1;
      _D1 = (float32x2_t)0x3F0000003F000000;
      if ((a4 - 1) >= 2)
      {
        if (a4 != 3)
        {
LABEL_10:
          v23 = FigSignalErrorAt();
          goto LABEL_11;
        }
        __asm { FMOV            V1.2S, #0.25 }
      }
      __asm { FMOV            V2.2S, #1.0 }
      v21 = COERCE_DOUBLE(vmul_f32(vdiv_f32(_D2, vcvt_f32_u32(*(uint32x2_t *)(v12 + 12))), _D1));
      *(double *)(a1 + 16) = v21;
      LODWORD(v21) = 1.0;
      objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11CD0], &v25, v21);
      *(_DWORD *)(a1 + 12) = v22;
      if (v25)
      {
        v23 = 0;
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  v23 = 0xFFFFFFFFLL;
LABEL_11:
  if (*v9 == 1)
    kdebug_trace();

  return v23;
}

void sub_230912888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t configLinearRGBToANSTInput(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _DWORD *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  int v12;
  int v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  int64x2_t v32;
  uint64x2_t v33;
  int64x2_t v34;
  id v35;
  uint64_t v36;
  uint64_t i;
  unint64_t j;
  float v39;
  float v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  uint64_t v51;
  void *v52;
  void *v53;
  float v54;
  uint64_t v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;

  v60 = a2;
  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("CaptureDebugInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PreviewMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("CaptureDebugInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PreviewMetadata"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v60;
  }

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11C10]);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (_DWORD *)objc_msgSend(v7, "bytes");
    if (v8)
    {
      LODWORD(v10) = *v8;
      LODWORD(v11) = v8[1];
      DWORD1(v10) = v8[3];
      DWORD2(v10) = v8[6];
      DWORD1(v11) = v8[4];
      DWORD2(v11) = v8[7];
      LODWORD(v14) = v8[2];
      v12 = (_DWORD)v8 + 20;
      v13 = (_DWORD)v8 + 32;
      DWORD1(v14) = v8[5];
      DWORD2(v14) = v8[8];
    }
    else
    {
      v10 = *MEMORY[0x24BDAEDF8];
      v11 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      v9 = *(_DWORD *)(MEMORY[0x24BDAEDF8] + 12);
      v12 = *(_DWORD *)(MEMORY[0x24BDAEDF8] + 28);
      v14 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
      v13 = *(_DWORD *)(MEMORY[0x24BDAEDF8] + 44);
    }
    *(_DWORD *)(a1 + 24) = DWORD2(v10);
    *(_QWORD *)(a1 + 16) = v10;
    *(_DWORD *)(a1 + 28) = v9;
    *(_DWORD *)(a1 + 40) = DWORD2(v11);
    *(_QWORD *)(a1 + 32) = v11;
    *(_DWORD *)(a1 + 56) = DWORD2(v14);
    *(_DWORD *)(a1 + 44) = v12;
    *(_QWORD *)(a1 + 48) = v14;
    *(_DWORD *)(a1 + 60) = v13;
    v15 = *MEMORY[0x24BE11B88];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11B88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_38;
    objc_msgSend(v6, "objectForKeyedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedShortValue");

    v19 = *MEMORY[0x24BE11B80];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11B80]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_38;
    objc_msgSend(v6, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedShortValue");

    v23 = *MEMORY[0x24BE11B78];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11B78]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedShortValue");
      *(float *)&v27 = (float)v18 * 0.00024414;
      v59 = v27;
      *(float *)&v27 = (float)v22 * 0.00024414;
      v58 = v27;
      *(float *)&v27 = (float)v26 * 0.00024414;
      v57 = v27;

      v28 = v59;
      DWORD1(v28) = v58;
      DWORD2(v28) = v57;
      *(_OWORD *)a1 = v28;
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11C90]);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "bytes");
      v31 = 0;
      if (v30)
      {
        do
        {
          *(_WORD *)(a1 + 64 + v31) = *(_WORD *)(v30 + 2 + v31);
          v31 += 2;
        }
        while (v31 != 514);
      }
      else
      {
        v32 = (int64x2_t)xmmword_23092D460;
        v33 = (uint64x2_t)vdupq_n_s64(0x101uLL);
        v34 = vdupq_n_s64(2uLL);
        do
        {
          if ((vmovn_s64((int64x2_t)vcgtq_u64(v33, (uint64x2_t)v32)).u8[0] & 1) != 0)
            *(_WORD *)(a1 + 2 * v31 + 64) = (int)(float)((float)((float)v31 * 0.0039062) * 65535.0);
          if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x101uLL), *(uint64x2_t *)&v32)).i32[1] & 1) != 0)
            *(_WORD *)(a1 + 2 * v31 + 66) = (int)(float)((float)((float)(v31 + 1) * 0.0039062) * 65535.0);
          v31 += 2;
          v32 = vaddq_s64(v32, v34);
        }
        while (v31 != 258);
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11CA0], v57, v58);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36 = objc_msgSend(v35, "bytes");
      if (v36)
      {
        for (i = 0; i != 514; i += 2)
          *(_WORD *)(a1 + 578 + i) = *(_WORD *)(v36 + 2 + i);
      }
      else
      {
        for (j = 0; j != 257; ++j)
        {
          v39 = (float)j * 0.0039062;
          if (v39 >= 0.018)
            v40 = (float)(powf(v39, 0.45) * 1.099) + -0.099;
          else
            v40 = v39 * 4.5;
          *(_WORD *)(a1 + 578 + 2 * j) = (int)(float)(v40 * 65535.0);
        }
      }
      v41 = *MEMORY[0x24BE11D98];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11D98]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "intValue");

        v45 = *MEMORY[0x24BE11DA0];
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11DA0]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (float)v44 * 0.0039062;

        if (v46)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "floatValue");
          v50 = v49;

          v47 = v47 / v50;
        }
      }
      else
      {
        v47 = 1.0;
      }
      v51 = *MEMORY[0x24BE11DA8];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11DA8]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (float)(int)objc_msgSend(v53, "intValue") * 0.0039062;

      }
      else
      {
        v54 = 1.0;
      }
      *(float *)(a1 + 1092) = v47 / v54;

      v55 = 0;
    }
    else
    {
LABEL_38:
      v55 = FigSignalErrorAt();
    }
  }
  else
  {
    v55 = FigSignalErrorAt();
    v7 = 0;
  }

  return v55;
}

void sub_230912F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_2309132BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t configCCM(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5, void *a6, float a7)
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  float v17;
  float32x2_t v18;
  float v19;
  float32x2_t v20;
  float v21;
  float32x2_t v22;
  float v23;
  void *v24;
  BOOL v25;
  void *v26;
  float v27;
  void *v28;
  float v29;
  void *v30;
  float v31;
  void *v32;
  float v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  float v38;
  float v39;
  uint64_t v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  BOOL v51;
  void *v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  void *v66;
  unsigned int v67;
  void *v68;
  unsigned int v69;
  uint64_t v70;
  double v71;
  int8x16_t v72;
  int8x16_t v73;
  int8x16_t v74;
  float32x2_t v80;
  float32x2_t v81;
  float32x2_t v82;
  float32x2_t v83;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  float v89;
  float v90;
  float v91;
  float v92;
  id v93;
  char v94;
  float32x2_t v95;
  float v96;
  float32x2_t v97;
  float v98;
  float32x2_t v99;
  float v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v93 = a6;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v16 = 0;
  v94 = 0;
  do
  {
    v95.f32[v16] = (float)(int)objc_msgSend(v13, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CCMCoef"), v16, 0, &v94);
    if (!v94)
    {
      v70 = FigSignalErrorAt();
      goto LABEL_17;
    }
    ++v16;
  }
  while (v16 != 9);
  v17 = (float)(a7 * 0.0039062) * 0.00024414;
  v18 = vmul_n_f32(v95, v17);
  v19 = v17 * v96;
  v20 = vmul_n_f32(v97, v17);
  v21 = v17 * v98;
  v22 = vmul_n_f32(v99, v17);
  v23 = v17 * v100;
  *(float *)(a1 + 8) = v19;
  *(float32x2_t *)a1 = v18;
  *(float *)(a1 + 24) = v21;
  *(float32x2_t *)(a1 + 16) = v20;
  *(float *)(a1 + 40) = v23;
  *(float32x2_t *)(a1 + 32) = v22;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HiCCTrgAbs"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (!v25)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HiCCTrgAbs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v92 = v27;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HiCCTbgAbs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v91 = v29;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("LowCCTrgAbs"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v90 = v31;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("LowCCTbgAbs"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v89 = v33;
    goto LABEL_11;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE11B38]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE11B40]);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v32 && v34)
  {
    v36 = *MEMORY[0x24BE11B30];
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x24BE11B30]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    v39 = v38;

    v40 = *MEMORY[0x24BE11B28];
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x24BE11B28]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "floatValue");
    v43 = v42;

    objc_msgSend(v35, "objectForKeyedSubscript:", v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "floatValue");
    v46 = v45;

    objc_msgSend(v35, "objectForKeyedSubscript:", v40);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "floatValue");
    v49 = v48;

    v92 = v39 * 16384.0;
    v91 = v43 * 16384.0;
    v90 = v46 * 16384.0;
    v89 = v49 * 16384.0;
LABEL_11:

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hiCCTrgIdeal"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (!v51)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hiCCTrgIdeal"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "floatValue");
      v88 = v53;

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hiCCTbgIdeal"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "floatValue");
      v87 = v55;

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lowCCTrgIdeal"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "floatValue");
      v86 = v57;

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lowCCTbgIdeal"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v85 = v58;
LABEL_16:

      v70 = 0;
      v71 = fmin(fmax((float)a5, 2500.0), 5000.0);
      v72 = *(int8x16_t *)a1;
      v73 = *(int8x16_t *)(a1 + 16);
      v74 = *(int8x16_t *)(a1 + 32);
      __asm { FMOV            V2.2S, #1.0 }
      v80 = vdiv_f32(vmla_n_f32(vmul_n_f32((float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32((float32x2_t)__PAIR64__(LODWORD(v91), LODWORD(v92))), (int8x8_t)vcgtz_f32((float32x2_t)__PAIR64__(v87, v88))), (int8x8_t)vdiv_f32((float32x2_t)__PAIR64__(v87, v88), (float32x2_t)__PAIR64__(LODWORD(v91), LODWORD(v92))), _D2), (float)(v71 - 2500)), (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32((float32x2_t)__PAIR64__(LODWORD(v89), LODWORD(v90))), (int8x8_t)vcgtz_f32((float32x2_t)__PAIR64__(v85, v86))), (int8x8_t)vdiv_f32((float32x2_t)__PAIR64__(v85, v86), (float32x2_t)__PAIR64__(LODWORD(v89), LODWORD(v90))), _D2),
                (float)(5000 - v71)),
              (float32x2_t)vdup_n_s32(0x451C4000u));
      v81 = vmul_f32((float32x2_t)vzip1_s32(*(int32x2_t *)a1, (int32x2_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL)), v80);
      *(_DWORD *)(a1 + 8) = v81.i32[1];
      v81.i32[1] = v72.i32[1];
      *(float32x2_t *)a1 = v81;
      v82 = vmul_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v73.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v73, v73, 8uLL)), v80);
      *(_DWORD *)(a1 + 24) = v82.i32[1];
      v82.i32[1] = v73.i32[1];
      *(float32x2_t *)(a1 + 16) = v82;
      v83 = vmul_f32(v80, (float32x2_t)vzip1_s32(*(int32x2_t *)v74.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v74, v74, 8uLL)));
      *(_DWORD *)(a1 + 40) = v83.i32[1];
      v83.i32[1] = v74.i32[1];
      *(float32x2_t *)(a1 + 32) = v83;
      *(_DWORD *)(a1 + 88) = -974530560;
      *(_QWORD *)(a1 + 80) = vdupq_n_s32(0xC5E9D800).u64[0];
      *(_DWORD *)(a1 + 104) = 1172953088;
      *(_QWORD *)(a1 + 96) = vdupq_n_s32(0x45E9D800u).u64[0];
      *(_DWORD *)(a1 + 56) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      *(_DWORD *)(a1 + 72) = 1199570688;
      *(_QWORD *)(a1 + 64) = vdupq_n_s32(0x477FFF00u).u64[0];
      goto LABEL_17;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11B38]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11B40]);
    v59 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v59;
    if (v32 && v59)
    {
      v60 = *MEMORY[0x24BE11B30];
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x24BE11B30]);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "floatValue");
      v88 = v62;

      v63 = *MEMORY[0x24BE11B28];
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x24BE11B28]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "floatValue");
      v87 = v65;

      objc_msgSend(v35, "objectForKeyedSubscript:", v60);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "floatValue");
      v86 = v67;

      objc_msgSend(v35, "objectForKeyedSubscript:", v63);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "floatValue");
      v85 = v69;

      goto LABEL_16;
    }
  }
  v70 = FigSignalErrorAt();

LABEL_17:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v70;
}

void sub_230913A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_2309162AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_230916D70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_230918638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,void *a23)
{
  void *v23;
  uint64_t v24;

  _Unwind_Resume(a1);
}

void sub_230918A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_230918FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_230919184(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void CDualLEDsWhitePointProjector::~CDualLEDsWhitePointProjector(CDualLEDsWhitePointProjector *this)
{
  JUMPOUT(0x2348BC8E0);
}

float CDualLEDsWhitePointProjector::xyYToRGB(CDualLEDsWhitePointProjector *this, float a2, float a3, float a4, float *a5, float *a6, float *a7)
{
  float *v7;
  float v8;
  float v9;
  float result;

  v7 = (float *)*((_QWORD *)this + 1);
  v8 = (float)(a4 / a3) * a2;
  v9 = (1.0 - a2 - a3) * (float)(a4 / a3);
  *a5 = (float)((float)(v7[10] * a4) + (float)(v7[9] * v8)) + (float)(v7[11] * v9);
  *a6 = (float)((float)(v7[13] * a4) + (float)(v7[12] * v8)) + (float)(v7[14] * v9);
  result = (float)((float)(v7[16] * a4) + (float)(v7[15] * v8)) + (float)(v7[17] * v9);
  *a7 = result;
  return result;
}

float CDualLEDsWhitePointProjector::EstimateCurve(float a1, uint64_t a2, uint64_t a3)
{
  float *v3;
  unint64_t i;
  float *v5;
  float v6;
  float v7;
  double v8;
  float v9;
  double v10;

  v3 = (float *)(a3 + 8);
  for (i = 1; i != 3; ++i)
  {
    if (*v3 > a1)
      break;
    v3 += 2;
  }
  if (i >= 2)
    i = 2;
  v5 = (float *)(a3 + 8 * i);
  v6 = v5[1];
  v7 = *(v5 - 2);
  if (*v5 != v7)
  {
    v8 = (float)((float)(a1 - v7) / (float)(*v5 - v7));
    if (v8 > 1.0)
      v8 = 1.0;
    if (v8 <= 0.0)
      v8 = 0.0;
    v9 = v8;
    v6 = (float)(v6 * v9) + (1.0 - v9) * *(v5 - 1);
  }
  v10 = v6;
  if (v6 > 1.0)
    v10 = 1.0;
  if (v10 <= 0.0)
    return 0.0;
  return v10;
}

int8x8_t CDualLEDsWhitePointProjector::updateEllipseWithLEDCalibData(CDualLEDsWhitePointProjector *this, float a2, const sPerModuleLEDCalibData *a3)
{
  float cw_rg;
  float cw_bg;
  float ww_rg;
  float v6;
  float v7;
  float *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float32x2_t v32;
  int8x8_t result;

  cw_rg = a3->cw_rg;
  cw_bg = a3->cw_bg;
  ww_rg = a3->ww_rg;
  v6 = 1.0 / ww_rg;
  v7 = a3->ww_bg / ww_rg;
  v8 = (float *)*((_QWORD *)this + 1);
  v9 = v8[1];
  v10 = v8[2];
  v11 = v8[3];
  v12 = (float)(v9 + (float)(*v8 * cw_rg)) + (float)(v10 * cw_bg);
  v13 = v8[6];
  v14 = v8[7];
  v15 = v8[8];
  v16 = (float)(v14 + (float)(v13 * cw_rg)) + (float)(v15 * cw_bg);
  v17 = v8[4];
  v18 = v8[5];
  v19 = (float)(v17 + (float)(v11 * cw_rg)) + (float)(v18 * cw_bg);
  v20 = v16 + (float)(v12 + v19);
  v21 = v12 / v20;
  v22 = v19 / v20;
  v23 = (float)(*v8 + (float)(v6 * v9)) + (float)(v10 * v7);
  v24 = (float)(v13 + (float)(v6 * v14)) + (float)(v15 * v7);
  v25 = (float)(v11 + (float)(v6 * v17)) + (float)(v18 * v7);
  v26 = v24 + (float)(v23 + v25);
  *((float *)this + 4) = (float)((float)(v23 / v26) * a2) + (float)((float)(1.0 - a2) * v21);
  *((float *)this + 5) = (float)((float)(v25 / v26) * a2) + (float)((float)(1.0 - a2) * v22);
  __asm { FMOV            V1.2S, #0.25 }
  v32 = vmul_f32(*(float32x2_t *)((char *)this + 24), _D1);
  result = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL), vcvtq_f64_f32(v32))), (int8x8_t)vdup_n_s32(0x3C23D70Au), (int8x8_t)v32);
  *((int8x8_t *)this + 3) = result;
  return result;
}

int8x8_t CDualLEDsWhitePointProjector::updateEllipseWithLEDCalibData(CDualLEDsWhitePointProjector *this, const sPerModuleLEDCalibData *a2)
{
  float strb_rg;
  float strb_bg;
  float *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float32x2_t v14;
  int8x8_t result;

  strb_rg = a2->strb_rg;
  strb_bg = a2->strb_bg;
  v4 = (float *)*((_QWORD *)this + 1);
  v5 = (float)(v4[1] + (float)(*v4 * strb_rg)) + (float)(v4[2] * strb_bg);
  v6 = (float)(v4[7] + (float)(v4[6] * strb_rg)) + (float)(v4[8] * strb_bg);
  v7 = (float)(v4[4] + (float)(v4[3] * strb_rg)) + (float)(v4[5] * strb_bg);
  v8 = v6 + (float)(v5 + v7);
  *((float *)this + 4) = v5 / v8;
  *((float *)this + 5) = v7 / v8;
  __asm { FMOV            V1.2S, #0.25 }
  v14 = vmul_f32(*(float32x2_t *)((char *)this + 24), _D1);
  result = vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL), vcvtq_f64_f32(v14))), (int8x8_t)vdup_n_s32(0x3C23D70Au), (int8x8_t)v14);
  *((int8x8_t *)this + 3) = result;
  return result;
}

void CDualLEDsWhitePointProjector::ParamInit(uint64_t a1, unsigned int a2, const sPerModuleLEDCalibData *a3, uint64_t a4, float a5, float a6)
{
  uint64_t v10;
  float v11;
  uint64_t v12;
  double v13;
  double v14;
  float v15;
  float v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  unsigned int version;

  if (a2 <= 0xB && ((1 << a2) & 0xC01) != 0)
  {
    v10 = a4;
    *(_QWORD *)(a1 + 8) = a4;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 8);
  }
  *(float *)(a1 + 40) = a6;
  v11 = CDualLEDsWhitePointProjector::EstimateCurve(a6, a1, v10 + 408);
  v12 = 0;
  if (v11 <= 0.0)
    v13 = v11 + 1.0;
  else
    v13 = 1.0;
  v14 = v13 * a6;
  if (v14 >= 1.0)
    v14 = 1.0;
  v15 = v14;
  v16 = 0.0;
  do
  {
    v16 = *(float *)(v10 + 192 + v12) + (float)(v15 * v16);
    v12 += 4;
  }
  while (v12 != 24);
  v17 = 0;
  *(float *)(a1 + 16) = v16;
  v18 = 0.0;
  do
  {
    v18 = *(float *)(v10 + 216 + v17) + (float)(v15 * v18);
    v17 += 4;
  }
  while (v17 != 24);
  v19 = 0;
  *(float *)(a1 + 20) = v18;
  v20 = 0.0;
  do
  {
    v20 = *(float *)(v10 + 240 + v19) + (float)(v15 * v20);
    v19 += 4;
  }
  while (v19 != 24);
  v21 = 0;
  *(float *)(a1 + 24) = v20;
  v22 = 0.0;
  do
  {
    v22 = *(float *)(v10 + 264 + v21) + (float)(v15 * v22);
    v21 += 4;
  }
  while (v21 != 24);
  v23 = 0;
  *(float *)(a1 + 28) = v22;
  v24 = 0.0;
  do
  {
    v24 = *(float *)(v10 + 288 + v23) + (float)(v15 * v24);
    v23 += 4;
  }
  while (v23 != 24);
  v25 = 0;
  *(float *)(a1 + 32) = v24;
  v26 = 0.0;
  do
  {
    v26 = *(float *)(v10 + 312 + v25) + (float)(v15 * v26);
    v25 += 4;
  }
  while (v25 != 24);
  *(float *)(a1 + 36) = v26;
  *(float *)(a1 + 44) = a5;
  if (a3->isvalid)
  {
    version = a3->version;
    if (version > 2)
    {
      if (version == 3)
        CDualLEDsWhitePointProjector::updateEllipseWithLEDCalibData((CDualLEDsWhitePointProjector *)a1, a3);
    }
    else
    {
      CDualLEDsWhitePointProjector::updateEllipseWithLEDCalibData((CDualLEDsWhitePointProjector *)a1, v15, a3);
    }
  }
}

void CDualLEDsWhitePointProjector::WhitePointProject(CDualLEDsWhitePointProjector *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, float *a8, float *a9, float *a10, float *a11, float *a12, float *a13)
{
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v50;
  float v51;
  unsigned int v52;
  float v53;
  unsigned int v54;
  float v55;
  unsigned int v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  uint64_t v65;
  float v66;
  uint64_t v67;
  float v68;
  float v69;
  float v70;
  uint64_t v71;
  float v72;
  double v73;
  double v74;
  float *v75;
  double v76;
  float v77;
  float v78;
  uint64_t v79;
  float v80;
  float v81;
  double v82;
  float v83;
  float v84;
  uint64_t v85;
  float v86;
  _DWORD v87[9];
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v15 = 1.0;
  v16 = 1.0 / *a8;
  v17 = 1.0 / *a9;
  v18 = *((_QWORD *)this + 1);
  v19 = (float)(*(float *)(v18 + 4) + (float)(*(float *)v18 * v16)) + (float)(*(float *)(v18 + 8) * v17);
  v20 = (float)(*(float *)(v18 + 16) + (float)(*(float *)(v18 + 12) * v16)) + (float)(*(float *)(v18 + 20) * v17);
  v21 = (float)((float)(*(float *)(v18 + 28) + (float)(*(float *)(v18 + 24) * v16)) + (float)(*(float *)(v18 + 32) * v17))
      + (float)(v19 + v20);
  v22 = v19 / v21;
  v23 = v20 / v21;
  v24 = *((float *)this + 8);
  v25 = *((float *)this + 9);
  v26 = *((float *)this + 4);
  v27 = *((float *)this + 5);
  v28 = (float)(v24 * (float)(v22 - v26)) - (float)(v25 * (float)(v23 - v27));
  v29 = (float)(v24 * (float)(v23 - v27)) + (float)(v25 * (float)(v22 - v26));
  v30 = *((float *)this + 6);
  v31 = *((float *)this + 7);
  if ((float)((float)((float)((float)(v29 / v31) * (float)(v29 / v31))
                     + (float)((float)(v28 / v30) * (float)(v28 / v30)))
             * 4.0) <= 1.0)
  {
    v37 = (float)(v24 * (float)(v23 - v27)) + (float)(v25 * (float)(v22 - v26));
    v36 = (float)(v24 * (float)(v22 - v26)) - (float)(v25 * (float)(v23 - v27));
  }
  else
  {
    v32 = 0;
    v33 = v30 * -0.5;
    v34 = v31 * -0.0;
    v35 = 0.0;
    v36 = 0.0;
    v37 = 0.0;
    do
    {
      v38 = v30 * *(float *)((char *)&ledHalfCosSin + v32 + 8);
      v39 = v31 * *(float *)((char *)&ledHalfCosSin + v32 + 12);
      v40 = v38 - v33;
      v41 = v39 - v34;
      v42 = (float)((float)(v29 - v34) * (float)(v39 - v34)) + (float)((float)(v28 - v33) * (float)(v38 - v33));
      v43 = v42 / (float)((float)(v41 * v41) + (float)(v40 * v40));
      if (v43 <= 1.0)
        v44 = v42 / (float)((float)(v41 * v41) + (float)(v40 * v40));
      else
        v44 = 1.0;
      if (v43 >= 0.0)
        v45 = v44;
      else
        v45 = 0.0;
      v46 = v33 + (float)(v45 * v40);
      v47 = v34 + (float)(v45 * v41);
      v48 = (float)(v29 - v47) * (float)(v29 - v47);
      if ((float)(v48 + (float)((float)(v28 - v46) * (float)(v28 - v46))) < v35 || v32 == 0)
      {
        v37 = v47;
        v36 = v46;
        v35 = v48 + (float)((float)(v28 - v46) * (float)(v28 - v46));
      }
      v32 += 8;
      v33 = v38;
      v34 = v39;
    }
    while (v32 != 96);
  }
  v50 = v26 + (float)(v24 * v36);
  v51 = v27 + (float)((float)-v25 * v36);
  if (a2 <= a5)
    v52 = a5;
  else
    v52 = a2;
  if (v52)
    v53 = (float)v52;
  else
    v53 = 1.0;
  if (a3 <= a6)
    v54 = a6;
  else
    v54 = a3;
  v55 = (float)v54;
  if (!v54)
    v55 = 1.0;
  if (a4 <= a7)
    v56 = a7;
  else
    v56 = a4;
  if (v56)
    v15 = (float)v56;
  if (a4)
  {
    if (a4 == 1)
      v57 = 0.4;
    else
      v57 = (float)a4;
  }
  else
  {
    v57 = 0.2;
  }
  v58 = v50 + (float)(v25 * v37);
  v59 = (float)a2;
  v60 = v51 + (float)(v24 * v37);
  v61 = 1.0;
  if ((float)a2 < 1.0)
    v59 = 1.0;
  v62 = v59 / v53;
  if (*(_BYTE *)(v18 + 432))
  {
    if ((float)a3 >= 1.0)
      v61 = (float)a3;
    v63 = v61 / v55;
    if (v63 >= v62)
      v63 = v59 / v53;
    if ((float)(v57 / v15) < v63)
      v62 = v57 / v15;
    else
      v62 = v63;
  }
  v64 = CDualLEDsWhitePointProjector::EstimateCurve((float)((float)(v23 - v60) * (float)(v23 - v60)) + (float)((float)(v22 - v58) * (float)(v22 - v58)), (uint64_t)this, v18 + 360);
  v66 = CDualLEDsWhitePointProjector::EstimateCurve(v62, v65, v18 + 336);
  v68 = CDualLEDsWhitePointProjector::EstimateCurve(v62, v67, v18 + 384);
  v69 = *((float *)this + 11);
  v70 = powf(v64, v68);
  v71 = 0;
  v72 = v66 * (float)(v69 * v70);
  *a13 = v72;
  v73 = v58;
  v74 = 1.0;
  if (v58 == 0.0)
    v73 = 1.0;
  if (v60 != 0.0)
    v74 = v60;
  v75 = (float *)(v18 + 88);
  do
  {
    v76 = *(v75 - 3) / v73 + *(v75 - 4) + (float)(v58 * *(v75 - 2)) + *(v75 - 1) / v74;
    v77 = *v75;
    v75 += 5;
    *(float *)&v76 = v76 + (float)(v60 * v77);
    *(float *)((char *)&v88 + v71) = *(float *)&v76;
    v71 += 4;
  }
  while (v71 != 24);
  *(float *)v87 = v88;
  *(float *)&v87[1] = v89;
  *(float *)&v87[2] = (float)(1.0 - v88) - v89;
  *(float *)&v87[3] = v90;
  *(float *)&v87[4] = (float)(1.0 - v90) - v91;
  *(float *)&v87[5] = v91;
  *(float *)&v87[6] = (float)(1.0 - v92) - v93;
  *(float *)&v87[7] = v92;
  *(float *)&v87[8] = v93;
  v86 = 0.0;
  v85 = 0;
  CDualLEDsWhitePointProjector::xyYToRGB(this, v58, v60, v20, &v86, (float *)&v85 + 1, (float *)&v85);
  v78 = *((float *)&v85 + 1);
  *a10 = *((float *)&v85 + 1) / v86;
  *a11 = v78 / *(float *)&v85;
  if (*(_BYTE *)(v18 + 433))
  {
    v79 = 0;
    v80 = 0.4;
    if (v72 <= 0.4)
      v80 = v72;
    do
    {
      v81 = (float)(v80 * *(float *)&v87[v79]) + (1.0 - v80) * a12[v79];
      a12[v79++] = v81;
    }
    while (v79 != 9);
  }
  v82 = 1.0 - v72;
  v83 = (float)(v60 * v72) + v82 * v23;
  *(float *)&v82 = (float)(v58 * v72) + v82 * v22;
  CDualLEDsWhitePointProjector::xyYToRGB(this, *(float *)&v82, v83, v20, &v86, (float *)&v85 + 1, (float *)&v85);
  v84 = *((float *)&v85 + 1);
  *a8 = *((float *)&v85 + 1) / v86;
  *a9 = v84 / *(float *)&v85;
}

uint64_t SetFileLoad(CAWBAFE *this, _DWORD *a2)
{
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  unsigned int v13;
  unsigned int *v14;
  char *v15;
  sCIspCmdChColorCalIdealSet *p_var143;
  sFEStatCSCConfig v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2[4])
  {
    v4 = 0;
    v5 = a2 + 5;
    p_var143 = &this->var143;
    do
    {
      v6 = *((unsigned __int16 *)v5 + 4);
      if (v6 > 0xC004)
      {
        if (v6 == 49157)
        {
          v10 = 0;
          v11 = *((_OWORD *)v5 + 1);
          v18.var0[8] = *((_WORD *)v5 + 16);
          *(_OWORD *)v18.var0 = v11;
          v12 = *(_OWORD *)((char *)v5 + 34);
          v18.var1[8] = *((_WORD *)v5 + 25);
          *(_OWORD *)v18.var1 = v12;
          v13 = v5[13];
          v18.var2[2] = *((_WORD *)v5 + 28);
          *(_DWORD *)v18.var2 = v13;
          v14 = v5 + 16;
          do
          {
            v15 = (char *)&v18 + v10;
            *((_WORD *)v15 + 24) = *(_WORD *)((char *)v14 + v10);
            *((_WORD *)v15 + 21) = *(_WORD *)((char *)v14 + v10 - 6);
            v10 += 2;
          }
          while (v10 != 6);
          v18.var6 = 1;
          *(_DWORD *)v18.var5 = 134744072;
          CAWBAFE::UpdateCSCConfig(this, &v18);
        }
        else if (v6 == 49161)
        {
          v8 = *(_OWORD *)(v5 + 7);
          *(_OWORD *)&v18.var0[7] = *(_OWORD *)((char *)v5 + 42);
          *(_OWORD *)v18.var0 = v8;
          *(_OWORD *)&v18.var1[6] = *(_OWORD *)((char *)v5 + 58);
          v18.var3[2] = *((_WORD *)v5 + 12);
          *(_DWORD *)v18.var4 = v5[4];
          v18.var4[2] = *((_WORD *)v5 + 13);
          *(_DWORD *)&v18.var5[1] = v5[5];
          CAWBAFE::UpdateColorHistConfig(this, (const sFEStatColorHistConfig *)&v18);
        }
      }
      else
      {
        switch(*((_WORD *)v5 + 4))
        {
          case 0x8305:
            v7 = *((char *)v5 + 16);
            if (v7 > 4 || ((0x17u >> v7) & 1) == 0)
              return 0xFFFFFFFFLL;
            CAWBAFE::SetScheme((uint64_t)this, dword_230930560[v7]);
            break;
          case 0x8306:
          case 0x8308:
          case 0x830C:
          case 0x830D:
          case 0x830E:
          case 0x830F:
          case 0x8310:
          case 0x831A:
          case 0x831B:
          case 0x831D:
          case 0x831E:
          case 0x831F:
          case 0x8320:
            break;
          case 0x8307:
            CAWBAFE::SetHistogramWeight((char *)this, *((unsigned __int8 *)v5 + 16), (uint64_t)(v5 + 5));
            break;
          case 0x8309:
            CAWBAFE::SetProjectionPoint((uint64_t)this, v5[4], v5 + 5);
            break;
          case 0x830A:
            CAWBAFE::SetHistogramXToCCTLut((uint64_t)this, v5[4], v5 + 5);
            break;
          case 0x830B:
            CAWBAFE::SetCCM2DCoefficient(this, (__int16 *)v5 + 8, (__int16 *)v5 + 17, (__int16 *)v5 + 26, (__int16 *)v5 + 35, (__int16 *)v5 + 44, (__n128 *)((char *)v5 + 106));
            break;
          case 0x8311:
            CAWBAFE::SetPostTintParam((uint64_t)this, v5[4], v5 + 5);
            break;
          case 0x8312:
            CAWBAFE::SetMixLightingXLoc(this, (const unsigned __int16 *)v5 + 8);
            break;
          case 0x8313:
            CAWBAFE::SetMixLightingCCM(this, (__n128 *)v5 + 1);
            break;
          case 0x8314:
            CAWBAFE::SetTileStatsYThreshold(this, (const unsigned __int16 *)v5 + 8);
            break;
          case 0x8315:
            CAWBAFE::SetRatioSpace2ndGainThreshold(this, (const unsigned __int16 *)v5 + 8);
            break;
          case 0x8316:
            CAWBAFE::SetHistogramTrimFilterV(this, (const unsigned __int16 *)v5 + 8);
            break;
          case 0x8317:
            CAWBAFE::SetHistogramTrimFilterH(this, (const unsigned __int16 *)v5 + 8);
            break;
          case 0x8318:
            CAWBAFE::SetHistogramTrimScaleProfile(this, (const unsigned __int16 *)v5 + 8);
            break;
          case 0x8319:
            CAWBAFE::SetCCMLuxClip(this, *((_WORD *)v5 + 8));
            break;
          case 0x831C:
            CAWBAFE::SetFlashProjectionConfig((uint64_t)this, (unsigned __int8 *)v5 + 16);
            break;
          case 0x8321:
            CAWBAFE::SetDaylightProjectionPoint((uint64_t)this, v5[4], v5 + 5);
            break;
          default:
            if (v6 == 2054)
            {
              v9 = *(_OWORD *)(v5 + 1);
              *(_DWORD *)&p_var143->var6 = v5[5];
              *(_OWORD *)&p_var143->var0 = v9;
            }
            break;
        }
      }
      ++v4;
      v5 = (unsigned int *)((char *)v5 + *v5 + 4);
    }
    while (v4 < a2[4]);
  }
  return 0;
}

void CEnvironment::~CEnvironment(CEnvironment *this)
{
  JUMPOUT(0x2348BC8E0);
}

void LTMCompute::~LTMCompute(LTMCompute *this)
{
  JUMPOUT(0x2348BC8E0);
}

void LTMCompute::computeLocalLuma(LTMCompute *this, const sLtmComputeInput *a2, const sLtmTuningParams *a3, const sLtmDisplayParams *a4, sLtmFrameParams *a5, double a6)
{
  uint64_t v6;
  float *var1;
  char *p_var2;
  int32x2_t v9;
  float v10;
  float v11;
  float v12;
  sLtmFrameParams *v13;
  float *v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float32x4_t v31;
  float32x4_t *v32;
  unint64_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t *v37;
  unint64_t v38;
  float32x4_t v39;
  float32x4_t v40;

  v6 = 0;
  var1 = a5->var1;
  p_var2 = (char *)&a4[-1].var2;
  v9.i32[1] = 872415232;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v13 = a5;
  do
  {
    v14 = &a2->localHist[v6];
    v15 = v14 + 4160;
    v16 = v14[4160];
    v17 = 0.0;
    v18 = 0.0;
    if (v16 >= 0.00000011921)
    {
      v19 = v14[4208];
      v20 = 1.0 - (float)(*(float *)a3 * fmaxf(v19 + -0.2, 0.0));
      v17 = (float)(v19 / v16) * v20;
      v13->var0[0] = v17;
      v18 = v14[4208] * v20;
    }
    *var1 = v18;
    v21 = fmaxf(v18, fminf(v17, 1.0));
    v13->var0[0] = v21;
    if (v21 <= 0.0)
    {
      v25 = a4->var0[0];
    }
    else if (v21 >= 1.0)
    {
      v25 = a4->var0[64];
    }
    else
    {
      v22 = 0;
      do
      {
        v23 = v22;
        v24 = *((float *)&LTMCompute::localCurveInputs + v22++);
      }
      while (v23 <= 0x40 && v24 < v21);
      v25 = 0.0;
      if (v22 != 1)
      {
        v26 = (v22 - 2);
        v27 = *((float *)&LTMCompute::localCurveInputs + v26);
        if (vabds_f32(v24, v27) >= 0.00000011921)
          v25 = a4->var0[v26]
              + (float)((float)((float)(v21 - v27) / (float)(v24 - v27))
                      * (float)(*(float *)&p_var2[4 * v22] - a4->var0[v26]));
        else
          v25 = *(float *)&p_var2[4 * v22];
      }
    }
    v28 = v25 * a4->var2;
    v13->var0[0] = v28;
    v13 = (sLtmFrameParams *)((char *)v13 + 4);
    v10 = v10 + *v15;
    v11 = v11 + (float)(v28 * *v15);
    v12 = v12 + (float)(v18 * *v15);
    ++var1;
    ++v6;
  }
  while (v6 != 48);
  if (v10 <= 0.0)
    v29 = 1.0;
  else
    v29 = v11 / v10;
  a5->var2 = v29;
  if (v10 <= 0.0)
    v30 = 1.0;
  else
    v30 = v12 / v10;
  *(float *)v9.i32 = v29 * 0.3;
  v31 = (float32x4_t)vdupq_lane_s32(v9, 0);
  a5->var3 = v30;
  v32 = (float32x4_t *)&a5->var0[4];
  v33 = -8;
  v34 = (float32x4_t)vdupq_n_s32(0x3F333333u);
  do
  {
    v35 = vaddq_f32(v31, vmulq_f32(*v32, v34));
    v32[-1] = vaddq_f32(v31, vmulq_f32(v32[-1], v34));
    *v32 = v35;
    v33 += 8;
    v32 += 2;
  }
  while (v33 < 0x28);
  *(float *)&a6 = a5->var3 * 0.3;
  v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0);
  v37 = (float32x4_t *)&a5->var1[4];
  v38 = -8;
  v39 = (float32x4_t)vdupq_n_s32(0x3F333333u);
  do
  {
    v40 = vaddq_f32(v36, vmulq_f32(*v37, v39));
    v37[-1] = vaddq_f32(v36, vmulq_f32(v37[-1], v39));
    *v37 = v40;
    v38 += 8;
    v37 += 2;
  }
  while (v38 < 0x28);
}

uint64_t LTMCompute::calculateSceneModel(LTMCompute *this, const sLtmComputeInput *a2, const sLtmTuningParams *a3, sLtmFrameParams *a4)
{
  float *p_pixelCountRatio;
  BOOL *var6;
  float *v10;
  uint64_t v11;
  float v12;
  float var20;
  float v14;
  float v15;
  float var19;
  float v17;
  float (*var5)[342];
  uint64_t v19;
  float32x4_t *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  LTMCompute *v25;
  float32x4_t *v26;
  unint64_t v27;
  float v28;
  float32x4_t v29;
  float *thumbnailHistEV0;
  unint64_t v31;
  float32x4_t *v32;
  float *v33;
  float32x4_t v34;
  float v35;
  unint64_t v36;
  float32x4_t v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  LTMCompute *v50;
  unint64_t v51;
  uint64_t v52;
  LTMCompute *v53;
  float *var8;
  unint64_t v55;
  uint64_t v56;
  float *v57;
  uint64_t result;
  uint64_t v59;
  const float *v60;
  int8x16_t v61;
  float32x4_t v62;
  uint64_t i;
  uint64_t j;
  float v65;
  BOOL *v66;
  float v67;
  float v68;
  float v69;

  p_pixelCountRatio = &a2->pixelCountRatio;
  var6 = this->var6;
  if (this->var6[1])
  {
    v10 = 0;
  }
  else
  {
    this->var6[1] = 1;
    v10 = this->var5[1];
  }
  v11 = 0;
  v12 = (float)(logf(0.00024414 / fmaxf(a4->var14, 1.0)) * 3.0) / -8.3178;
  do
  {
    v10[v11] = fmaxf(powf((float)(int)v11 * 0.0625, v12) * a4->var14, (float)((float)(int)v11 * 0.0625) * (float)((float)(int)v11 * 0.0625));
    ++v11;
  }
  while (v11 != 17);
  var20 = a4->var20;
  v14 = (float)(*((float *)a3 + 15) * (float)(1.0 - a4->var17)) + (float)(*((float *)a3 + 14) * a4->var17);
  v15 = fmaxf(p_pixelCountRatio[2], 1.0);
  var19 = a4->var19;
  v17 = *((float *)a3 + 16) * var19;
  v66 = var6;
  if (*var6)
  {
    var5 = 0;
  }
  else
  {
    *var6 = 1;
    var5 = this->var5;
  }
  v19 = 0;
  v69 = var20 * v14;
  v20 = (float32x4_t *)&(*var5)[64];
  v21 = 0.0;
  v67 = var19 * v17;
  v68 = (float)(var20 * 0.015625) * v15;
  do
  {
    v22 = *(float *)((char *)&LTMCompute::localCurveInputs + v19 * 4 + 4);
    v23 = 1.0 / *((float *)a3 + 17);
    v24 = powf(v22, v23);
    v20->f32[v19++] = v24 - powf(v21, v23);
    v21 = v22;
  }
  while (v19 != 64);
  v26 = (float32x4_t *)&(*var5)[68];
  v27 = -8;
  v28 = 1.0 / (*var5)[64];
  do
  {
    v29 = vmulq_n_f32(*v26, v28);
    v26[-1] = vmulq_n_f32(v26[-1], v28);
    *v26 = v29;
    v27 += 8;
    v26 += 2;
  }
  while (v27 < 0x38);
  thumbnailHistEV0 = a2->thumbnailHistEV0;
  v31 = -4;
  v32 = (float32x4_t *)&(*var5)[64];
  v33 = a2->thumbnailHistEV0;
  do
  {
    v34 = *(float32x4_t *)v33;
    v33 += 4;
    *v32 = vminq_f32(*v32, v34);
    ++v32;
    v31 += 4;
  }
  while (v31 < 0x3C);
  v35 = fmaxf((float)(a4->var19 * 1.5) + -0.5, 0.0);
  v36 = -4;
  do
  {
    v37 = *(float32x4_t *)thumbnailHistEV0;
    thumbnailHistEV0 += 4;
    v20[-16] = vaddq_f32(vmulq_n_f32(v37, v35), vmulq_n_f32(*v20, 1.0 - v35));
    v36 += 4;
    ++v20;
  }
  while (v36 < 0x3C);
  v38 = 0;
  v39 = 0.0;
  do
    v39 = v39 + (*var5)[v38++];
  while (v38 != 64);
  v40 = 0;
  v41 = fmaxf((float)((float)((float)-(float)(1.0 - *p_pixelCountRatio) * 0.5) + 1.0) - v39, 0.0);
  do
  {
    (*var5)[v40] = (*var5)[v40] + (float)(v41 * *(float *)&LTMCompute::defaultHist[v40]);
    ++v40;
  }
  while (v40 != 64);
  v42 = 0;
  *(_OWORD *)(v10 + 25) = 0u;
  *(_OWORD *)(v10 + 29) = 0u;
  *(_OWORD *)(v10 + 17) = 0u;
  *(_OWORD *)(v10 + 21) = 0u;
  v10[33] = 0.0;
  do
  {
    v43 = v42 + 1;
    if ((*var5)[v42] > 0.00000011921)
    {
      v44 = 0;
      v45 = v69 + (float)((float)((float)(int)v43 - v67) * v68);
      do
      {
        v46 = v69 + (float)(v10[v44] * a4->var20);
        v47 = vabds_f32(v46, v45);
        if (v46 >= v45)
        {
          v49 = 8.22;
          v48 = v47 / (float)(v45 + 0.39);
        }
        else
        {
          v48 = (float)(v47 * 0.945) / (float)((float)(v46 + 0.39) + (float)(v47 * 0.055));
          v49 = -7.07;
        }
        v10[v44 + 17] = v10[v44 + 17] + (float)((float)(v49 * log10f((float)(v48 * 6.58) + 1.0)) * (*var5)[v42]);
        ++v44;
      }
      while (v44 != 17);
    }
    ++v42;
  }
  while (v43 != 64);
  *v66 = 0;
  LTMCompute::interpolate(v25, v10, v10 + 17, 17, (const float *)&LTMCompute::localCurveInputs, v10 + 34, 65);
  v51 = -4;
  v52 = 419;
  do
  {
    *(float32x4_t *)&a4->var0[v52] = vsubq_f32(*(float32x4_t *)&v10[v52 - 384], *(float32x4_t *)&v10[v52 - 385]);
    v51 += 4;
    v52 += 4;
  }
  while (v51 < 0x3C);
  v53 = (LTMCompute *)LTMCompute::interpolate(v50, v10, v10 + 17, 17, (const float *)&LTMCompute::localCurveInputs, v10 + 34, 65, a4->var14);
  var8 = a4->var8;
  v55 = -4;
  v56 = 355;
  do
  {
    *(float32x4_t *)&a4->var0[v56] = vsubq_f32(*(float32x4_t *)&v10[v56 - 320], *(float32x4_t *)&v10[v56 - 321]);
    v55 += 4;
    v56 += 4;
  }
  while (v55 < 0x3C);
  v57 = v10 + 99;
  result = LTMCompute::interpolate(v53, v10, v10 + 17, 17, a4->var4, v10 + 34, 65, a4->var14);
  v59 = 0;
  v60 = v10 + 34;
  v61 = (int8x16_t)vld1q_dup_f32(v60);
  do
  {
    v62 = *(float32x4_t *)&v10[v59 + 35];
    *(float32x4_t *)&v10[v59 + 99] = vabdq_f32(v62, (float32x4_t)vextq_s8(v61, (int8x16_t)v62, 0xCuLL));
    v59 += 4;
    v61 = (int8x16_t)v62;
  }
  while (v59 != 64);
  for (i = 0; i != 64; ++i)
    v57[i] = fminf(var8[i] * 3.0, v57[i]);
  for (j = 0; j != 64; ++j)
  {
    v65 = var8[j];
    if (v65 <= v57[j])
      v65 = v57[j];
    var8[j] = v65;
  }
  v66[1] = 0;
  return result;
}

uint64_t LTMCompute::interpolate(LTMCompute *this, float *a2, float *a3, int a4, const float *a5, float *a6, int a7, float a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  const float *v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t result;
  float v18;
  float v19;

  if (a7 >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = a4 - 1;
    v11 = a3 - 1;
    do
    {
      v12 = a5[v8] * a8;
      if (v12 <= *a2)
      {
        v19 = *a3;
      }
      else if (v12 >= a2[v10])
      {
        v19 = a3[v10];
      }
      else
      {
        v13 = v9;
        v14 = ((uint64_t)v9-- << 32) - 0x200000000;
        do
        {
          v15 = v13;
          v16 = a2[v13++];
          v14 += 0x100000000;
          ++v9;
        }
        while (v15 < a4 && v12 > v16);
        result = v14 >> 30;
        v18 = *(float *)((char *)a2 + (v14 >> 30));
        if (vabds_f32(v16, v18) >= 0.00000011921)
          v19 = a3[v14 >> 32]
              + (float)((float)((float)(v12 - v18) / (float)(v16 - v18)) * (float)(v11[v13] - a3[v14 >> 32]));
        else
          v19 = v11[v13];
      }
      a6[v8++] = v19;
    }
    while (v8 != a7);
  }
  return result;
}

void LTMCompute::calculateHighlightSceneModel(LTMCompute *this, const sLtmComputeInput *a2, const sLtmTuningParams *a3, int a4, sLtmFrameParams *a5, double a6, double a7, double a8, double a9)
{
  uint64_t v10;
  float *var8;
  BOOL *var6;
  float (*var5)[342];
  float var20;
  float v15;
  float v16;
  uint64_t v17;
  float var14;
  float v19;
  float v20;
  float v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  float *var11;
  unint64_t v30;
  float32x4_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float32x2_t v38;
  float *v39;
  int32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  uint64_t v50;
  float v51;
  float var15;
  float v53;
  unint64_t v54;
  float32x4_t *v55;
  float32x4_t *v56;
  float32x4_t v57;
  float32x4_t v58;
  unint64_t v59;
  float32x4_t *v60;
  float v61;
  float32x4_t *v62;
  float32x4_t *v63;
  unint64_t v64;
  float32x4_t v65;
  unint64_t v66;
  float32x4_t *v67;
  float32x4_t v68;
  float32x4_t v69;
  unint64_t v70;
  float32x4_t *v71;
  float32x4_t *v72;
  float *p_var25;
  float32x4_t v74;
  unint64_t v75;
  float32x4_t v76;
  float v77;
  float (*v78)[342];
  float v79;
  float v80;
  int v81;
  float v82;
  float v83;
  float (*v84)[342];
  float v85;
  float v86;
  float v87;
  float32x4_t *v88;
  unint64_t v89;
  float32x4_t v90;
  uint64_t v91;
  float32x4_t *v93;
  float32x4_t *v94;
  unint64_t v95;
  float32x4_t v96;
  float32x4_t *v97;
  float32x4_t *v98;
  unint64_t v99;
  float32x4_t v100;
  float (*v102)[342];
  float *p_pixelCountRatio;
  float *v105;
  uint64x2_t v106;
  float v107;
  float v108;
  int32x2_t v109;
  float v110[64];
  float v111;
  float v112[5];
  float v113;
  float v114;
  float v115;
  uint64_t v116;

  v10 = 0;
  v116 = *MEMORY[0x24BDAC8D0];
  var8 = a5->var8;
  p_pixelCountRatio = &a2->pixelCountRatio;
  v105 = a5->var8;
  var6 = this->var6;
  var5 = this->var5;
  v102 = this->var5;
  var20 = a5->var20;
  v15 = var20 + 10.553;
  v16 = (float)((float)(178.42 / (float)(var20 + 12.131)) + 184.34) * 0.00097656;
  do
  {
    v112[v10] = (float)((float)((float)((float)(-285.53 / v15) + 3.1761) * 0.00097656)
                      * *(float *)&LTMCompute::calculateHighlightSceneModel(sLtmComputeInput const*,sLtmTuningParams const*,BOOL,sLtmFrameParams *)::bvec2[v10])
              + (float)(*(float *)&LTMCompute::calculateHighlightSceneModel(sLtmComputeInput const*,sLtmTuningParams const*,BOOL,sLtmFrameParams *)::bvec1[v10]
                      * v16);
    ++v10;
  }
  while (v10 != 17);
  v17 = 0;
  var14 = a5->var14;
  v19 = v112[0];
  v20 = v115;
  do
  {
    v21 = (float)(*((float *)&LTMCompute::localCurveInputs + v17) * var14) * 0.125;
    if (v21 <= 1.0)
    {
      *(float *)&a8 = v19;
      if (v21 > 0.0)
      {
        *(float *)&a8 = v20;
        if (v21 < 1.0)
        {
          v22 = 0;
          do
          {
            v23 = v22;
            v24 = LTMCompute::calculateHighlightSceneModel(sLtmComputeInput const*,sLtmTuningParams const*,BOOL,sLtmFrameParams *)::xgHigh[v22++];
          }
          while (v23 <= 0x10 && v24 < v21);
          LODWORD(a8) = 0;
          if (v22 != 1)
          {
            v25 = (v22 - 2);
            v26 = LTMCompute::calculateHighlightSceneModel(sLtmComputeInput const*,sLtmTuningParams const*,BOOL,sLtmFrameParams *)::xgHigh[v25];
            if (vabds_f32(v24, v26) >= 0.00000011921)
              *(float *)&a8 = v112[v25]
                            + (float)((float)((float)(v21 - v26) / (float)(v24 - v26))
                                    * (float)(v112[v22 - 1] - v112[v25]));
            else
              *(float *)&a8 = v112[v22 - 1];
          }
        }
      }
    }
    else
    {
      *(float *)&a8 = powf(v21, 0.25) * v20;
    }
    v110[v17++] = *(float *)&a8;
  }
  while (v17 != 65);
  if (var14 < 1.0)
  {
    v27 = 0;
    v111 = v113 + (float)((float)(v114 - v113) * 0.63636);
    do
    {
      v110[v27] = (float)((float)((float)((float)(int)v27 * 0.015625) * (float)((float)(int)v27 * 0.015625))
                        * (float)((float)((float)(int)v27 * 0.015625) * v111))
                + (float)(v110[v27]
                        * (float)(1.0
                                - (float)((float)((float)(int)v27 * 0.015625) * (float)((float)(int)v27 * 0.015625))));
      ++v27;
    }
    while (v27 != 65);
  }
  v28 = 0;
  var11 = a5->var11;
  v30 = -4;
  do
  {
    v31 = vsubq_f32(*(float32x4_t *)&v110[v28 + 1], *(float32x4_t *)&v110[v28]);
    *(float32x4_t *)&var11[v28] = v31;
    v30 += 4;
    v28 += 4;
  }
  while (v30 < 0x3C);
  v31.i32[0] = LODWORD(a5->var14);
  if (v31.f32[0] > 8.0)
  {
    v32 = vcvtms_s32_f32((float)(8.0 / v31.f32[0]) * 64.0);
    v33 = v32 <= 1 ? 1 : v32;
    if (v33 <= 0x3F)
    {
      v34 = 0;
      *(float *)&a8 = (float)(int)v33;
      *(float *)&a9 = (float)(64 - v33);
      v31.f32[0] = (float)(v31.f32[0] * 0.03125) + -0.25;
      v106 = (uint64x2_t)vdupq_n_s64(63 - (unint64_t)v33);
      v35 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.f32, 0);
      v36 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a8, 0);
      v37 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a9, 0);
      v38 = (float32x2_t)vdup_n_s32(0x3E91EB85u);
      v39 = &a5->var11[v33 + 1];
      __asm
      {
        FMOV            V12.2S, #1.0
        FMOV            V13.2S, #0.25
      }
      do
      {
        v109 = vmovn_s64((int64x2_t)vcgeq_u64(v106, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v34), (int8x16_t)xmmword_23092D460)));
        v46.i32[0] = v33 + v34;
        v46.i32[1] = v33 + v34 + 1;
        v47 = vmla_f32(_D13, v35, vdiv_f32(vadd_f32(vsub_f32(vcvt_f32_s32(v46), v36), _D12), v37));
        v107 = v47.f32[0];
        v108 = powf(v47.f32[1], 1.25);
        v48.f32[0] = powf(v107, 1.25);
        v48.f32[1] = v108;
        v49 = vmaxnm_f32(vdiv_f32(v38, v48), (float32x2_t)0x3400000034000000);
        if ((v109.i8[0] & 1) != 0)
          *(v39 - 1) = v49.f32[0];
        if ((v109.i8[4] & 1) != 0)
          *v39 = v49.f32[1];
        v34 += 2;
        v39 += 2;
      }
      while (((65 - v33) & 0xFFFFFFFFFFFFFFFELL) != v34);
      v50 = v33;
      v51 = a5->var11[(v33 - 1)] / a5->var11[v33];
      do
      {
        var11[v50] = v51 * var11[v50];
        ++v50;
      }
      while (v50 != 64);
    }
  }
  var15 = a5->var15;
  v53 = (float)((float)(a5->var19 * 0.5) + 1.0) / var15;
  if (a4)
    v53 = (float)(v53 * a5->var17)
        + (float)((float)((float)((float)((float)(2.0 - a5->var17) * 0.5) + 1.0) / sqrtf(var15))
                * (float)(1.0 - a5->var17));
  if (*var6)
    var5 = 0;
  else
    *var6 = 1;
  v54 = -4;
  v55 = (float32x4_t *)var8;
  v56 = (float32x4_t *)var5;
  do
  {
    v57 = v55[48];
    v58 = *v55++;
    *v56++ = vsubq_f32(v57, v58);
    v54 += 4;
  }
  while (v54 < 0x3C);
  v59 = -4;
  v60 = (float32x4_t *)var5;
  do
  {
    *v60 = vmaxq_f32(*v60, (float32x4_t)0);
    ++v60;
    v59 += 4;
  }
  while (v59 < 0x3C);
  v61 = fminf(v53, 1.0) * (float)(1.0 - *p_pixelCountRatio);
  v62 = (float32x4_t *)&(*var5)[4];
  v63 = (float32x4_t *)(v105 + 4);
  v64 = -8;
  do
  {
    v65 = vaddq_f32(*v63, vmulq_n_f32(*v62, v61));
    v63[-1] = vaddq_f32(v63[-1], vmulq_n_f32(v62[-1], v61));
    *v63 = v65;
    v64 += 8;
    v62 += 2;
    v63 += 2;
  }
  while (v64 < 0x38);
  v66 = -4;
  v67 = (float32x4_t *)var5;
  do
  {
    v68 = *(float32x4_t *)(var8 + 192);
    v69 = *(float32x4_t *)var8;
    var8 += 4;
    *v67++ = vsubq_f32(v68, v69);
    v66 += 4;
  }
  while (v66 < 0x3C);
  v70 = -4;
  v71 = (float32x4_t *)var5;
  do
  {
    *v71 = vmaxq_f32(*v71, (float32x4_t)0);
    ++v71;
    v70 += 4;
  }
  while (v70 < 0x3C);
  v72 = (float32x4_t *)(v105 + 128);
  p_var25 = &a5->var25;
  v74 = vld1q_dup_f32(p_var25);
  v75 = -4;
  do
  {
    v76 = *(float32x4_t *)var5;
    var5 = (float (*)[342])((char *)var5 + 16);
    *v72 = vaddq_f32(vmulq_f32(v74, v72[-32]), vmulq_n_f32(v76, v53));
    ++v72;
    v75 += 4;
  }
  while (v75 < 0x3C);
  *var6 = 1;
  if (a5->var28 > 1.0)
  {
    v77 = fminf(0.18 / p_pixelCountRatio[3], 1.0) * 64.0;
    if (v77 >= 2.0)
    {
      v78 = v102;
    }
    else
    {
      v78 = v102;
      if (v77 >= 1.0)
      {
        v80 = (float)((float)((float)((float)(v77 * v77) * -38.75) + (float)(powf(v77, 3.0) * 9.375))
                    + (float)(v77 * 54.375))
            + -24.5;
      }
      else
      {
        v79 = powf(v77, 5.0);
        v80 = (float)(v79 * 4.5) / (float)(v79 + 8.0);
      }
      v77 = fminf(v77, v80);
    }
    v81 = 0;
    v82 = floorf(v77);
    v83 = ceilf(v77);
    v84 = this->var5;
    do
    {
      v85 = (float)v81;
      v86 = 1.0;
      if (v82 <= (float)v81)
      {
        v86 = 0.0;
        if (v83 > v85)
          v86 = v77 - v85;
      }
      if (v84)
      {
        *(float *)v84 = v86;
        v84 = (float (*)[342])((char *)v84 + 4);
      }
      ++v81;
    }
    while (v81 != 64);
    v87 = a5->var28 + -1.0;
    v88 = (float32x4_t *)&(*v78)[4];
    v89 = -8;
    do
    {
      v90 = vmulq_n_f32(*v88, v87);
      v88[-1] = vmulq_n_f32(v88[-1], v87);
      *v88 = v90;
      v89 += 8;
      v88 += 2;
    }
    while (v89 < 0x38);
    v91 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    do
    {
      *(float32x4_t *)&this->var5[0][v91] = vaddq_f32(*(float32x4_t *)&this->var5[0][v91], _Q0);
      v91 += 4;
    }
    while (v91 != 64);
    v93 = (float32x4_t *)&(*v78)[4];
    v94 = (float32x4_t *)(v105 + 4);
    v95 = -8;
    do
    {
      v96 = vmulq_f32(*v94, *v93);
      v94[-1] = vmulq_f32(v94[-1], v93[-1]);
      *v94 = v96;
      v95 += 8;
      v93 += 2;
      v94 += 2;
    }
    while (v95 < 0x38);
    v97 = (float32x4_t *)&(*v78)[4];
    v98 = (float32x4_t *)(v105 + 132);
    v99 = -8;
    do
    {
      v100 = vmulq_f32(*v98, *v97);
      v98[-1] = vmulq_f32(v98[-1], v97[-1]);
      *v98 = v100;
      v99 += 8;
      v97 += 2;
      v98 += 2;
    }
    while (v99 < 0x38);
  }
  *var6 = 0;
}

void LTMCompute::computeThumbnailLuma(LTMCompute *this, const sLtmComputeInput *a2, sLtmFrameParams *a3)
{
  float *var5;
  float *var4;
  BOOL *v8;
  float *v9;
  int v10;
  float v11;
  float v12;
  float v13;
  float *v14;
  float *v15;
  float v16;
  float v17;
  float *v18;
  float *v19;
  uint64_t v20;
  unint64_t v21;
  __int128 *v22;
  float32x4_t *v23;
  float32x4_t *v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t *v28;
  float v29;
  unint64_t v30;
  float32x4_t *v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t *v35;
  float32x4_t *v36;
  unint64_t v37;
  float32x4_t v38;
  unint64_t v39;
  float32x4_t *v40;
  float *v41;
  float32x4_t v42;
  uint64_t v43;
  float v44;
  float *v45;

  var5 = a3->var5;
  var4 = a3->var4;
  v8 = &this->var6[1];
  if (this->var6[1])
  {
    v9 = 0;
  }
  else
  {
    *v8 = 1;
    v9 = this->var5[1];
  }
  v10 = 0;
  v11 = fminf(64.0 / a3->var15, 64.0);
  v12 = floorf(v11);
  v13 = ceilf(v11);
  v14 = a3->var5;
  v15 = v9;
  do
  {
    v16 = (float)v10;
    v17 = 1.0;
    if (v12 <= (float)v10)
    {
      v17 = 0.0;
      if (v13 > v16)
        v17 = v11 - v16;
    }
    if (v14)
      *v14++ = v17;
    if (v15)
      *v15++ = 1.0 - v17;
    ++v10;
  }
  while (v10 != 64);
  memcpy(v9 + 64, &LTMCompute::localCurveInputs, 0x104uLL);
  v18 = v9 + 65;
  v19 = &a2->thumbnailHist[1];
  v20 = 63;
  do
  {
    if (*v19 > 0.00000011921)
      *v18 = v19[128] / (float)(*v19 * 65535.0);
    ++v18;
    ++v19;
    --v20;
  }
  while (v20);
  v9[128] = 1.0;
  v21 = -4;
  v22 = &LTMCompute::localCurveInputs;
  v23 = (float32x4_t *)(v9 + 64);
  v24 = (float32x4_t *)var4;
  do
  {
    v25 = (float32x4_t)*v22++;
    v26 = v25;
    v27 = *v23++;
    *v24++ = vminq_f32(v26, v27);
    v21 += 4;
  }
  while (v21 < 0x3C);
  v28 = (float32x4_t *)(v9 + 129);
  v29 = v9[128];
  if (v29 > 1.0)
    v29 = 1.0;
  a3->var4[64] = v29;
  v30 = -8;
  v31 = (float32x4_t *)&unk_2309307F4;
  do
  {
    v32 = *(float32x4_t *)var5;
    v33 = *(float32x4_t *)(var5 + 4);
    var5 += 8;
    v34 = vmulq_f32(*v31, v33);
    v30 += 8;
    *v28 = vmulq_f32(v31[-1], v32);
    v28[1] = v34;
    v28 += 2;
    v31 += 2;
  }
  while (v30 < 0x38);
  v35 = (float32x4_t *)(v9 + 4);
  v36 = (float32x4_t *)(var4 + 4);
  v37 = -8;
  do
  {
    v38 = vmulq_f32(*v36, *v35);
    v36[-1] = vmulq_f32(v36[-1], v35[-1]);
    *v36 = v38;
    v37 += 8;
    v35 += 2;
    v36 += 2;
  }
  while (v37 < 0x38);
  v39 = -4;
  v40 = (float32x4_t *)var4;
  v41 = v9;
  do
  {
    v42 = *v40++;
    *((float32x4_t *)v41 + 16) = vaddq_f32(v42, *(float32x4_t *)(v41 + 129));
    v39 += 4;
    v41 += 4;
  }
  while (v39 < 0x3C);
  v43 = 0;
  v44 = v9[64];
  v45 = v9 + 65;
  do
  {
    v44 = fmaxf(v45[v43], v44);
    v45[v43++] = v44;
  }
  while (v43 != 64);
  LTMCompute::smoothHistogramMiddle(this, v9 + 64, var4, 65, a3->var13, 6, 0);
  *v8 = 0;
}

void LTMCompute::smoothHistogramMiddle(LTMCompute *this, float *__src, float *__dst, int a4, const float *a5, int a6, int a7)
{
  BOOL *var6;
  float (*var5)[342];
  int v15;
  uint64_t v16;
  float *v17;
  float *v18;
  float *v19;
  float *v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;

  var6 = this->var6;
  if (this->var6[0])
  {
    var5 = 0;
    if (!__dst)
      goto LABEL_16;
  }
  else
  {
    *var6 = 1;
    var5 = this->var5;
    bzero(this->var5, 0x404uLL);
    if (!__dst)
    {
LABEL_16:
      v18 = __src;
      goto LABEL_17;
    }
  }
  if (a6 < 1)
    goto LABEL_16;
  v15 = 0;
  v16 = a4 - 1;
  v17 = __dst;
  do
  {
    v18 = v17;
    v17 = (float *)var5;
    if (a4 >= 3)
    {
      v19 = v18 + 1;
      v20 = __src + 2;
      v21 = (a4 - 1) - 1;
      do
      {
        v22 = (float)(*(v20 - 1) * a5[1]) + (float)(*(v20 - 2) * *a5);
        v23 = *v20++;
        *v19++ = v22 + (float)(v23 * a5[2]);
        --v21;
      }
      while (v21);
    }
    v24 = *__src;
    if (a7)
    {
      *v18 = (float)(__src[1] * a5[2]) + (float)(v24 * (float)(*a5 + a5[1]));
      v25 = (float)(__src[a4 - 2] * *a5) + (float)(__src[v16] * (float)(a5[1] + a5[2]));
    }
    else
    {
      *v18 = v24;
      v25 = __src[v16];
    }
    v18[v16] = v25;
    if (!var5)
      break;
    ++v15;
    var5 = (float (*)[342])v18;
    __src = v18;
  }
  while (v15 < a6);
LABEL_17:
  if (v18 != __dst)
    memcpy(__dst, v18, 4 * a4);
  *var6 = 0;
}

float LTMCompute::calculateSceneFlare(LTMCompute *this, const float *a2, int a3, int *a4, float a5, float a6, float *a7, float *a8, float *a9)
{
  BOOL *var6;
  float v10;
  float v11;
  float *v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  int v24;
  uint64_t v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  float *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  float *v33;
  float *v34;
  float32x4_t *v35;
  unint64_t v36;
  unint64_t v37;
  float *v38;
  float32x4_t *v39;
  float32x4_t *v40;
  float32x4_t v41;
  uint64_t v42;
  float *v43;
  float *v44;
  unint64_t v45;
  float *v46;
  float32x4_t v47;
  uint64_t v48;
  float *v49;
  float *v50;
  float v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  float v55;
  float v56;
  uint64_t v57;
  float v58;
  float *v59;
  float *v60;
  float *v61;
  float v62;
  float v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  float v67;
  uint64_t v68;
  float v69;
  float v70;
  int v71;
  float result;

  var6 = this->var6;
  v10 = 0.0;
  v11 = 0.0;
  if (a3 >= 1)
  {
    v12 = (float *)&a2[a4[3] * a3];
    v13 = a3;
    do
    {
      v14 = *v12++;
      v11 = v11 + v14;
      --v13;
    }
    while (v13);
  }
  v15 = 0;
  v16 = v11 * 0.99;
  do
  {
    v17 = v10;
    v18 = v15;
    v19 = a2[a4[3] * a3 + v15++];
    if (v18 >= a3)
      break;
    v10 = v10 + v19;
  }
  while ((float)(v17 + v19) < v16);
  v20 = (float)(v16 - v17) / v19;
  v21 = (float)a3;
  v22 = v20 + (float)(v15 - 1);
  if (a3 + 1 == (_DWORD)v15)
  {
    v21 = (float)a3;
    v22 = (float)a3 + -1.0;
  }
  v23 = v22 / v21;
  *a9 = v23;
  v24 = llroundf(fminf(a6, fmaxf(roundf(v23 * a6), 1.0)));
  if (v24 >= 113)
    v25 = 113;
  else
    v25 = v24;
  if (this->var6[3])
  {
    v26 = 0;
    if (v24 < 0)
      goto LABEL_18;
LABEL_16:
    v27 = 0;
    do
    {
      v26[v27] = (float)(int)v27;
      ++v27;
    }
    while (v24 + 1 != v27);
    goto LABEL_18;
  }
  this->var6[3] = 1;
  v26 = this->var5[3];
  if ((v24 & 0x80000000) == 0)
    goto LABEL_16;
LABEL_18:
  v28 = 0;
  *var6 = 1;
  this->var5[0][0] = 0.0;
  this->var5[0][114] = 0.0;
  this->var5[0][228] = 0.0;
  v29 = &this->var5[0][1];
  v30 = (v25 + 1) - 1;
  do
  {
    if ((int)v25 >= 1)
    {
      v31 = a4[v28] * a3;
      v32 = (v25 + 1) - 1;
      v33 = v29;
      do
      {
        *v33 = *(v33 - 1) + a2[v31];
        ++v33;
        ++v31;
        --v32;
      }
      while (v32);
    }
    ++v28;
    v29 += 114;
  }
  while (v28 != 3);
  if (this->var6[1])
  {
    v34 = 0;
  }
  else
  {
    this->var6[1] = 1;
    v34 = this->var5[1];
  }
  *v34 = 0.0;
  v35 = (float32x4_t *)(v34 + 1);
  v36 = v25 & 0xFFFFFFFC;
  if ((int)v36 < 1)
  {
    LODWORD(v37) = 0;
  }
  else
  {
    v37 = 0;
    v38 = &this->var5[0][115];
    v39 = (float32x4_t *)(v34 + 1);
    do
    {
      v40 = (float32x4_t *)(v38 - 114);
      v41 = *(float32x4_t *)v38;
      v38 += 4;
      *v39++ = vaddq_f32(*v40, v41);
      v37 += 4;
    }
    while (v37 < v36);
  }
  if ((int)v37 < (int)v25)
  {
    v42 = v25 - v37;
    v43 = &v34[v37 + 1];
    v44 = &this->var5[0][v37 + 1];
    do
    {
      *v43++ = *v44 + v44[114];
      ++v44;
      --v42;
    }
    while (v42);
  }
  if ((int)v36 < 1)
  {
    LODWORD(v45) = 0;
  }
  else
  {
    v45 = 0;
    v46 = &this->var5[0][229];
    do
    {
      v47 = *(float32x4_t *)v46;
      v46 += 4;
      *v35 = vaddq_f32(*v35, v47);
      ++v35;
      v45 += 4;
    }
    while (v45 < v36);
  }
  if ((int)v45 < (int)v25)
  {
    v48 = v25 - v45;
    v49 = &this->var5[0][v45 + 229];
    v50 = &v34[v45 + 1];
    do
    {
      v51 = *v49++;
      *v50 = *v50 + v51;
      ++v50;
      --v48;
    }
    while (v48);
  }
  v52 = v24 + 1;
  if (a5 <= 0.0)
  {
    v56 = *v26;
  }
  else if (v34[v24] <= a5)
  {
    v56 = v26[v24];
  }
  else
  {
    v53 = 0;
    do
    {
      v54 = v53;
      v55 = v34[v53++];
    }
    while (v54 < v52 && v55 < a5);
    v56 = 0.0;
    if (v53 != 1)
    {
      v57 = (v53 - 2);
      v58 = v34[v57];
      if (vabds_f32(v55, v58) >= 0.00000011921)
        v56 = v26[v57] + (float)((float)((float)(a5 - v58) / (float)(v55 - v58)) * (float)(v26[v53 - 1] - v26[v57]));
      else
        v56 = v26[v53 - 1];
    }
  }
  if (this->var6[2])
  {
    v59 = 0;
  }
  else
  {
    this->var6[2] = 1;
    v59 = this->var5[2];
  }
  *v59 = 0.0;
  if ((int)v25 >= 1)
  {
    v60 = v59 + 1;
    v61 = v34 + 1;
    v62 = 0.0;
    do
    {
      v63 = *v61++;
      v62 = v62 + v63;
      *v60++ = v62;
      --v30;
    }
    while (v30);
  }
  if (a5 <= 0.0)
  {
    v67 = *v26;
  }
  else if (v59[v24] <= a5)
  {
    v67 = v26[v24];
  }
  else
  {
    v64 = 0;
    do
    {
      v65 = v64;
      v66 = v59[v64++];
    }
    while (v65 < v52 && v66 < a5);
    v67 = 0.0;
    if (v64 != 1)
    {
      v68 = (v64 - 2);
      v69 = v59[v68];
      if (vabds_f32(v66, v69) >= 0.00000011921)
        v67 = v26[v68] + (float)((float)((float)(a5 - v69) / (float)(v66 - v69)) * (float)(v26[v64 - 1] - v26[v68]));
      else
        v67 = v26[v64 - 1];
    }
  }
  *a7 = v67;
  v70 = 0.0;
  if (v56 > 0.00000011921)
    v70 = fminf(v67 / v56, 1.0) * 0.85;
  *a8 = v70;
  v71 = a3 + 63;
  if (a3 < -63)
    v71 = a3 + 126;
  result = fminf(*a7, a6) / (float)(v71 >> 6);
  *a7 = result;
  *(_DWORD *)var6 = 0;
  return result;
}

LTMCompute *LTMCompute::calculateGlobalLUTandModifySceneModels(LTMCompute *this, uint64_t a2, const sLtmComputeInput *a3, const sLtmComputeMeta *a4, const sLtmTuningParams *a5, const sLtmDisplayParams *a6, sLtmFrameParams *a7, sLtmComputeOutput *a8)
{
  _BYTE *v13;
  float v14;
  float v15;
  uint64_t v16;
  float32x4_t *v17;
  BOOL *var6;
  float *v19;
  float *v20;
  float v21;
  float var30;
  float v23;
  unint64_t v24;
  unint64_t v25;
  float v26;
  uint64_t v27;
  float v28;
  int v29;
  float v30;
  float v31;
  float v32;
  float *v33;
  float v34;
  float v35;
  float32x4_t *v36;
  float32x4_t *v37;
  float *thumbnailHistEV0;
  float *var1;
  float var15;
  uint64_t i;
  float v42;
  float v43;
  float var2;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  unint64_t v50;
  unint64_t v51;
  float v52;
  float v53;
  uint64_t v54;
  float v55;
  float v56;
  unint64_t v57;
  unint64_t v58;
  float v59;
  float v60;
  uint64_t v61;
  float v62;
  float v63;
  uint64_t v64;
  float v65;
  LTMCompute *v66;
  uint64_t v67;
  float v68;
  float32x4_t *v69;
  unint64_t v70;
  float v71;
  float32x4_t v72;
  float *v73;
  LTMCompute *v74;
  float *v75;
  float *globalLUT;
  LTMCompute *v77;
  LTMCompute *v78;
  uint64_t v79;
  float (*var5)[342];
  float v81;
  float v82;
  unint64_t v83;
  float32x4_t *v84;
  float32x4_t *v85;
  float32x4_t v86;
  float32x4_t *v87;
  unint64_t v88;
  float32x4_t *v89;
  float32x4_t v90;
  uint64_t v91;
  float v92;
  float32x4_t *v93;
  unint64_t v94;
  float v95;
  float32x4_t v96;
  LTMCompute *v97;
  float v98;
  float *v99;
  unint64_t v100;
  unint64_t v101;
  float v102;
  float v103;
  uint64_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  unint64_t v109;
  unint64_t v110;
  float v111;
  uint64_t v112;
  float v113;
  unint64_t v114;
  unint64_t v115;
  float v116;
  float v117;
  uint64_t v118;
  float v119;
  float v120;
  float v121;
  unint64_t v122;
  unint64_t v123;
  float v124;
  float v125;
  uint64_t v126;
  float v127;
  float *v128;
  LTMCompute *v129;
  LTMCompute *result;
  unint64_t v131;
  float v132;
  unint64_t v133;
  float v134;
  float32x4_t v135;
  char *v136;
  float *v137;
  float *v138;
  float v139;
  unint64_t v140;
  __int128 *v141;
  __int128 *v142;
  float32x4_t *v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  LTMCompute *v147;
  float *v148;
  float32x4_t *v149;
  char *v150;
  float v151;
  float *v152;
  float v155[256];
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v13 = (char *)a8 + 36580;
  if (a2 != 2)
  {
    v14 = -1.0;
    if (a4->useDigitalFlash)
      goto LABEL_7;
LABEL_20:
    memcpy(a8->globalLUT, &LTMCompute::globalCurveInputs, sizeof(a8->globalLUT));
LABEL_136:
    result = (LTMCompute *)memcpy(a7->var12, a6->var1, sizeof(a7->var12));
    goto LABEL_137;
  }
  if (!a4->useDigitalFlash)
    goto LABEL_20;
  v14 = -1.0;
  if (a7->var16 > 1.0 && !a4->useGlobalCCM)
  {
    v15 = fmaxf((float)(a7->var19 * -5.0) + 1.03, 0.0);
    v14 = fminf(v15 * v15, 1.0);
  }
LABEL_7:
  v150 = (char *)a8 + 36580;
  v16 = 0;
  v17 = (float32x4_t *)&a8->globalLUT[4];
  var6 = this->var6;
  v152 = &this->var5[0][4];
  v19 = this->var5[2];
  if (this->var6[2])
    v20 = 0;
  else
    v20 = this->var5[2];
  *v20 = 0.0;
  v21 = 0.0;
  do
  {
    v21 = v21 + a7->var9[v16];
    v20[++v16] = v21;
  }
  while (v16 != 64);
  var30 = a7->var30;
  v23 = 0.0;
  if (var30 > 0.0)
  {
    if (v20[63] <= var30)
    {
      v23 = 0.98438;
    }
    else
    {
      v24 = 0;
      do
      {
        v25 = v24;
        v26 = v20[v24++];
      }
      while (v25 <= 0x3F && v26 < var30);
      if (v24 != 1)
      {
        v27 = (v24 - 2);
        v28 = v20[v27];
        if (vabds_f32(v26, v28) >= 0.00000011921)
          v23 = *((float *)&LTMCompute::localCurveInputs + v27)
              + (float)((float)((float)(var30 - v28) / (float)(v26 - v28))
                      * (float)(*((float *)&LTMCompute::localCurveInputs + v24 - 1)
                              - *((float *)&LTMCompute::localCurveInputs + v27)));
        else
          v23 = *((float *)&LTMCompute::localCurveInputs + v24 - 1);
      }
    }
  }
  v29 = 0;
  v30 = fminf(v23 * 64.0, a7->var29);
  this->var6[2] = 1;
  v31 = floorf(v30);
  v32 = ceilf(v30);
  v33 = this->var5[2];
  do
  {
    v34 = (float)v29;
    v35 = 1.0;
    if (v31 <= (float)v29)
    {
      v35 = 0.0;
      if (v32 > v34)
        v35 = v30 - v34;
    }
    if (v33)
      *v33++ = v35;
    ++v29;
  }
  while (v29 != 64);
  v151 = v14;
  v148 = &a7->var8[4];
  if (this->var6[3])
  {
    v36 = 0;
  }
  else
  {
    this->var6[3] = 1;
    v36 = (float32x4_t *)this->var5[3];
  }
  memset_pattern16(v36, &unk_230930680, 0x100uLL);
  if (this->var6[1])
  {
    v37 = 0;
  }
  else
  {
    this->var6[1] = 1;
    v37 = (float32x4_t *)this->var5[1];
  }
  thumbnailHistEV0 = a3->thumbnailHistEV0;
  var1 = a6->var1;
  v149 = v37;
  LTMCompute::allocateTone(this, v37, 0, thumbnailHistEV0, a5, a6, a7, v36, a7->var2, a7->var3, 1.0, (float32x4_t *)this->var5[2], a7->var9, flt_2309318C4, a6->var1, 1, a4->gammaCurve == 1);
  this->var6[3] = 0;
  var15 = a7->var15;
  for (i = -4; i != 80; i += 4)
    ;
  if (fabsf(0.3125 + -0.29688) >= 0.00000011921)
    v42 = a6->var0[19] + (float)((float)(0.003125 / (float)(0.3125 + -0.29688)) * (float)(a6->var0[20] - a6->var0[19]));
  else
    v42 = a6->var0[20];
  v43 = fminf(11.52 / var15, 1.0);
  var2 = a6->var2;
  v45 = v42 * var2;
  v46 = a7->var8[0];
  v47 = 1.0;
  if (v45 < v46)
  {
    v48 = v45 / v46;
    v49 = (float)(v43 * v45) / var2;
    if (v49 <= 0.0)
    {
      v53 = *var1;
    }
    else if (v49 >= 0.98438)
    {
      v53 = a6->var1[63];
    }
    else
    {
      v50 = 0;
      do
      {
        v51 = v50;
        v52 = *((float *)&LTMCompute::localCurveInputs + v50++);
      }
      while (v51 <= 0x3F && v52 < v49);
      v53 = 0.0;
      if (v50 != 1)
      {
        v54 = (v50 - 2);
        v55 = *((float *)&LTMCompute::localCurveInputs + v54);
        if (vabds_f32(v52, v55) >= 0.00000011921)
          v53 = var1[v54]
              + (float)((float)((float)(v49 - v55) / (float)(v52 - v55)) * (float)(a6->var0[v50 + 64] - var1[v54]));
        else
          v53 = a6->var0[v50 + 64];
      }
    }
    v56 = (float)(v43 * (float)(v45 * v48)) / var2;
    if (v56 <= 0.0)
    {
      v60 = *var1;
    }
    else if (v56 >= 0.98438)
    {
      v60 = a6->var1[63];
    }
    else
    {
      v57 = 0;
      do
      {
        v58 = v57;
        v59 = *((float *)&LTMCompute::localCurveInputs + v57++);
      }
      while (v58 <= 0x3F && v59 < v56);
      v60 = 0.0;
      if (v57 != 1)
      {
        v61 = (v57 - 2);
        v62 = *((float *)&LTMCompute::localCurveInputs + v61);
        if (vabds_f32(v59, v62) >= 0.00000011921)
          v60 = var1[v61]
              + (float)((float)((float)(v56 - v62) / (float)(v59 - v62)) * (float)(a6->var0[v57 + 64] - var1[v61]));
        else
          v60 = a6->var0[v57 + 64];
      }
    }
    v63 = logf(v53);
    v47 = fminf(fmaxf(v63 / logf(v60), 0.5), 1.0);
  }
  v64 = 0;
  v65 = (float)(fmaxf(v47, 0.9) * 1.2)
      * (float)((float)((float)(fminf(fmaxf(var15 + -4.0, 0.0) * 0.25, 1.0) * -0.2) * this->var4.var17) + 1.0);
  do
  {
    a8->globalLUT[v64] = powf(*(float *)((char *)&LTMCompute::globalCurveInputs + v64 * 4), v65);
    ++v64;
  }
  while (v64 != 257);
  v67 = 0;
  this->var6[2] = 1;
  this->var5[2][0] = 0.0;
  v68 = 0.0;
  do
  {
    v68 = v68 + a7->var8[v67];
    this->var5[2][++v67] = v68;
  }
  while (v67 != 64);
  v69 = (float32x4_t *)(v152 + 684);
  v70 = -8;
  v71 = 1.0 / this->var5[2][64];
  do
  {
    v72 = vmulq_n_f32(*v69, v71);
    v69[-1] = vmulq_n_f32(v69[-1], v71);
    *v69 = v72;
    v70 += 8;
    v69 += 2;
  }
  while (v70 < 0x38);
  this->var5[2][64] = v71 * this->var5[2][64];
  if (this->var6[3])
  {
    v73 = 0;
  }
  else
  {
    this->var6[3] = 1;
    v73 = this->var5[3];
  }
  LTMCompute::interpolate(v66, (float *)&LTMCompute::localCurveInputs, var1, 65, this->var5[2], v73, 65);
  if (*var6)
  {
    v75 = 0;
  }
  else
  {
    *var6 = 1;
    v75 = this->var5[0];
  }
  globalLUT = a8->globalLUT;
  LTMCompute::interpolate(v74, a8->globalLUT, (float *)&LTMCompute::globalCurveInputs, 257, v73, v75, 65);
  LTMCompute::interpolate(v77, (float *)&LTMCompute::localCurveInputs, a6->var0, 65, v75, v73, 65);
  v79 = 0;
  *var6 = 1;
  var5 = this->var5;
  v81 = this->var5[2][0];
  do
  {
    v82 = (*var5)[v79 + 685];
    (*var5)[v79] = fmaxf(v73[v79 + 1] - v73[v79], 0.00000011921) / fmaxf(v82 - v81, 0.00000011921);
    ++v79;
    v81 = v82;
  }
  while (v79 != 64);
  v83 = -8;
  v84 = (float32x4_t *)v148;
  v85 = (float32x4_t *)v152;
  do
  {
    v86 = vmulq_f32(*v84, *v85);
    v84[-1] = vmulq_f32(v84[-1], v85[-1]);
    *v84 = v86;
    v83 += 8;
    v85 += 2;
    v84 += 2;
  }
  while (v83 < 0x38);
  v87 = (float32x4_t *)(v148 + 128);
  v88 = -8;
  v89 = (float32x4_t *)v152;
  do
  {
    v90 = vmulq_f32(*v87, *v89);
    v87[-1] = vmulq_f32(v87[-1], v89[-1]);
    *v87 = v90;
    v88 += 8;
    v89 += 2;
    v87 += 2;
  }
  while (v88 < 0x38);
  v91 = 0;
  *var6 = 0;
  this->var5[2][0] = 0.0;
  v92 = 0.0;
  do
  {
    v92 = v92 + a7->var8[v91];
    this->var5[2][++v91] = v92;
  }
  while (v91 != 64);
  v93 = (float32x4_t *)(v152 + 684);
  v94 = -8;
  v95 = 1.0 / this->var5[2][64];
  do
  {
    v96 = vmulq_n_f32(*v93, v95);
    v93[-1] = vmulq_n_f32(v93[-1], v95);
    *v93 = v96;
    v94 += 8;
    v93 += 2;
  }
  while (v94 < 0x38);
  this->var5[2][64] = v95 * this->var5[2][64];
  LTMCompute::interpolate(v78, (float *)&LTMCompute::localCurveInputs, var1, 65, this->var5[2], v73, 65);
  this->var6[2] = 0;
  v98 = v43 * 0.015625;
  if ((float)(v43 * 0.015625) <= 0.0)
  {
    v103 = *v73;
    v99 = (float *)v149;
  }
  else
  {
    v99 = (float *)v149;
    if (v98 >= 1.0)
    {
      v103 = v73[64];
    }
    else
    {
      v100 = 0;
      do
      {
        v101 = v100;
        v102 = *((float *)&LTMCompute::localCurveInputs + v100++);
      }
      while (v101 <= 0x40 && v102 < v98);
      v103 = 0.0;
      if (v100 != 1)
      {
        v104 = (v100 - 2);
        v105 = *((float *)&LTMCompute::localCurveInputs + v104);
        if (vabds_f32(v102, v105) >= 0.00000011921)
          v103 = v73[v104]
               + (float)((float)((float)(v98 - v105) / (float)(v102 - v105)) * (float)(v73[v100 - 1] - v73[v104]));
        else
          v103 = v73[v100 - 1];
      }
    }
  }
  v106 = fminf(v103, 0.5) * 256.0;
  v107 = (float)(int)floorf(v106) * 0.0039062;
  v108 = 0.0;
  if (*v73 < v107)
  {
    if (v73[63] <= v107)
    {
      v108 = 0.98438;
    }
    else
    {
      v109 = 0;
      do
      {
        v110 = v109;
        v111 = v73[v109++];
      }
      while (v110 <= 0x3F && v111 < v107);
      if (v109 != 1)
      {
        v112 = (v109 - 2);
        v113 = v73[v112];
        if (vabds_f32(v111, v113) >= 0.00000011921)
          v108 = *((float *)&LTMCompute::localCurveInputs + v112)
               + (float)((float)((float)(v107 - v113) / (float)(v111 - v113))
                       * (float)(*((float *)&LTMCompute::localCurveInputs + v109 - 1)
                               - *((float *)&LTMCompute::localCurveInputs + v112)));
        else
          v108 = *((float *)&LTMCompute::localCurveInputs + v109 - 1);
      }
    }
  }
  LODWORD(v19) = vcvtms_s32_f32(v106);
  if (v107 <= 0.0)
  {
    v117 = *globalLUT;
  }
  else if (v107 >= 1.0)
  {
    v117 = a8->globalLUT[256];
  }
  else
  {
    v114 = 0;
    do
    {
      v115 = v114;
      v116 = *((float *)&LTMCompute::globalCurveInputs + v114++);
    }
    while (v115 <= 0x100 && v116 < v107);
    v117 = 0.0;
    if (v114 != 1)
    {
      v118 = (v114 - 2);
      v119 = *((float *)&LTMCompute::globalCurveInputs + v118);
      if (vabds_f32(v116, v119) >= 0.00000011921)
        v117 = globalLUT[v118]
             + (float)((float)((float)(v107 - v119) / (float)(v116 - v119))
                     * (float)(a8->averageLTC[v114 + 64] - globalLUT[v118]));
      else
        v117 = a8->averageLTC[v114 + 64];
    }
  }
  v120 = a7->var15;
  v121 = v108 * v120;
  if ((float)(v108 * v120) <= 0.0)
  {
    v125 = *v99;
  }
  else if (v121 >= 0.98438)
  {
    v125 = v99[63];
  }
  else
  {
    v122 = 0;
    do
    {
      v123 = v122;
      v124 = *((float *)&LTMCompute::localCurveInputs + v122++);
    }
    while (v123 <= 0x3F && v124 < v121);
    v125 = 0.0;
    if (v122 != 1)
    {
      v126 = (v122 - 2);
      v127 = *((float *)&LTMCompute::localCurveInputs + v126);
      if (vabds_f32(v124, v127) >= 0.00000011921)
        v125 = v99[v126]
             + (float)((float)((float)(v121 - v127) / (float)(v124 - v127)) * (float)(v99[v122 - 1] - v99[v126]));
      else
        v125 = v99[v122 - 1];
    }
  }
  v128 = v99;
  LTMCompute::interpolate(v97, v73, (float *)&LTMCompute::localCurveInputs, 64, (const float *)&LTMCompute::globalCurveInputs, v155, (int)v19);
  result = (LTMCompute *)LTMCompute::interpolate(v129, (float *)&LTMCompute::localCurveInputs, v128, 65, v155, globalLUT, (int)v19, v120);
  v131 = v19 & 0xFFFFFFF8;
  v132 = v117 / v125;
  if ((int)v131 < 1)
  {
    LODWORD(v133) = 0;
    v134 = v151;
  }
  else
  {
    v133 = 0;
    v134 = v151;
    do
    {
      v135 = vmulq_n_f32(*v17, v132);
      v17[-1] = vmulq_n_f32(v17[-1], v132);
      *v17 = v135;
      v133 += 8;
      v17 += 2;
    }
    while (v133 < v131);
  }
  if ((int)v133 < (int)v19)
  {
    v136 = (char *)v19 - v133;
    v137 = &a8->globalLUT[v133];
    do
    {
      *v137 = v132 * *v137;
      ++v137;
      --v136;
    }
    while (v136);
  }
  this->var6[1] = 0;
  this->var6[3] = 0;
  if (v134 >= 0.0)
  {
    this->var6[1] = 1;
    v138 = this->var5[1];
    this->var6[3] = 1;
    v139 = 1.0 - v134;
    v140 = -4;
    v141 = &LTMCompute::globalCurveInputs;
    v142 = &LTMCompute::liftedGTC;
    v143 = (float32x4_t *)this->var5[1];
    do
    {
      v144 = (float32x4_t)*v142++;
      v145 = v144;
      v146 = (float32x4_t)*v141++;
      *v143++ = vaddq_f32(vmulq_n_f32(v145, v134), vmulq_n_f32(v146, v139));
      v140 += 4;
    }
    while (v140 < 0xFC);
    this->var5[1][256] = v134 + v139;
    LTMCompute::interpolate(result, v138, (float *)&LTMCompute::globalCurveInputs, 257, var1, a7->var12, 65);
    LTMCompute::interpolate(v147, (float *)&LTMCompute::globalCurveInputs, v138, 257, globalLUT, this->var5[3], 257);
    result = (LTMCompute *)memcpy(globalLUT, this->var5[3], 0x404uLL);
    v134 = v151;
    var6[1] = 0;
    var6[3] = 0;
  }
  v13 = v150;
  if (v134 < 0.0)
    goto LABEL_136;
LABEL_137:
  *v13 |= 8u;
  return result;
}

void LTMCompute::allocateTone(LTMCompute *this, float32x4_t *a2, float32x4_t *a3, const float *a4, const sLtmTuningParams *a5, const sLtmDisplayParams *a6, const sLtmFrameParams *a7, float32x4_t *a8, float a9, float a10, float a11, float32x4_t *a12, const float *a13, const float *a14, float *a15, BOOL a16, BOOL a17)
{
  unint64_t v26;
  const float *v27;
  float *p_var21;
  float32x4_t v29;
  unint64_t v30;
  float32x4_t *v31;
  unint64_t v32;
  float32x4_t v33;
  float32x4_t v34;
  unint64_t v35;
  float32x4_t *v36;
  unint64_t v42;
  float32x4_t *v43;
  float32x4_t v44;
  int32x2_t v45;
  int32x2_t v46;
  int32x2_t v47;
  uint64_t v48;
  float *p_var27;
  float32x4_t v50;
  int32x4_t v51;
  float *p_var26;
  float32x4_t v53;
  float32x4_t v54;
  __int128 v55;
  float v56;
  __int128 v57;
  float v58;
  __int128 v59;
  int32x4_t v60;
  int v61;
  float v62;
  float v63;
  float32x4_t *v64;
  float v65;
  float v66;
  uint64_t v67;
  float v68;
  unint64_t v69;
  float v70;
  float v71;
  float v72;
  unint64_t v73;
  float v74;
  float v75;
  float v76;
  float v77;
  uint64_t v78;
  float v79;
  float v80;
  int v81;
  float v82;
  float v83;
  float32x4_t *v84;
  float v85;
  float v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  float32x4_t v91;
  uint64_t i;
  unint64_t v93;
  float v94;
  float32x4_t v95;
  float v96;
  float (*var5)[342];
  float32x4_t *v98;
  float32x4_t *v99;
  unint64_t v100;
  float32x4_t v101;
  uint64_t j;
  uint64_t v103;
  float v104;
  float32x4_t v105;
  float32x4_t *v106;
  unint64_t v107;
  float v108;
  float32x4_t v109;
  LTMCompute *v110;
  unint64_t v111;
  unint64_t v112;
  float32x4_t v113;
  _OWORD *v114;
  uint64_t v115;
  float v116;
  float32x4_t v117;
  unint64_t v118;
  float32x4_t *v119;
  float v120;
  float *v121;
  float32x4_t *v122;
  unint64_t v123;
  float32x4_t *v124;
  unint64_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t *v131;
  unint64_t v132;
  float v133;
  float32x4_t v134;
  unint64_t v135;
  float32x4_t *v136;
  float v137;
  unint64_t v138;
  float32x4_t *v139;
  float v140;
  float v141;
  BOOL *var6;
  int32x2_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  float32x4_t v150;
  int32x4_t v151;
  float v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  float32x4_t v156;
  float32x4_t v157[16];
  float32x4_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _OWORD v175[16];
  float32x4_t v176[16];
  _OWORD v177[16];
  _OWORD v178[15];
  __int128 v179;
  _OWORD __src[17];
  __int128 v181;
  _OWORD v182[15];
  uint64_t v183;

  v26 = 0;
  v27 = a13;
  v183 = *MEMORY[0x24BDAC8D0];
  var6 = this->var6;
  memset(v182, 0, sizeof(v182));
  v181 = 0u;
  memset(__src, 0, 260);
  v179 = 0u;
  memset(v178, 0, sizeof(v178));
  memset(v177, 0, sizeof(v177));
  memset(v176, 0, sizeof(v176));
  v174 = 0u;
  memset(v175, 0, sizeof(v175));
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v159 = 0u;
  memset(&v158, 0, 256);
  memset(v157, 0, sizeof(v157));
  p_var21 = &a7->var21;
  v29 = vld1q_dup_f32(p_var21);
  v30 = -4;
  do
  {
    v178[v26 / 4] = vminq_f32(v29, *(float32x4_t *)&a4[v26]);
    v30 += 4;
    v26 += 4;
  }
  while (v30 < 0x3C);
  LTMCompute::smoothHistogramMiddle(this, (float *)v178, (float *)&v181, 64, a14, (int)*((float *)a5 + 3), 1);
  v31 = (float32x4_t *)v182;
  v32 = -8;
  v33 = (float32x4_t)vdupq_n_s32(0x42800000u);
  do
  {
    v34 = vmulq_f32(*v31, v33);
    v31[-1] = vmulq_f32(v31[-1], v33);
    *v31 = v34;
    v32 += 8;
    v31 += 2;
  }
  while (v32 < 0x38);
  v35 = -4;
  v36 = (float32x4_t *)&v181;
  __asm { FMOV            V1.4S, #1.0 }
  do
  {
    *v36 = vminq_f32(*v36, _Q1);
    ++v36;
    v35 += 4;
  }
  while (v35 < 0x3C);
  v150 = _Q1;
  v42 = -4;
  v43 = (float32x4_t *)&v181;
  v44 = (float32x4_t)vdupq_n_s32(0x2EDBE6FFu);
  do
  {
    *v43 = vmaxq_f32(*v43, v44);
    ++v43;
    v42 += 4;
  }
  while (v42 < 0x3C);
  LTMCompute::smoothHistogramMiddle(this, (float *)&v181, (float *)v178, 64, a14, (int)*((float *)a5 + 3), !a17);
  v46.i32[0] = LODWORD(a6->var2);
  v47.i32[0] = *((_DWORD *)a5 + 22);
  if (*(float *)v47.i32 >= 1.0)
  {
    v145 = v46;
  }
  else
  {
    *(float *)v47.i32 = fminf(*(float *)v46.i32* (float)((float)((float)(*(float *)v47.i32 * *((float *)&v179 + 3)) + 1.0)- *((float *)&v179 + 3)), a7->var22);
    v145 = v47;
  }
  v48 = 0;
  *(float *)v45.i32 = fminf(64.0 / a11, 64.0);
  p_var27 = &a7->var27;
  v50 = vld1q_dup_f32(p_var27);
  v149 = v50;
  v51 = (int32x4_t)xmmword_23092FA90;
  p_var26 = &a7->var26;
  v50.f32[0] = *(float *)v45.i32 + *(float *)v45.i32;
  v141 = *(float *)v45.i32;
  v147 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 0);
  v148 = (float32x4_t)vdupq_lane_s32(v45, 0);
  v53 = vld1q_dup_f32(p_var26);
  v146 = v53;
  do
  {
    v151 = v51;
    v54 = vminnmq_f32(vdivq_f32(vmaxnmq_f32(vsubq_f32(vaddq_f32(vcvtq_f32_s32(v51), v150), v148), (float32x4_t)0), v147), v150);
    v155 = v178[v48];
    v156 = vmlaq_f32(vmulq_f32(v54, v149), vsubq_f32(v150, v54), v146);
    v152 = powf(COERCE_FLOAT(HIDWORD(*(_QWORD *)&v178[v48])), v156.f32[1]);
    *(float *)&v55 = powf(*(float *)&v155, v156.f32[0]);
    *((float *)&v55 + 1) = v152;
    v153 = v55;
    v56 = powf(*((float *)&v155 + 2), v156.f32[2]);
    v57 = v153;
    *((float *)&v57 + 2) = v56;
    v154 = v57;
    v58 = powf(*((float *)&v155 + 3), v156.f32[3]);
    v59 = v154;
    *((float *)&v59 + 3) = v58;
    v178[v48] = v59;
    v60.i64[0] = 0x400000004;
    v60.i64[1] = 0x400000004;
    v51 = vaddq_s32(v151, v60);
    ++v48;
  }
  while (v48 != 16);
  v61 = 0;
  v62 = floorf(v141);
  v63 = ceilf(v141);
  v64 = &v158;
  do
  {
    v65 = (float)v61;
    v66 = 1.0;
    if (v62 <= (float)v61)
    {
      v66 = 0.0;
      if (v63 > v65)
        v66 = v141 - v65;
    }
    if (v64)
    {
      v64->f32[0] = v66;
      v64 = (float32x4_t *)((char *)v64 + 4);
    }
    ++v61;
  }
  while (v61 != 64);
  if (a17)
  {
    v67 = 0;
    v68 = 0.0;
    do
      v68 = v68 + a4[v67++];
    while (v67 != 64);
    v69 = 0;
    v70 = v68 * 0.18;
    v71 = 0.0;
    do
    {
      v72 = v71;
      v73 = v69;
      v74 = a4[v69++];
      if (v73 > 0x3F)
        break;
      v71 = v71 + v74;
    }
    while ((float)(v72 + v74) < v70);
    if ((_DWORD)v69 == 65)
      v75 = 63.0;
    else
      v75 = (float)((float)(v70 - v72) / v74) + (float)((int)v69 - 1);
    v76 = fminf(v75, a7->var31);
    v77 = ceilf(v76);
    if (v77 > 0.0)
    {
      v78 = 0;
      v79 = fminf(a4[vcvtms_s32_f32(v75)], 1.0);
      do
      {
        v158.f32[v78] = (float)(v79 * a12->f32[v78]) + (float)(a8->f32[v78] * (float)(1.0 - v79));
        ++v78;
      }
      while (v77 > (float)(int)v78);
    }
    v80 = fmaxf(v77 + -1.0, 0.0);
    v158.f32[v80] = (float)((float)(1.0 - (float)((float)(v76 + 1.0) - v77)) * a8->f32[v80])
                  + (float)(v158.f32[v80] * (float)((float)(v76 + 1.0) - v77));
  }
  if (a10 >= 1.0)
  {
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
  }
  else
  {
    v81 = 0;
    v82 = floorf(a10 * 64.0);
    v83 = ceilf(a10 * 64.0);
    v84 = v157;
    do
    {
      v85 = (float)v81;
      v86 = 1.0;
      if (v82 <= (float)v81)
      {
        v86 = 0.0;
        if (v83 > v85)
          v86 = (float)(a10 * 64.0) - v85;
      }
      if (v84)
      {
        v84->f32[0] = 1.0 - v86;
        v84 = (float32x4_t *)((char *)v84 + 4);
      }
      ++v81;
    }
    while (v81 != 64);
    v87 = 0;
    v88 = -4;
    do
    {
      v176[v87] = vminq_f32(v157[v87], a8[v87]);
      v88 += 4;
      ++v87;
    }
    while (v88 < 0x3C);
    v89 = 0;
    v90 = -4;
    do
    {
      v91 = vminq_f32((float32x4_t)v178[v89], v176[v89]);
      v177[v89] = v91;
      v90 += 4;
      ++v89;
    }
    while (v90 < 0x3C);
    v91.f32[0] = fmaxf(*(float *)v145.i32 - a9, 0.0);
    LTMCompute::scaleToFitRange(this, (float *)&v159, v176, (const float *)v177, a13, v91, v157, 0.0, 0);
  }
  if (a12)
  {
    for (i = 0; i != 16; ++i)
      v178[i] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v178[i], a12[i]), (int8x16_t)v178[i], (int8x16_t)a12[i]);
    v93 = 0;
    v94 = 0.0;
    do
    {
      v95 = vmulq_f32(a12[v93 / 4], *(float32x4_t *)&a13[v93]);
      v94 = (float)((float)((float)(v94 + v95.f32[0]) + v95.f32[1]) + v95.f32[2]) + v95.f32[3];
      v93 += 4;
    }
    while (v93 != 64);
    v96 = (float)(fminf(*(float *)v145.i32 * 0.5, v94) / v94) * a7->var32;
    if (*var6)
    {
      var5 = 0;
    }
    else
    {
      *var6 = 1;
      var5 = this->var5;
    }
    v98 = (float32x4_t *)&(*var5)[4];
    v99 = a12 + 1;
    v100 = -8;
    do
    {
      v101 = vaddq_f32(vmulq_n_f32(*v99, v96), (float32x4_t)0);
      v98[-1] = vaddq_f32(vmulq_n_f32(v99[-1], v96), (float32x4_t)0);
      *v98 = v101;
      v100 += 8;
      v98 += 2;
      v99 += 2;
    }
    while (v100 < 0x38);
    for (j = 0; j != 64; j += 4)
      *(__int128 *)((char *)&v159 + j * 4) = (__int128)vbslq_s8((int8x16_t)vcgtq_f32(*(float32x4_t *)&(*var5)[j], *(float32x4_t *)((char *)&v159 + j * 4)), *(int8x16_t *)&(*var5)[j], *(int8x16_t *)((char *)&v159 + j * 4));
    *var6 = 0;
  }
  v103 = 0;
  v104 = 0.0;
  do
  {
    v105 = vmulq_f32(*(float32x4_t *)((char *)&v159 + v103 * 4), *(float32x4_t *)&a13[v103]);
    v104 = (float)((float)((float)(v104 + v105.f32[0]) + v105.f32[1]) + v105.f32[2]) + v105.f32[3];
    v103 += 4;
  }
  while (v103 != 64);
  if (v104 > *(float *)v145.i32)
  {
    v106 = (float32x4_t *)&v160;
    v107 = -8;
    v108 = *(float *)v145.i32 / v104;
    do
    {
      v109 = vmulq_n_f32(*v106, v108);
      v106[-1] = vmulq_n_f32(v106[-1], v108);
      *v106 = v109;
      v107 += 8;
      v106 += 2;
    }
    while (v107 < 0x38);
    v104 = *(float *)v145.i32;
  }
  v105.i32[0] = v145.i32[0];
  LTMCompute::scaleToFitRange(this, (float *)v175, a8, (const float *)v178, a13, v105, &v158, v104, (const float *)&v159);
  v111 = 0;
  v112 = -8;
  do
  {
    v113 = vmulq_f32((float32x4_t)v175[v111 / 0x10 + 1], *(float32x4_t *)&a13[v111 / 4 + 4]);
    v114 = &v182[v111 / 0x10 - 1];
    *v114 = vmulq_f32((float32x4_t)v175[v111 / 0x10], *(float32x4_t *)&a13[v111 / 4]);
    v114[1] = v113;
    v112 += 8;
    v111 += 32;
  }
  while (v112 < 0x38);
  v115 = 0;
  LODWORD(__src[0]) = 0;
  v116 = 0.0;
  do
  {
    v116 = v116 + *(float *)((char *)&v182[-1] + v115);
    *(float *)((char *)__src + v115 + 4) = v116;
    v115 += 4;
  }
  while (v115 != 256);
  v117 = (float32x4_t)vdupq_lane_s32(v145, 0);
  v118 = -4;
  v119 = (float32x4_t *)__src;
  do
  {
    *v119 = vminq_f32(v117, *v119);
    ++v119;
    v118 += 4;
  }
  while (v118 < 0x3C);
  v120 = *(float *)&__src[16];
  if (*(float *)&__src[16] > *(float *)v145.i32)
    v120 = *(float *)v145.i32;
  *(float *)&__src[16] = v120;
  if (a3)
  {
    if (var6[3])
    {
      v121 = 0;
    }
    else
    {
      var6[3] = 1;
      *(_OWORD *)&this->var5[3][0] = 0u;
      v121 = this->var5[3];
      *(_OWORD *)&this->var5[3][4] = 0u;
      *(_OWORD *)&this->var5[3][8] = 0u;
      *(_OWORD *)&this->var5[3][12] = 0u;
      *(_OWORD *)&this->var5[3][16] = 0u;
      *(_OWORD *)&this->var5[3][20] = 0u;
      *(_OWORD *)&this->var5[3][24] = 0u;
      *(_OWORD *)&this->var5[3][28] = 0u;
      *(_OWORD *)&this->var5[3][32] = 0u;
      *(_OWORD *)&this->var5[3][36] = 0u;
      *(_OWORD *)&this->var5[3][40] = 0u;
      *(_OWORD *)&this->var5[3][44] = 0u;
      *(_OWORD *)&this->var5[3][48] = 0u;
      *(_OWORD *)&this->var5[3][52] = 0u;
      *(_OWORD *)&this->var5[3][56] = 0u;
      *(_OWORD *)&this->var5[3][60] = 0u;
      this->var5[3][64] = 0.0;
    }
    v122 = (float32x4_t *)((char *)__src + 4);
    v123 = -4;
    v124 = (float32x4_t *)v121;
    do
    {
      *v124++ = vsubq_f32(*v122, *(float32x4_t *)((char *)v122 - 4));
      v123 += 4;
      ++v122;
    }
    while (v123 < 0x3C);
    v125 = -4;
    do
    {
      v126 = *(float32x4_t *)v27;
      v27 += 4;
      v127 = v126;
      v128 = *(float32x4_t *)v121;
      v121 += 4;
      v129 = vrecpeq_f32(v127);
      v130 = vmulq_f32(v129, vrecpsq_f32(v127, v129));
      *a3++ = vmulq_f32(v128, vmulq_f32(vrecpsq_f32(v127, v130), v130));
      v125 += 4;
    }
    while (v125 < 0x3C);
    var6[3] = 0;
  }
  if (a2)
  {
    v131 = (float32x4_t *)&__src[1];
    v132 = -8;
    v133 = 1.0 / a6->var2;
    do
    {
      v134 = vmulq_n_f32(*v131, v133);
      v131[-1] = vmulq_n_f32(v131[-1], v133);
      *v131 = v134;
      v132 += 8;
      v131 += 2;
    }
    while (v132 < 0x38);
    *(float *)&__src[16] = v133 * *(float *)&__src[16];
    if (a16)
    {
      LTMCompute::interpolate(v110, (float *)&LTMCompute::localCurveInputs, a15, 65, (const float *)__src, a2->f32, 65);
      v135 = -4;
      v136 = a2;
      do
      {
        *v136 = vminq_f32(*v136, v150);
        ++v136;
        v135 += 4;
      }
      while (v135 < 0x3C);
      v137 = a2[16].f32[0];
      if (v137 > 1.0)
        v137 = 1.0;
      a2[16].f32[0] = v137;
      v138 = -4;
      v139 = a2;
      do
      {
        *v139 = vmaxq_f32(*v139, (float32x4_t)0);
        ++v139;
        v138 += 4;
      }
      while (v138 < 0x3C);
      v140 = a2[16].f32[0];
      if (v140 < 0.0)
        v140 = 0.0;
      a2[16].f32[0] = v140;
      a2->i32[0] = 0;
    }
    else
    {
      memcpy(a2, __src, 0x104uLL);
    }
  }
}

float32x4_t LTMCompute::scaleToFitRange(LTMCompute *this, float *a2, float32x4_t *a3, const float *a4, const float *a5, float32x4_t result, float32x4_t *a7, float a8, const float *a9)
{
  BOOL *var6;
  float (*var5)[342];
  float (*v11)[342];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  const float *v21;
  const float *v22;
  float32x4_t *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  unint64_t v27;
  float32x4_t *v28;
  float32x4_t v29;
  unint64_t v30;
  float v31;
  float32x4_t v32;
  float v33;
  uint64_t i;
  float v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  float v49;
  float (*v50)[342];
  float v51;
  uint64_t v52;
  float v53;
  float32x4_t v54;
  float v55;
  float v56;
  unint64_t v57;
  float *v58;
  float (*v59)[342];
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  unint64_t v63;
  float32x4_t *v64;
  float v65;
  float32x4_t *v66;
  unint64_t v67;
  float32x4_t v68;
  unint64_t v69;
  float (*v70)[342];
  float32x4_t *v71;
  float32x4_t v72;
  uint64_t j;
  float v74;
  uint64_t v75;
  float v76;
  float32x4_t v77;
  float v78;
  unint64_t v79;
  float *v80;
  float (*v81)[342];
  float v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  unint64_t v86;
  float32x4_t *v87;
  float v88;
  float32x4_t *v89;
  unint64_t v90;
  float32x4_t v91;
  unint64_t v92;
  float32x4_t v93;
  float *v94;
  float32x4_t *v95;
  unint64_t v96;
  float32x4_t v97;
  unint64_t v98;
  float32x4_t v99;
  __int128 v100;
  _OWORD v101[15];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  var6 = this->var6;
  var5 = this->var5;
  if (a8 <= 0.0)
  {
    v12 = *((_OWORD *)a4 + 13);
    v101[11] = *((_OWORD *)a4 + 12);
    v101[12] = v12;
    v13 = *((_OWORD *)a4 + 15);
    v101[13] = *((_OWORD *)a4 + 14);
    v101[14] = v13;
    v14 = *((_OWORD *)a4 + 9);
    v101[7] = *((_OWORD *)a4 + 8);
    v101[8] = v14;
    v15 = *((_OWORD *)a4 + 11);
    v101[9] = *((_OWORD *)a4 + 10);
    v101[10] = v15;
    v16 = *((_OWORD *)a4 + 5);
    v101[3] = *((_OWORD *)a4 + 4);
    v101[4] = v16;
    v17 = *((_OWORD *)a4 + 7);
    v101[5] = *((_OWORD *)a4 + 6);
    v101[6] = v17;
    v18 = *((_OWORD *)a4 + 1);
    v100 = *(_OWORD *)a4;
    v101[0] = v18;
    v19 = *((_OWORD *)a4 + 3);
    v101[1] = *((_OWORD *)a4 + 2);
    v101[2] = v19;
  }
  else
  {
    if (*var6)
    {
      v11 = 0;
    }
    else
    {
      *var6 = 1;
      v11 = this->var5;
    }
    v20 = -4;
    v21 = a4;
    v22 = a9;
    v23 = (float32x4_t *)v11;
    do
    {
      v24 = *(float32x4_t *)v21;
      v21 += 4;
      v25 = v24;
      v26 = *(float32x4_t *)v22;
      v22 += 4;
      *v23++ = vsubq_f32(v25, v26);
      v20 += 4;
    }
    while (v20 < 0x3C);
    v27 = -4;
    v28 = (float32x4_t *)&v100;
    do
    {
      v29 = *(float32x4_t *)v11;
      v11 = (float (*)[342])((char *)v11 + 16);
      *v28++ = vmaxq_f32(v29, (float32x4_t)0);
      v27 += 4;
    }
    while (v27 < 0x3C);
    *var6 = 0;
  }
  v30 = 0;
  v31 = 0.0;
  do
  {
    v32 = vmulq_f32((float32x4_t)v101[v30 / 4 - 1], *(float32x4_t *)&a5[v30]);
    v31 = (float)((float)((float)(v31 + v32.f32[0]) + v32.f32[1]) + v32.f32[2]) + v32.f32[3];
    v30 += 4;
  }
  while (v30 != 64);
  if (v31 > 0.0 && (v33 = (float)(result.f32[0] - a8) / v31, v33 < 1.0))
  {
    v94 = a2 + 4;
    v95 = (float32x4_t *)v101;
    v96 = -8;
    result = 0uLL;
    do
    {
      v97 = vaddq_f32(vmulq_n_f32(*v95, v33), (float32x4_t)0);
      *((float32x4_t *)v94 - 1) = vaddq_f32(vmulq_n_f32(v95[-1], v33), (float32x4_t)0);
      *(float32x4_t *)v94 = v97;
      v96 += 8;
      v94 += 8;
      v95 += 2;
    }
    while (v96 < 0x38);
    if (a8 > 0.0)
    {
      v98 = -4;
      do
      {
        v99 = *(float32x4_t *)a9;
        a9 += 4;
        result = vaddq_f32(v99, *(float32x4_t *)a2);
        *(float32x4_t *)a2 = result;
        a2 += 4;
        v98 += 4;
      }
      while (v98 < 0x3C);
    }
  }
  else
  {
    if (a8 <= 0.0)
    {
      v36 = *(_OWORD *)a4;
      v37 = *((_OWORD *)a4 + 1);
      v38 = *((_OWORD *)a4 + 3);
      *((_OWORD *)a2 + 2) = *((_OWORD *)a4 + 2);
      *((_OWORD *)a2 + 3) = v38;
      *(_OWORD *)a2 = v36;
      *((_OWORD *)a2 + 1) = v37;
      v39 = *((_OWORD *)a4 + 4);
      v40 = *((_OWORD *)a4 + 5);
      v41 = *((_OWORD *)a4 + 7);
      *((_OWORD *)a2 + 6) = *((_OWORD *)a4 + 6);
      *((_OWORD *)a2 + 7) = v41;
      *((_OWORD *)a2 + 4) = v39;
      *((_OWORD *)a2 + 5) = v40;
      v42 = *((_OWORD *)a4 + 8);
      v43 = *((_OWORD *)a4 + 9);
      v44 = *((_OWORD *)a4 + 11);
      *((_OWORD *)a2 + 10) = *((_OWORD *)a4 + 10);
      *((_OWORD *)a2 + 11) = v44;
      *((_OWORD *)a2 + 8) = v42;
      *((_OWORD *)a2 + 9) = v43;
      v45 = *((_OWORD *)a4 + 12);
      v46 = *((_OWORD *)a4 + 13);
      v47 = *((_OWORD *)a4 + 15);
      *((_OWORD *)a2 + 14) = *((_OWORD *)a4 + 14);
      *((_OWORD *)a2 + 15) = v47;
      *((_OWORD *)a2 + 12) = v45;
      *((_OWORD *)a2 + 13) = v46;
    }
    else if (a9)
    {
      for (i = 0; i != 64; ++i)
      {
        v35 = a4[i];
        if (v35 <= a9[i])
          v35 = a9[i];
        a2[i] = v35;
      }
    }
    v48 = 0;
    v49 = v31 + a8;
    if (*var6)
      v50 = 0;
    else
      v50 = this->var5;
    do
    {
      v51 = a2[v48];
      if (v51 <= a3->f32[v48])
        v51 = a3->f32[v48];
      (*v50)[v48++] = v51;
    }
    while (v48 != 64);
    v52 = 0;
    v53 = 0.0;
    do
    {
      v54 = vmulq_f32(*(float32x4_t *)&(*v50)[v52], *(float32x4_t *)&a5[v52]);
      v53 = (float)((float)((float)(v53 + v54.f32[0]) + v54.f32[1]) + v54.f32[2]) + v54.f32[3];
      v52 += 4;
    }
    while (v52 != 64);
    v55 = v53 - v49;
    if (v55 > 0.00000011921)
    {
      v56 = fminf((float)(result.f32[0] - v49) / v55, 1.0);
      *var6 = 1;
      v57 = -4;
      v58 = a2;
      v59 = this->var5;
      do
      {
        v60 = *a3++;
        v61 = v60;
        v62 = *(float32x4_t *)v58;
        v58 += 4;
        *(float32x4_t *)v59 = vsubq_f32(v61, v62);
        v59 = (float (*)[342])((char *)v59 + 16);
        v57 += 4;
      }
      while (v57 < 0x3C);
      v63 = -4;
      v64 = (float32x4_t *)this->var5;
      do
      {
        *v64 = vmaxq_f32(*v64, (float32x4_t)0);
        ++v64;
        v63 += 4;
      }
      while (v63 < 0x3C);
      v65 = fmaxf(v56, 0.0);
      v66 = (float32x4_t *)&this->var5[0][4];
      v67 = -8;
      do
      {
        v68 = vmulq_n_f32(*v66, v65);
        v66[-1] = vmulq_n_f32(v66[-1], v65);
        *v66 = v68;
        v67 += 8;
        v66 += 2;
      }
      while (v67 < 0x38);
      v69 = -4;
      v70 = this->var5;
      v71 = (float32x4_t *)a2;
      do
      {
        v72 = *(float32x4_t *)v70;
        v70 = (float (*)[342])((char *)v70 + 16);
        *v71 = vaddq_f32(v72, *v71);
        ++v71;
        v69 += 4;
      }
      while (v69 < 0x3C);
      *var6 = 0;
      if (v65 < 1.0)
        return result;
      v49 = v49 + (float)(v55 * v65);
    }
    for (j = 0; j != 64; ++j)
    {
      v74 = a2[j];
      if (v74 <= a7->f32[j])
        v74 = a7->f32[j];
      (*var5)[j] = v74;
    }
    v75 = 0;
    v76 = 0.0;
    do
    {
      v77 = vmulq_f32(*(float32x4_t *)&(*var5)[v75], *(float32x4_t *)&a5[v75]);
      v76 = (float)((float)((float)(v76 + v77.f32[0]) + v77.f32[1]) + v77.f32[2]) + v77.f32[3];
      v75 += 4;
    }
    while (v75 != 64);
    *var6 = 0;
    v78 = v76 - v49;
    if (v78 > 0.00000011921)
    {
      *var6 = 1;
      v79 = -4;
      v80 = a2;
      v81 = this->var5;
      v82 = (float)(result.f32[0] - v49) / v78;
      do
      {
        v83 = *a7++;
        v84 = v83;
        v85 = *(float32x4_t *)v80;
        v80 += 4;
        *(float32x4_t *)v81 = vsubq_f32(v84, v85);
        v81 = (float (*)[342])((char *)v81 + 16);
        v79 += 4;
      }
      while (v79 < 0x3C);
      v86 = -4;
      v87 = (float32x4_t *)this->var5;
      do
      {
        *v87 = vmaxq_f32(*v87, (float32x4_t)0);
        ++v87;
        v86 += 4;
      }
      while (v86 < 0x3C);
      v88 = fminf(v82, 1.0);
      v89 = (float32x4_t *)&this->var5[0][4];
      v90 = -8;
      do
      {
        v91 = vmulq_n_f32(*v89, v88);
        v89[-1] = vmulq_n_f32(v89[-1], v88);
        *v89 = v91;
        v90 += 8;
        v89 += 2;
      }
      while (v90 < 0x38);
      v92 = -4;
      do
      {
        v93 = *(float32x4_t *)var5;
        var5 = (float (*)[342])((char *)var5 + 16);
        result = vaddq_f32(v93, *(float32x4_t *)a2);
        *(float32x4_t *)a2 = result;
        a2 += 4;
        v92 += 4;
      }
      while (v92 < 0x3C);
      *var6 = 0;
    }
  }
  return result;
}

void *LTMCompute::makeScaleGTC(LTMCompute *this, float *__dst, float *__src, float a4, float a5)
{
  float v5;
  unint64_t v6;
  unint64_t v7;
  float v8;
  float v9;
  uint64_t v10;
  float v11;
  void *result;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float *v23;
  float *v24;
  uint64_t v25;
  float v26;

  if (a4 <= 0.00000011921)
    return memcpy(__dst, __src, 0x404uLL);
  v5 = 1.0 - a5;
  if (a4 <= 0.0)
  {
    v9 = *__src;
  }
  else if (a4 >= 1.0)
  {
    v9 = __src[256];
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = v6;
      v8 = *((float *)&LTMCompute::globalCurveInputs + v6++);
    }
    while (v7 <= 0x100 && v8 < a4);
    v9 = 0.0;
    if (v6 != 1)
    {
      v10 = (v6 - 2);
      v11 = *((float *)&LTMCompute::globalCurveInputs + v10);
      if (vabds_f32(v8, v11) >= 0.00000011921)
        v9 = __src[v10] + (float)((float)((float)(a4 - v11) / (float)(v8 - v11)) * (float)(__src[v6 - 1] - __src[v10]));
      else
        v9 = __src[v6 - 1];
    }
  }
  v13 = v5 * v9;
  v14 = (float)(1.0 - v13) / fmaxf(1.0 - v9, 0.00000011921);
  v15 = v9;
  v16 = v13;
  v17 = 1.0 / fmax((v15 + v15) * v15 - v15 * v15, 2.22044605e-16);
  v18 = (v15 + v15) * v17 * v13 + -(v15 * v15) * v17 * v14;
  if (v18 >= 0.0)
  {
    v19 = v17 * v15 * v14 - v17 * v16;
  }
  else
  {
    v19 = v16 / fmax((float)(v9 * v9), 2.22044605e-16);
    v18 = 0.0;
  }
  v20 = 0;
  *__dst = 0.0;
  do
  {
    __dst[v20 + 1] = (float)(__src[v20 + 1] * v14) - (float)(v14 + -1.0);
    ++v20;
  }
  while (v20 != 256);
  v21 = (int)fminf(ceilf(a4 * 256.0), 257.0);
  if ((int)v21 >= 2)
  {
    v23 = __dst + 1;
    v24 = __src + 1;
    v25 = v21 - 1;
    do
    {
      v26 = *v24++;
      v22 = v19;
      *v23++ = v26 * (float)(v18 + (float)(v22 * v26));
      --v25;
    }
    while (v25);
  }
  return result;
}

void LTMCompute::computeRGBToneCurve(LTMCompute *this, const sLtmComputeInput *a2, const sLtmTuningParams *a3, const sLtmFrameParams *a4, sLtmComputeOutput *a5)
{
  uint64_t v8;
  BOOL *var6;
  float v10;
  int v11;
  float v12;
  unsigned int v13;
  float v14;
  const sLtmComputeInput *v15;
  float v16;
  float v17;
  uint64_t v18;
  float *v19;
  float v20;
  float *v21;
  float v22;
  float v23;
  float v24;
  float *globalLUT;
  unint64_t v26;
  unint64_t v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  float *v32;
  uint64_t v33;
  sLtmTuningParams *var2;
  float v35;
  LTMCompute *v36;
  float *v37;
  float *v38;
  float *v39;
  LTMCompute *ScaleGTC;
  uint64_t v41;
  float *v42;
  float v43;
  float v44;
  LTMCompute *v45;
  uint64_t v46;
  float *v47;
  float v48;
  float *v49;
  LTMCompute *v50;
  uint64_t v51;
  sLtmTuningParams *v52;
  LTMCompute *v53;
  float *rgbToneCurve;
  uint64_t i;
  float v56;
  float v57;
  LTMCompute *v58;
  LTMCompute *v59;
  uint64_t j;
  float v61;
  float v62;
  float *p_exposureRatio;

  v8 = 0;
  var6 = this->var6;
  v10 = fminf(a4->var23 / a2->exposureRatio, 32.0);
  v11 = vcvtms_s32_f32(v10);
  v12 = v10 - (float)(int)floorf(v10);
  if (v11 <= 1)
    v13 = 1;
  else
    v13 = v11;
  v14 = 0.0;
  v15 = a2;
  v16 = 0.0;
  do
  {
    v17 = v12 * a2->localHist[64 * v8 + v11];
    v18 = v13 - 1;
    v19 = (float *)v15;
    if (v13 >= 2)
    {
      do
      {
        v20 = *v19++;
        v17 = v17 + v20;
        --v18;
      }
      while (v18);
    }
    v21 = &a5->LTC[65 * v8 + v11];
    v22 = *v21 + (float)((float)(v21[1] - *v21) * v12);
    v23 = (float)(v17 * v22) + 0.001;
    v14 = v14 + (float)(v22 * v23);
    v16 = v16 + v23;
    ++v8;
    v15 = (const sLtmComputeInput *)((char *)v15 + 256);
  }
  while (v8 != 48);
  v24 = v14 / v16;
  globalLUT = a5->globalLUT;
  if (v24 <= 0.0)
  {
    v29 = *globalLUT;
  }
  else if (v24 >= 1.0)
  {
    v29 = a5->globalLUT[256];
  }
  else
  {
    v26 = 0;
    do
    {
      v27 = v26;
      v28 = *((float *)&LTMCompute::globalCurveInputs + v26++);
    }
    while (v27 <= 0x100 && v28 < v24);
    v29 = 0.0;
    if (v26 != 1)
    {
      v30 = (v26 - 2);
      v31 = *((float *)&LTMCompute::globalCurveInputs + v30);
      if (vabds_f32(v28, v31) >= 0.00000011921)
        v29 = globalLUT[v30]
            + (float)((float)((float)(v24 - v31) / (float)(v28 - v31))
                    * (float)(a5->averageLTC[v26 + 64] - globalLUT[v30]));
      else
        v29 = a5->averageLTC[v26 + 64];
    }
  }
  p_exposureRatio = &a2->exposureRatio;
  if (this->var6[1])
  {
    v32 = 0;
  }
  else
  {
    this->var6[1] = 1;
    v32 = this->var5[1];
  }
  LTMCompute::makeScaleGTC(this, v32, (float *)&LTMCompute::globalCurveInputs, v29, a4->var24);
  v33 = 0;
  var2 = this->var2;
  do
  {
    v35 = powf(v32[v33], (float)(a4->var18 * 1.1) / *((float *)var2 + 4));
    v32[v33++] = powf(v35, (float)(sqrtf(v35) * -0.1) + 1.2);
  }
  while (v33 != 257);
  if (var6[3])
  {
    v37 = 0;
  }
  else
  {
    var6[3] = 1;
    v37 = this->var5[3];
  }
  if (*var6)
  {
    v38 = 0;
  }
  else
  {
    *var6 = 1;
    v38 = this->var5[0];
  }
  if (var6[2])
  {
    v39 = 0;
  }
  else
  {
    var6[2] = 1;
    v39 = this->var5[2];
  }
  ScaleGTC = (LTMCompute *)LTMCompute::makeScaleGTC(v36, v37, (float *)&LTMCompute::globalCurveInputs, a4->var35, 0.28);
  v41 = 256;
  v42 = v38;
  do
    *v42++ = 1.0 - v37[v41--];
  while (v41 != -1);
  LTMCompute::interpolate(ScaleGTC, v38, (float *)&LTMCompute::globalCurveInputs, 257, (const float *)&LTMCompute::globalCurveInputs, v39, 257);
  v43 = powf(a4->var35, 0.8);
  v44 = powf(1.0 / (float)((float)(0.4704 / v43) + 0.5146), 1.25);
  LTMCompute::makeScaleGTC(v45, v37, (float *)&LTMCompute::globalCurveInputs, v44, 0.12);
  v46 = 0;
  v47 = v37 + 256;
  do
  {
    v48 = *v47--;
    v38[v46++] = 1.0 - v48;
  }
  while (v46 != 257);
  var6[3] = 1;
  v49 = this->var5[3];
  v50 = (LTMCompute *)memcpy(this->var5[3], a5->globalLUT, 0x404uLL);
  LTMCompute::interpolate(v50, (float *)&LTMCompute::globalCurveInputs, v39, 257, this->var5[3], a5->globalLUT, 257);
  v51 = 0;
  v52 = this->var2;
  do
  {
    a5->globalLUT[v51] = powf(a5->globalLUT[v51], *((float *)v52 + 4));
    ++v51;
  }
  while (v51 != 257);
  rgbToneCurve = a5->rgbToneCurve;
  if (*((_BYTE *)p_exposureRatio + 857))
  {
    memcpy(a5->rgbToneCurve, &LTMCompute::globalCurveInputs, sizeof(a5->rgbToneCurve));
    for (i = 0; i != 257; ++i)
    {
      v56 = rgbToneCurve[i];
      if (v56 >= 0.018)
        v57 = (float)(powf(v56, 0.45) * 1.099) + -0.099;
      else
        v57 = v56 * 4.5;
      rgbToneCurve[i] = v57;
    }
  }
  else
  {
    LTMCompute::interpolate(v53, (float *)&LTMCompute::globalCurveInputs, v39, 257, v32, a5->rgbToneCurve, 257);
    LTMCompute::interpolate(v58, v39, a5->rgbToneCurve, 257, (const float *)&LTMCompute::globalCurveInputs, v49, 257);
    LTMCompute::interpolate(v59, (float *)&LTMCompute::globalCurveInputs, v38, 257, v49, a5->rgbToneCurve, 257);
    for (j = 0; j != 257; ++j)
    {
      v61 = rgbToneCurve[j];
      if (v61 >= 0.0031308)
        v62 = (float)(powf(v61, 0.41667) * 1.055) + -0.055;
      else
        v62 = v61 * 12.92;
      rgbToneCurve[j] = v62;
    }
  }
  *((_BYTE *)a5 + 36580) |= 0x10u;
  *(_DWORD *)var6 = 0;
}

void LTMCompute::adaptForHLG(LTMCompute *this, sLtmComputeOutput *a2)
{
  BOOL *var6;
  float (*var5)[342];
  LTMCompute *v5;
  uint64_t i;
  LTMCompute *v7;
  float *rgbToneCurve;
  LTMCompute *v9;
  uint64_t j;
  float v11;
  float v12;

  var6 = this->var6;
  if (this->var6[0])
  {
    var5 = 0;
  }
  else
  {
    *var6 = 1;
    var5 = this->var5;
  }
  v5 = (LTMCompute *)memcpy(var5, a2->globalLUT, 0x404uLL);
  LTMCompute::interpolate(v5, (float *)LTMCompute::globalCurveInputs, LTMCompute::gpre, 257, (const float *)var5, a2->globalLUT, 257);
  for (i = 0; i != 257; ++i)
    a2->rgbToneCurve[i] = powf(a2->rgbToneCurve[i], 2.2);
  rgbToneCurve = a2->rgbToneCurve;
  LTMCompute::interpolate(v7, (float *)LTMCompute::globalCurveInputs, LTMCompute::gpre, 257, rgbToneCurve, (float *)var5, 257);
  LTMCompute::interpolate(v9, LTMCompute::gpre, (float *)var5, 257, (const float *)LTMCompute::globalCurveInputs, rgbToneCurve, 257);
  for (j = 0; j != 257; ++j)
  {
    v11 = rgbToneCurve[j];
    if (v11 >= 0.0833)
      v12 = (float)(logf((float)(v11 * 12.0) + -0.2847) * 0.17883) + 0.5599;
    else
      v12 = sqrtf(v11 * 3.0);
    rgbToneCurve[j] = v12;
  }
  *var6 = 0;
}

void LTMCompute::generateSpatialLTC(LTMCompute *this, const sLtmComputeInput *a2, const sLtmComputeMeta *a3, sLtmComputeOutput *a4)
{
  const sLtmComputeInput *v6;
  uint64_t *var2;
  unsigned int v9;
  float *p_sceneLux;
  BOOL *v11;
  float *p_var17;
  LTMCompute *v13;
  float v14;
  float32x4_t *v15;
  unint64_t v16;
  float v17;
  float32x4_t v18;
  float *var1;
  LTMCompute *v20;
  sLtmTuningParams *v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v34;
  sLtmTuningParams *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  sLtmTuningParams *v43;
  float32x2_t *p_var23;
  float v45;
  float32x2_t v46;
  sLtmTuningParams *v47;
  const sLtmTuningParams *v48;
  double v49;
  double v50;
  float v51;
  double v52;
  double v53;
  _BOOL4 useDigitalFlash;
  float v55;
  float v56;
  sLtmDisplayParams *v57;
  unint64_t v58;
  unint64_t v59;
  float v60;
  uint64_t v61;
  float v62;
  uint64_t v63;
  float (*var5)[342];
  int gammaCurve;
  float v66;
  float *v67;
  float var30;
  float v69;
  unint64_t v70;
  unint64_t v71;
  float v72;
  uint64_t v73;
  float v74;
  float v75;
  float v76;
  float var19;
  float v78;
  int v79;
  float *v80;
  float v81;
  float v82;
  float v83;
  float v84;
  const sLtmDisplayParams *v85;
  float32x4_t *v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  float32x4_t *v91;
  float32x4_t v92;
  unint64_t v93;
  uint64_t v94;
  float *var8;
  float32x4_t *v96;
  unint64_t v97;
  unint64_t v98;
  float32x4_t *v99;
  float32x4_t v100;
  unint64_t v101;
  float *v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  float32x4_t *v110;
  float32x4_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  float *p_var25;
  float32x4_t v119;
  unint64_t v120;
  uint64_t v121;
  float32x4_t *v122;
  sLtmFrameParams *v123;
  uint64_t v124;
  float v125;
  float v126;
  float v127;
  float var32;
  float *v129;
  const float *v130;
  float32x4_t *v131;
  sLtmTuningParams *v132;
  float v133;
  float *v134;
  float v135;
  int v136;
  uint64_t i;
  float v138;
  uint64_t v139;
  unint64_t v140;
  float32x4_t *v141;
  float32x4_t v142;
  unint64_t v143;
  unint64_t v144;
  float32x4_t *v145;
  unint64_t v146;
  float32x4_t v147;
  float32x4_t v148;
  const sLtmTuningParams *v149;
  uint64_t j;
  int v151;
  float v152;
  float v153;
  float *p_midLuminance;
  BOOL *var6;
  float *v156;
  float v157;
  float v158;
  float *var12;
  const sLtmComputeMeta *v160;
  const float *var13;
  const sLtmDisplayParams *p_var3;
  sLtmComputeInput *v163;
  float32x4_t *v164;
  sLtmFrameParams *p_var4;
  uint64_t v166;
  unsigned int v167;
  float v168;
  int v169[4];
  uint64_t v170;

  v6 = a2;
  v170 = *MEMORY[0x24BDAC8D0];
  this->var2 = (sLtmTuningParams *)&LTMCompute::tuningParamsSDR;
  if (a3->gammaCurve == 1)
  {
    var2 = &LTMCompute::tuningParamsHLG;
    v9 = 1;
LABEL_7:
    this->var2 = (sLtmTuningParams *)var2;
    goto LABEL_8;
  }
  if (a3->useDigitalFlash)
  {
    var2 = (uint64_t *)&LTMCompute::tuningParamsDigitalFlash;
    if (this->var1 == 2)
      var2 = (uint64_t *)&LTMCompute::tuningParamsDigitalFlashFFC;
    v9 = 2;
    goto LABEL_7;
  }
  v9 = 0;
  var2 = &LTMCompute::tuningParamsSDR;
LABEL_8:
  p_midLuminance = &a4->midLuminance;
  var6 = this->var6;
  p_sceneLux = &a2->sceneLux;
  if (a3->useTuningParametersOverride)
  {
    v11 = &a3->useLinearLTCs + 108 * v9;
    *((_DWORD *)var2 + 2) = *((_DWORD *)v11 + 7);
    *var2 = (uint64_t)vrev64_s32(*(int32x2_t *)(v11 + 32));
    *(uint64_t *)((char *)var2 + 84) = *((_QWORD *)v11 + 5);
    var2[7] = *((_QWORD *)v11 + 6);
    *((_DWORD *)var2 + 16) = *((_DWORD *)v11 + 14);
    var2[12] = *(_QWORD *)(v11 + 60);
    *(uint64_t *)((char *)var2 + 20) = *(_QWORD *)(v11 + 68);
    *((_DWORD *)var2 + 8) = *((_DWORD *)v11 + 19);
    *((_DWORD *)var2 + 26) = *((_DWORD *)v11 + 20);
    *((_DWORD *)var2 + 3) = *((_DWORD *)v11 + 21);
    *((_DWORD *)var2 + 23) = *((_DWORD *)v11 + 22);
    *((_DWORD *)var2 + 17) = *((_DWORD *)v11 + 23);
    *((_DWORD *)var2 + 7) = *((_DWORD *)v11 + 24);
    *((_DWORD *)var2 + 20) = *((_DWORD *)v11 + 25);
    *((_DWORD *)var2 + 4) = *((_DWORD *)v11 + 26);
    *(_OWORD *)((char *)var2 + 36) = *(_OWORD *)(v11 + 108);
    *((_DWORD *)var2 + 13) = *((_DWORD *)v11 + 31);
    var2[9] = *((_QWORD *)v11 + 16);
    var2 = (uint64_t *)this->var2;
  }
  p_var17 = &this->var4.var17;
  LTMCompute::calculateDisplayModel(this, *((float *)var2 + 18), *((float *)var2 + 19), LTMCompute::uniformLocalHistogram, this->var3.var0);
  v14 = this->var3.var0[64];
  this->var3.var2 = v14;
  v15 = (float32x4_t *)&this->var3.var0[4];
  v16 = -8;
  v17 = 1.0 / v14;
  do
  {
    v18 = vmulq_n_f32(*v15, v17);
    v15[-1] = vmulq_n_f32(v15[-1], v17);
    *v15 = v18;
    v16 += 8;
    v15 += 2;
  }
  while (v16 < 0x38);
  this->var3.var0[64] = v17 * this->var3.var0[64];
  var1 = this->var3.var1;
  LTMCompute::interpolate(v13, this->var3.var0, (float *)&LTMCompute::localCurveInputs, 65, (const float *)&LTMCompute::localCurveInputs, this->var3.var1, 65);
  bzero(&this->var4, 0xAF4uLL);
  v21 = this->var2;
  LODWORD(v22) = *((_DWORD *)v21 + 24);
  this->var4.var35 = *(float *)&v22;
  if (!a3->useDigitalFlash)
  {
    *(float *)&v22 = fminf(*(float *)&v22+ (float)((float)((float)(0.65 - *(float *)&v22) * fmaxf(p_sceneLux[4] + -1.0, 0.0)) * 0.25), 0.65);
    this->var4.var35 = *(float *)&v22;
  }
  LTMCompute::computeLocalLuma(v20, v6, v21, &this->var3, &this->var4, v22);
  this->var4.var16 = 1.0;
  v23 = p_sceneLux[3];
  v24 = 1.0;
  if (!a3->useFlash && v23 > 1.0)
  {
    v25 = p_sceneLux[6];
    if (a3->gammaCurve == 1)
      v24 = (float)((float)((float)(v25 + -1.0) * fmaxf(*((float *)this->var2 + 7), v23 / v25)) * 0.08) + 1.0;
    else
      v24 = powf(v25, fminf(fmaxf(*((float *)this->var2 + 7), (float)(v23 + -1.0) / v25) * 0.08, 1.0));
    this->var4.var16 = v24;
  }
  p_var4 = &this->var4;
  v26 = p_sceneLux[4];
  v27 = fminf((float)(v23 * v24) * fminf(v26, 1.0), 80.0);
  this->var4.var14 = v27;
  this->var4.var28 = v24 * v26;
  v28 = fmaxf(v27, 1.0);
  this->var4.var15 = v28;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)p_var17 = _D0;
  v34 = *p_sceneLux;
  v35 = this->var2;
  p_var3 = &this->var3;
  if (a3->useDigitalFlash)
  {
    v36 = *((float *)v35 + 9);
    v37 = fminf(fmaxf(15.0 / p_sceneLux[216], v34 + v34) / v36, 1.0);
    this->var4.var17 = v37;
    v38 = fmaxf(v34, (float)(v34 + v36) * 0.5);
    if (v34 < v36)
      v34 = v38;
    this->var4.var18 = fminf(fminf((float)((float)((float)(1.0 - (float)(1.0 / fmaxf(powf(p_sceneLux[7], 3.0), 1.0))) * 0.4)* (float)(1.0 - sqrtf(v37)))+ 1.0, *((float *)v35 + 6)), *((float *)v35 + 5) + (float)(v37 * 50.0));
  }
  this->var4.var27 = *((float *)v35 + 2);
  v39 = fmaxf(v34, *((float *)v35 + 8));
  this->var4.var20 = v39 / 3.14;
  v40 = fminf(fmaxf((float)(v39 + -4.0) / 1019.0, 0.0), 1.0);
  this->var4.var19 = v40;
  v41 = fabsf(sqrtf(v40));
  this->var4.var22 = this->var3.var2 * (float)(v41 + (float)(*((float *)v35 + 23) * (float)(1.0 - v41)));
  v42 = exp2f((float)(v28 * -0.435) + -1.3651);
  this->var4.var13[0] = v42;
  this->var4.var13[1] = (float)(v42 * -2.0) + 1.0;
  this->var4.var13[2] = v42;
  LTMCompute::computeThumbnailLuma(this, v6, p_var4);
  v43 = this->var2;
  this->var4.var21 = fmaxf(*((float *)v43 + 26) * this->var4.var19, 0.015625);
  v168 = 0.0;
  this->var4.var23 = 0.0;
  this->var4.var24 = 0.0;
  p_var23 = (float32x2_t *)&this->var4.var23;
  *(_OWORD *)v169 = xmmword_23092FA90;
  v163 = (sLtmComputeInput *)v6;
  LTMCompute::calculateSceneFlare(this, v6->globalHist, 256, v169, *((float *)v43 + 20), (float)sLtmTuningParams::nFlareBins, &this->var4.var23, &this->var4.var24, &v168);
  v45 = (float)sLtmTuningParams::nFlareBins;
  v46.f32[0] = fminf(this->var4.var23, (float)sLtmTuningParams::nFlareBins);
  LODWORD(this->var4.var23) = v46.i32[0];
  if (p_sceneLux[9] < 1.0)
  {
    memset(v169, 0, sizeof(v169));
    v167 = 0;
    LODWORD(v166) = 0;
    LTMCompute::calculateSceneFlare(this, v6->thumbnailHistEV0, 64, v169, 0.04, v45, (float *)&v167, (float *)&v166, (float *)&v166 + 1);
    v46 = vmla_n_f32(vmul_n_f32(vmaxnm_f32(*p_var23, (float32x2_t)__PAIR64__(v166, v167)), 1.0 - p_sceneLux[9]), *p_var23, p_sceneLux[9]);
    *p_var23 = v46;
  }
  v47 = this->var2;
  if (a3->useDigitalFlash)
    p_var23->f32[0] = fmaxf(v46.f32[0], *((float *)v47 + 25) * (float)(1.0 - (float)(1.0 / p_sceneLux[7])));
  LTMCompute::calculateSceneModel(this, v6, v47, p_var4);
  v51 = 0.0;
  *(float *)&v52 = this->var4.var19;
  *(float *)&v53 = fmaxf(*(float *)&v52, 0.22108);
  this->var4.var25 = (float)((float)((float)((float)((float)(1.0 - v168) * 0.0) + 1.0) * 0.2) * *(float *)&v53) + 1.0;
  useDigitalFlash = a3->useDigitalFlash;
  if (a3->useDigitalFlash)
  {
    LODWORD(v50) = 1053609165;
  }
  else
  {
    v55 = (float)((float)(this->var4.var17 * -0.8) + 1.0) * fminf(this->var4.var15 * 0.125, 1.0);
    *(float *)&v53 = 1.0 - v55;
    *(float *)&v50 = v55 + (float)((float)(1.0 - v55) * 0.4);
  }
  var13 = this->var4.var13;
  *(float *)&v49 = (float)(1.0 - *(float *)&v52) * *(float *)&v50;
  LODWORD(v50) = 0.5;
  *(float *)&v49 = *(float *)&v49 + (float)(*(float *)&v52 * 0.5);
  this->var4.var26 = *(float *)&v49;
  LTMCompute::calculateHighlightSceneModel(this, v6, v48, useDigitalFlash, p_var4, v49, v52, v50, v53);
  this->var4.var29 = 11.52;
  v167 = 0;
  v166 = 0;
  *(_OWORD *)v169 = xmmword_23092FA90;
  LTMCompute::calculateSceneFlare(this, v6->globalHist, 256, v169, 0.15, 46.08, (float *)&v167, (float *)&v166 + 1, (float *)&v166);
  v56 = *(float *)&v167 / this->var4.var29;
  *(float *)&v167 = v56;
  if (this->var3.var1[0] >= 0.18)
  {
    v57 = &this->var3;
  }
  else
  {
    v57 = &this->var3;
    if (this->var3.var1[63] <= 0.18)
    {
      v51 = 0.98438;
    }
    else
    {
      v58 = 0;
      do
      {
        v59 = v58;
        v60 = var1[v58++];
      }
      while (v59 <= 0x3F && v60 < 0.18);
      if (v58 != 1)
      {
        v61 = (v58 - 2);
        v62 = var1[v61];
        if (vabds_f32(v60, v62) >= 0.00000011921)
          v51 = *((float *)&LTMCompute::localCurveInputs + v61)
              + (float)((float)((float)(0.18 - v62) / (float)(v60 - v62))
                      * (float)(*((float *)&LTMCompute::localCurveInputs + v58 - 1)
                              - *((float *)&LTMCompute::localCurveInputs + v61)));
        else
          v51 = *((float *)&LTMCompute::localCurveInputs + v58 - 1);
      }
    }
  }
  v63 = 0;
  this->var4.var30 = v51 * this->var3.var2;
  var5 = this->var5;
  if (*var6)
    var5 = 0;
  *(_DWORD *)var5 = 0;
  gammaCurve = a3->gammaCurve;
  v66 = 0.0;
  do
  {
    v67 = &this->var4.var8[v63];
    if (gammaCurve == 1)
      v67 = &this->var4.var10[v63];
    v66 = v66 + *v67;
    (*var5)[++v63] = v66;
  }
  while (v63 != 64);
  var30 = this->var4.var30;
  v69 = 0.0;
  if (var30 > 0.0)
  {
    if ((*var5)[63] <= var30)
    {
      v69 = 0.98438;
    }
    else
    {
      v70 = 0;
      do
      {
        v71 = v70;
        v72 = (*var5)[v70++];
      }
      while (v71 <= 0x3F && v72 < var30);
      v69 = 0.0;
      if (v70 != 1)
      {
        v73 = (v70 - 2);
        v74 = (*var5)[v73];
        if (vabds_f32(v72, v74) >= 0.00000011921)
          v69 = *((float *)&LTMCompute::localCurveInputs + v73)
              + (float)((float)((float)(var30 - v74) / (float)(v72 - v74))
                      * (float)(*((float *)&LTMCompute::localCurveInputs + v70 - 1)
                              - *((float *)&LTMCompute::localCurveInputs + v73)));
        else
          v69 = *((float *)&LTMCompute::localCurveInputs + v70 - 1);
      }
    }
  }
  v75 = v69 * 64.0;
  this->var4.var31 = v69 * 64.0;
  *var6 = 0;
  v76 = fmaxf(fminf((float)((float)(v56 + -0.08) * *((float *)&v166 + 1)) * 3.0, 1.0), 0.0);
  this->var4.var32 = v76;
  if (gammaCurve == 1)
  {
    var19 = this->var4.var19;
    v78 = fminf(fmaxf((float)(var19 + 0.9) + (float)(fminf(1.0 - p_sceneLux[2], 0.1) * -10.0), 0.7), 1.0) * 0.8;
    this->var4.var34 = v78;
    this->var4.var32 = fmaxf((float)(1.0 - var19) * v78, v76);
  }
  v79 = 0;
  v80 = this->var4.var6;
  v81 = floorf(v75);
  v82 = ceilf(v75);
  v164 = (float32x4_t *)this->var4.var6;
  do
  {
    v83 = (float)v79;
    v84 = 1.0;
    if (v81 <= (float)v79)
    {
      v84 = 0.0;
      if (v82 > v83)
        v84 = v75 - v83;
    }
    if (v80)
      *v80++ = v84;
    ++v79;
  }
  while (v79 != 64);
  v85 = v57;
  LTMCompute::calculateGlobalLUTandModifySceneModels(this, this->var1, v6, a3, this->var2, v57, p_var4, a4);
  if (var6[1])
  {
    v86 = 0;
  }
  else
  {
    var6[1] = 1;
    v86 = (float32x4_t *)this->var5[1];
  }
  v87 = 0;
  v88 = -4;
  do
  {
    v86[v87 / 4] = vsubq_f32(*(float32x4_t *)&v6->thumbnailHist[v87], *(float32x4_t *)&v6->averageLocalHist[v87]);
    v88 += 4;
    v87 += 4;
  }
  while (v88 < 0x3C);
  v89 = 0;
  v90 = -8;
  do
  {
    v91 = &v86[v89 / 0x10];
    v92 = vmulq_f32(v86[v89 / 0x10 + 1], *(float32x4_t *)&this->var4.var5[v89 / 4 + 4]);
    *v91 = vmulq_f32(v86[v89 / 0x10], *(float32x4_t *)&this->var4.var5[v89 / 4]);
    v91[1] = v92;
    v90 += 8;
    v89 += 32;
  }
  while (v90 < 0x38);
  v93 = -4;
  v94 = 3072;
  do
  {
    v86[(unint64_t)v94 / 4 - 768] = vaddq_f32(v86[(unint64_t)v94 / 4 - 768], *(float32x4_t *)&v6->localHist[v94]);
    v93 += 4;
    v94 += 4;
  }
  while (v93 < 0x3C);
  memset_pattern16(&v86[16], &unk_230930680, 0x100uLL);
  var8 = this->var4.var8;
  if (a3->gammaCurve == 1)
    var8 = this->var4.var10;
  var12 = this->var4.var12;
  v96 = (float32x4_t *)this->var4.var6;
  LTMCompute::allocateTone(this, 0, (float32x4_t *)this->var4.var7, v86->f32, this->var2, v85, p_var4, v86 + 16, this->var4.var2, this->var4.var3, this->var4.var15, v164, var8, var13, this->var4.var12, 0, a3->gammaCurve == 1);
  v97 = -4;
  do
  {
    *v96 = vminq_f32(*v96, v96[16]);
    ++v96;
    v97 += 4;
  }
  while (v97 < 0x3C);
  if (a3->gammaCurve != 1)
  {
    v98 = -8;
    v99 = (float32x4_t *)this->var4.var6;
    do
    {
      v100 = vmulq_f32(v99[1], v99[33]);
      *v99 = vmulq_f32(*v99, v99[32]);
      v99[1] = v100;
      v99 += 2;
      v98 += 8;
    }
    while (v98 < 0x38);
    v101 = -4;
    v102 = this->var4.var6;
    do
    {
      v103 = *(float32x4_t *)(v102 + 256);
      v104 = vrecpeq_f32(v103);
      v105 = vmulq_f32(v104, vrecpsq_f32(v103, v104));
      *(float32x4_t *)v102 = vmulq_f32(*(float32x4_t *)v102, vmulq_f32(vrecpsq_f32(v103, v105), v105));
      v102 += 4;
      v101 += 4;
    }
    while (v101 < 0x3C);
  }
  v106 = 0;
  v107 = -4;
  do
  {
    v86[v106 / 4] = vsubq_f32(*(float32x4_t *)&v6->thumbnailHist[v106], *(float32x4_t *)&v6->averageLocalHist[v106]);
    v107 += 4;
    v106 += 4;
  }
  while (v107 < 0x3C);
  v108 = 0;
  v109 = -8;
  do
  {
    v110 = &v86[v108 / 0x10];
    v111 = vmulq_f32(v86[v108 / 0x10 + 1], *(float32x4_t *)&this->var4.var7[v108 / 4 + 4]);
    *v110 = vmulq_f32(v86[v108 / 0x10], *(float32x4_t *)&this->var4.var7[v108 / 4]);
    v110[1] = v111;
    v109 += 8;
    v108 += 32;
  }
  while (v109 < 0x38);
  v112 = -4;
  v113 = 3072;
  do
  {
    v86[(unint64_t)v113 / 4 - 768] = vaddq_f32(v86[(unint64_t)v113 / 4 - 768], *(float32x4_t *)&v6->localHist[v113]);
    v112 += 4;
    v113 += 4;
  }
  while (v112 < 0x3C);
  v114 = 0;
  v115 = -4;
  do
  {
    v86[v114 / 4 + 32] = vsubq_f32(*(float32x4_t *)&this->var4.var11[v114], *(float32x4_t *)&this->var4.var8[v114]);
    v115 += 4;
    v114 += 4;
  }
  while (v115 < 0x3C);
  v116 = -4;
  v117 = 32;
  do
  {
    v86[v117] = vmaxq_f32(v86[v117], (float32x4_t)0);
    v116 += 4;
    ++v117;
  }
  while (v116 < 0x3C);
  p_var25 = &this->var4.var25;
  v119 = vld1q_dup_f32(p_var25);
  v120 = -4;
  v121 = 123;
  do
  {
    v86[v121 - 75] = vaddq_f32(vmulq_f32(v119, *(float32x4_t *)((char *)&this->var0 + v121 * 16)), vmulq_f32(v119, v86[v121 - 91]));
    v120 += 4;
    ++v121;
  }
  while (v120 < 0x3C);
  v156 = p_sceneLux;
  if (var6[2])
  {
    v122 = 0;
  }
  else
  {
    var6[2] = 1;
    v122 = (float32x4_t *)this->var5[2];
  }
  v160 = a3;
  v123 = &this->var4;
  LTMCompute::allocateTone(this, v122, 0, v86->f32, this->var2, p_var3, p_var4, v86 + 16, this->var4.var2, this->var4.var3, this->var4.var15, v164, v86[48].f32, var13, var12, 1, a3->gammaCurve == 1);
  v124 = 0;
  var6[1] = 0;
  v125 = p_sceneLux[6];
  v126 = *((float *)this->var2 + 1)
       - (float)((float)(*((float *)this->var2 + 1) - this->var4.var26)
               / (float)(fmaxf((float)(v125 * v125) + -1.0, 0.0) + 1.0));
  v127 = fmaxf(v125 + -1.0, 0.0);
  this->var4.var33 = fminf((float)(v127 * v127) * 25.0, 4.0);
  var32 = this->var4.var32;
  v129 = this->var4.var1;
  v130 = (const float *)v6;
  v131 = (float32x4_t *)a4;
  v157 = 1.0 - (float)(this->var4.var19 * 0.5);
  v158 = this->var4.var19 * 0.5;
  do
  {
    v132 = this->var2;
    v133 = *((float *)v132 + 1);
    v134 = &v6->faceWeightForTone[v124];
    v135 = fminf(v133, *v134 * this->var4.var33);
    this->var4.var26 = v126 + v135;
    this->var4.var27 = fminf(v133, *((float *)v132 + 2) + (float)(v135 * 0.25));
    v136 = v160->gammaCurve;
    if (v136 == 1)
      this->var4.var32 = fmaxf(fminf(this->var4.var34* (float)(1.0- (float)(this->var4.var19/ (float)((float)((float)(*v134* powf(fmaxf(this->var4.var16 + -1.0, 0.0), 0.25))* 20.0)+ 1.0))), 0.45)+ (float)(var32 * 0.25), var32);
    LTMCompute::allocateTone(this, v131, 0, v130, v132, p_var3, p_var4, (float32x4_t *)this->var4.var7, v123->var0[0], *v129, this->var4.var15, v164, this->var4.var10, var13, var12, 1, v136 == 1);
    for (i = 0; i != 65; ++i)
    {
      v138 = v131->f32[i];
      if (v138 <= v122->f32[i])
        v138 = v122->f32[i];
      v122[16].f32[i + 1] = v138;
    }
    v139 = 0;
    v140 = -8;
    v6 = v163;
    do
    {
      v141 = &v131[v139];
      v142 = vaddq_f32(vmulq_n_f32(v131[v139 + 1], v157), vmulq_n_f32(*(float32x4_t *)((char *)&v122[v139 + 17] + 4), v158));
      *v141 = vaddq_f32(vmulq_n_f32(v131[v139], v157), vmulq_n_f32(*(float32x4_t *)((char *)&v122[v139 + 16] + 4), v158));
      v141[1] = v142;
      v140 += 8;
      v139 += 2;
    }
    while (v140 < 0x38);
    v143 = 0;
    v131[16].f32[0] = (float)(v158 * v122[32].f32[1]) + (float)(v131[16].f32[0] * v157);
    v144 = -4;
    do
    {
      *(float32x4_t *)&a4->averageLTC[v143 / 4] = vaddq_f32(*(float32x4_t *)&a4->averageLTC[v143 / 4], v131[v143 / 0x10]);
      v144 += 4;
      v143 += 16;
    }
    while (v144 < 0x3C);
    a4->averageLTC[64] = a4->averageLTC[64] + v131[16].f32[0];
    v131 = (float32x4_t *)((char *)v131 + 260);
    v130 += 64;
    v123 = (sLtmFrameParams *)((char *)v123 + 4);
    ++v129;
    ++v124;
  }
  while (v124 != 48);
  var6[2] = 0;
  v145 = (float32x4_t *)&a4->averageLTC[4];
  v146 = -8;
  v147 = (float32x4_t)vdupq_n_s32(0x3CAAAAABu);
  do
  {
    v148 = vmulq_f32(*v145, v147);
    v145[-1] = vmulq_f32(v145[-1], v147);
    *v145 = v148;
    v146 += 8;
    v145 += 2;
  }
  while (v146 < 0x38);
  a4->averageLTC[64] = a4->averageLTC[64] * 0.020833;
  *((_BYTE *)p_midLuminance + 20) |= 4u;
  LTMCompute::levelSmoothHFF(this, a4->LTC, v163->ltcGridScaleLogLumaThumb, 6, 8);
  if (v160->useDigitalFlash)
  {
    for (j = 0; j != 257; ++j)
      a4->globalLUT[j] = powf(a4->globalLUT[j], 1.0 / this->var4.var18);
  }
  LTMCompute::computeRGBToneCurve(this, v163, v149, p_var4, a4);
  v151 = v160->gammaCurve;
  if (v151 == 2)
  {
    memcpy(a4->rgbToneCurve, LTMCompute::globalCurveInputs, 0x101uLL);
  }
  else if (v151 == 1)
  {
    LTMCompute::adaptForHLG(this, a4);
  }
  v152 = v156[3];
  p_midLuminance[4] = v152;
  if (v160->useDigitalFlash && v160->useGlobalCCM)
    *p_midLuminance = fminf(v156[8], v153) / v152;
}

void LTMCompute::levelSmoothHFF(LTMCompute *this, float *a2, const float *a3, int a4, int a5)
{
  BOOL *var6;
  int v11;
  int v12;
  float32x4_t *v13;
  int v14;
  const float *v15;
  float32x4_t v16;
  int8x16_t v17;
  uint64_t v18;
  uint64_t v19;
  float (*var5)[342];
  int v21;
  float32x4_t *v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  uint64_t v26;
  float *v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  float *v31;
  float *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  __int32 *v37;
  float *v38;
  float *v39;
  float *v40;
  int v41;
  const float *v42;
  float32x4_t v43;
  int8x16_t v44;
  unint64_t v45;
  float32x4_t *v46;
  float32x4_t *v47;
  float32x4_t *v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  float *v55;
  float *v56;
  float *v57;
  float v58;
  float v59;
  float v60;
  LTMCompute *v61;
  unint64_t v62;
  float32x4_t *v63;
  float32x4_t *v64;
  float32x4_t *v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  uint64_t v69;
  uint64_t v70;
  float *v71;
  float *v72;
  float *v73;
  float v74;
  float v75;
  float v76;
  unint64_t v77;
  float32x4_t *v78;
  float32x4_t v79;
  uint64_t v80;
  uint64_t v81;
  float *v82;
  unint64_t v83;
  float32x4_t *v84;
  uint64_t v85;
  uint64_t v86;
  float *v87;
  unint64_t v88;
  float32x4_t *v89;
  float32x4_t *v90;
  float32x4_t *v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  uint64_t v95;
  uint64_t v96;
  float *v97;
  float *v98;
  float *v99;
  float v100;
  float v101;
  float v102;
  unint64_t v103;
  float32x4_t *v104;
  float32x4_t *v105;
  float32x4_t v106;
  uint64_t v107;
  uint64_t v108;
  float *v109;
  float *v110;
  float v111;
  int v112;
  int v113;
  int v114;
  float *v115;
  float *v116;
  int v117;
  float v118;
  int v119;
  int v120;
  int v121;
  uint64_t v122;
  int v123;
  float *v124;
  float v125;
  BOOL *v126;
  float32x4_t *v127;
  float32x4_t v128;
  float32x4_t *v129;
  uint64_t __n;
  float32x4_t *v131;
  float32x4_t *v132;
  float32x4_t *v133;
  float *v134;
  float32x4_t *v135;
  float32x4_t *v136;
  float32x4_t *v137;
  float *v138;
  AuxCompute *v139;
  int v140;
  float *v141;
  uint64_t v142;
  uint64_t v143;

  var6 = this->var6;
  v11 = a5 * a4;
  v143 = a5 * a4;
  v12 = 6 * a5 * a4;
  if (this->var6[3])
  {
    v13 = 0;
  }
  else
  {
    this->var6[3] = 1;
    v13 = (float32x4_t *)this->var5[3];
    if (v12 >= 336)
      v14 = 336;
    else
      v14 = 6 * a5 * a4;
    bzero(this->var5[3], 4 * (v14 + 6));
  }
  LTMCompute::HFFspatialMapCalc(this, v143, a3, &v13->f32[6 * v11], v13);
  LTMCompute::HFFspatialMapFilter(this, a4, a5, v13->f32, a3);
  v18 = v143;
  v19 = v143 + 6;
  if (*var6)
  {
    var5 = 0;
  }
  else
  {
    v21 = v19 + v12;
    *var6 = 1;
    if ((int)v19 + v12 >= 342)
      v21 = 342;
    bzero(this->var5, 4 * v21);
    var5 = this->var5;
    v18 = v143;
  }
  v22 = (float32x4_t *)&(*var5)[v19];
  v23 = (int)v19 + (int)v18;
  v136 = (float32x4_t *)&(*var5)[v23];
  v24 = (int)v19 + 2 * (int)v18;
  v139 = (AuxCompute *)&(*var5)[v24];
  v25 = &(*var5)[3 * (int)v18 + (int)v19];
  v26 = (int)v19 + 4 * (int)v18;
  v134 = (float *)v13;
  v135 = (float32x4_t *)&(*var5)[v26];
  v126 = var6;
  if (var6[1])
  {
    v27 = 0;
  }
  else
  {
    var6[1] = 1;
    v16.i64[0] = 0;
    *(_OWORD *)&this->var5[1][0] = 0u;
    v27 = this->var5[1];
    *(_OWORD *)&this->var5[1][4] = 0u;
    *(_OWORD *)&this->var5[1][8] = 0u;
    *(_OWORD *)&this->var5[1][12] = 0u;
    *(_QWORD *)&this->var5[1][16] = 0;
  }
  v28 = 0;
  v132 = (float32x4_t *)(v27 + 6);
  v133 = (float32x4_t *)v27;
  v131 = (float32x4_t *)(v27 + 12);
  __n = 4 * v18;
  v29 = v18 & 0xFFFFFFFC;
  v30 = v18 & 0xFFFFFFF8;
  v141 = &(*var5)[v24];
  v142 = v18;
  v31 = &(*var5)[v23];
  v32 = &(*var5)[4 * v11 + 4];
  v138 = v32 + 2;
  v137 = (float32x4_t *)&(*var5)[v26];
  v127 = (float32x4_t *)(v32 + 6);
  v33 = 65 * a5;
  v129 = (float32x4_t *)&(*var5)[5 * (int)v18 + (int)v19];
  v128 = (float32x4_t)vdupq_n_s32(0x3F19999Au);
  do
  {
    while (1)
    {
      if (a4 >= 1)
      {
        v34 = 0;
        v35 = 0;
        v36 = v28;
        do
        {
          if (a5 >= 1)
          {
            v37 = &v22->i32[v35];
            v38 = &v141[v35];
            v39 = &v31[v35];
            v35 += a5;
            v40 = &a2[v36];
            v36 += v33;
            v41 = a5;
            do
            {
              *v37++ = *(_DWORD *)v40;
              *v38++ = *v40;
              v16.f32[0] = *v40;
              *v39++ = *v40;
              v40 += 65;
              --v41;
            }
            while (v41);
          }
          ++v34;
        }
        while (v34 != a4);
      }
      v140 = v28;
      AuxCompute::levelSmooth3x3SinglePlane(v139, (float *)6, 8, sLtmTuningParams::ltc3x3VertFilterCoeffs, sLtmTuningParams::ltc3x3HorzFilterCoeffs, v15, *(double *)v16.i64, v17);
      memcpy(v129, v139, __n);
      if ((int)v29 < 1)
      {
        v52 = 0;
        v53 = v143;
      }
      else
      {
        v45 = 0;
        v46 = v22;
        v47 = (float32x4_t *)v139;
        v48 = (float32x4_t *)v25;
        do
        {
          v49 = *v46++;
          v50 = v49;
          v51 = *v47++;
          v44 = (int8x16_t)v51;
          v43 = vsubq_f32(v50, v51);
          *v48++ = v43;
          v45 += 4;
        }
        while (v45 < v29);
        v52 = v45;
        v53 = v143;
      }
      if ((int)v52 < v53)
      {
        v54 = v142 - v52;
        v55 = &v138[v52];
        v56 = &v141[v52];
        v57 = &v22->f32[v52];
        do
        {
          v58 = *v57++;
          v59 = v58;
          v60 = *v56++;
          *(float *)v44.i32 = v60;
          v43.f32[0] = v59 - v60;
          *v55++ = v43.f32[0];
          --v54;
        }
        while (v54);
      }
      AuxCompute::levelSmooth3x3SinglePlane((AuxCompute *)v129, (float *)6, 8, sLtmTuningParams::ltc3x3VertFilterCoeffs, sLtmTuningParams::ltc3x3HorzFilterCoeffs, v42, *(double *)v43.i64, v44);
      if ((int)v29 < 1)
      {
        v69 = 0;
      }
      else
      {
        v62 = 0;
        v63 = (float32x4_t *)v139;
        v64 = v129;
        v65 = v135;
        do
        {
          v66 = *v63++;
          v67 = v66;
          v68 = *v64++;
          *v65++ = vsubq_f32(v67, v68);
          v62 += 4;
        }
        while (v62 < v29);
        v69 = v62;
      }
      if ((int)v69 < (int)v143)
      {
        v70 = v142 - v69;
        v71 = &v137->f32[v69];
        v72 = &v129->f32[v69];
        v73 = &v141[v69];
        do
        {
          v74 = *v73++;
          v75 = v74;
          v76 = *v72++;
          *v71++ = v75 - v76;
          --v70;
        }
        while (v70);
      }
      LTMCompute::HFFHighFreqModulate(v61, a5, a4, v134, v25, v133, v132, v131);
      if ((int)v30 < 1)
      {
        v80 = 0;
      }
      else
      {
        v77 = 0;
        v78 = v127;
        v79.i64[0] = 0x3F0000003F000000;
        v79.i64[1] = 0x3F0000003F000000;
        do
        {
          v16 = vmulq_f32(v78[-1], v79);
          v17 = (int8x16_t)vmulq_f32(*v78, v79);
          v78[-1] = v16;
          *v78 = (float32x4_t)v17;
          v77 += 8;
          v78 += 2;
        }
        while (v77 < v30);
        v80 = v77;
      }
      if ((int)v80 < (int)v143)
      {
        v81 = v142 - v80;
        v82 = &v138[v80];
        do
        {
          v16.f32[0] = *v82 * 0.5;
          *v82++ = v16.f32[0];
          --v81;
        }
        while (v81);
      }
      if ((int)v30 < 1)
      {
        v85 = 0;
      }
      else
      {
        v83 = 0;
        v84 = v137 + 1;
        do
        {
          v16 = vmulq_f32(v84[-1], v128);
          v17 = (int8x16_t)vmulq_f32(*v84, v128);
          v84[-1] = v16;
          *v84 = (float32x4_t)v17;
          v83 += 8;
          v84 += 2;
        }
        while (v83 < v30);
        v85 = v83;
      }
      if ((int)v85 < (int)v143)
      {
        v86 = v142 - v85;
        v87 = &v137->f32[v85];
        do
        {
          v16.f32[0] = *v87 * 0.6;
          *v87++ = v16.f32[0];
          --v86;
        }
        while (v86);
      }
      if ((int)v29 < 1)
      {
        v95 = 0;
      }
      else
      {
        v88 = 0;
        v89 = v129;
        v90 = v135;
        v91 = v136;
        do
        {
          v92 = *v89++;
          v93 = v92;
          v94 = *v90++;
          v17 = (int8x16_t)v94;
          v16 = vaddq_f32(v93, v94);
          *v91++ = v16;
          v88 += 4;
        }
        while (v88 < v29);
        v95 = v88;
      }
      if ((int)v95 < (int)v143)
      {
        v96 = v142 - v95;
        v97 = &v31[v95];
        v98 = &v137->f32[v95];
        v99 = &v129->f32[v95];
        do
        {
          v100 = *v99++;
          v101 = v100;
          v102 = *v98++;
          *(float *)v17.i32 = v102;
          v16.f32[0] = v101 + v102;
          *v97++ = v16.f32[0];
          --v96;
        }
        while (v96);
      }
      if ((int)v29 < 1)
      {
        v107 = 0;
      }
      else
      {
        v103 = 0;
        v104 = v136;
        v105 = (float32x4_t *)v25;
        do
        {
          v106 = *v105++;
          v17 = *(int8x16_t *)v104;
          v16 = vaddq_f32(*v104, v106);
          *v104++ = v16;
          v103 += 4;
        }
        while (v103 < v29);
        v107 = v103;
      }
      if ((int)v107 < (int)v143)
      {
        v108 = v142 - v107;
        v109 = &v138[v107];
        v110 = &v31[v107];
        do
        {
          v111 = *v109++;
          *(float *)v17.i32 = v111;
          v16.f32[0] = *v110 + v111;
          *v110++ = v16.f32[0];
          --v108;
        }
        while (v108);
      }
      if (a4 >= 1)
        break;
      v28 = v140 + 1;
      if (v140 == 64)
        goto LABEL_89;
    }
    v112 = 0;
    v113 = 0;
    v114 = v140;
    do
    {
      if (a5 >= 1)
      {
        v115 = &v31[v113];
        v113 += a5;
        v116 = &a2[v114];
        v114 += v33;
        v117 = a5;
        do
        {
          v118 = *v115++;
          v16.f32[0] = fminf(v118, 1.0);
          *v116 = v16.f32[0];
          v116 += 65;
          --v117;
        }
        while (v117);
      }
      ++v112;
    }
    while (v112 != a4);
    v28 = v140 + 1;
  }
  while (v140 != 64);
  v119 = 0;
  v120 = 0;
  do
  {
    if (a5 >= 1)
    {
      v121 = 0;
      do
      {
        v122 = 0;
        v123 = v120;
        v124 = &a2[v120 + 1];
        do
        {
          v125 = a2[v123 + (int)v122];
          if (v124[v122] < v125)
            v124[v122] = v125;
          ++v122;
        }
        while ((_DWORD)v122 != 64);
        v120 = v123 + 65;
        ++v121;
      }
      while (v121 != a5);
      v120 = v123 + 65;
    }
    ++v119;
  }
  while (v119 != a4);
LABEL_89:
  *(_WORD *)v126 = 0;
  v126[3] = 0;
}

void LTMCompute::generateLinearLTC(LTMCompute *this, const sLtmComputeInput *a2, const sLtmComputeMeta *a3, sLtmComputeOutput *__dst)
{
  float *p_encodedExpRatio;
  int v7;
  sLtmComputeOutput *v8;
  char v9;
  float *rgbToneCurve;
  int gammaCurve;
  uint64_t i;
  float v13;
  float v14;
  uint64_t j;
  float v16;
  float v17;

  p_encodedExpRatio = &__dst->encodedExpRatio;
  v7 = 48;
  v8 = __dst;
  do
  {
    memcpy(v8, &LTMCompute::localCurveInputs, 0x104uLL);
    v8 = (sLtmComputeOutput *)((char *)v8 + 260);
    --v7;
  }
  while (v7);
  memcpy(__dst->averageLTC, &LTMCompute::localCurveInputs, sizeof(__dst->averageLTC));
  v9 = *((_BYTE *)p_encodedExpRatio + 4);
  memcpy(__dst->globalLUT, LTMCompute::globalCurveInputs, sizeof(__dst->globalLUT));
  *((_BYTE *)p_encodedExpRatio + 4) = v9 | 0xC;
  rgbToneCurve = __dst->rgbToneCurve;
  memcpy(rgbToneCurve, LTMCompute::globalCurveInputs, 0x404uLL);
  gammaCurve = a3->gammaCurve;
  if (gammaCurve)
  {
    if (gammaCurve == 2)
    {
      memcpy(rgbToneCurve, LTMCompute::globalCurveInputs, 0x101uLL);
    }
    else if (gammaCurve == 1)
    {
      for (i = 0; i != 257; ++i)
      {
        v13 = rgbToneCurve[i];
        if (v13 >= 0.0833)
          v14 = (float)(logf((float)(v13 * 12.0) + -0.2847) * 0.17883) + 0.5599;
        else
          v14 = sqrtf(v13 * 3.0);
        rgbToneCurve[i] = v14;
      }
    }
  }
  else
  {
    for (j = 0; j != 257; ++j)
    {
      v16 = rgbToneCurve[j];
      if (v16 >= 0.018)
        v17 = (float)(powf(v16, 0.45) * 1.099) + -0.099;
      else
        v17 = v16 * 4.5;
      rgbToneCurve[j] = v17;
    }
  }
  *((_BYTE *)p_encodedExpRatio + 4) |= 0x10u;
  *p_encodedExpRatio = 1.0;
}

void LTMCompute::calculateSpatialCCM(LTMCompute *this, const sLtmComputeInput *a2, const sLtmComputeMeta *a3, sLtmComputeOutput *a4)
{
  uint64_t v7;
  float *spatialCCM;
  uint64_t v9;
  float v10;
  float v12;
  _BOOL4 useDigitalFlash;
  uint64_t v14;
  __int128 *v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  double v19;
  float *v20;
  float v21;
  float v22;
  int v23;
  __int128 v24;
  __int128 v25;
  _OWORD v27[2];
  int v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3->useGlobalCCM)
  {
    a4->spatialCCM[8] = 0.2561;
    *(_OWORD *)a4->spatialCCM = sLtmTuningParams::desaturationCCM;
    *(_OWORD *)&a4->spatialCCM[4] = unk_2309306B8;
    *((_BYTE *)a4 + 36580) |= 2u;
  }
  if (a3->useSpatialCCM)
  {
    v30 = 0;
    v31 = 0x3F80000000000000;
    v32 = 0;
    v33 = 0x3F80000000000000;
    v29 = 1.0;
    LTMCompute::ccmWithNewWhitePoint(this, &v29, a2->ccm, a2->rGainRatio, a2->bGainRatio);
    v7 = 0;
    spatialCCM = a4->spatialCCM;
    do
    {
      v9 = 0;
      v10 = a2->ccmWeights[v7] * a2->ccmMixFactor;
      do
      {
        if ((v9 & 0x7FFFFFFB) == 0 || v9 == 8)
          v12 = 1.0 - v10;
        else
          v12 = -0.0;
        *((float *)v27 + v9) = v12 + (float)(v10 * *(&v29 + v9));
        ++v9;
      }
      while (v9 != 9);
      useDigitalFlash = a3->useDigitalFlash;
      if (a3->useDigitalFlash)
      {
        useDigitalFlash = a3->useGlobalCCM;
        if (a3->useGlobalCCM)
        {
          v14 = 0;
          v15 = &sLtmTuningParams::desaturationCCM;
          do
          {
            v16 = 0;
            v17 = v27;
            do
            {
              v18 = 0;
              v19 = 0.0;
              v20 = (float *)v17;
              do
              {
                v21 = *v20;
                v20 += 3;
                v19 = v19 + (float)(*(float *)((char *)v15 + v18) * v21);
                v18 += 4;
              }
              while (v18 != 12);
              v22 = v19;
              spatialCCM[3 * v14 + v16++] = v22;
              v17 = (_OWORD *)((char *)v17 + 4);
            }
            while (v16 != 3);
            ++v14;
            v15 = (__int128 *)((char *)v15 + 12);
          }
          while (v14 != 3);
          spatialCCM += 9;
          useDigitalFlash = 1;
        }
      }
      v23 = useDigitalFlash - 3;
      do
      {
        v24 = v27[0];
        v25 = v27[1];
        *((_DWORD *)spatialCCM + 8) = v28;
        *(_OWORD *)spatialCCM = v24;
        *((_OWORD *)spatialCCM + 1) = v25;
        spatialCCM += 9;
      }
      while (!__CFADD__(v23++, 1));
      ++v7;
    }
    while (v7 != 192);
    *((_BYTE *)a4 + 36580) |= 2u;
  }
}

float LTMCompute::ccmWithNewWhitePoint(LTMCompute *this, float *a2, const float *a3, float a4, float a5)
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float result;

  v6 = a3[7];
  v5 = a3[8];
  v7 = a3[4];
  v8 = a3[5];
  v9 = a3[6];
  v10 = (float)(v7 * v5) - (float)(v6 * v8);
  v11 = a3[1];
  v13 = a3[2];
  v12 = a3[3];
  v14 = (float)(v12 * v6) - (float)(v7 * v9);
  v15 = 1.0
      / (float)((float)((float)(*a3 * v10) - (float)(v11 * (float)((float)(v12 * v5) - (float)(v8 * v9))))
              + (float)(v13 * v14));
  v16 = v10 * v15;
  v17 = (float)((float)(v13 * v6) - (float)(v11 * v5)) * v15;
  v18 = (float)((float)(v11 * v8) - (float)(v13 * v7)) * v15;
  v19 = (float)((float)(v8 * v9) - (float)(v12 * v5)) * v15;
  v20 = (float)((float)(*a3 * v5) - (float)(v13 * v9)) * v15;
  v21 = (float)((float)(v12 * v13) - (float)(*a3 * v8)) * v15;
  v22 = v14 * v15;
  v23 = (float)((float)(v9 * v11) - (float)(*a3 * v6)) * v15;
  v24 = (float)((float)(*a3 * v7) - (float)(v12 * v11)) * v15;
  v25 = v16 * a4;
  v26 = v17 * a4;
  v27 = v18 * a4;
  v28 = v22 * a5;
  v29 = v23 * a5;
  v30 = v24 * a5;
  *a2 = (float)((float)(v11 * v19) + (float)(*a3 * v25)) + (float)(v13 * v28);
  a2[1] = (float)((float)(a3[1] * v20) + (float)(*a3 * v26)) + (float)(a3[2] * v29);
  a2[2] = (float)((float)(v21 * a3[1]) + (float)(*a3 * v27)) + (float)(a3[2] * v30);
  a2[3] = (float)((float)(v19 * a3[4]) + (float)(a3[3] * v25)) + (float)(a3[5] * v28);
  a2[4] = (float)((float)(v20 * a3[4]) + (float)(a3[3] * v26)) + (float)(a3[5] * v29);
  a2[5] = (float)((float)(v21 * a3[4]) + (float)(a3[3] * v27)) + (float)(a3[5] * v30);
  a2[6] = (float)((float)(v19 * a3[7]) + (float)(a3[6] * v25)) + (float)(a3[8] * v28);
  a2[7] = (float)((float)(v20 * a3[7]) + (float)(a3[6] * v26)) + (float)(a3[8] * v29);
  result = (float)((float)(v21 * a3[7]) + (float)(a3[6] * v27)) + (float)(a3[8] * v30);
  a2[8] = result;
  return result;
}

uint64_t LTMCompute::Process(LTMCompute *this, const sLtmComputeInput *a2, const sLtmComputeMeta *a3, sLtmComputeOutput *a4)
{
  float *p_eit;
  unint64_t *v9;

  p_eit = &a2->eit;
  if (a2->LTMHazeCorrectionOff)
    sLtmTuningParams::nFlareBins = 0;
  v9 = &a4->eit;
  if (a3->useLinearLTCs)
    LTMCompute::generateLinearLTC(this, a2, a3, a4);
  else
    LTMCompute::generateSpatialLTC(this, a2, a3, a4);
  LTMCompute::calculateSpatialCCM(this, a2, a3, a4);
  if (a3->updateMixLUT)
  {
    memset_pattern16(a4->WMixLUT, &unk_230930690, 0x404uLL);
    *((_BYTE *)v9 + 12) |= 1u;
  }
  *v9 = (unint64_t)*p_eit;
  return 0;
}

void LTMCompute::HFFspatialMapCalc(LTMCompute *this, int a2, const float *a3, float *a4, float32x4_t *a5)
{
  float *v10;
  int v11;
  float (*var5)[342];
  uint64_t v13;
  const float *v14;
  float *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  float v20;
  float v21;
  uint64_t v22;
  float *v23;
  int v24;
  float v25;
  float32x4_t *v26;
  int v27;
  uint64_t v28;
  int v29;
  float v30;
  float *v31;
  __int32 *v32;
  uint64_t v33;
  const float *v34;
  float v35;
  __int32 v36;
  unint64_t v37;
  unint64_t v38;
  float32x4_t *v39;
  float32x4_t *v40;
  float32x4_t v41;
  uint64_t v42;
  float *v43;
  float *v44;
  float v45;
  unint64_t v46;
  unint64_t v47;
  float32x4_t *v48;
  float32x4_t v49;
  uint64_t v50;
  float *v51;
  float v52;
  unint64_t v53;
  float32x4_t *v54;
  float32x4_t v55;
  uint64_t v56;
  float *v57;
  int v58;
  int v59;
  float *v60;
  int v61;
  int v62;
  float v63;
  int v64;
  float v65;
  float v66;
  unint64_t v67;
  float32x4_t *v68;
  float32x4_t v69;
  uint64_t v70;
  float *v71;
  int v72;
  int v73;
  float *v74;
  float *v75;
  uint64_t v76;
  float *v77;
  float v78;
  int v79;
  int v80;
  float *v81;
  uint64_t v82;
  float *v83;
  int v84;
  unint64_t v85;
  float32x4_t *v86;
  float32x4_t *v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  uint64_t v91;
  float *v92;
  float *v93;
  float v94;
  float *v95;

  v95 = this->var5[2];
  if (this->var6[1])
  {
    v10 = 0;
  }
  else
  {
    v11 = 7 * a2;
    this->var6[1] = 1;
    v10 = this->var5[1];
    if (7 * a2 >= 342)
      v11 = 342;
    bzero(this->var5[1], 4 * v11);
  }
  var5 = this->var5;
  if (a2 >= 1)
  {
    v13 = a2;
    v14 = a3;
    v15 = v10;
    do
    {
      v16 = *(_DWORD *)v14++;
      *(_DWORD *)v15++ = v16;
      --v13;
    }
    while (v13);
  }
  qsort(v10, a2, 4uLL, (int (__cdecl *)(const void *, const void *))compFloat);
  v17 = 0;
  v18 = 0;
  v19 = a2 - 1;
  do
  {
    a4[v17] = v10[(float)((float)v18 / 5.0)];
    v18 += v19;
    ++v17;
  }
  while (v17 != 6);
  v20 = v10[v19];
  v21 = *v10;
  v22 = (6 * a2);
  v23 = v95;
  if (*((_BYTE *)v95 + 2736))
  {
    var5 = 0;
  }
  else
  {
    *((_BYTE *)v95 + 2736) = 1;
    if ((int)v22 >= 342)
      v24 = 342;
    else
      v24 = 6 * a2;
    bzero(var5, 4 * v24);
    v23 = v95;
  }
  v25 = v20 - v21;
  if (*((_BYTE *)v23 + 2738))
  {
    v26 = 0;
  }
  else
  {
    *((_BYTE *)v23 + 2738) = 1;
    if ((int)v22 >= 342)
      v27 = 342;
    else
      v27 = 6 * a2;
    bzero(v95, 4 * v27);
    v23 = v95;
    v26 = (float32x4_t *)v95;
  }
  v28 = 0;
  v29 = 0;
  v30 = (float)((float)(2.0 / v25) / 1.5) * (float)((float)(2.0 / v25) / 1.5);
  do
  {
    if (a2 >= 1)
    {
      v31 = &(*var5)[v29];
      v32 = &v26->i32[v29];
      v29 += a2;
      v33 = a2;
      v34 = a3;
      v35 = a4[v28];
      do
      {
        *v31++ = v35;
        v36 = *(_DWORD *)v34++;
        *v32++ = v36;
        --v33;
      }
      while (v33);
    }
    ++v28;
  }
  while (v28 != 6);
  if (v30 < 0.00000011921)
    v30 = 0.00000011921;
  v37 = v22 & 0xFFFFFFFC;
  if ((int)v37 < 1)
  {
    LODWORD(v38) = 0;
  }
  else
  {
    v38 = 0;
    v39 = v26;
    v40 = (float32x4_t *)var5;
    do
    {
      v41 = *v40++;
      *v39 = vsubq_f32(*v39, v41);
      ++v39;
      v38 += 4;
    }
    while (v38 < v37);
  }
  if ((int)v38 < (int)v22)
  {
    v42 = v22 - v38;
    v43 = &(*var5)[v38];
    v44 = &v26->f32[v38];
    do
    {
      v45 = *v43++;
      *v44 = *v44 - v45;
      ++v44;
      --v42;
    }
    while (v42);
  }
  v46 = v22 & 0xFFFFFFF8;
  if ((int)v46 < 1)
  {
    LODWORD(v47) = 0;
  }
  else
  {
    v47 = 0;
    v48 = v26 + 1;
    do
    {
      v49 = vmulq_f32(*v48, *v48);
      v48[-1] = vmulq_f32(v48[-1], v48[-1]);
      *v48 = v49;
      v47 += 8;
      v48 += 2;
    }
    while (v47 < v46);
  }
  if ((int)v47 < (int)v22)
  {
    v50 = v22 - v47;
    v51 = &v26->f32[v47];
    do
    {
      *v51 = *v51 * *v51;
      ++v51;
      --v50;
    }
    while (v50);
  }
  v52 = 1.0 / v30;
  if ((int)v46 < 1)
  {
    LODWORD(v53) = 0;
  }
  else
  {
    v53 = 0;
    v54 = v26 + 1;
    do
    {
      v55 = vmulq_n_f32(*v54, v52);
      v54[-1] = vmulq_n_f32(v54[-1], v52);
      *v54 = v55;
      v53 += 8;
      v54 += 2;
    }
    while (v53 < v46);
  }
  if ((int)v53 < (int)v22)
  {
    v56 = v22 - v53;
    v57 = &v26->f32[v53];
    do
    {
      *v57 = v52 * *v57;
      ++v57;
      --v56;
    }
    while (v56);
  }
  v58 = 0;
  v59 = 0;
  do
  {
    if (a2 >= 1)
    {
      v60 = &v26->f32[v59];
      v59 += a2;
      v61 = a2;
      do
      {
        v62 = 1016466288;
        if (*v60 <= 8888.2)
        {
          v63 = *v60 * 0.5 * 32.0;
          v64 = llroundf(v63);
          if (v64 >= 128)
            v64 = 128;
          v62 = LTMCompute::invExpLutX4[v64];
        }
        *(_DWORD *)v60++ = v62;
        --v61;
      }
      while (v61);
    }
    ++v58;
  }
  while (v58 != 6);
  v65 = (float)(v30 + v30) * 3.14159265;
  v66 = 1.0 / sqrtf(v65);
  if ((int)v46 < 1)
  {
    LODWORD(v67) = 0;
  }
  else
  {
    v67 = 0;
    v68 = v26 + 1;
    do
    {
      v69 = vmulq_n_f32(*v68, v66);
      v68[-1] = vmulq_n_f32(v68[-1], v66);
      *v68 = v69;
      v67 += 8;
      v68 += 2;
    }
    while (v67 < v46);
  }
  if ((int)v67 < (int)v22)
  {
    v70 = v22 - v67;
    v71 = &v26->f32[v67];
    do
    {
      *v71 = v66 * *v71;
      ++v71;
      --v70;
    }
    while (v70);
  }
  if (a2 > 0)
  {
    memset_pattern16(&v10[6 * a2], &unk_230930670, 4 * a2);
    v23 = v95;
  }
  v72 = 0;
  v73 = 0;
  do
  {
    if (a2 >= 1)
    {
      v74 = &v26->f32[v73];
      v75 = &a5->f32[v73];
      v73 += a2;
      v76 = a2;
      v77 = &v10[6 * a2];
      do
      {
        *v75++ = *v74;
        v78 = *v74++;
        *v77 = v78 + *v77;
        ++v77;
        --v76;
      }
      while (v76);
    }
    ++v72;
  }
  while (v72 != 6);
  v79 = 0;
  v80 = 0;
  do
  {
    if (a2 >= 1)
    {
      v81 = &v10[v80];
      v80 += a2;
      v82 = a2;
      v83 = &v10[6 * a2];
      do
      {
        v84 = *(_DWORD *)v83++;
        *(_DWORD *)v81++ = v84;
        --v82;
      }
      while (v82);
    }
    ++v79;
  }
  while (v79 != 6);
  if ((int)v37 < 1)
  {
    LODWORD(v85) = 0;
  }
  else
  {
    v85 = 0;
    v86 = (float32x4_t *)v10;
    v87 = a5;
    do
    {
      v88 = *v86++;
      v89 = vrecpeq_f32(v88);
      v90 = vmulq_f32(v89, vrecpsq_f32(v88, v89));
      *v87 = vmulq_f32(*v87, vmulq_f32(vrecpsq_f32(v88, v90), v90));
      ++v87;
      v85 += 4;
    }
    while (v85 < v37);
  }
  if ((int)v85 < (int)v22)
  {
    v91 = v22 - v85;
    v92 = &v10[v85];
    v93 = &a5->f32[v85];
    do
    {
      v94 = *v92++;
      *v93 = *v93 / v94;
      ++v93;
      --v91;
    }
    while (v91);
  }
  *((_WORD *)v23 + 1368) = 0;
  *((_BYTE *)v23 + 2738) = 0;
}

uint64_t compFloat(float *a1, float *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 != *a2;
}

unint64_t LTMCompute::HFFspatialMapFilter(LTMCompute *this, int a2, int a3, float *__src, const float *a5)
{
  int v9;
  BOOL *v10;
  float *v11;
  int v12;
  unint64_t result;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  int v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float *v27;
  uint64_t v28;
  float *v29;
  float v30;
  int v31;
  float v32;
  float v33;
  float v34;
  float v35;
  int v36;
  float v37;
  int v38;
  float v39;
  int v40;
  int v41;
  int v42;
  float *v43;
  float *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  float *v49;
  float *v50;
  float *v51;
  float v52;
  float v53;
  int v54;
  float v55;
  float v56;
  int v57;
  int v58;
  const float *v59;
  float *v60;
  float *v61;
  int v62;
  int v63;
  float v64;
  float v65;
  float v66;
  int v67;
  float *v69;
  int v70;
  float *v71;
  int v72;
  float v73;
  float v74;
  float v75;

  v9 = a3 * a2;
  v10 = &this->var6[1];
  if (this->var6[1])
  {
    v11 = 0;
  }
  else
  {
    v12 = 6 * v9;
    *v10 = 1;
    v11 = this->var5[1];
    if (6 * v9 >= 342)
      v12 = 342;
    bzero(this->var5[1], 4 * v12);
  }
  result = (unint64_t)memcpy(v11, __src, 24 * v9);
  v14 = 0;
  v15 = 0;
  do
  {
    if (a2 >= 1)
    {
      v16 = 0;
      v17 = 0;
      do
      {
        v18 = v15;
        v19 = v17;
        v20 = v17 + 1;
        v21 = a5[v17] - a5[v20];
        v22 = llroundf((float)((float)(v21 * v21) / 0.1089) * 32.0);
        if (v22 >= 128)
          v22 = 128;
        v23 = *(float *)&LTMCompute::invExpLutX4[v22];
        v24 = v15 + 1;
        __src[v15] = (float)((float)(v11[v15] + (float)(v11[v15] + 0.0)) + (float)(v23 * v11[v24])) / (float)(v23 + 2.0);
        if (a3 < 3)
        {
          result = v20;
          v38 = v15 + 1;
        }
        else
        {
          v25 = 0;
          v26 = (v19 << 32) + 0x100000000;
          v27 = (float *)&a5[v19 + 2];
          v28 = (v18 << 32) + 0x100000000;
          v29 = &v11[v18 + 1];
          do
          {
            v30 = *(v27 - 1);
            v31 = llroundf((float)((float)((float)(v30 - *(v27 - 2)) * (float)(v30 - *(v27 - 2))) / 0.1089) * 32.0);
            if (v31 >= 128)
              v31 = 128;
            v32 = *(float *)&LTMCompute::invExpLutX4[v31];
            v33 = *v29;
            v34 = *v27++;
            v35 = (float)(v32 * *(v29 - 1)) + 0.0;
            v36 = llroundf((float)((float)((float)(v30 - v34) * (float)(v30 - v34)) / 0.1089) * 32.0);
            if (v36 >= 128)
              v36 = 128;
            v37 = v29[1];
            ++v29;
            __src[v18 + 1 + v25++] = (float)((float)(v33 + v35) + (float)(*(float *)&LTMCompute::invExpLutX4[v36] * v37))
                                   / (float)((float)((float)(v32 + 0.00000011921) + 1.0)
                                           + *(float *)&LTMCompute::invExpLutX4[v36]);
            v26 += 0x100000000;
            v28 += 0x100000000;
          }
          while (a3 - 2 != (_DWORD)v25);
          result = (v19 + v25 + 1);
          v38 = v18 + v25 + 1;
          v20 = v26 >> 32;
          v24 = v28 >> 32;
        }
        v39 = a5[(int)result - 1];
        v40 = llroundf((float)((float)((float)(a5[v20] - v39) * (float)(a5[v20] - v39)) / 0.1089) * 32.0);
        if (v40 >= 128)
          v40 = 128;
        __src[v24] = (float)(v11[v24]
                           + (float)(v11[v24]
                                   + (float)((float)(*(float *)&LTMCompute::invExpLutX4[v40] * v11[v38 - 1]) + 0.0)))
                   / (float)((float)((float)(*(float *)&LTMCompute::invExpLutX4[v40] + 0.00000011921) + 1.0) + 1.0);
        v17 = result + 1;
        v15 = v38 + 1;
        ++v16;
      }
      while (v16 != a2);
    }
    ++v14;
  }
  while (v14 != 6);
  v41 = 0;
  v42 = 0;
  do
  {
    if (v9 >= 1)
    {
      v43 = &__src[v42];
      v44 = &v11[v42];
      v42 += v9;
      v45 = v9;
      do
      {
        v46 = *(_DWORD *)v43++;
        *(_DWORD *)v44++ = v46;
        --v45;
      }
      while (v45);
    }
    ++v41;
  }
  while (v41 != 6);
  v47 = 0;
  v48 = 0;
  do
  {
    if (a3 < 1)
    {
      v57 = 0;
    }
    else
    {
      v49 = &v11[v48 + 8];
      v50 = &__src[v48];
      v48 += a3;
      result = a3;
      v51 = (float *)(a5 + 8);
      do
      {
        v52 = *(v51 - 8);
        v53 = *v51++;
        v54 = llroundf((float)((float)((float)(v52 - v53) * (float)(v52 - v53)) / 0.1089) * 32.0);
        v55 = *(v49 - 8) + (float)(*(v49 - 8) + 0.0);
        if (v54 >= 128)
          v54 = 128;
        v56 = *v49++;
        *v50++ = (float)(v55 + (float)(*(float *)&LTMCompute::invExpLutX4[v54] * v56))
               / (float)(*(float *)&LTMCompute::invExpLutX4[v54] + 2.0);
        --result;
      }
      while (result);
      v57 = a3;
    }
    if (a2 >= 3)
    {
      v58 = 1;
      do
      {
        if (a3 >= 1)
        {
          v59 = &a5[v57];
          v57 += a3;
          v60 = &v11[v48];
          v61 = &__src[v48];
          v48 += a3;
          v62 = a3;
          do
          {
            v63 = llroundf((float)((float)((float)(*v59 - *(v59 - 8)) * (float)(*v59 - *(v59 - 8))) / 0.1089) * 32.0);
            if (v63 >= 128)
              v63 = 128;
            v64 = *(float *)&LTMCompute::invExpLutX4[v63];
            v65 = (float)(v64 * *(v60 - 8)) + 0.0;
            v66 = (float)(v64 + 0.00000011921) + 1.0;
            v67 = llroundf((float)((float)((float)(*v59 - v59[8]) * (float)(*v59 - v59[8])) / 0.1089) * 32.0);
            if (v67 >= 128)
              v67 = 128;
            *v61++ = (float)((float)(*v60 + v65) + (float)(*(float *)&LTMCompute::invExpLutX4[v67] * v60[8]))
                   / (float)(v66 + *(float *)&LTMCompute::invExpLutX4[v67]);
            ++v59;
            ++v60;
            --v62;
          }
          while (v62);
        }
        result = (v58 + 1);
      }
      while (v58++ != a2 - 2);
    }
    if (a3 >= 1)
    {
      v69 = &__src[v48];
      result = (unint64_t)&v11[v48];
      v48 += a3;
      v70 = a3;
      v71 = (float *)&a5[v57];
      do
      {
        v72 = llroundf((float)((float)((float)(*v71 - *(v71 - 8)) * (float)(*v71 - *(v71 - 8))) / 0.1089) * 32.0);
        if (v72 >= 128)
          v72 = 128;
        v73 = *(float *)&LTMCompute::invExpLutX4[v72];
        v74 = (float)(v73 * *(float *)(result - 32)) + 0.0;
        v75 = *(float *)result;
        result += 4;
        *v69++ = (float)(v75 + (float)(v75 + v74)) / (float)((float)((float)(v73 + 0.00000011921) + 1.0) + 1.0);
        ++v71;
        --v70;
      }
      while (v70);
    }
    ++v47;
  }
  while (v47 != 6);
  *v10 = 0;
  return result;
}

void LTMCompute::HFFHighFreqModulate(LTMCompute *this, int a2, int a3, float *a4, float *a5, float32x4_t *a6, float32x4_t *a7, float32x4_t *a8)
{
  int v8;
  uint64_t v9;
  int v10;
  float *v11;
  float v12;
  float v13;
  uint64_t v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  float *f32;
  float32x4_t v21;
  float32x4_t v22;
  float *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  float v34;
  float *v35;

  v8 = 0;
  v9 = 0;
  v10 = a3 * a2;
  do
  {
    if (v10 < 1)
    {
      v12 = 0.0;
      v13 = 0.00000011921;
    }
    else
    {
      v11 = &a4[v8];
      v12 = 0.0;
      v13 = 0.00000011921;
      v14 = (a3 * a2);
      v15 = a5;
      do
      {
        v16 = *v11++;
        v17 = v16;
        v18 = *v15++;
        v12 = v12 + (float)(v17 * v18);
        v13 = v13 + v17;
        --v14;
      }
      while (v14);
    }
    a7->f32[v9] = v12;
    a8->f32[v9++] = v13;
    v8 += v10 & ~(v10 >> 31);
  }
  while (v9 != 6);
  v19 = 0;
  v21 = *a8;
  f32 = a8[1].f32;
  v22 = v21;
  v24 = *a7;
  v23 = a7[1].f32;
  v25 = vrecpeq_f32(v22);
  v26 = vmulq_f32(v25, vrecpsq_f32(v22, v25));
  *a6 = vmulq_f32(v24, vmulq_f32(vrecpsq_f32(v22, v26), v26));
  do
  {
    a6[1].f32[v19] = v23[v19] / f32[v19];
    ++v19;
  }
  while (v19 != 2);
  if (a3 >= 1)
  {
    v27 = 0;
    v28 = 0;
    LODWORD(v29) = 0;
    v30 = 4 * v10;
    do
    {
      if (a2 >= 1)
      {
        v31 = 0;
        v29 = (int)v29;
        v32 = v27;
        do
        {
          v33 = 0;
          a5[v29] = 0.0;
          v34 = 0.0;
          v35 = &a4[v32];
          do
          {
            v34 = v34 + (float)(*v35 * a6->f32[v33]);
            a5[v29] = v34;
            v35 = (float *)((char *)v35 + v30);
            ++v33;
          }
          while (v33 != 6);
          ++v29;
          ++v31;
          ++v32;
        }
        while (v31 != a2);
      }
      ++v28;
      v27 += a2;
    }
    while (v28 != a3);
  }
}

void CAWBAFEPhotometerAssistPenrose::~CAWBAFEPhotometerAssistPenrose(CAWBAFEPhotometerAssistPenrose *this)
{
  JUMPOUT(0x2348BC8E0);
}

void CAWBAFEPhotometerAssistPenrose::updatePhotometerDetectionOutput(CAWBAFEPhotometerAssistPenrose *this, float32x2_t *a2, float a3)
{
  int v4;
  unsigned int v6;
  float v7;
  unsigned int v8;
  float v9;
  float v10;
  unsigned __int16 v11;
  float v12;
  float v13;
  float v14;
  __int16 v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  __int16 v23;
  float *v24;
  float v25;
  float v26;
  unsigned int v27;
  float v28;
  float v29;
  float *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  unsigned int v41;
  float v42;
  float v43;
  float v44;
  uint64_t v45;
  float v46;
  float v47;
  float v48;
  float v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  float *v59;
  uint64_t v60;
  float v61;
  float v62;
  float v63;
  uint64_t v64;
  float *v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float32x2_t v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  uint64_t v87;
  float v88;
  float v89;
  uint64_t v90;
  float *v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  int v95;
  __int8 v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float32_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;

  v4 = *((_DWORD *)this + 3);
  if (!v4)
  {
    a2[28] = 0;
    a2[27].i32[1] = 0;
    return;
  }
  v6 = a2->u8[3];
  if (v6 <= 7)
  {
    LOBYTE(v6) = v6 + 1;
    a2->i8[3] = v6;
  }
  if (v6 == 1)
  {
    v7 = a2[2].f32[1];
    LOWORD(a3) = a2->i16[2];
    v114 = (float)LODWORD(a3);
    v9 = a2[6].f32[1];
    v120 = a2[14].f32[1];
    v10 = a2[22].f32[1];
    goto LABEL_9;
  }
  if (v6 == 2)
  {
    v7 = a2[3].f32[0];
    a2[2].f32[1] = v7;
    v8 = a2->u16[3];
    a2->i16[2] = v8;
    v120 = a2[15].f32[0];
    a2[14].f32[1] = v120;
    v114 = (float)v8;
    v9 = (float)(a2[7].f32[0] * 0.5) + (float)(a2[6].f32[1] * 0.5);
    v10 = (float)(a2[23].f32[0] * 0.5) + (float)(a2[22].f32[1] * 0.5);
LABEL_9:
    v113 = v10;
    goto LABEL_10;
  }
  v56 = (_BYTE *)*((_QWORD *)this + 2);
  v57 = *v56;
  if (!*v56)
  {
    v113 = 0.0;
    v114 = 0.0;
    v120 = 0.0;
    v9 = 0.0;
    v7 = 0.0;
LABEL_10:
    v11 = 0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = a2->u8[2];
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
    do
    {
      v23 = v15 - v11;
      if ((__int16)(v15 - v11) < 0)
        v23 = v15 - v11 + 8;
      v24 = (float *)a2 + v23;
      v25 = v24[13];
      v22 = v22 + v25;
      v21 = v21 + (float)(v25 * v25);
      v26 = v24[5];
      v20 = v20 + v26;
      v19 = v19 + (float)(v26 * v26);
      v27 = a2->u16[v23 + 2];
      v18 = v18 + (float)v27;
      v17 = v17 + (float)(int)(v27 * v27);
      v28 = v24[29];
      v16 = v16 + v28;
      v14 = v14 + (float)(v28 * v28);
      v29 = v24[45];
      v13 = v13 + v29;
      v12 = v12 + (float)(v29 * v29);
      ++v11;
    }
    while (v6 > v11);
    goto LABEL_14;
  }
  v58 = a2->u8[2];
  v59 = (float *)(v56 + 4);
  v60 = v58 << 48;
  v61 = 0.0;
  v62 = 0.0;
  v9 = 0.0;
  v63 = 0.0;
  v7 = 0.0;
  do
  {
    v64 = v60 + 0x8000000000000;
    if (v58 >= 0)
      v64 = v60;
    v65 = (float *)((char *)a2 + (v64 >> 46));
    v66 = v65[5];
    v67 = *v59++;
    v7 = v7 + (float)(v66 * v67);
    LOWORD(v66) = *(__int16 *)((char *)&a2->i16[2] + (v64 >> 47));
    v63 = v63 + (float)((float)LODWORD(v66) * v67);
    v9 = v9 + (float)(v65[13] * v67);
    v62 = v62 + (float)(v65[29] * v67);
    v61 = v61 + (float)(v65[45] * v67);
    v60 -= 0x1000000000000;
    --v58;
    --v57;
  }
  while (v57);
  v113 = v61;
  v114 = v63;
  v120 = v62;
  if ((_BYTE)v6)
    goto LABEL_10;
  v22 = 0.0;
  v21 = 0.0;
  v20 = 0.0;
  v19 = 0.0;
  v18 = 0.0;
  v17 = 0.0;
  v16 = 0.0;
  v14 = 0.0;
  v13 = 0.0;
  v12 = 0.0;
LABEL_14:
  v110 = (float)v6;
  v111 = v22 / v110;
  v112 = v18 / v110;
  v30 = (float *)*((_QWORD *)this + 2);
  v118 = sqrtf((float)(v17 / v110) - (float)(v112 * v112));
  v119 = sqrtf((float)(v21 / v110) - (float)(v111 * v111));
  v117 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v7, (uint64_t)this, v30 + 19);
  v106 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v114, v31, v30 + 28);
  v115 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v9, v32, v30 + 10);
  v109 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v120, v33, v30 + 37);
  a2[27].i32[0] = 0;
  if (v6 <= 2u && *((_BYTE *)this + 8) && a2->i8[1] && v113 > 500.0 && v9 > 0.3)
    a2[27].i32[0] = 1;
  v105 = (float)(v117 * v106) * v115;
  v116 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v7, v34, v30 + 64);
  v107 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v118, v35, v30 + 82);
  v102 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v9, v36, v30 + 55);
  v100 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v119, v37, v30 + 73);
  v40 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v120, v38, v30 + 46);
  v42 = (float)((float)(v116 * v107) * v102) * v100;
  v101 = v40;
  v43 = v42 * v40;
  v44 = 0.0;
  if (v6 < 3u)
    v43 = 0.0;
  v108 = v43;
  if (v6 >= 3u)
  {
    v45 = a2->u8[2];
    LOWORD(v43) = a2->i16[v45 + 2];
    v46 = (float)LODWORD(v43);
    v47 = v30[7];
    v48 = v30[8];
    if (v47 > v46)
      v46 = v30[7];
    v49 = a2[6].f32[v45 + 1];
    if (v48 > v49)
      v49 = v30[8];
    v50 = v45 - 1;
    v51 = (_DWORD)v45 == 0;
    v52 = 7;
    if (!v51)
      v52 = v50;
    LOWORD(v41) = a2->i16[v52 + 2];
    v53 = (float)v41;
    if (v47 > v53)
      v53 = v30[7];
    v54 = a2[6].f32[v52 + 1];
    if (v48 > v54)
      v54 = v30[8];
    if (v46 <= v53)
      v55 = v53 / v46;
    else
      v55 = v46 / v53;
    if (v49 <= v54)
      v68 = v54 / v49;
    else
      v68 = v49 / v54;
    v98 = v68;
    v103 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v55, v39, v30 + 91);
    v70 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v98, v69, v30 + 100);
    v44 = v103;
    if (v103 <= v70)
      v44 = v70;
  }
  v104 = v44;
  v71 = v20 / v110;
  v72 = v16 / v110;
  v97 = v14 / v110;
  v99 = v19 / v110;
  v73 = v13 / v110;
  v74 = v105 * v109;
  v75 = v12 / v110;
  v76 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v9, v39, v30 + 109);
  v77.f32[0] = v116 * v101;
  v78 = (float)(v116 * v101) * v76;
  v79 = (float)(v117 * v109) * v76;
  if (a2[26].i8[4])
  {
    v80 = v104;
    if (!*((_BYTE *)this + 32))
    {
      v81 = a2[27].f32[1];
      v82 = v30[4];
      if (v81 <= v74)
        v74 = v81 + fminf(v74 - v81, v82);
      else
        v74 = v81 - fminf(v81 - v74, v82);
    }
    v83 = (float)(a2[28].f32[0] * 0.5) + (float)(v108 * 0.5);
    a2[27].f32[1] = v74;
    a2[28].f32[0] = v83;
    a2[28].f32[1] = v104;
    v77.f32[1] = v78;
    a2[29] = vmla_f32(vmul_f32(a2[29], (float32x2_t)0x3F0000003F000000), (float32x2_t)0x3F0000003F000000, v77);
    a2[30].f32[0] = (float)(a2[30].f32[0] * 0.5) + (float)(v79 * 0.5);
  }
  else
  {
    v83 = v108;
    a2[27].f32[1] = v74;
    a2[28].f32[0] = v108;
    v80 = v104;
    a2[28].f32[1] = v104;
    a2[29].i32[0] = v77.i32[0];
    a2[29].f32[1] = v78;
    a2[30].f32[0] = v79;
    a2[26].i8[4] = 1;
  }
  if (v83 < v30[5])
    a2[28].i32[0] = 0;
  v84 = sqrtf(v99 - (float)(v71 * v71));
  v85 = sqrtf(v97 - (float)(v72 * v72));
  v86 = sqrtf(v75 - (float)(v73 * v73));
  if (v80 < v30[6])
    a2[28].i32[1] = 0;
  a2[30].f32[1] = v9;
  a2[31].f32[0] = v111;
  a2[31].f32[1] = v119;
  a2[32].f32[0] = v7;
  a2[32].f32[1] = v71;
  a2[33].f32[0] = v84;
  a2[35].f32[0] = v114;
  a2[35].f32[1] = v112;
  a2[36].f32[0] = v118;
  a2[36].f32[1] = v120;
  a2[37].f32[0] = v72;
  a2[37].f32[1] = v85;
  a2[38].f32[0] = v113;
  a2[38].f32[1] = v73;
  a2[39].f32[0] = v86;
  if (v4 == 1)
  {
    v87 = *(unsigned __int8 *)v30;
    v88 = 0.0;
    if (v87 <= v6)
    {
      v89 = 0.0;
      if (*(_BYTE *)v30)
      {
        v90 = a2->u8[2];
        v91 = v30 + 1;
        v92 = v90 << 48;
        do
        {
          v93 = v92 + 0x8000000000000;
          if (v90 >= 0)
            v93 = v92;
          v94 = *v91++;
          v89 = v89 + (float)(*(float *)((char *)&a2[18].f32[1] + (v93 >> 46)) * v94);
          v92 -= 0x1000000000000;
          --v90;
          --v87;
        }
        while (v87);
      }
      if (v89 >= 0.0)
        v88 = v89;
    }
    a2[27].f32[1] = v88 * v74;
  }
  a2->i8[0] = 0;
  v95 = a2->u8[2];
  if (v95 == 7)
    v96 = 0;
  else
    v96 = v95 + 1;
  a2->i8[2] = v96;
}

float CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(float a1, uint64_t a2, float *a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned __int8 *v6;
  float v7;
  float v8;
  unsigned __int8 *v9;
  float v10;

  v3 = *(unsigned __int8 *)a3;
  if (v3 < 2)
  {
    v5 = 1;
  }
  else
  {
    v4 = 0;
    while (a3[v4 + 2] <= a1)
    {
      if (v3 - 1 == ++v4)
      {
        v5 = *(unsigned __int8 *)a3;
        goto LABEL_8;
      }
    }
    v5 = v4 + 1;
  }
LABEL_8:
  if (v5 >= (int)v3 - 1)
    v5 = v3 - 1;
  v7 = a3[1];
  v6 = (unsigned __int8 *)(a3 + 1);
  v8 = v7;
  v9 = &v6[4 * v3];
  if (*((float *)v9 - 1) < a1)
    a1 = *((float *)v9 - 1);
  if (v8 > a1)
    a1 = v8;
  v10 = (float)(a1 - *(float *)&v6[4 * v5 - 4]) / (float)(*(float *)&v6[4 * v5] - *(float *)&v6[4 * v5 - 4]);
  return (float)(*(float *)&v6[4 * v5 + 16] * v10) + (float)((float)(1.0 - v10) * *(float *)&v6[4 * v5 + 12]);
}

void CAWBAFEPhotometerAssistPenrose::calcTemproalFilterForChromaHist(CAWBAFEPhotometerAssistPenrose *this, sPhotometerAWBMetadata *a2, const unsigned int *a3, const unsigned int *a4, const unsigned __int8 *a5, int a6, unsigned int a7, unsigned int a8, float a9, float a10, unsigned __int16 a11, float *a12)
{
  float v20;
  float *v21;
  uint64_t v22;
  float v23;
  float *v24;
  float v25;
  float v26;
  BOOL v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unsigned __int16 v39;
  uint64_t v40;
  unsigned __int16 v41;
  unint64_t v42;
  unint64_t v43;
  float v44;
  float v45;
  float *v46;
  float v47;

  v20 = *a12;
  v21 = (float *)*((_QWORD *)this + 3);
  v23 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(*((float *)a2 + 56), (uint64_t)this, v21 + 18);
  v24 = (float *)*((_QWORD *)this + 2);
  v25 = (float)a11;
  v26 = v24[7];
  if (v26 > v25)
    v25 = v24[7];
  if (v26 <= (float)a8)
    v26 = (float)a8;
  v27 = v25 <= v26;
  v28 = v26 / v25;
  v29 = v25 / v26;
  if (v27)
    v29 = v28;
  v30 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v29, v22, v24 + 91);
  v33 = CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v30, v31, v21 + 27);
  if (!a6)
    goto LABEL_21;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  do
  {
    if (a7)
    {
      v40 = 0;
      v41 = v39;
      do
      {
        v32 = a5[v41];
        if (a5[v41])
        {
          v42 = a4[v41] * (unint64_t)a5[v41];
          v38 += v42 * (v40 + 1);
          v37 += v42;
          v43 = a3[v41] * (unint64_t)a5[v41];
          v36 += v43 * (v40 + 1);
          v35 += v43;
        }
        ++v41;
        v40 += 2;
      }
      while (2 * a7 != v40);
      v39 += a7;
    }
    ++v34;
  }
  while (v34 != a6);
  if (v35)
    a9 = (float)((float)v36 * 0.5) / (float)v35;
  if (v37)
  {
    v44 = (float)((float)v38 * 0.5) / (float)v37;
    if (a9 > v44)
    {
      v45 = a9 - v44;
      v46 = v21;
      goto LABEL_23;
    }
  }
  else
  {
LABEL_21:
    v44 = a9;
  }
  v46 = v21 + 9;
  v45 = v44 - a9;
LABEL_23:
  v47 = v20
      * (float)((float)(1.0 / v20)
              * (float)(v33
                      * (float)(v23 * CAWBAFEPhotometerAssistPenrose::calculateWeightFromTuningTable(v45, v32, v46))));
  if (v24[9] < v47)
    v47 = v24[9];
  *a12 = v47;
}

void useLowerLocalHistogramThreshold_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "FigCapturePlatformID soft_FigCapturePlatformIdentifier(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DeviceModel.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getFigCapturePlatformIdentifierSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;
  CGRect v4;
  CGRect v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CMCaptureLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DeviceModel.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
  CGRectContainsRect(v4, v5);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x24BDC06C8]();
}

uint64_t FigKTraceInit()
{
  return MEMORY[0x24BDC0948]();
}

uint64_t FigMetalDecRef()
{
  return MEMORY[0x24BE119E0]();
}

uint64_t FigMetalIncRef()
{
  return MEMORY[0x24BE119E8]();
}

uint64_t FigMetalIsValid()
{
  return MEMORY[0x24BE119F0]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x24BDC0960]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x24BDC09E0]();
}

uint64_t MTLPixelFormatGetInfo()
{
  return MEMORY[0x24BDDD378]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t operator delete()
{
  return off_24FEC5980();
}

uint64_t operator new()
{
  return off_24FEC5988();
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x24BDAC820]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 result;

  MEMORY[0x24BDACE10]((__n128)x, (__n128)y);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x24BDC0B20]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x24BDC0B28]();
}

uint64_t fig_note_initialize_category_with_default_work()
{
  return MEMORY[0x24BDC0B38]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int heapsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x24BDAE7E0](__base, __nel, __width, __compar);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

