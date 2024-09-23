@implementation HandsKitConfig

- (HandsKitConfig)init
{
  char *v2;
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
  void *v24;
  uint64_t v25;
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
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)HandsKitConfig;
  v2 = -[HandsKitConfig init](&v54, sel_init);
  v3 = (void *)*((_QWORD *)v2 + 99);
  *((_QWORD *)v2 + 99) = CFSTR("N_1Detection");

  *(_OWORD *)(v2 + 104) = xmmword_23D9A5D10;
  *((_DWORD *)v2 + 2) = 16842753;
  *((_DWORD *)v2 + 30) = 30;
  v4 = (void *)*((_QWORD *)v2 + 100);
  *((_QWORD *)v2 + 100) = CFSTR("SideDownPair");

  v5 = (void *)*((_QWORD *)v2 + 101);
  *((_QWORD *)v2 + 101) = CFSTR("DownCameras");

  v6 = (void *)*((_QWORD *)v2 + 98);
  *((_QWORD *)v2 + 98) = MEMORY[0x24BDBD1B8];

  v2[19] = 0;
  *((_WORD *)v2 + 48) = 0;
  *((_DWORD *)v2 + 194) = 0;
  v2[35] = 1;
  *((_DWORD *)v2 + 59) = 1056964608;
  *(_QWORD *)(v2 + 188) = 0x3F0000003F666666;
  *((_WORD *)v2 + 18) = 0;
  *((_DWORD *)v2 + 49) = 1043207291;
  *((_DWORD *)v2 + 3) = 16842753;
  v2[16] = 1;
  v7 = (void *)*((_QWORD *)v2 + 137);
  *((_QWORD *)v2 + 137) = CFSTR("ANE_CG");

  v8 = (void *)*((_QWORD *)v2 + 102);
  *((_QWORD *)v2 + 102) = CFSTR("starflow-ywthvj3wta_131167_quantized_anec_nms");

  *((_WORD *)v2 + 19) = 257;
  *((_QWORD *)v2 + 25) = 0x200000000;
  v2[48] = 0;
  v9 = (void *)*((_QWORD *)v2 + 145);
  *((_QWORD *)v2 + 145) = &unk_250E624B8;

  v10 = (void *)*((_QWORD *)v2 + 146);
  *((_QWORD *)v2 + 146) = &unk_250E624D0;

  v11 = (void *)*((_QWORD *)v2 + 138);
  *((_QWORD *)v2 + 138) = CFSTR("training.nets.blizzard.configs.release.V14p5-qm62rsuhd9_0_HP-mucbjudrzn_214841");

  v12 = (void *)*((_QWORD *)v2 + 144);
  *((_QWORD *)v2 + 144) = CFSTR("zmyfiay6tf_79560");

  v13 = (void *)*((_QWORD *)v2 + 139);
  *((_QWORD *)v2 + 139) = CFSTR("Passthrough");

  v14 = (void *)*((_QWORD *)v2 + 141);
  *((_QWORD *)v2 + 141) = &unk_250E624E8;

  v15 = (void *)*((_QWORD *)v2 + 143);
  *((_QWORD *)v2 + 143) = CFSTR("monopose_hmd_1.0");

  v16 = (void *)*((_QWORD *)v2 + 147);
  *((_QWORD *)v2 + 147) = CFSTR("Seahawks-5any3qq95y_150_conv_u8_f16");

  v2[41] = 0;
  *(_DWORD *)(v2 + 42) = 16777472;
  *((_WORD *)v2 + 23) = 1;
  v17 = (void *)*((_QWORD *)v2 + 148);
  *((_QWORD *)v2 + 148) = CFSTR("passthrough");

  *((_QWORD *)v2 + 30) = 0x3F0000003F666666;
  *((_QWORD *)v2 + 26) = 0x3C03126F3BC49BA6;
  *(_WORD *)(v2 + 49) = 257;
  v2[51] = 1;
  *(_OWORD *)(v2 + 216) = xmmword_23D9A5D20;
  *((_DWORD *)v2 + 58) = 1045220557;
  v18 = (void *)*((_QWORD *)v2 + 142);
  *((_QWORD *)v2 + 142) = CFSTR("GeometricPoseFilterShekel");

  v2[40] = 1;
  *(_QWORD *)(v2 + 180) = 0x200000001;
  v2[20] = 0;
  *((_QWORD *)v2 + 103) = 0x3FEB333333333333;
  *(_WORD *)(v2 + 21) = 1;
  *((_DWORD *)v2 + 41) = 12;
  *((_OWORD *)v2 + 52) = xmmword_23D9A5D30;
  *((_OWORD *)v2 + 53) = xmmword_23D9A5D40;
  *((_QWORD *)v2 + 108) = 0xBFF0000000000000;
  __asm { FMOV            V0.2D, #-1.0 }
  *((_OWORD *)v2 + 55) = _Q0;
  *((_OWORD *)v2 + 56) = _Q0;
  *(_OWORD *)(v2 + 132) = xmmword_23D9A5D50;
  *(_QWORD *)(v2 + 148) = 0x3C0000003CLL;
  *(_QWORD *)(v2 + 156) = 0x3C23D70A0000003CLL;
  *(_DWORD *)(v2 + 25) = 1;
  *((_OWORD *)v2 + 57) = _Q0;
  *((_OWORD *)v2 + 58) = _Q0;
  *((_OWORD *)v2 + 59) = _Q0;
  *((_QWORD *)v2 + 120) = 0xBFF0000000000000;
  *(_WORD *)(v2 + 33) = 1;
  *(_DWORD *)(v2 + 29) = 16843009;
  *((_DWORD *)v2 + 32) = 1065353216;
  *((_QWORD *)v2 + 21) = 0;
  *((_DWORD *)v2 + 44) = 1056964608;
  *((_QWORD *)v2 + 135) = 0x3FD6666666666666;
  *((_QWORD *)v2 + 136) = 0x3FA999999999999ALL;
  v2[89] = 0;
  *((int32x2_t *)v2 + 96) = vdup_n_s32(0x3A83126Fu);
  *(_DWORD *)(v2 + 91) = 0;
  *((_DWORD *)v2 + 188) = -1082130432;
  v24 = (void *)*((_QWORD *)v2 + 166);
  v25 = MEMORY[0x24BDBD1A8];
  *((_QWORD *)v2 + 166) = MEMORY[0x24BDBD1A8];

  v2[90] = 1;
  *((_DWORD *)v2 + 189) = 2;
  *((_QWORD *)v2 + 95) = 0x1600000015;
  *(_WORD *)(v2 + 17) = 256;
  *((_DWORD *)v2 + 31) = 0;
  v2[95] = 0;
  *(_DWORD *)(v2 + 98) = 1;
  v2[102] = 0;
  v26 = (void *)*((_QWORD *)v2 + 167);
  *((_QWORD *)v2 + 167) = v25;

  v2[103] = 1;
  v27 = (void *)*((_QWORD *)v2 + 140);
  *((_QWORD *)v2 + 140) = 0;

  *(_DWORD *)(v2 + 55) = 65793;
  *(_OWORD *)(v2 + 380) = xmmword_23D9A5D60;
  *(_OWORD *)(v2 + 396) = xmmword_23D9A5D70;
  *(_OWORD *)(v2 + 412) = xmmword_23D9A5D80;
  *((_DWORD *)v2 + 107) = 3;
  *((_OWORD *)v2 + 27) = xmmword_23D9A5D90;
  *((_QWORD *)v2 + 56) = 0x1E00000005;
  *(_WORD *)(v2 + 59) = 1;
  *(_OWORD *)(v2 + 456) = xmmword_23D9A5DA0;
  *(_OWORD *)(v2 + 472) = xmmword_23D9A5DB0;
  *((_QWORD *)v2 + 61) = 0x41F000003CF5C28FLL;
  *((_WORD *)v2 + 26) = 1;
  v2[54] = 1;
  *((_DWORD *)v2 + 62) = 2;
  *((_DWORD *)v2 + 127) = 3;
  *(_OWORD *)(v2 + 252) = xmmword_23D9A5DC0;
  *(_OWORD *)(v2 + 268) = xmmword_23D9A5DD0;
  *(_OWORD *)(v2 + 284) = xmmword_23D9A5DE0;
  *(_OWORD *)(v2 + 300) = xmmword_23D9A5DF0;
  *((_OWORD *)v2 + 20) = xmmword_23D9A5E00;
  *((_DWORD *)v2 + 84) = 1036831949;
  v28 = (void *)*((_QWORD *)v2 + 149);
  *((_QWORD *)v2 + 149) = &unk_250E62500;

  *(_OWORD *)(v2 + 360) = xmmword_23D9A5E10;
  *((_DWORD *)v2 + 94) = 1061158912;
  *((_DWORD *)v2 + 85) = 60;
  *(_OWORD *)(v2 + 344) = xmmword_23D9A5E20;
  v2[61] = 0;
  *(_DWORD *)(v2 + 63) = 16843009;
  *(_WORD *)(v2 + 67) = 257;
  v29 = (void *)*((_QWORD *)v2 + 150);
  *((_QWORD *)v2 + 150) = CFSTR("cancellation_LSTM_v1.10.62");

  v30 = (void *)*((_QWORD *)v2 + 151);
  *((_QWORD *)v2 + 151) = &unk_250E62518;

  v31 = (void *)*((_QWORD *)v2 + 152);
  *((_QWORD *)v2 + 152) = &unk_250E62530;

  *((_DWORD *)v2 + 124) = 1022739087;
  *((_QWORD *)v2 + 64) = 0x3C23D70A3CA3D70ALL;
  *((_DWORD *)v2 + 130) = 3;
  *(_QWORD *)(v2 + 524) = 0x3E99999A3E0F5C29;
  *((_DWORD *)v2 + 134) = 1017370378;
  v32 = (void *)*((_QWORD *)v2 + 153);
  *((_QWORD *)v2 + 153) = CFSTR("intention_LSTM_v5_c4vgs4246t.10.76");

  *(_DWORD *)(v2 + 69) = 65537;
  *(_WORD *)(v2 + 73) = 257;
  *((_DWORD *)v2 + 139) = 1028443341;
  *(_OWORD *)(v2 + 540) = xmmword_23D9A5E30;
  v2[75] = 0;
  v33 = (void *)*((_QWORD *)v2 + 154);
  *((_QWORD *)v2 + 154) = &unk_250E62548;

  v34 = (void *)*((_QWORD *)v2 + 155);
  *((_QWORD *)v2 + 155) = &unk_250E62560;

  *((_QWORD *)v2 + 70) = 0x4020000041700000;
  *((_DWORD *)v2 + 142) = 1022739087;
  v35 = (void *)*((_QWORD *)v2 + 156);
  *((_QWORD *)v2 + 156) = &unk_250E62578;

  *((_WORD *)v2 + 38) = 1;
  *(_OWORD *)(v2 + 580) = xmmword_23D9A5E40;
  *((_DWORD *)v2 + 149) = 0;
  *((_QWORD *)v2 + 75) = 0x3E8000003F000000;
  v2[78] = 1;
  *((_QWORD *)v2 + 76) = 0x3E4CCCCD00000003;
  *((_QWORD *)v2 + 77) = 0x3E4CCCCD3D4CCCCDLL;
  v36 = (void *)*((_QWORD *)v2 + 157);
  *((_QWORD *)v2 + 157) = &unk_250E62590;

  v37 = (void *)*((_QWORD *)v2 + 158);
  *((_QWORD *)v2 + 158) = &unk_250E625A8;

  *((_QWORD *)v2 + 82) = 0xF3DCCCCCDLL;
  *((_QWORD *)v2 + 85) = 0x40A0000042700000;
  *((_QWORD *)v2 + 86) = 0x23D4CCCCDLL;
  *(_OWORD *)(v2 + 664) = xmmword_23D9A5E50;
  *((_QWORD *)v2 + 87) = 0x3DCCCCCD3ECCCCCDLL;
  *((_DWORD *)v2 + 176) = 1065353216;
  *(_DWORD *)(v2 + 81) = 65792;
  *((_QWORD *)v2 + 78) = 0x3F0000003F000000;
  *((_QWORD *)v2 + 79) = 0x300000002;
  *((_QWORD *)v2 + 80) = 0x3C75C28F3CA3D70ALL;
  *((_QWORD *)v2 + 81) = 0x3C23D70A3D75C28FLL;
  *(_WORD *)(v2 + 79) = 257;
  v38 = (void *)*((_QWORD *)v2 + 159);
  *((_QWORD *)v2 + 159) = &unk_250E625C0;

  v39 = (void *)*((_QWORD *)v2 + 160);
  *((_QWORD *)v2 + 160) = &unk_250E625D8;

  v40 = (void *)*((_QWORD *)v2 + 161);
  *((_QWORD *)v2 + 161) = &unk_250E625F0;

  v41 = (void *)*((_QWORD *)v2 + 162);
  *((_QWORD *)v2 + 162) = &unk_250E62608;

  *(_WORD *)(v2 + 85) = 257;
  *(_QWORD *)(v2 + 708) = 0x3CA3D70A3ECCCCCDLL;
  v42 = (void *)*((_QWORD *)v2 + 163);
  *((_QWORD *)v2 + 163) = CFSTR("cancellation_LSTM_v4_jxshmtrt8d.10.76");

  *(_QWORD *)(v2 + 500) = 0x23DB851ECLL;
  *(_WORD *)(v2 + 87) = 256;
  *(_QWORD *)(v2 + 716) = 0x3C75C28F0000000FLL;
  *((_DWORD *)v2 + 181) = 2;
  *(_OWORD *)(v2 + 728) = xmmword_23D9A5E60;
  *((_QWORD *)v2 + 93) = 0x3F19999A3ECCCCCDLL;
  *((_OWORD *)v2 + 82) = xmmword_23D9A5E70;
  v43 = (void *)*((_QWORD *)v2 + 121);
  *((_QWORD *)v2 + 121) = &unk_250E62620;

  v44 = (void *)*((_QWORD *)v2 + 122);
  *((_QWORD *)v2 + 122) = &unk_250E62638;

  v45 = (void *)*((_QWORD *)v2 + 123);
  *((_QWORD *)v2 + 123) = &unk_250E62650;

  v46 = (void *)*((_QWORD *)v2 + 124);
  *((_QWORD *)v2 + 124) = &unk_250E62668;

  v47 = (void *)*((_QWORD *)v2 + 125);
  *((_QWORD *)v2 + 125) = &unk_250E62680;

  v48 = (void *)*((_QWORD *)v2 + 126);
  *((_QWORD *)v2 + 126) = &unk_250E62698;

  v49 = (void *)*((_QWORD *)v2 + 127);
  *((_QWORD *)v2 + 127) = &unk_250E626B0;

  v50 = (void *)*((_QWORD *)v2 + 128);
  *((_QWORD *)v2 + 128) = &unk_250E626C8;

  *(_WORD *)(v2 + 23) = 257;
  *((_QWORD *)v2 + 129) = 0x3FD3333333333333;
  *((_OWORD *)v2 + 65) = xmmword_23D9A5E80;
  *((_QWORD *)v2 + 134) = 0x3FA999999999999ALL;
  v51 = (void *)*((_QWORD *)v2 + 132);
  *((_QWORD *)v2 + 132) = &unk_250E626E0;

  v52 = (void *)*((_QWORD *)v2 + 133);
  *((_QWORD *)v2 + 133) = &unk_250E626F8;

  return (HandsKitConfig *)v2;
}

- (BOOL)Enable640Mode
{
  return self->_UseBinned640Streams || self->_Enable640Mode;
}

- (NSString)UberPoseModel
{
  NSString *UberPoseModel;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  UberPoseModel = self->_UberPoseModel;
  if (UberPoseModel)
  {
    v3 = UberPoseModel;
  }
  else
  {
    -[HandsKitConfig PoseModel](self, "PoseModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("_pose_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HandsKitConfig PinchModel](self, "PinchModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_action_with_processing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingString:", CFSTR("_ane_warper"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HandsKitConfig)initWithJSONString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HandsKitConfig *v11;
  HandsKitConfig *v12;
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v8, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", CFSTR("Invalid json string"), CFSTR("%@ String content: <start>%@<end>"), v10, v4);

  }
  if (v7)
    v11 = -[HandsKitConfig initWithDictionary:](self, "initWithDictionary:", v7);
  else
    v11 = -[HandsKitConfig init](self, "init");
  v12 = v11;

  return v12;
}

- (HandsKitConfig)initWithDictionary:(id)a3
{
  id v4;
  HandsKitConfig *v5;
  HandsKitConfig *v6;

  v4 = a3;
  v5 = -[HandsKitConfig init](self, "init");
  -[HandsKitConfig updateWithDictionary:](v5, "updateWithDictionary:", v4);
  v6 = (HandsKitConfig *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateWithDictionary:(id)a3
{
  -[HandsKitConfig setValuesForKeysWithDictionary:](self, "setValuesForKeysWithDictionary:", a3);
  return self;
}

- (id)updateWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v8, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", CFSTR("Invalid json string"), CFSTR("%@ String content: <start>%@<end>"), v10, v4);

  }
  if (v7)
    v11 = -[HandsKitConfig updateWithDictionary:](self, "updateWithDictionary:", v7);

  return self;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HandsKitConfig *v4;
  HandsKitConfig *v5;
  objc_class *v6;
  objc_property_t *v7;
  unint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  unsigned int outCount;

  v4 = (HandsKitConfig *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      outCount = 0;
      v6 = (objc_class *)objc_opt_class();
      v7 = class_copyPropertyList(v6, &outCount);
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", property_getName(v7[i]));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HandsKitConfig valueForKey:](self, "valueForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HandsKitConfig valueForKey:](v5, "valueForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

          if ((v12 & 1) == 0)
            break;
        }
      }
      else
      {
        v12 = 1;
      }
      free(v7);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)build
{
  id v3;
  objc_class *v4;
  objc_property_t *v5;
  unint64_t i;
  void *v7;
  void *v8;
  unsigned int outCount;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  outCount = 0;
  v4 = (objc_class *)objc_opt_class();
  v5 = class_copyPropertyList(v4, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", property_getName(v5[i]));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HandsKitConfig valueForKey:](self, "valueForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v7);

    }
  }
  free(v5);
  return v3;
}

+ (id)getPropertyArray
{
  id v2;
  objc_class *v3;
  objc_property_t *v4;
  unint64_t i;
  void *v6;
  unsigned int outCount;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyPropertyList(v3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", property_getName(v4[i]));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
  }
  free(v4);
  return v2;
}

- (NSDictionary)InputStreamKeyToSource
{
  return (NSDictionary *)objc_getProperty(self, a2, 784, 1);
}

- (void)setInputStreamKeyToSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (unsigned)ThreadSize
{
  return self->_ThreadSize;
}

- (void)setThreadSize:(unsigned int)a3
{
  self->_ThreadSize = a3;
}

- (unsigned)DetectionGraphDeadline
{
  return self->_DetectionGraphDeadline;
}

- (void)setDetectionGraphDeadline:(unsigned int)a3
{
  self->_DetectionGraphDeadline = a3;
}

- (unsigned)PoseGraphDeadline
{
  return self->_PoseGraphDeadline;
}

- (void)setPoseGraphDeadline:(unsigned int)a3
{
  self->_PoseGraphDeadline = a3;
}

- (unsigned)SegmentationProcessingDeadline
{
  return self->_SegmentationProcessingDeadline;
}

- (void)setSegmentationProcessingDeadline:(unsigned int)a3
{
  self->_SegmentationProcessingDeadline = a3;
}

- (NSString)HandsGraphType
{
  return (NSString *)objc_getProperty(self, a2, 792, 1);
}

- (void)setHandsGraphType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (BOOL)EnableInfieldCalibration
{
  return self->_EnableInfieldCalibration;
}

- (void)setEnableInfieldCalibration:(BOOL)a3
{
  self->_EnableInfieldCalibration = a3;
}

- (BOOL)ARKitReplayMode
{
  return self->_ARKitReplayMode;
}

- (void)setARKitReplayMode:(BOOL)a3
{
  self->_ARKitReplayMode = a3;
}

- (BOOL)UseWorldPoseInput
{
  return self->_UseWorldPoseInput;
}

- (void)setUseWorldPoseInput:(BOOL)a3
{
  self->_UseWorldPoseInput = a3;
}

- (BOOL)UsePolarisWarperMesh
{
  return self->_UsePolarisWarperMesh;
}

- (void)setUsePolarisWarperMesh:(BOOL)a3
{
  self->_UsePolarisWarperMesh = a3;
}

- (unsigned)FrameRate
{
  return self->_FrameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_FrameRate = a3;
}

- (NSString)InputImageStreams
{
  return (NSString *)objc_getProperty(self, a2, 800, 1);
}

- (void)setInputImageStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (NSString)DetectionInputImageStreams
{
  return (NSString *)objc_getProperty(self, a2, 808, 1);
}

- (void)setDetectionInputImageStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (void)setEnable640Mode:(BOOL)a3
{
  self->_Enable640Mode = a3;
}

- (BOOL)UseBinned640Streams
{
  return self->_UseBinned640Streams;
}

- (void)setUseBinned640Streams:(BOOL)a3
{
  self->_UseBinned640Streams = a3;
}

- (BOOL)EnablePrewiring
{
  return self->_EnablePrewiring;
}

- (void)setEnablePrewiring:(BOOL)a3
{
  self->_EnablePrewiring = a3;
}

- (BOOL)EnablePosePrewiring
{
  return self->_EnablePosePrewiring;
}

- (void)setEnablePosePrewiring:(BOOL)a3
{
  self->_EnablePosePrewiring = a3;
}

- (BOOL)UseUnwarpedFrameForPose
{
  return self->_UseUnwarpedFrameForPose;
}

- (void)setUseUnwarpedFrameForPose:(BOOL)a3
{
  self->_UseUnwarpedFrameForPose = a3;
}

- (BOOL)SerializeMesh
{
  return self->_SerializeMesh;
}

- (void)setSerializeMesh:(BOOL)a3
{
  self->_SerializeMesh = a3;
}

- (int)DisabledHand
{
  return self->_DisabledHand;
}

- (void)setDisabledHand:(int)a3
{
  self->_DisabledHand = a3;
}

- (BOOL)AllowInternalModel
{
  return self->_AllowInternalModel;
}

- (void)setAllowInternalModel:(BOOL)a3
{
  self->_AllowInternalModel = a3;
}

- (BOOL)EncodeInputImageJpeg
{
  return self->_EncodeInputImageJpeg;
}

- (void)setEncodeInputImageJpeg:(BOOL)a3
{
  self->_EncodeInputImageJpeg = a3;
}

- (NSString)MonoDetectionModel
{
  return (NSString *)objc_getProperty(self, a2, 816, 1);
}

- (void)setMonoDetectionModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (float)FilterDetectedHandsByDistanceThresh
{
  return self->_FilterDetectedHandsByDistanceThresh;
}

- (void)setFilterDetectedHandsByDistanceThresh:(float)a3
{
  self->_FilterDetectedHandsByDistanceThresh = a3;
}

- (int)SchedulerInterval
{
  return self->_SchedulerInterval;
}

- (void)setSchedulerInterval:(int)a3
{
  self->_SchedulerInterval = a3;
}

- (BOOL)EnableSkipPose
{
  return self->_EnableSkipPose;
}

- (void)setEnableSkipPose:(BOOL)a3
{
  self->_EnableSkipPose = a3;
}

- (double)EstimatedBboxVisibilitySaturation
{
  return self->_EstimatedBboxVisibilitySaturation;
}

- (void)setEstimatedBboxVisibilitySaturation:(double)a3
{
  self->_EstimatedBboxVisibilitySaturation = a3;
}

- (double)HandCenterAngleDeadzone
{
  return self->_HandCenterAngleDeadzone;
}

- (void)setHandCenterAngleDeadzone:(double)a3
{
  self->_HandCenterAngleDeadzone = a3;
}

- (double)HandCenterAngleGrayzone
{
  return self->_HandCenterAngleGrayzone;
}

- (void)setHandCenterAngleGrayzone:(double)a3
{
  self->_HandCenterAngleGrayzone = a3;
}

- (BOOL)EnableCameraSelectionHysteresis
{
  return self->_EnableCameraSelectionHysteresis;
}

- (void)setEnableCameraSelectionHysteresis:(BOOL)a3
{
  self->_EnableCameraSelectionHysteresis = a3;
}

- (double)HandCenterAngleGrayzoneReductionFactor
{
  return self->_HandCenterAngleGrayzoneReductionFactor;
}

- (void)setHandCenterAngleGrayzoneReductionFactor:(double)a3
{
  self->_HandCenterAngleGrayzoneReductionFactor = a3;
}

- (double)RequiresAssociationHandPresenceThresholdOverride
{
  return self->_RequiresAssociationHandPresenceThresholdOverride;
}

- (void)setRequiresAssociationHandPresenceThresholdOverride:(double)a3
{
  self->_RequiresAssociationHandPresenceThresholdOverride = a3;
}

- (double)ChiralityLeftHandPresenceThresholdOverride
{
  return self->_ChiralityLeftHandPresenceThresholdOverride;
}

- (void)setChiralityLeftHandPresenceThresholdOverride:(double)a3
{
  self->_ChiralityLeftHandPresenceThresholdOverride = a3;
}

- (double)ChiralityRightHandPresenceThresholdOverride
{
  return self->_ChiralityRightHandPresenceThresholdOverride;
}

- (void)setChiralityRightHandPresenceThresholdOverride:(double)a3
{
  self->_ChiralityRightHandPresenceThresholdOverride = a3;
}

- (double)ObjectInteractionGeneralMakeThresholdOverride
{
  return self->_ObjectInteractionGeneralMakeThresholdOverride;
}

- (void)setObjectInteractionGeneralMakeThresholdOverride:(double)a3
{
  self->_ObjectInteractionGeneralMakeThresholdOverride = a3;
}

- (double)ObjectInteractionGeneralBreakThresholdOverride
{
  return self->_ObjectInteractionGeneralBreakThresholdOverride;
}

- (void)setObjectInteractionGeneralBreakThresholdOverride:(double)a3
{
  self->_ObjectInteractionGeneralBreakThresholdOverride = a3;
}

- (double)ObjectInteractionPencilMakeThresholdOverride
{
  return self->_ObjectInteractionPencilMakeThresholdOverride;
}

- (void)setObjectInteractionPencilMakeThresholdOverride:(double)a3
{
  self->_ObjectInteractionPencilMakeThresholdOverride = a3;
}

- (double)ObjectInteractionPencilBreakThresholdOverride
{
  return self->_ObjectInteractionPencilBreakThresholdOverride;
}

- (void)setObjectInteractionPencilBreakThresholdOverride:(double)a3
{
  self->_ObjectInteractionPencilBreakThresholdOverride = a3;
}

- (int)ObjectInteractionGeneralNumFramesBreakDelay
{
  return self->_ObjectInteractionGeneralNumFramesBreakDelay;
}

- (void)setObjectInteractionGeneralNumFramesBreakDelay:(int)a3
{
  self->_ObjectInteractionGeneralNumFramesBreakDelay = a3;
}

- (int)ObjectInteractionPencilNumFramesBreakDelay
{
  return self->_ObjectInteractionPencilNumFramesBreakDelay;
}

- (void)setObjectInteractionPencilNumFramesBreakDelay:(int)a3
{
  self->_ObjectInteractionPencilNumFramesBreakDelay = a3;
}

- (int)ObjectInteractionGeneralNumFramesToEnableBreakDelay
{
  return self->_ObjectInteractionGeneralNumFramesToEnableBreakDelay;
}

- (void)setObjectInteractionGeneralNumFramesToEnableBreakDelay:(int)a3
{
  self->_ObjectInteractionGeneralNumFramesToEnableBreakDelay = a3;
}

- (int)ObjectInteractionPencilNumFramesToEnableBreakDelay
{
  return self->_ObjectInteractionPencilNumFramesToEnableBreakDelay;
}

- (void)setObjectInteractionPencilNumFramesToEnableBreakDelay:(int)a3
{
  self->_ObjectInteractionPencilNumFramesToEnableBreakDelay = a3;
}

- (int)ObjectInteractionGeneralNumFramesToLockHighConfidence
{
  return self->_ObjectInteractionGeneralNumFramesToLockHighConfidence;
}

- (void)setObjectInteractionGeneralNumFramesToLockHighConfidence:(int)a3
{
  self->_ObjectInteractionGeneralNumFramesToLockHighConfidence = a3;
}

- (int)ObjectInteractionPencilNumFramesToLockHighConfidence
{
  return self->_ObjectInteractionPencilNumFramesToLockHighConfidence;
}

- (void)setObjectInteractionPencilNumFramesToLockHighConfidence:(int)a3
{
  self->_ObjectInteractionPencilNumFramesToLockHighConfidence = a3;
}

- (double)JointsObjectOcclusionThresholdOverride
{
  return self->_JointsObjectOcclusionThresholdOverride;
}

- (void)setJointsObjectOcclusionThresholdOverride:(double)a3
{
  self->_JointsObjectOcclusionThresholdOverride = a3;
}

- (double)DetectionConfidenceThresholdOverride
{
  return self->_DetectionConfidenceThresholdOverride;
}

- (void)setDetectionConfidenceThresholdOverride:(double)a3
{
  self->_DetectionConfidenceThresholdOverride = a3;
}

- (double)DetectionLowerConfidenceThresholdOverride
{
  return self->_DetectionLowerConfidenceThresholdOverride;
}

- (void)setDetectionLowerConfidenceThresholdOverride:(double)a3
{
  self->_DetectionLowerConfidenceThresholdOverride = a3;
}

- (double)DetectionChiralityThresholdOverride
{
  return self->_DetectionChiralityThresholdOverride;
}

- (void)setDetectionChiralityThresholdOverride:(double)a3
{
  self->_DetectionChiralityThresholdOverride = a3;
}

- (double)DetectionUvOThresholdOverride
{
  return self->_DetectionUvOThresholdOverride;
}

- (void)setDetectionUvOThresholdOverride:(double)a3
{
  self->_DetectionUvOThresholdOverride = a3;
}

- (double)DetectionAvgBoneLengthOverride
{
  return self->_DetectionAvgBoneLengthOverride;
}

- (void)setDetectionAvgBoneLengthOverride:(double)a3
{
  self->_DetectionAvgBoneLengthOverride = a3;
}

- (double)DetectionDepthNormalizationFactorOverride
{
  return self->_DetectionDepthNormalizationFactorOverride;
}

- (void)setDetectionDepthNormalizationFactorOverride:(double)a3
{
  self->_DetectionDepthNormalizationFactorOverride = a3;
}

- (BOOL)UseAvgBoneLengthFromPose
{
  return self->_UseAvgBoneLengthFromPose;
}

- (void)setUseAvgBoneLengthFromPose:(BOOL)a3
{
  self->_UseAvgBoneLengthFromPose = a3;
}

- (float)MaxUncertaintyForFetchBoneLength
{
  return self->_MaxUncertaintyForFetchBoneLength;
}

- (void)setMaxUncertaintyForFetchBoneLength:(float)a3
{
  self->_MaxUncertaintyForFetchBoneLength = a3;
}

- (int)NumCachedPoseForBoneLength
{
  return self->_NumCachedPoseForBoneLength;
}

- (void)setNumCachedPoseForBoneLength:(int)a3
{
  self->_NumCachedPoseForBoneLength = a3;
}

- (NSArray)DDFOVNoiseValues
{
  return (NSArray *)objc_getProperty(self, a2, 968, 1);
}

- (void)setDDFOVNoiseValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (NSArray)DDFOVDistances
{
  return (NSArray *)objc_getProperty(self, a2, 976, 1);
}

- (void)setDDFOVDistances:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSArray)DSFOVNoiseValues
{
  return (NSArray *)objc_getProperty(self, a2, 984, 1);
}

- (void)setDSFOVNoiseValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (NSArray)DSFOVDistances
{
  return (NSArray *)objc_getProperty(self, a2, 992, 1);
}

- (void)setDSFOVDistances:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSArray)SDFOVNoiseValues
{
  return (NSArray *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setSDFOVNoiseValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (NSArray)SDFOVDistances
{
  return (NSArray *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setSDFOVDistances:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSArray)FOV2dCircles
{
  return (NSArray *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setFOV2dCircles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (NSArray)Noise2Ths
{
  return (NSArray *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setNoise2Ths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (double)TrackingHealthDriftAveragingFactor
{
  return self->_TrackingHealthDriftAveragingFactor;
}

- (void)setTrackingHealthDriftAveragingFactor:(double)a3
{
  self->_TrackingHealthDriftAveragingFactor = a3;
}

- (double)TrackingHealthGhostHandAveragingFactor
{
  return self->_TrackingHealthGhostHandAveragingFactor;
}

- (void)setTrackingHealthGhostHandAveragingFactor:(double)a3
{
  self->_TrackingHealthGhostHandAveragingFactor = a3;
}

- (double)TrackingHealthSpeedAveragingFactor
{
  return self->_TrackingHealthSpeedAveragingFactor;
}

- (void)setTrackingHealthSpeedAveragingFactor:(double)a3
{
  self->_TrackingHealthSpeedAveragingFactor = a3;
}

- (BOOL)ThsFroceFovContinuity
{
  return self->_ThsFroceFovContinuity;
}

- (void)setThsFroceFovContinuity:(BOOL)a3
{
  self->_ThsFroceFovContinuity = a3;
}

- (NSArray)PredictionErroLutForSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPredictionErroLutForSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSArray)AvgVelocityLutForSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setAvgVelocityLutForSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (BOOL)TrackingHealthScoreEnableFovHysDis
{
  return self->_TrackingHealthScoreEnableFovHysDis;
}

- (void)setTrackingHealthScoreEnableFovHysDis:(BOOL)a3
{
  self->_TrackingHealthScoreEnableFovHysDis = a3;
}

- (double)TrackingHealthScoreFovHysDis
{
  return self->_TrackingHealthScoreFovHysDis;
}

- (void)setTrackingHealthScoreFovHysDis:(double)a3
{
  self->_TrackingHealthScoreFovHysDis = a3;
}

- (BOOL)ObjectInteractionGeneralRequireConfidenceForBlockingAction
{
  return self->_ObjectInteractionGeneralRequireConfidenceForBlockingAction;
}

- (void)setObjectInteractionGeneralRequireConfidenceForBlockingAction:(BOOL)a3
{
  self->_ObjectInteractionGeneralRequireConfidenceForBlockingAction = a3;
}

- (BOOL)ObjectInteractionPencilRequireConfidenceForBlockingAction
{
  return self->_ObjectInteractionPencilRequireConfidenceForBlockingAction;
}

- (void)setObjectInteractionPencilRequireConfidenceForBlockingAction:(BOOL)a3
{
  self->_ObjectInteractionPencilRequireConfidenceForBlockingAction = a3;
}

- (BOOL)EnableObjectInteractionForActionForGeneralObject
{
  return self->_EnableObjectInteractionForActionForGeneralObject;
}

- (void)setEnableObjectInteractionForActionForGeneralObject:(BOOL)a3
{
  self->_EnableObjectInteractionForActionForGeneralObject = a3;
}

- (BOOL)EnableObjectInteractionForActionForPencilObject
{
  return self->_EnableObjectInteractionForActionForPencilObject;
}

- (void)setEnableObjectInteractionForActionForPencilObject:(BOOL)a3
{
  self->_EnableObjectInteractionForActionForPencilObject = a3;
}

- (BOOL)EnableOverlappingHandsFilter
{
  return self->_EnableOverlappingHandsFilter;
}

- (void)setEnableOverlappingHandsFilter:(BOOL)a3
{
  self->_EnableOverlappingHandsFilter = a3;
}

- (BOOL)EnableTwoHandsOcclussionFilter
{
  return self->_EnableTwoHandsOcclussionFilter;
}

- (void)setEnableTwoHandsOcclussionFilter:(BOOL)a3
{
  self->_EnableTwoHandsOcclussionFilter = a3;
}

- (BOOL)EnableTwoHandsOcclusionSuppressor
{
  return self->_EnableTwoHandsOcclusionSuppressor;
}

- (void)setEnableTwoHandsOcclusionSuppressor:(BOOL)a3
{
  self->_EnableTwoHandsOcclusionSuppressor = a3;
}

- (BOOL)EnableTwoHandsOcclusionOnlyForNonDoubleTrackedHands
{
  return self->_EnableTwoHandsOcclusionOnlyForNonDoubleTrackedHands;
}

- (void)setEnableTwoHandsOcclusionOnlyForNonDoubleTrackedHands:(BOOL)a3
{
  self->_EnableTwoHandsOcclusionOnlyForNonDoubleTrackedHands = a3;
}

- (BOOL)EnableDoubleTrackerFilter
{
  return self->_EnableDoubleTrackerFilter;
}

- (void)setEnableDoubleTrackerFilter:(BOOL)a3
{
  self->_EnableDoubleTrackerFilter = a3;
}

- (BOOL)UvOEnableForceDcamRotation
{
  return self->_UvOEnableForceDcamRotation;
}

- (void)setUvOEnableForceDcamRotation:(BOOL)a3
{
  self->_UvOEnableForceDcamRotation = a3;
}

- (int)UvODcamLeftRotation
{
  return self->_UvODcamLeftRotation;
}

- (void)setUvODcamLeftRotation:(int)a3
{
  self->_UvODcamLeftRotation = a3;
}

- (int)UvODcamRightRotation
{
  return self->_UvODcamRightRotation;
}

- (void)setUvODcamRightRotation:(int)a3
{
  self->_UvODcamRightRotation = a3;
}

- (float)VisibilityThresholdOfROI
{
  return self->_VisibilityThresholdOfROI;
}

- (void)setVisibilityThresholdOfROI:(float)a3
{
  self->_VisibilityThresholdOfROI = a3;
}

- (double)PoseSchedulerBboxVisibilityRequirement
{
  return self->_PoseSchedulerBboxVisibilityRequirement;
}

- (void)setPoseSchedulerBboxVisibilityRequirement:(double)a3
{
  self->_PoseSchedulerBboxVisibilityRequirement = a3;
}

- (double)PoseSchedulerBboxVisibilityTolerance
{
  return self->_PoseSchedulerBboxVisibilityTolerance;
}

- (void)setPoseSchedulerBboxVisibilityTolerance:(double)a3
{
  self->_PoseSchedulerBboxVisibilityTolerance = a3;
}

- (int)SchedulerIntervalZeroHand
{
  return self->_SchedulerIntervalZeroHand;
}

- (void)setSchedulerIntervalZeroHand:(int)a3
{
  self->_SchedulerIntervalZeroHand = a3;
}

- (int)SchedulerIntervalOneHand
{
  return self->_SchedulerIntervalOneHand;
}

- (void)setSchedulerIntervalOneHand:(int)a3
{
  self->_SchedulerIntervalOneHand = a3;
}

- (BOOL)EnableCameraPairTransitionCorrection
{
  return self->_EnableCameraPairTransitionCorrection;
}

- (void)setEnableCameraPairTransitionCorrection:(BOOL)a3
{
  self->_EnableCameraPairTransitionCorrection = a3;
}

- (float)RigidTransformJointVisibilityThreshold
{
  return self->_RigidTransformJointVisibilityThreshold;
}

- (void)setRigidTransformJointVisibilityThreshold:(float)a3
{
  self->_RigidTransformJointVisibilityThreshold = a3;
}

- (BOOL)EnableGracefulFailureCloseToHMD
{
  return self->_EnableGracefulFailureCloseToHMD;
}

- (void)setEnableGracefulFailureCloseToHMD:(BOOL)a3
{
  self->_EnableGracefulFailureCloseToHMD = a3;
}

- (BOOL)EnableGracefulFailureHandOutOfFOV
{
  return self->_EnableGracefulFailureHandOutOfFOV;
}

- (void)setEnableGracefulFailureHandOutOfFOV:(BOOL)a3
{
  self->_EnableGracefulFailureHandOutOfFOV = a3;
}

- (float)OOEVisibilityThreshold
{
  return self->_OOEVisibilityThreshold;
}

- (void)setOOEVisibilityThreshold:(float)a3
{
  self->_OOEVisibilityThreshold = a3;
}

- (float)OOEDistanceThreshold
{
  return self->_OOEDistanceThreshold;
}

- (void)setOOEDistanceThreshold:(float)a3
{
  self->_OOEDistanceThreshold = a3;
}

- (NSString)PoseCropMode
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setPoseCropMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (NSString)PoseModel
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setPoseModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSString)HandPresenceModel
{
  return (NSString *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setHandPresenceModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (void)setUberPoseModel:(id)a3
{
  objc_storeStrong((id *)&self->_UberPoseModel, a3);
}

- (NSArray)HandPresenceOutputSelection
{
  return (NSArray *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setHandPresenceOutputSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (int)PosePipelineType
{
  return self->_PosePipelineType;
}

- (void)setPosePipelineType:(int)a3
{
  self->_PosePipelineType = a3;
}

- (BOOL)PerformJointAngleValidation
{
  return self->_PerformJointAngleValidation;
}

- (void)setPerformJointAngleValidation:(BOOL)a3
{
  self->_PerformJointAngleValidation = a3;
}

- (unsigned)AllowedNumberOfInvalidJointAngles
{
  return self->_AllowedNumberOfInvalidJointAngles;
}

- (void)setAllowedNumberOfInvalidJointAngles:(unsigned int)a3
{
  self->_AllowedNumberOfInvalidJointAngles = a3;
}

- (NSString)PoseFilter
{
  return (NSString *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setPoseFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (BOOL)EnableMissingFinger
{
  return self->_EnableMissingFinger;
}

- (void)setEnableMissingFinger:(BOOL)a3
{
  self->_EnableMissingFinger = a3;
}

- (BOOL)FilterInWorldCoordinates
{
  return self->_FilterInWorldCoordinates;
}

- (void)setFilterInWorldCoordinates:(BOOL)a3
{
  self->_FilterInWorldCoordinates = a3;
}

- (NSString)MonoPoseModel
{
  return (NSString *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setMonoPoseModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (BOOL)UseMonoActionModel
{
  return self->_UseMonoActionModel;
}

- (void)setUseMonoActionModel:(BOOL)a3
{
  self->_UseMonoActionModel = a3;
}

- (BOOL)UseMonoUnsure
{
  return self->_UseMonoUnsure;
}

- (void)setUseMonoUnsure:(BOOL)a3
{
  self->_UseMonoUnsure = a3;
}

- (BOOL)UseKalmanFiltering
{
  return self->_UseKalmanFiltering;
}

- (void)setUseKalmanFiltering:(BOOL)a3
{
  self->_UseKalmanFiltering = a3;
}

- (BOOL)MonoDD
{
  return self->_MonoDD;
}

- (void)setMonoDD:(BOOL)a3
{
  self->_MonoDD = a3;
}

- (BOOL)UseMonoOnlineEnrollment
{
  return self->_UseMonoOnlineEnrollment;
}

- (void)setUseMonoOnlineEnrollment:(BOOL)a3
{
  self->_UseMonoOnlineEnrollment = a3;
}

- (BOOL)OutputRawPose
{
  return self->_OutputRawPose;
}

- (void)setOutputRawPose:(BOOL)a3
{
  self->_OutputRawPose = a3;
}

- (BOOL)UseUberMono
{
  return self->_UseUberMono;
}

- (void)setUseUberMono:(BOOL)a3
{
  self->_UseUberMono = a3;
}

- (float)WristStdDevLowerThreshold
{
  return self->_WristStdDevLowerThreshold;
}

- (void)setWristStdDevLowerThreshold:(float)a3
{
  self->_WristStdDevLowerThreshold = a3;
}

- (float)WristStdDevUpperThreshold
{
  return self->_WristStdDevUpperThreshold;
}

- (void)setWristStdDevUpperThreshold:(float)a3
{
  self->_WristStdDevUpperThreshold = a3;
}

- (NSString)PinchModel
{
  return (NSString *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setPinchModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (BOOL)UsePinchThresholdsSearch
{
  return self->_UsePinchThresholdsSearch;
}

- (void)setUsePinchThresholdsSearch:(BOOL)a3
{
  self->_UsePinchThresholdsSearch = a3;
}

- (BOOL)EnableUnsurePinchFilters
{
  return self->_EnableUnsurePinchFilters;
}

- (void)setEnableUnsurePinchFilters:(BOOL)a3
{
  self->_EnableUnsurePinchFilters = a3;
}

- (BOOL)EnableUnsureScorePostProcessing
{
  return self->_EnableUnsureScorePostProcessing;
}

- (void)setEnableUnsureScorePostProcessing:(BOOL)a3
{
  self->_EnableUnsureScorePostProcessing = a3;
}

- (BOOL)EnableActionBreakRangeFilter
{
  return self->_EnableActionBreakRangeFilter;
}

- (void)setEnableActionBreakRangeFilter:(BOOL)a3
{
  self->_EnableActionBreakRangeFilter = a3;
}

- (float)OverwrittenPinchMakeThreshold
{
  return self->_OverwrittenPinchMakeThreshold;
}

- (void)setOverwrittenPinchMakeThreshold:(float)a3
{
  self->_OverwrittenPinchMakeThreshold = a3;
}

- (float)OverwrittenPinchBreakThreshold
{
  return self->_OverwrittenPinchBreakThreshold;
}

- (void)setOverwrittenPinchBreakThreshold:(float)a3
{
  self->_OverwrittenPinchBreakThreshold = a3;
}

- (float)UnsureNetBreakThreshold
{
  return self->_UnsureNetBreakThreshold;
}

- (void)setUnsureNetBreakThreshold:(float)a3
{
  self->_UnsureNetBreakThreshold = a3;
}

- (float)UnsureNetHDThreshold
{
  return self->_UnsureNetHDThreshold;
}

- (void)setUnsureNetHDThreshold:(float)a3
{
  self->_UnsureNetHDThreshold = a3;
}

- (float)RelaxedBreakThreshold
{
  return self->_RelaxedBreakThreshold;
}

- (void)setRelaxedBreakThreshold:(float)a3
{
  self->_RelaxedBreakThreshold = a3;
}

- (NSArray)SearchMakeThresholdRange
{
  return (NSArray *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setSearchMakeThresholdRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (NSArray)SearchBreakThresholdRange
{
  return (NSArray *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setSearchBreakThresholdRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (float)OperationalEnvelopeEdgeThreshold
{
  return self->_OperationalEnvelopeEdgeThreshold;
}

- (void)setOperationalEnvelopeEdgeThreshold:(float)a3
{
  self->_OperationalEnvelopeEdgeThreshold = a3;
}

- (NSString)MonoPinchModel
{
  return (NSString *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setMonoPinchModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (NSString)MonoThumbIndexTapModel
{
  return (NSString *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setMonoThumbIndexTapModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (float)MonoThumbIndexTapActivationThreshold
{
  return self->_MonoThumbIndexTapActivationThreshold;
}

- (void)setMonoThumbIndexTapActivationThreshold:(float)a3
{
  self->_MonoThumbIndexTapActivationThreshold = a3;
}

- (float)MonoThumbIndexTapDeactivationThreshold
{
  return self->_MonoThumbIndexTapDeactivationThreshold;
}

- (void)setMonoThumbIndexTapDeactivationThreshold:(float)a3
{
  self->_MonoThumbIndexTapDeactivationThreshold = a3;
}

- (BOOL)EnableGestureRecognition
{
  return self->_EnableGestureRecognition;
}

- (void)setEnableGestureRecognition:(BOOL)a3
{
  self->_EnableGestureRecognition = a3;
}

- (BOOL)EnablePinkySwipeRecognition
{
  return self->_EnablePinkySwipeRecognition;
}

- (void)setEnablePinkySwipeRecognition:(BOOL)a3
{
  self->_EnablePinkySwipeRecognition = a3;
}

- (BOOL)EnableTurningPointFilterForSwipe
{
  return self->_EnableTurningPointFilterForSwipe;
}

- (void)setEnableTurningPointFilterForSwipe:(BOOL)a3
{
  self->_EnableTurningPointFilterForSwipe = a3;
}

- (int)MaxSwipeTurns
{
  return self->_MaxSwipeTurns;
}

- (void)setMaxSwipeTurns:(int)a3
{
  self->_MaxSwipeTurns = a3;
}

- (float)ThresholdHandSpeed
{
  return self->_ThresholdHandSpeed;
}

- (void)setThresholdHandSpeed:(float)a3
{
  self->_ThresholdHandSpeed = a3;
}

- (float)ThresholdRelativeSpeedRatio
{
  return self->_ThresholdRelativeSpeedRatio;
}

- (void)setThresholdRelativeSpeedRatio:(float)a3
{
  self->_ThresholdRelativeSpeedRatio = a3;
}

- (float)MiddleDoubleTapIdleDist
{
  return self->_MiddleDoubleTapIdleDist;
}

- (void)setMiddleDoubleTapIdleDist:(float)a3
{
  self->_MiddleDoubleTapIdleDist = a3;
}

- (float)MiddleDoubleTapIdleAngle
{
  return self->_MiddleDoubleTapIdleAngle;
}

- (void)setMiddleDoubleTapIdleAngle:(float)a3
{
  self->_MiddleDoubleTapIdleAngle = a3;
}

- (float)MiddleDoubleTapReadyDist
{
  return self->_MiddleDoubleTapReadyDist;
}

- (void)setMiddleDoubleTapReadyDist:(float)a3
{
  self->_MiddleDoubleTapReadyDist = a3;
}

- (float)MiddleDoubleTapTap1Dist
{
  return self->_MiddleDoubleTapTap1Dist;
}

- (void)setMiddleDoubleTapTap1Dist:(float)a3
{
  self->_MiddleDoubleTapTap1Dist = a3;
}

- (float)MiddleDoubleTapTap1DropDur
{
  return self->_MiddleDoubleTapTap1DropDur;
}

- (void)setMiddleDoubleTapTap1DropDur:(float)a3
{
  self->_MiddleDoubleTapTap1DropDur = a3;
}

- (float)MiddleDoubleTapTap1DropFrac
{
  return self->_MiddleDoubleTapTap1DropFrac;
}

- (void)setMiddleDoubleTapTap1DropFrac:(float)a3
{
  self->_MiddleDoubleTapTap1DropFrac = a3;
}

- (float)MiddleDoubleTapBounceRiseFrac
{
  return self->_MiddleDoubleTapBounceRiseFrac;
}

- (void)setMiddleDoubleTapBounceRiseFrac:(float)a3
{
  self->_MiddleDoubleTapBounceRiseFrac = a3;
}

- (float)MiddleDoubleTapBounceDist
{
  return self->_MiddleDoubleTapBounceDist;
}

- (void)setMiddleDoubleTapBounceDist:(float)a3
{
  self->_MiddleDoubleTapBounceDist = a3;
}

- (float)MiddleDoubleTapTap2DropFrac
{
  return self->_MiddleDoubleTapTap2DropFrac;
}

- (void)setMiddleDoubleTapTap2DropFrac:(float)a3
{
  self->_MiddleDoubleTapTap2DropFrac = a3;
}

- (float)MiddleDoubleTapRiseDist
{
  return self->_MiddleDoubleTapRiseDist;
}

- (void)setMiddleDoubleTapRiseDist:(float)a3
{
  self->_MiddleDoubleTapRiseDist = a3;
}

- (float)MiddleDoubleTapMaxTapDistDiff
{
  return self->_MiddleDoubleTapMaxTapDistDiff;
}

- (void)setMiddleDoubleTapMaxTapDistDiff:(float)a3
{
  self->_MiddleDoubleTapMaxTapDistDiff = a3;
}

- (float)MiddleDoubleTapMinTapDurDiff
{
  return self->_MiddleDoubleTapMinTapDurDiff;
}

- (void)setMiddleDoubleTapMinTapDurDiff:(float)a3
{
  self->_MiddleDoubleTapMinTapDurDiff = a3;
}

- (float)MiddleDoubleTapMinBounceDropDist
{
  return self->_MiddleDoubleTapMinBounceDropDist;
}

- (void)setMiddleDoubleTapMinBounceDropDist:(float)a3
{
  self->_MiddleDoubleTapMinBounceDropDist = a3;
}

- (float)MiddleDoubleTapMinReadyDur
{
  return self->_MiddleDoubleTapMinReadyDur;
}

- (void)setMiddleDoubleTapMinReadyDur:(float)a3
{
  self->_MiddleDoubleTapMinReadyDur = a3;
}

- (float)MiddleDoubleTapMaxDropDur
{
  return self->_MiddleDoubleTapMaxDropDur;
}

- (void)setMiddleDoubleTapMaxDropDur:(float)a3
{
  self->_MiddleDoubleTapMaxDropDur = a3;
}

- (float)MiddleDoubleTapMinTapDur
{
  return self->_MiddleDoubleTapMinTapDur;
}

- (void)setMiddleDoubleTapMinTapDur:(float)a3
{
  self->_MiddleDoubleTapMinTapDur = a3;
}

- (float)MiddleDoubleTapMaxTapDur
{
  return self->_MiddleDoubleTapMaxTapDur;
}

- (void)setMiddleDoubleTapMaxTapDur:(float)a3
{
  self->_MiddleDoubleTapMaxTapDur = a3;
}

- (float)MiddleDoubleTapMinBounceDur
{
  return self->_MiddleDoubleTapMinBounceDur;
}

- (void)setMiddleDoubleTapMinBounceDur:(float)a3
{
  self->_MiddleDoubleTapMinBounceDur = a3;
}

- (float)MiddleDoubleTapMaxBounceDur
{
  return self->_MiddleDoubleTapMaxBounceDur;
}

- (void)setMiddleDoubleTapMaxBounceDur:(float)a3
{
  self->_MiddleDoubleTapMaxBounceDur = a3;
}

- (float)MiddleDoubleTapMinResetDur
{
  return self->_MiddleDoubleTapMinResetDur;
}

- (void)setMiddleDoubleTapMinResetDur:(float)a3
{
  self->_MiddleDoubleTapMinResetDur = a3;
}

- (int)MiddleDoubleTapNoiseWindowSize
{
  return self->_MiddleDoubleTapNoiseWindowSize;
}

- (void)setMiddleDoubleTapNoiseWindowSize:(int)a3
{
  self->_MiddleDoubleTapNoiseWindowSize = a3;
}

- (float)MiddleDoubleTapMinSignalToNoiseRatio
{
  return self->_MiddleDoubleTapMinSignalToNoiseRatio;
}

- (void)setMiddleDoubleTapMinSignalToNoiseRatio:(float)a3
{
  self->_MiddleDoubleTapMinSignalToNoiseRatio = a3;
}

- (float)MiddleDoubleTapMinTravelDistNoiseRatio
{
  return self->_MiddleDoubleTapMinTravelDistNoiseRatio;
}

- (void)setMiddleDoubleTapMinTravelDistNoiseRatio:(float)a3
{
  self->_MiddleDoubleTapMinTravelDistNoiseRatio = a3;
}

- (NSArray)MiddleDoubleTapSuppressors
{
  return (NSArray *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setMiddleDoubleTapSuppressors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (float)MiddleDoubleTapIndexFingerProximityThreshold
{
  return self->_MiddleDoubleTapIndexFingerProximityThreshold;
}

- (void)setMiddleDoubleTapIndexFingerProximityThreshold:(float)a3
{
  self->_MiddleDoubleTapIndexFingerProximityThreshold = a3;
}

- (float)MiddleDoubleTapRingFingerProximityThreshold
{
  return self->_MiddleDoubleTapRingFingerProximityThreshold;
}

- (void)setMiddleDoubleTapRingFingerProximityThreshold:(float)a3
{
  self->_MiddleDoubleTapRingFingerProximityThreshold = a3;
}

- (float)MiddleDoubleTapJointUncertainityMax
{
  return self->_MiddleDoubleTapJointUncertainityMax;
}

- (void)setMiddleDoubleTapJointUncertainityMax:(float)a3
{
  self->_MiddleDoubleTapJointUncertainityMax = a3;
}

- (float)MiddleDoubleTapHandInMotionDistThreshold
{
  return self->_MiddleDoubleTapHandInMotionDistThreshold;
}

- (void)setMiddleDoubleTapHandInMotionDistThreshold:(float)a3
{
  self->_MiddleDoubleTapHandInMotionDistThreshold = a3;
}

- (float)MiddleDoubleTapRestingGesturePreDuration
{
  return self->_MiddleDoubleTapRestingGesturePreDuration;
}

- (void)setMiddleDoubleTapRestingGesturePreDuration:(float)a3
{
  self->_MiddleDoubleTapRestingGesturePreDuration = a3;
}

- (float)MiddleDoubleTapRestingGestureMinIndexKnuckleVelocity
{
  return self->_MiddleDoubleTapRestingGestureMinIndexKnuckleVelocity;
}

- (void)setMiddleDoubleTapRestingGestureMinIndexKnuckleVelocity:(float)a3
{
  self->_MiddleDoubleTapRestingGestureMinIndexKnuckleVelocity = a3;
}

- (float)MiddleDoubleTapJointOcclusionTheshold
{
  return self->_MiddleDoubleTapJointOcclusionTheshold;
}

- (void)setMiddleDoubleTapJointOcclusionTheshold:(float)a3
{
  self->_MiddleDoubleTapJointOcclusionTheshold = a3;
}

- (BOOL)EnableScrollRecovery
{
  return self->_EnableScrollRecovery;
}

- (void)setEnableScrollRecovery:(BOOL)a3
{
  self->_EnableScrollRecovery = a3;
}

- (BOOL)EnableRepetitiveTapRecovery
{
  return self->_EnableRepetitiveTapRecovery;
}

- (void)setEnableRepetitiveTapRecovery:(BOOL)a3
{
  self->_EnableRepetitiveTapRecovery = a3;
}

- (BOOL)EnableTapRecoveryBreakFrame
{
  return self->_EnableTapRecoveryBreakFrame;
}

- (void)setEnableTapRecoveryBreakFrame:(BOOL)a3
{
  self->_EnableTapRecoveryBreakFrame = a3;
}

- (BOOL)UseBreakForTapRecovery
{
  return self->_UseBreakForTapRecovery;
}

- (void)setUseBreakForTapRecovery:(BOOL)a3
{
  self->_UseBreakForTapRecovery = a3;
}

- (float)CacheTimeLimit
{
  return self->_CacheTimeLimit;
}

- (void)setCacheTimeLimit:(float)a3
{
  self->_CacheTimeLimit = a3;
}

- (float)ThresholdAdaptiveMakeRange
{
  return self->_ThresholdAdaptiveMakeRange;
}

- (void)setThresholdAdaptiveMakeRange:(float)a3
{
  self->_ThresholdAdaptiveMakeRange = a3;
}

- (float)ThresholdHdDiff
{
  return self->_ThresholdHdDiff;
}

- (void)setThresholdHdDiff:(float)a3
{
  self->_ThresholdHdDiff = a3;
}

- (float)ThresholdKuckleDiff
{
  return self->_ThresholdKuckleDiff;
}

- (void)setThresholdKuckleDiff:(float)a3
{
  self->_ThresholdKuckleDiff = a3;
}

- (float)ThresholdOcclusion
{
  return self->_ThresholdOcclusion;
}

- (void)setThresholdOcclusion:(float)a3
{
  self->_ThresholdOcclusion = a3;
}

- (float)ThresholdHd
{
  return self->_ThresholdHd;
}

- (void)setThresholdHd:(float)a3
{
  self->_ThresholdHd = a3;
}

- (float)ThresholdAngle
{
  return self->_ThresholdAngle;
}

- (void)setThresholdAngle:(float)a3
{
  self->_ThresholdAngle = a3;
}

- (float)ThresholdBreakTipOcclusion
{
  return self->_ThresholdBreakTipOcclusion;
}

- (void)setThresholdBreakTipOcclusion:(float)a3
{
  self->_ThresholdBreakTipOcclusion = a3;
}

- (float)ThresholdPreciseMakeFrameMakeRange
{
  return self->_ThresholdPreciseMakeFrameMakeRange;
}

- (void)setThresholdPreciseMakeFrameMakeRange:(float)a3
{
  self->_ThresholdPreciseMakeFrameMakeRange = a3;
}

- (float)ThresholdPreciseMakeFrameRawActionScore
{
  return self->_ThresholdPreciseMakeFrameRawActionScore;
}

- (void)setThresholdPreciseMakeFrameRawActionScore:(float)a3
{
  self->_ThresholdPreciseMakeFrameRawActionScore = a3;
}

- (float)ThresholdPreciseBreakFrameBreakRange
{
  return self->_ThresholdPreciseBreakFrameBreakRange;
}

- (void)setThresholdPreciseBreakFrameBreakRange:(float)a3
{
  self->_ThresholdPreciseBreakFrameBreakRange = a3;
}

- (float)ThresholdPreciseBreakFrameRawActionScore
{
  return self->_ThresholdPreciseBreakFrameRawActionScore;
}

- (void)setThresholdPreciseBreakFrameRawActionScore:(float)a3
{
  self->_ThresholdPreciseBreakFrameRawActionScore = a3;
}

- (int)ThresholdScrollMinSwipeFramesRecovery
{
  return self->_ThresholdScrollMinSwipeFramesRecovery;
}

- (void)setThresholdScrollMinSwipeFramesRecovery:(int)a3
{
  self->_ThresholdScrollMinSwipeFramesRecovery = a3;
}

- (float)ThresholdScrollPinchCentroidMovement
{
  return self->_ThresholdScrollPinchCentroidMovement;
}

- (void)setThresholdScrollPinchCentroidMovement:(float)a3
{
  self->_ThresholdScrollPinchCentroidMovement = a3;
}

- (float)ThresholdScrollPinkyKnuckleMovement
{
  return self->_ThresholdScrollPinkyKnuckleMovement;
}

- (void)setThresholdScrollPinkyKnuckleMovement:(float)a3
{
  self->_ThresholdScrollPinkyKnuckleMovement = a3;
}

- (float)ThresholdScrollMaxPinchSpeedRecovery
{
  return self->_ThresholdScrollMaxPinchSpeedRecovery;
}

- (void)setThresholdScrollMaxPinchSpeedRecovery:(float)a3
{
  self->_ThresholdScrollMaxPinchSpeedRecovery = a3;
}

- (float)ThresholdScrollRelativeSpeedRatioRecovery
{
  return self->_ThresholdScrollRelativeSpeedRatioRecovery;
}

- (void)setThresholdScrollRelativeSpeedRatioRecovery:(float)a3
{
  self->_ThresholdScrollRelativeSpeedRatioRecovery = a3;
}

- (int)ThresholdArmScrollDurationMin
{
  return self->_ThresholdArmScrollDurationMin;
}

- (void)setThresholdArmScrollDurationMin:(int)a3
{
  self->_ThresholdArmScrollDurationMin = a3;
}

- (int)ThresholdArmScrollDurationMax
{
  return self->_ThresholdArmScrollDurationMax;
}

- (void)setThresholdArmScrollDurationMax:(int)a3
{
  self->_ThresholdArmScrollDurationMax = a3;
}

- (float)ThresholdArmScrollWristPitch
{
  return self->_ThresholdArmScrollWristPitch;
}

- (void)setThresholdArmScrollWristPitch:(float)a3
{
  self->_ThresholdArmScrollWristPitch = a3;
}

- (float)ThresholdArmScrollWristRoll
{
  return self->_ThresholdArmScrollWristRoll;
}

- (void)setThresholdArmScrollWristRoll:(float)a3
{
  self->_ThresholdArmScrollWristRoll = a3;
}

- (BOOL)EnableWristScroll
{
  return self->_EnableWristScroll;
}

- (void)setEnableWristScroll:(BOOL)a3
{
  self->_EnableWristScroll = a3;
}

- (BOOL)EnableArmScroll
{
  return self->_EnableArmScroll;
}

- (void)setEnableArmScroll:(BOOL)a3
{
  self->_EnableArmScroll = a3;
}

- (float)ThresholdTapDurationMax
{
  return self->_ThresholdTapDurationMax;
}

- (void)setThresholdTapDurationMax:(float)a3
{
  self->_ThresholdTapDurationMax = a3;
}

- (float)ThresholdTapPinchCentroidMovement
{
  return self->_ThresholdTapPinchCentroidMovement;
}

- (void)setThresholdTapPinchCentroidMovement:(float)a3
{
  self->_ThresholdTapPinchCentroidMovement = a3;
}

- (float)ThresholdTapPinkyKnuckleMovement
{
  return self->_ThresholdTapPinkyKnuckleMovement;
}

- (void)setThresholdTapPinkyKnuckleMovement:(float)a3
{
  self->_ThresholdTapPinkyKnuckleMovement = a3;
}

- (float)ThresholdTapHoverDistance
{
  return self->_ThresholdTapHoverDistance;
}

- (void)setThresholdTapHoverDistance:(float)a3
{
  self->_ThresholdTapHoverDistance = a3;
}

- (float)ThresholdTapHDVectorDiffAngle
{
  return self->_ThresholdTapHDVectorDiffAngle;
}

- (void)setThresholdTapHDVectorDiffAngle:(float)a3
{
  self->_ThresholdTapHDVectorDiffAngle = a3;
}

- (float)ThresholdTapKuckleDiff
{
  return self->_ThresholdTapKuckleDiff;
}

- (void)setThresholdTapKuckleDiff:(float)a3
{
  self->_ThresholdTapKuckleDiff = a3;
}

- (float)ThresholdTapPinchCentroidDiff
{
  return self->_ThresholdTapPinchCentroidDiff;
}

- (void)setThresholdTapPinchCentroidDiff:(float)a3
{
  self->_ThresholdTapPinchCentroidDiff = a3;
}

- (float)ThresholdTapPalmOrientationDiff
{
  return self->_ThresholdTapPalmOrientationDiff;
}

- (void)setThresholdTapPalmOrientationDiff:(float)a3
{
  self->_ThresholdTapPalmOrientationDiff = a3;
}

- (BOOL)EnablePinchCancellation
{
  return self->_EnablePinchCancellation;
}

- (void)setEnablePinchCancellation:(BOOL)a3
{
  self->_EnablePinchCancellation = a3;
}

- (NSString)PinchCancellationModelName
{
  return (NSString *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setPinchCancellationModelName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (NSArray)CancellationThresholdLSTM
{
  return (NSArray *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setCancellationThresholdLSTM:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (NSArray)CancellationRangeLSTM
{
  return (NSArray *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setCancellationRangeLSTM:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (float)CancellationHoverDistance
{
  return self->_CancellationHoverDistance;
}

- (void)setCancellationHoverDistance:(float)a3
{
  self->_CancellationHoverDistance = a3;
}

- (float)ScrollBreakDistanceThreshold
{
  return self->_ScrollBreakDistanceThreshold;
}

- (void)setScrollBreakDistanceThreshold:(float)a3
{
  self->_ScrollBreakDistanceThreshold = a3;
}

- (int)ScrollBreakCounterThreshold
{
  return self->_ScrollBreakCounterThreshold;
}

- (void)setScrollBreakCounterThreshold:(int)a3
{
  self->_ScrollBreakCounterThreshold = a3;
}

- (BOOL)CancelShortScroll
{
  return self->_CancelShortScroll;
}

- (void)setCancelShortScroll:(BOOL)a3
{
  self->_CancelShortScroll = a3;
}

- (int)MinSwipeFrames
{
  return self->_MinSwipeFrames;
}

- (void)setMinSwipeFrames:(int)a3
{
  self->_MinSwipeFrames = a3;
}

- (BOOL)EnableLSTMCancellation
{
  return self->_EnableLSTMCancellation;
}

- (void)setEnableLSTMCancellation:(BOOL)a3
{
  self->_EnableLSTMCancellation = a3;
}

- (BOOL)EnableDroppingHandCancellation
{
  return self->_EnableDroppingHandCancellation;
}

- (void)setEnableDroppingHandCancellation:(BOOL)a3
{
  self->_EnableDroppingHandCancellation = a3;
}

- (BOOL)EnableSlidingPinchCancellation
{
  return self->_EnableSlidingPinchCancellation;
}

- (void)setEnableSlidingPinchCancellation:(BOOL)a3
{
  self->_EnableSlidingPinchCancellation = a3;
}

- (BOOL)EnableCrossedPinchCancellation
{
  return self->_EnableCrossedPinchCancellation;
}

- (void)setEnableCrossedPinchCancellation:(BOOL)a3
{
  self->_EnableCrossedPinchCancellation = a3;
}

- (BOOL)EnableRepetitiveAccidentalSuppression
{
  return self->_EnableRepetitiveAccidentalSuppression;
}

- (void)setEnableRepetitiveAccidentalSuppression:(BOOL)a3
{
  self->_EnableRepetitiveAccidentalSuppression = a3;
}

- (float)SlidingFingerDistanceThreshold
{
  return self->_SlidingFingerDistanceThreshold;
}

- (void)setSlidingFingerDistanceThreshold:(float)a3
{
  self->_SlidingFingerDistanceThreshold = a3;
}

- (float)DroppingHandHDThreshold
{
  return self->_DroppingHandHDThreshold;
}

- (void)setDroppingHandHDThreshold:(float)a3
{
  self->_DroppingHandHDThreshold = a3;
}

- (int)SlidingPinchCounterThreshold
{
  return self->_SlidingPinchCounterThreshold;
}

- (void)setSlidingPinchCounterThreshold:(int)a3
{
  self->_SlidingPinchCounterThreshold = a3;
}

- (float)CancellationVelocityThreshold
{
  return self->_CancellationVelocityThreshold;
}

- (void)setCancellationVelocityThreshold:(float)a3
{
  self->_CancellationVelocityThreshold = a3;
}

- (BOOL)UsePinchSuppressionAfterCancellation
{
  return self->_UsePinchSuppressionAfterCancellation;
}

- (void)setUsePinchSuppressionAfterCancellation:(BOOL)a3
{
  self->_UsePinchSuppressionAfterCancellation = a3;
}

- (float)PinchScoreSuppressionThreshold
{
  return self->_PinchScoreSuppressionThreshold;
}

- (void)setPinchScoreSuppressionThreshold:(float)a3
{
  self->_PinchScoreSuppressionThreshold = a3;
}

- (float)CrossedPinchMaxVelocity
{
  return self->_CrossedPinchMaxVelocity;
}

- (void)setCrossedPinchMaxVelocity:(float)a3
{
  self->_CrossedPinchMaxVelocity = a3;
}

- (float)SlidingPinchThreshold
{
  return self->_SlidingPinchThreshold;
}

- (void)setSlidingPinchThreshold:(float)a3
{
  self->_SlidingPinchThreshold = a3;
}

- (NSString)PinchIntentionModelName
{
  return (NSString *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setPinchIntentionModelName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (BOOL)EnableObjectInteractionState
{
  return self->_EnableObjectInteractionState;
}

- (void)setEnableObjectInteractionState:(BOOL)a3
{
  self->_EnableObjectInteractionState = a3;
}

- (BOOL)ObjectInteractionStateSupressPinchRecovery
{
  return self->_ObjectInteractionStateSupressPinchRecovery;
}

- (void)setObjectInteractionStateSupressPinchRecovery:(BOOL)a3
{
  self->_ObjectInteractionStateSupressPinchRecovery = a3;
}

- (BOOL)OisUseLstmInEatingModeOnly
{
  return self->_OisUseLstmInEatingModeOnly;
}

- (void)setOisUseLstmInEatingModeOnly:(BOOL)a3
{
  self->_OisUseLstmInEatingModeOnly = a3;
}

- (BOOL)OisEnterOISWhenEnterEatingMode
{
  return self->_OisEnterOISWhenEnterEatingMode;
}

- (void)setOisEnterOISWhenEnterEatingMode:(BOOL)a3
{
  self->_OisEnterOISWhenEnterEatingMode = a3;
}

- (BOOL)UseHandCloseToMouthToGateObjectInteractionState
{
  return self->_UseHandCloseToMouthToGateObjectInteractionState;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionState:(BOOL)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionState = a3;
}

- (BOOL)UseHandCloseToMouthToGateObjectInteractionStateWithMaxAllowedTimeNearMouth
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateWithMaxAllowedTimeNearMouth;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateWithMaxAllowedTimeNearMouth:(BOOL)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateWithMaxAllowedTimeNearMouth = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateHoverDistanceThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateHoverDistanceThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateHoverDistanceThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateHoverDistanceThreshold = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceThreshold = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateHandToMouthStrictDistanceThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateHandToMouthStrictDistanceThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateHandToMouthStrictDistanceThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateHandToMouthStrictDistanceThreshold = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceUpperThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceUpperThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceUpperThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateHandToMouthDistanceUpperThreshold = a3;
}

- (BOOL)UseHandCloseToMouthToGateObjectInteractionStateAllowEnterWithoutObject
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateAllowEnterWithoutObject;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateAllowEnterWithoutObject:(BOOL)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateAllowEnterWithoutObject = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateMouthToHandTrajectoryDistanceThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateMouthToHandTrajectoryDistanceThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateMouthToHandTrajectoryDistanceThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateMouthToHandTrajectoryDistanceThreshold = a3;
}

- (NSArray)UseHandCloseToMouthToGateObjectInteractionStateNumberOfRepetitionThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateNumberOfRepetitionThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (NSArray)UseHandCloseToMouthToGateObjectInteractionStateRequireObjects
{
  return (NSArray *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateRequireObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateLastObjectInteractionTimeThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateLastObjectInteractionTimeThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateLastObjectInteractionTimeThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateLastObjectInteractionTimeThreshold = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateMaxAllowedTimeNearMouth
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateMaxAllowedTimeNearMouth;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateMaxAllowedTimeNearMouth:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateMaxAllowedTimeNearMouth = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateMaxAllowedDistancesToMouthIncrease
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateMaxAllowedDistancesToMouthIncrease;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateMaxAllowedDistancesToMouthIncrease:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateMaxAllowedDistancesToMouthIncrease = a3;
}

- (int)UseHandCloseToMouthToGateObjectInteractionStateTrajectoryExtendFrames
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateTrajectoryExtendFrames;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateTrajectoryExtendFrames:(int)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateTrajectoryExtendFrames = a3;
}

- (float)UseHandCloseToMouthToGateObjectInteractionStateTrajectoryHoverDistanceThreshold
{
  return self->_UseHandCloseToMouthToGateObjectInteractionStateTrajectoryHoverDistanceThreshold;
}

- (void)setUseHandCloseToMouthToGateObjectInteractionStateTrajectoryHoverDistanceThreshold:(float)a3
{
  self->_UseHandCloseToMouthToGateObjectInteractionStateTrajectoryHoverDistanceThreshold = a3;
}

- (NSArray)TimeToUseHandCloseToMouthToGateObjectInteractionStates
{
  return (NSArray *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setTimeToUseHandCloseToMouthToGateObjectInteractionStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (BOOL)UseSegmentationOIHForObjectInteractionState
{
  return self->_UseSegmentationOIHForObjectInteractionState;
}

- (void)setUseSegmentationOIHForObjectInteractionState:(BOOL)a3
{
  self->_UseSegmentationOIHForObjectInteractionState = a3;
}

- (float)TimeToExitObjectInteractionStateAfterInactivity
{
  return self->_TimeToExitObjectInteractionStateAfterInactivity;
}

- (void)setTimeToExitObjectInteractionStateAfterInactivity:(float)a3
{
  self->_TimeToExitObjectInteractionStateAfterInactivity = a3;
}

- (float)OisPinchAcceptorStrictHoverDistanceReductionAtMakeThreshold
{
  return self->_OisPinchAcceptorStrictHoverDistanceReductionAtMakeThreshold;
}

- (void)setOisPinchAcceptorStrictHoverDistanceReductionAtMakeThreshold:(float)a3
{
  self->_OisPinchAcceptorStrictHoverDistanceReductionAtMakeThreshold = a3;
}

- (float)OisPinchAcceptorMediumHoverDistanceReductionAtMakeThreshold
{
  return self->_OisPinchAcceptorMediumHoverDistanceReductionAtMakeThreshold;
}

- (void)setOisPinchAcceptorMediumHoverDistanceReductionAtMakeThreshold:(float)a3
{
  self->_OisPinchAcceptorMediumHoverDistanceReductionAtMakeThreshold = a3;
}

- (float)OisPinchAcceptorStaticHandHoverDistanceReductionThreshold
{
  return self->_OisPinchAcceptorStaticHandHoverDistanceReductionThreshold;
}

- (void)setOisPinchAcceptorStaticHandHoverDistanceReductionThreshold:(float)a3
{
  self->_OisPinchAcceptorStaticHandHoverDistanceReductionThreshold = a3;
}

- (float)OisPinchAcceptorStaticHandIntentionThreshold
{
  return self->_OisPinchAcceptorStaticHandIntentionThreshold;
}

- (void)setOisPinchAcceptorStaticHandIntentionThreshold:(float)a3
{
  self->_OisPinchAcceptorStaticHandIntentionThreshold = a3;
}

- (float)OisPinchAcceptorStrictIntentionThreshold
{
  return self->_OisPinchAcceptorStrictIntentionThreshold;
}

- (void)setOisPinchAcceptorStrictIntentionThreshold:(float)a3
{
  self->_OisPinchAcceptorStrictIntentionThreshold = a3;
}

- (float)OisPinchAcceptorMediumIntentionThreshold
{
  return self->_OisPinchAcceptorMediumIntentionThreshold;
}

- (void)setOisPinchAcceptorMediumIntentionThreshold:(float)a3
{
  self->_OisPinchAcceptorMediumIntentionThreshold = a3;
}

- (BOOL)OisPinchAcceptorIgnoreSidePinch
{
  return self->_OisPinchAcceptorIgnoreSidePinch;
}

- (void)setOisPinchAcceptorIgnoreSidePinch:(BOOL)a3
{
  self->_OisPinchAcceptorIgnoreSidePinch = a3;
}

- (BOOL)OisPinchAcceptorUsingUnsureCond
{
  return self->_OisPinchAcceptorUsingUnsureCond;
}

- (void)setOisPinchAcceptorUsingUnsureCond:(BOOL)a3
{
  self->_OisPinchAcceptorUsingUnsureCond = a3;
}

- (int)OisPinchAcceptorMinTouchFrameToAllowMake
{
  return self->_OisPinchAcceptorMinTouchFrameToAllowMake;
}

- (void)setOisPinchAcceptorMinTouchFrameToAllowMake:(int)a3
{
  self->_OisPinchAcceptorMinTouchFrameToAllowMake = a3;
}

- (float)OisPinchAcceptorMinDistanceToMouth
{
  return self->_OisPinchAcceptorMinDistanceToMouth;
}

- (void)setOisPinchAcceptorMinDistanceToMouth:(float)a3
{
  self->_OisPinchAcceptorMinDistanceToMouth = a3;
}

- (float)OisPinchAcceptorScrollMovementRange
{
  return self->_OisPinchAcceptorScrollMovementRange;
}

- (void)setOisPinchAcceptorScrollMovementRange:(float)a3
{
  self->_OisPinchAcceptorScrollMovementRange = a3;
}

- (float)OisPinchAcceptorDuringTouchOcclusionThreshold
{
  return self->_OisPinchAcceptorDuringTouchOcclusionThreshold;
}

- (void)setOisPinchAcceptorDuringTouchOcclusionThreshold:(float)a3
{
  self->_OisPinchAcceptorDuringTouchOcclusionThreshold = a3;
}

- (NSArray)OisPinchAcceptorHighIntentionMakeIntentionThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setOisPinchAcceptorHighIntentionMakeIntentionThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (NSArray)OisPinchAcceptorHighIntentionMakeMinTouchFrameToAllowMakes
{
  return (NSArray *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setOisPinchAcceptorHighIntentionMakeMinTouchFrameToAllowMakes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (float)OisSegmentationProcessingWidthRatio
{
  return self->_OisSegmentationProcessingWidthRatio;
}

- (void)setOisSegmentationProcessingWidthRatio:(float)a3
{
  self->_OisSegmentationProcessingWidthRatio = a3;
}

- (float)OisSegmentationProcessingHeightRatio
{
  return self->_OisSegmentationProcessingHeightRatio;
}

- (void)setOisSegmentationProcessingHeightRatio:(float)a3
{
  self->_OisSegmentationProcessingHeightRatio = a3;
}

- (int)MinimumObjectSizeForOIHInPixels
{
  return self->_MinimumObjectSizeForOIHInPixels;
}

- (void)setMinimumObjectSizeForOIHInPixels:(int)a3
{
  self->_MinimumObjectSizeForOIHInPixels = a3;
}

- (int)MinimumObjectSizeForObjectProximityConeInPixels
{
  return self->_MinimumObjectSizeForObjectProximityConeInPixels;
}

- (void)setMinimumObjectSizeForObjectProximityConeInPixels:(int)a3
{
  self->_MinimumObjectSizeForObjectProximityConeInPixels = a3;
}

- (float)MaximumObjectDistanceToJoints
{
  return self->_MaximumObjectDistanceToJoints;
}

- (void)setMaximumObjectDistanceToJoints:(float)a3
{
  self->_MaximumObjectDistanceToJoints = a3;
}

- (float)HeightExtensionOfObjectProximityCone
{
  return self->_HeightExtensionOfObjectProximityCone;
}

- (void)setHeightExtensionOfObjectProximityCone:(float)a3
{
  self->_HeightExtensionOfObjectProximityCone = a3;
}

- (float)MaximumAllowedHDForObjectProximityCone
{
  return self->_MaximumAllowedHDForObjectProximityCone;
}

- (void)setMaximumAllowedHDForObjectProximityCone:(float)a3
{
  self->_MaximumAllowedHDForObjectProximityCone = a3;
}

- (BOOL)UseOIHSegmentationMask
{
  return self->_UseOIHSegmentationMask;
}

- (void)setUseOIHSegmentationMask:(BOOL)a3
{
  self->_UseOIHSegmentationMask = a3;
}

- (BOOL)UseGeneralObjectProximityCone
{
  return self->_UseGeneralObjectProximityCone;
}

- (void)setUseGeneralObjectProximityCone:(BOOL)a3
{
  self->_UseGeneralObjectProximityCone = a3;
}

- (BOOL)Use30HzMemoryForSegmentation
{
  return self->_Use30HzMemoryForSegmentation;
}

- (void)setUse30HzMemoryForSegmentation:(BOOL)a3
{
  self->_Use30HzMemoryForSegmentation = a3;
}

- (BOOL)UseStaticHandStateForOIS
{
  return self->_UseStaticHandStateForOIS;
}

- (void)setUseStaticHandStateForOIS:(BOOL)a3
{
  self->_UseStaticHandStateForOIS = a3;
}

- (float)OisStaticHandMaxMovement
{
  return self->_OisStaticHandMaxMovement;
}

- (void)setOisStaticHandMaxMovement:(float)a3
{
  self->_OisStaticHandMaxMovement = a3;
}

- (float)OisStaticHandMaxAngle
{
  return self->_OisStaticHandMaxAngle;
}

- (void)setOisStaticHandMaxAngle:(float)a3
{
  self->_OisStaticHandMaxAngle = a3;
}

- (int)OisStaticHandBufferLength
{
  return self->_OisStaticHandBufferLength;
}

- (void)setOisStaticHandBufferLength:(int)a3
{
  self->_OisStaticHandBufferLength = a3;
}

- (float)OisTimeToReenterOisDueToRecentEating
{
  return self->_OisTimeToReenterOisDueToRecentEating;
}

- (void)setOisTimeToReenterOisDueToRecentEating:(float)a3
{
  self->_OisTimeToReenterOisDueToRecentEating = a3;
}

- (float)OisTooFarHandToMouthTracjectoryDistanceThreshold
{
  return self->_OisTooFarHandToMouthTracjectoryDistanceThreshold;
}

- (void)setOisTooFarHandToMouthTracjectoryDistanceThreshold:(float)a3
{
  self->_OisTooFarHandToMouthTracjectoryDistanceThreshold = a3;
}

- (float)OisNearHandToMouthTracjectoryDistanceThreshold
{
  return self->_OisNearHandToMouthTracjectoryDistanceThreshold;
}

- (void)setOisNearHandToMouthTracjectoryDistanceThreshold:(float)a3
{
  self->_OisNearHandToMouthTracjectoryDistanceThreshold = a3;
}

- (float)OisNearHandToMouthTracjectoryTimeThreshold
{
  return self->_OisNearHandToMouthTracjectoryTimeThreshold;
}

- (void)setOisNearHandToMouthTracjectoryTimeThreshold:(float)a3
{
  self->_OisNearHandToMouthTracjectoryTimeThreshold = a3;
}

- (float)OisTimeBetweenEating
{
  return self->_OisTimeBetweenEating;
}

- (void)setOisTimeBetweenEating:(float)a3
{
  self->_OisTimeBetweenEating = a3;
}

- (float)OisTimeToPreventEnterObjectInteractionStateAfterIntentional
{
  return self->_OisTimeToPreventEnterObjectInteractionStateAfterIntentional;
}

- (void)setOisTimeToPreventEnterObjectInteractionStateAfterIntentional:(float)a3
{
  self->_OisTimeToPreventEnterObjectInteractionStateAfterIntentional = a3;
}

- (float)OisDistanceToPreventEnterObjectInteractionStateAfterIntentional
{
  return self->_OisDistanceToPreventEnterObjectInteractionStateAfterIntentional;
}

- (void)setOisDistanceToPreventEnterObjectInteractionStateAfterIntentional:(float)a3
{
  self->_OisDistanceToPreventEnterObjectInteractionStateAfterIntentional = a3;
}

- (int)OisStrictEatingModeNumberOfRepetitionsToEnter
{
  return self->_OisStrictEatingModeNumberOfRepetitionsToEnter;
}

- (void)setOisStrictEatingModeNumberOfRepetitionsToEnter:(int)a3
{
  self->_OisStrictEatingModeNumberOfRepetitionsToEnter = a3;
}

- (float)OisIntentionScoreThresholdToPreventStrictEatingMode
{
  return self->_OisIntentionScoreThresholdToPreventStrictEatingMode;
}

- (void)setOisIntentionScoreThresholdToPreventStrictEatingMode:(float)a3
{
  self->_OisIntentionScoreThresholdToPreventStrictEatingMode = a3;
}

- (BOOL)OisStrictEatingModeEnabled
{
  return self->_OisStrictEatingModeEnabled;
}

- (void)setOisStrictEatingModeEnabled:(BOOL)a3
{
  self->_OisStrictEatingModeEnabled = a3;
}

- (float)OisMaxMovementSecondAttemptExit
{
  return self->_OisMaxMovementSecondAttemptExit;
}

- (void)setOisMaxMovementSecondAttemptExit:(float)a3
{
  self->_OisMaxMovementSecondAttemptExit = a3;
}

- (float)OisMaxTimeSecondAttemptExit
{
  return self->_OisMaxTimeSecondAttemptExit;
}

- (void)setOisMaxTimeSecondAttemptExit:(float)a3
{
  self->_OisMaxTimeSecondAttemptExit = a3;
}

- (BOOL)OisRecoveryPinchSuppressionInStrictEatingMode
{
  return self->_OisRecoveryPinchSuppressionInStrictEatingMode;
}

- (void)setOisRecoveryPinchSuppressionInStrictEatingMode:(BOOL)a3
{
  self->_OisRecoveryPinchSuppressionInStrictEatingMode = a3;
}

- (NSArray)AcceptorThresholdDistanceToObject
{
  return (NSArray *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setAcceptorThresholdDistanceToObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (NSArray)AcceptorThresholdNumberOfObjectInteractions
{
  return (NSArray *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setAcceptorThresholdNumberOfObjectInteractions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (NSArray)AcceptorThresholdSizeOfObjectInPixels
{
  return (NSArray *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setAcceptorThresholdSizeOfObjectInPixels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1288);
}

- (NSArray)AcceptorThresholdTimeSinceLastInteraction
{
  return (NSArray *)objc_getProperty(self, a2, 1296, 1);
}

- (void)setAcceptorThresholdTimeSinceLastInteraction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1296);
}

- (BOOL)EnableDoublePinchRecovery
{
  return self->_EnableDoublePinchRecovery;
}

- (void)setEnableDoublePinchRecovery:(BOOL)a3
{
  self->_EnableDoublePinchRecovery = a3;
}

- (float)DoublePinchBreakThreshold
{
  return self->_DoublePinchBreakThreshold;
}

- (void)setDoublePinchBreakThreshold:(float)a3
{
  self->_DoublePinchBreakThreshold = a3;
}

- (float)StaticHandMovementThreshold
{
  return self->_StaticHandMovementThreshold;
}

- (void)setStaticHandMovementThreshold:(float)a3
{
  self->_StaticHandMovementThreshold = a3;
}

- (BOOL)EnablePinchBreak
{
  return self->_EnablePinchBreak;
}

- (void)setEnablePinchBreak:(BOOL)a3
{
  self->_EnablePinchBreak = a3;
}

- (NSString)PinchBreakModelName
{
  return (NSString *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setPinchBreakModelName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1304);
}

- (BOOL)UsePinchSuppressionAfterScrollBreak
{
  return self->_UsePinchSuppressionAfterScrollBreak;
}

- (void)setUsePinchSuppressionAfterScrollBreak:(BOOL)a3
{
  self->_UsePinchSuppressionAfterScrollBreak = a3;
}

- (BOOL)EnableSelectionRecoveryInBreak
{
  return self->_EnableSelectionRecoveryInBreak;
}

- (void)setEnableSelectionRecoveryInBreak:(BOOL)a3
{
  self->_EnableSelectionRecoveryInBreak = a3;
}

- (int)RecoveryShortTapMaxDuration
{
  return self->_RecoveryShortTapMaxDuration;
}

- (void)setRecoveryShortTapMaxDuration:(int)a3
{
  self->_RecoveryShortTapMaxDuration = a3;
}

- (float)RecoveryStationaryTapMovementRange
{
  return self->_RecoveryStationaryTapMovementRange;
}

- (void)setRecoveryStationaryTapMovementRange:(float)a3
{
  self->_RecoveryStationaryTapMovementRange = a3;
}

- (int)RecoveryHighActionScoreFrames
{
  return self->_RecoveryHighActionScoreFrames;
}

- (void)setRecoveryHighActionScoreFrames:(int)a3
{
  self->_RecoveryHighActionScoreFrames = a3;
}

- (float)RecoveryHighActionScoreThreshold
{
  return self->_RecoveryHighActionScoreThreshold;
}

- (void)setRecoveryHighActionScoreThreshold:(float)a3
{
  self->_RecoveryHighActionScoreThreshold = a3;
}

- (float)RecoveryBreakUnsureScoreThreshold
{
  return self->_RecoveryBreakUnsureScoreThreshold;
}

- (void)setRecoveryBreakUnsureScoreThreshold:(float)a3
{
  self->_RecoveryBreakUnsureScoreThreshold = a3;
}

- (float)RecoveryPinchHoverDistanceThreshold
{
  return self->_RecoveryPinchHoverDistanceThreshold;
}

- (void)setRecoveryPinchHoverDistanceThreshold:(float)a3
{
  self->_RecoveryPinchHoverDistanceThreshold = a3;
}

- (float)RecoveryPinchIndexOcclusionThreshold
{
  return self->_RecoveryPinchIndexOcclusionThreshold;
}

- (void)setRecoveryPinchIndexOcclusionThreshold:(float)a3
{
  self->_RecoveryPinchIndexOcclusionThreshold = a3;
}

- (float)RecoveryPinchThumbOcclusionThreshold
{
  return self->_RecoveryPinchThumbOcclusionThreshold;
}

- (void)setRecoveryPinchThumbOcclusionThreshold:(float)a3
{
  self->_RecoveryPinchThumbOcclusionThreshold = a3;
}

- (float)RecoveryMakeBreakSimilarityThreshold
{
  return self->_RecoveryMakeBreakSimilarityThreshold;
}

- (void)setRecoveryMakeBreakSimilarityThreshold:(float)a3
{
  self->_RecoveryMakeBreakSimilarityThreshold = a3;
}

- (int64_t)nominalLightCurrentUpperBound
{
  return self->_nominalLightCurrentUpperBound;
}

- (void)setNominalLightCurrentUpperBound:(int64_t)a3
{
  self->_nominalLightCurrentUpperBound = a3;
}

- (int64_t)lowLightPulseWidthThreshold
{
  return self->_lowLightPulseWidthThreshold;
}

- (void)setLowLightPulseWidthThreshold:(int64_t)a3
{
  self->_lowLightPulseWidthThreshold = a3;
}

- (float)HandRadius
{
  return self->_HandRadius;
}

- (void)setHandRadius:(float)a3
{
  self->_HandRadius = a3;
}

- (BOOL)EnableEnrolment
{
  return self->_EnableEnrolment;
}

- (void)setEnableEnrolment:(BOOL)a3
{
  self->_EnableEnrolment = a3;
}

- (BOOL)LeftHandPreferredForEnrolment
{
  return self->_LeftHandPreferredForEnrolment;
}

- (void)setLeftHandPreferredForEnrolment:(BOOL)a3
{
  self->_LeftHandPreferredForEnrolment = a3;
}

- (int)NumOfIgnoredEnrolmentFrames
{
  return self->_NumOfIgnoredEnrolmentFrames;
}

- (void)setNumOfIgnoredEnrolmentFrames:(int)a3
{
  self->_NumOfIgnoredEnrolmentFrames = a3;
}

- (int)NumOfPreEnrolmentFrames
{
  return self->_NumOfPreEnrolmentFrames;
}

- (void)setNumOfPreEnrolmentFrames:(int)a3
{
  self->_NumOfPreEnrolmentFrames = a3;
}

- (int)NumOfEnrolmentFrames
{
  return self->_NumOfEnrolmentFrames;
}

- (void)setNumOfEnrolmentFrames:(int)a3
{
  self->_NumOfEnrolmentFrames = a3;
}

- (NSArray)BoneScale
{
  return (NSArray *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setBoneScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1328);
}

- (BOOL)EnableCoreAnalytics
{
  return self->_EnableCoreAnalytics;
}

- (void)setEnableCoreAnalytics:(BOOL)a3
{
  self->_EnableCoreAnalytics = a3;
}

- (BOOL)EnableDetectionSensitivity
{
  return self->_EnableDetectionSensitivity;
}

- (void)setEnableDetectionSensitivity:(BOOL)a3
{
  self->_EnableDetectionSensitivity = a3;
}

- (float)DetectionSensitivityNoiseMagnitude
{
  return self->_DetectionSensitivityNoiseMagnitude;
}

- (void)setDetectionSensitivityNoiseMagnitude:(float)a3
{
  self->_DetectionSensitivityNoiseMagnitude = a3;
}

- (BOOL)EnableTrackingSensitivity
{
  return self->_EnableTrackingSensitivity;
}

- (void)setEnableTrackingSensitivity:(BOOL)a3
{
  self->_EnableTrackingSensitivity = a3;
}

- (float)TrackingSensitivityNoiseMagnitude
{
  return self->_TrackingSensitivityNoiseMagnitude;
}

- (void)setTrackingSensitivityNoiseMagnitude:(float)a3
{
  self->_TrackingSensitivityNoiseMagnitude = a3;
}

- (BOOL)EnableNonlinearFusion
{
  return self->_EnableNonlinearFusion;
}

- (void)setEnableNonlinearFusion:(BOOL)a3
{
  self->_EnableNonlinearFusion = a3;
}

- (BOOL)AttachDebugger
{
  return self->_AttachDebugger;
}

- (void)setAttachDebugger:(BOOL)a3
{
  self->_AttachDebugger = a3;
}

- (BOOL)DumpARKitResult
{
  return self->_DumpARKitResult;
}

- (void)setDumpARKitResult:(BOOL)a3
{
  self->_DumpARKitResult = a3;
}

- (int)DumpFrequency
{
  return self->_DumpFrequency;
}

- (void)setDumpFrequency:(int)a3
{
  self->_DumpFrequency = a3;
}

- (BOOL)StripRawData
{
  return self->_StripRawData;
}

- (void)setStripRawData:(BOOL)a3
{
  self->_StripRawData = a3;
}

- (BOOL)PrintStatistics
{
  return self->_PrintStatistics;
}

- (void)setPrintStatistics:(BOOL)a3
{
  self->_PrintStatistics = a3;
}

- (BOOL)SerializeInternalData
{
  return self->_SerializeInternalData;
}

- (void)setSerializeInternalData:(BOOL)a3
{
  self->_SerializeInternalData = a3;
}

- (BOOL)SerializeRawImages
{
  return self->_SerializeRawImages;
}

- (void)setSerializeRawImages:(BOOL)a3
{
  self->_SerializeRawImages = a3;
}

- (BOOL)Passthrough
{
  return self->_Passthrough;
}

- (void)setPassthrough:(BOOL)a3
{
  self->_Passthrough = a3;
}

- (BOOL)OpenLoopErrorInjectionForTesting
{
  return self->_OpenLoopErrorInjectionForTesting;
}

- (void)setOpenLoopErrorInjectionForTesting:(BOOL)a3
{
  self->_OpenLoopErrorInjectionForTesting = a3;
}

- (NSArray)GTInjections
{
  return (NSArray *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setGTInjections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1336);
}

- (BOOL)EnableDebugDataOutput
{
  return self->_EnableDebugDataOutput;
}

- (void)setEnableDebugDataOutput:(BOOL)a3
{
  self->_EnableDebugDataOutput = a3;
}

- (int)InjectLeftHandsMissingFingerData
{
  return self->_InjectLeftHandsMissingFingerData;
}

- (void)setInjectLeftHandsMissingFingerData:(int)a3
{
  self->_InjectLeftHandsMissingFingerData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_GTInjections, 0);
  objc_storeStrong((id *)&self->_BoneScale, 0);
  objc_storeStrong((id *)&self->_PinchBreakModelName, 0);
  objc_storeStrong((id *)&self->_AcceptorThresholdTimeSinceLastInteraction, 0);
  objc_storeStrong((id *)&self->_AcceptorThresholdSizeOfObjectInPixels, 0);
  objc_storeStrong((id *)&self->_AcceptorThresholdNumberOfObjectInteractions, 0);
  objc_storeStrong((id *)&self->_AcceptorThresholdDistanceToObject, 0);
  objc_storeStrong((id *)&self->_OisPinchAcceptorHighIntentionMakeMinTouchFrameToAllowMakes, 0);
  objc_storeStrong((id *)&self->_OisPinchAcceptorHighIntentionMakeIntentionThresholds, 0);
  objc_storeStrong((id *)&self->_TimeToUseHandCloseToMouthToGateObjectInteractionStates, 0);
  objc_storeStrong((id *)&self->_UseHandCloseToMouthToGateObjectInteractionStateRequireObjects, 0);
  objc_storeStrong((id *)&self->_UseHandCloseToMouthToGateObjectInteractionStateNumberOfRepetitionThresholds, 0);
  objc_storeStrong((id *)&self->_PinchIntentionModelName, 0);
  objc_storeStrong((id *)&self->_CancellationRangeLSTM, 0);
  objc_storeStrong((id *)&self->_CancellationThresholdLSTM, 0);
  objc_storeStrong((id *)&self->_PinchCancellationModelName, 0);
  objc_storeStrong((id *)&self->_MiddleDoubleTapSuppressors, 0);
  objc_storeStrong((id *)&self->_MonoThumbIndexTapModel, 0);
  objc_storeStrong((id *)&self->_MonoPinchModel, 0);
  objc_storeStrong((id *)&self->_SearchBreakThresholdRange, 0);
  objc_storeStrong((id *)&self->_SearchMakeThresholdRange, 0);
  objc_storeStrong((id *)&self->_PinchModel, 0);
  objc_storeStrong((id *)&self->_MonoPoseModel, 0);
  objc_storeStrong((id *)&self->_PoseFilter, 0);
  objc_storeStrong((id *)&self->_HandPresenceOutputSelection, 0);
  objc_storeStrong((id *)&self->_UberPoseModel, 0);
  objc_storeStrong((id *)&self->_HandPresenceModel, 0);
  objc_storeStrong((id *)&self->_PoseModel, 0);
  objc_storeStrong((id *)&self->_PoseCropMode, 0);
  objc_storeStrong((id *)&self->_AvgVelocityLutForSpeed, 0);
  objc_storeStrong((id *)&self->_PredictionErroLutForSpeed, 0);
  objc_storeStrong((id *)&self->_Noise2Ths, 0);
  objc_storeStrong((id *)&self->_FOV2dCircles, 0);
  objc_storeStrong((id *)&self->_SDFOVDistances, 0);
  objc_storeStrong((id *)&self->_SDFOVNoiseValues, 0);
  objc_storeStrong((id *)&self->_DSFOVDistances, 0);
  objc_storeStrong((id *)&self->_DSFOVNoiseValues, 0);
  objc_storeStrong((id *)&self->_DDFOVDistances, 0);
  objc_storeStrong((id *)&self->_DDFOVNoiseValues, 0);
  objc_storeStrong((id *)&self->_MonoDetectionModel, 0);
  objc_storeStrong((id *)&self->_DetectionInputImageStreams, 0);
  objc_storeStrong((id *)&self->_InputImageStreams, 0);
  objc_storeStrong((id *)&self->_HandsGraphType, 0);
  objc_storeStrong((id *)&self->_InputStreamKeyToSource, 0);
}

@end
