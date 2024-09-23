@implementation ARTechnique

void __ARTechnique_Image_to_Result_Timestamp_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CB218;
  v2[1] = &unk_1E66CB248;
  v3[0] = &unk_1E66CB230;
  v3[1] = &unk_1E66CB260;
  v2[2] = &unk_1E66CB278;
  v2[3] = &unk_1E66CB2A8;
  v3[2] = &unk_1E66CB290;
  v3[3] = &unk_1E66CB2C0;
  v2[4] = &unk_1E66CB2D8;
  v2[5] = &unk_1E66CB308;
  v3[4] = &unk_1E66CB2F0;
  v3[5] = &unk_1E66CB320;
  v2[6] = &unk_1E66CB338;
  v2[7] = &unk_1E66CB368;
  v3[6] = &unk_1E66CB350;
  v3[7] = &unk_1E66CB380;
  v2[8] = &unk_1E66CB398;
  v2[9] = &unk_1E66CB3C8;
  v3[8] = &unk_1E66CB3B0;
  v3[9] = &unk_1E66CB3E0;
  v2[10] = &unk_1E66CB3F8;
  v2[11] = &unk_1E66CB428;
  v3[10] = &unk_1E66CB410;
  v3[11] = &unk_1E66CB440;
  v2[12] = &unk_1E66CB458;
  v2[13] = &unk_1E66CB488;
  v3[12] = &unk_1E66CB470;
  v3[13] = &unk_1E66CB4A0;
  v2[14] = &unk_1E66CB4B8;
  v2[15] = &unk_1E66CB4E8;
  v3[14] = &unk_1E66CB4D0;
  v3[15] = &unk_1E66CB500;
  v2[16] = &unk_1E66CB518;
  v2[17] = &unk_1E66CB548;
  v3[16] = &unk_1E66CB530;
  v3[17] = &unk_1E66CB560;
  v2[18] = &unk_1E66CB578;
  v2[19] = &unk_1E66CB5A8;
  v3[18] = &unk_1E66CB590;
  v3[19] = &unk_1E66CB5C0;
  v2[20] = &unk_1E66CB5D8;
  v2[21] = &unk_1E66CB608;
  v3[20] = &unk_1E66CB5F0;
  v3[21] = &unk_1E66CB620;
  v2[22] = &unk_1E66CB638;
  v2[23] = &unk_1E66CB668;
  v3[22] = &unk_1E66CB650;
  v3[23] = &unk_1E66CB680;
  v2[24] = &unk_1E66CB698;
  v2[25] = &unk_1E66CB6C8;
  v3[24] = &unk_1E66CB6B0;
  v3[25] = &unk_1E66CB6E0;
  v2[26] = &unk_1E66CB6F8;
  v2[27] = &unk_1E66CB728;
  v3[26] = &unk_1E66CB710;
  v3[27] = &unk_1E66CB740;
  v2[28] = &unk_1E66CB758;
  v2[29] = &unk_1E66CB788;
  v3[28] = &unk_1E66CB770;
  v3[29] = &unk_1E66CB7A0;
  v2[30] = &unk_1E66CB7B8;
  v2[31] = &unk_1E66CB7E8;
  v3[30] = &unk_1E66CB7D0;
  v3[31] = &unk_1E66CB800;
  v2[32] = &unk_1E66CB818;
  v2[33] = &unk_1E66CB848;
  v3[32] = &unk_1E66CB830;
  v3[33] = &unk_1E66CB860;
  v2[34] = &unk_1E66CB878;
  v2[35] = &unk_1E66CB8A8;
  v3[34] = &unk_1E66CB890;
  v3[35] = &unk_1E66CB8C0;
  v2[36] = &unk_1E66CB8D8;
  v3[36] = &unk_1E66CB8F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Image_to_Result_Timestamp_keyToCode;
  ARTechnique_Image_to_Result_Timestamp_keyToCode = v0;

}

void __ARTechnique_Image_to_Result_Frame_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CB218;
  v2[1] = &unk_1E66CB248;
  v3[0] = &unk_1E66CB908;
  v3[1] = &unk_1E66CB920;
  v2[2] = &unk_1E66CB278;
  v2[3] = &unk_1E66CB2A8;
  v3[2] = &unk_1E66CB938;
  v3[3] = &unk_1E66CB950;
  v2[4] = &unk_1E66CB2D8;
  v2[5] = &unk_1E66CB308;
  v3[4] = &unk_1E66CB968;
  v3[5] = &unk_1E66CB980;
  v2[6] = &unk_1E66CB338;
  v2[7] = &unk_1E66CB368;
  v3[6] = &unk_1E66CB998;
  v3[7] = &unk_1E66CB9B0;
  v2[8] = &unk_1E66CB398;
  v2[9] = &unk_1E66CB3C8;
  v3[8] = &unk_1E66CB9C8;
  v3[9] = &unk_1E66CB9E0;
  v2[10] = &unk_1E66CB3F8;
  v2[11] = &unk_1E66CB428;
  v3[10] = &unk_1E66CB9F8;
  v3[11] = &unk_1E66CBA10;
  v2[12] = &unk_1E66CB458;
  v2[13] = &unk_1E66CB488;
  v3[12] = &unk_1E66CBA28;
  v3[13] = &unk_1E66CBA40;
  v2[14] = &unk_1E66CB4B8;
  v2[15] = &unk_1E66CB4E8;
  v3[14] = &unk_1E66CBA58;
  v3[15] = &unk_1E66CBA70;
  v2[16] = &unk_1E66CB518;
  v2[17] = &unk_1E66CB548;
  v3[16] = &unk_1E66CBA88;
  v3[17] = &unk_1E66CBAA0;
  v2[18] = &unk_1E66CB578;
  v2[19] = &unk_1E66CB5A8;
  v3[18] = &unk_1E66CBAB8;
  v3[19] = &unk_1E66CBAD0;
  v2[20] = &unk_1E66CB5D8;
  v2[21] = &unk_1E66CB608;
  v3[20] = &unk_1E66CBAE8;
  v3[21] = &unk_1E66CBB00;
  v2[22] = &unk_1E66CB638;
  v2[23] = &unk_1E66CB668;
  v3[22] = &unk_1E66CBB18;
  v3[23] = &unk_1E66CBB30;
  v2[24] = &unk_1E66CB698;
  v2[25] = &unk_1E66CB6C8;
  v3[24] = &unk_1E66CBB48;
  v3[25] = &unk_1E66CBB60;
  v2[26] = &unk_1E66CB6F8;
  v2[27] = &unk_1E66CB728;
  v3[26] = &unk_1E66CBB78;
  v3[27] = &unk_1E66CBB90;
  v2[28] = &unk_1E66CB758;
  v2[29] = &unk_1E66CB788;
  v3[28] = &unk_1E66CBBA8;
  v3[29] = &unk_1E66CBBC0;
  v2[30] = &unk_1E66CB7B8;
  v2[31] = &unk_1E66CB7E8;
  v3[30] = &unk_1E66CBBD8;
  v3[31] = &unk_1E66CBBF0;
  v2[32] = &unk_1E66CB818;
  v2[33] = &unk_1E66CB848;
  v3[32] = &unk_1E66CBC08;
  v3[33] = &unk_1E66CBC20;
  v2[34] = &unk_1E66CB878;
  v2[35] = &unk_1E66CB8A8;
  v3[34] = &unk_1E66CBC38;
  v3[35] = &unk_1E66CBC50;
  v2[36] = &unk_1E66CB8D8;
  v3[36] = &unk_1E66CBC68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Image_to_Result_Frame_keyToCode;
  ARTechnique_Image_to_Result_Frame_keyToCode = v0;

}

void __ARTechnique_Image_to_Result_FrameEnd_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CB218;
  v2[1] = &unk_1E66CB248;
  v3[0] = &unk_1E66CBC80;
  v3[1] = &unk_1E66CBC98;
  v2[2] = &unk_1E66CB278;
  v2[3] = &unk_1E66CB2A8;
  v3[2] = &unk_1E66CBCB0;
  v3[3] = &unk_1E66CBCC8;
  v2[4] = &unk_1E66CB2D8;
  v2[5] = &unk_1E66CB308;
  v3[4] = &unk_1E66CBCE0;
  v3[5] = &unk_1E66CBCF8;
  v2[6] = &unk_1E66CB338;
  v2[7] = &unk_1E66CB368;
  v3[6] = &unk_1E66CBD10;
  v3[7] = &unk_1E66CBD28;
  v2[8] = &unk_1E66CB398;
  v2[9] = &unk_1E66CB3C8;
  v3[8] = &unk_1E66CBD40;
  v3[9] = &unk_1E66CBD58;
  v2[10] = &unk_1E66CB3F8;
  v2[11] = &unk_1E66CB428;
  v3[10] = &unk_1E66CBD70;
  v3[11] = &unk_1E66CBD88;
  v2[12] = &unk_1E66CB458;
  v2[13] = &unk_1E66CB488;
  v3[12] = &unk_1E66CBDA0;
  v3[13] = &unk_1E66CBDB8;
  v2[14] = &unk_1E66CB4B8;
  v2[15] = &unk_1E66CB4E8;
  v3[14] = &unk_1E66CBDD0;
  v3[15] = &unk_1E66CBDE8;
  v2[16] = &unk_1E66CB518;
  v2[17] = &unk_1E66CB548;
  v3[16] = &unk_1E66CBE00;
  v3[17] = &unk_1E66CBE18;
  v2[18] = &unk_1E66CB578;
  v2[19] = &unk_1E66CB5A8;
  v3[18] = &unk_1E66CBE30;
  v3[19] = &unk_1E66CBE48;
  v2[20] = &unk_1E66CB5D8;
  v2[21] = &unk_1E66CB608;
  v3[20] = &unk_1E66CBE60;
  v3[21] = &unk_1E66CBE78;
  v2[22] = &unk_1E66CB638;
  v2[23] = &unk_1E66CB668;
  v3[22] = &unk_1E66CBE90;
  v3[23] = &unk_1E66CBEA8;
  v2[24] = &unk_1E66CB698;
  v2[25] = &unk_1E66CB6C8;
  v3[24] = &unk_1E66CBEC0;
  v3[25] = &unk_1E66CBED8;
  v2[26] = &unk_1E66CB6F8;
  v2[27] = &unk_1E66CB728;
  v3[26] = &unk_1E66CBEF0;
  v3[27] = &unk_1E66CBF08;
  v2[28] = &unk_1E66CB758;
  v2[29] = &unk_1E66CB788;
  v3[28] = &unk_1E66CBF20;
  v3[29] = &unk_1E66CBF38;
  v2[30] = &unk_1E66CB7B8;
  v2[31] = &unk_1E66CB7E8;
  v3[30] = &unk_1E66CBF50;
  v3[31] = &unk_1E66CBF68;
  v2[32] = &unk_1E66CB818;
  v2[33] = &unk_1E66CB848;
  v3[32] = &unk_1E66CBF80;
  v3[33] = &unk_1E66CBF98;
  v2[34] = &unk_1E66CB878;
  v2[35] = &unk_1E66CB8A8;
  v3[34] = &unk_1E66CBFB0;
  v3[35] = &unk_1E66CBFC8;
  v2[36] = &unk_1E66CB8D8;
  v3[36] = &unk_1E66CBFE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Image_to_Result_FrameEnd_keyToCode;
  ARTechnique_Image_to_Result_FrameEnd_keyToCode = v0;

}

void __ARTechnique_Image_to_Result_TimestampEnd_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CB218;
  v2[1] = &unk_1E66CB248;
  v3[0] = &unk_1E66CBFF8;
  v3[1] = &unk_1E66CC010;
  v2[2] = &unk_1E66CB278;
  v2[3] = &unk_1E66CB2A8;
  v3[2] = &unk_1E66CC028;
  v3[3] = &unk_1E66CC040;
  v2[4] = &unk_1E66CB2D8;
  v2[5] = &unk_1E66CB308;
  v3[4] = &unk_1E66CC058;
  v3[5] = &unk_1E66CC070;
  v2[6] = &unk_1E66CB338;
  v2[7] = &unk_1E66CB368;
  v3[6] = &unk_1E66CC088;
  v3[7] = &unk_1E66CC0A0;
  v2[8] = &unk_1E66CB398;
  v2[9] = &unk_1E66CB3C8;
  v3[8] = &unk_1E66CC0B8;
  v3[9] = &unk_1E66CC0D0;
  v2[10] = &unk_1E66CB3F8;
  v2[11] = &unk_1E66CB428;
  v3[10] = &unk_1E66CC0E8;
  v3[11] = &unk_1E66CC100;
  v2[12] = &unk_1E66CB458;
  v2[13] = &unk_1E66CB488;
  v3[12] = &unk_1E66CC118;
  v3[13] = &unk_1E66CC130;
  v2[14] = &unk_1E66CB4B8;
  v2[15] = &unk_1E66CB4E8;
  v3[14] = &unk_1E66CC148;
  v3[15] = &unk_1E66CC160;
  v2[16] = &unk_1E66CB518;
  v2[17] = &unk_1E66CB548;
  v3[16] = &unk_1E66CC178;
  v3[17] = &unk_1E66CC190;
  v2[18] = &unk_1E66CB578;
  v2[19] = &unk_1E66CB5A8;
  v3[18] = &unk_1E66CC1A8;
  v3[19] = &unk_1E66CC1C0;
  v2[20] = &unk_1E66CB5D8;
  v2[21] = &unk_1E66CB608;
  v3[20] = &unk_1E66CC1D8;
  v3[21] = &unk_1E66CC1F0;
  v2[22] = &unk_1E66CB638;
  v2[23] = &unk_1E66CB668;
  v3[22] = &unk_1E66CC208;
  v3[23] = &unk_1E66CC220;
  v2[24] = &unk_1E66CB698;
  v2[25] = &unk_1E66CB6C8;
  v3[24] = &unk_1E66CC238;
  v3[25] = &unk_1E66CC250;
  v2[26] = &unk_1E66CB6F8;
  v2[27] = &unk_1E66CB728;
  v3[26] = &unk_1E66CC268;
  v3[27] = &unk_1E66CC280;
  v2[28] = &unk_1E66CB758;
  v2[29] = &unk_1E66CB788;
  v3[28] = &unk_1E66CC298;
  v3[29] = &unk_1E66CC2B0;
  v2[30] = &unk_1E66CB7B8;
  v2[31] = &unk_1E66CB7E8;
  v3[30] = &unk_1E66CC2C8;
  v3[31] = &unk_1E66CC2E0;
  v2[32] = &unk_1E66CB818;
  v2[33] = &unk_1E66CB848;
  v3[32] = &unk_1E66CC2F8;
  v3[33] = &unk_1E66CC310;
  v2[34] = &unk_1E66CB878;
  v2[35] = &unk_1E66CB8A8;
  v3[34] = &unk_1E66CC328;
  v3[35] = &unk_1E66CC340;
  v2[36] = &unk_1E66CB8D8;
  v3[36] = &unk_1E66CC358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Image_to_Result_TimestampEnd_keyToCode;
  ARTechnique_Image_to_Result_TimestampEnd_keyToCode = v0;

}

+ (id)colorForTechnique:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  int v10;
  uint64_t i;
  void *v12;
  void *v13;

  v3 = a3;
  if (colorForTechnique__dotColorsOnceToken != -1)
    dispatch_once(&colorForTechnique__dotColorsOnceToken, &__block_literal_global_29);
  if (colorForTechnique__onceToken != -1)
    dispatch_once(&colorForTechnique__onceToken, &__block_literal_global_30);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorForTechnique__colorForTechnique, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)colorForTechnique__dotColors;
    v8 = v5;
    v9 = objc_msgSend(v8, "length");
    if (v9)
    {
      v10 = 0;
      for (i = 0; i != v9; ++i)
        v10 = objc_msgSend(v8, "characterAtIndex:", i) + 263 * v10;
      v9 = v10 & 0x1FFF;
    }

    objc_msgSend(v7, "objectAtIndexedSubscript:", v9 % objc_msgSend((id)colorForTechnique__dotColors, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)colorForTechnique__colorForTechnique, "setObject:forKeyedSubscript:", v12, v8);

  }
  objc_msgSend((id)colorForTechnique__colorForTechnique, "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __43__ARTechnique_DotGraph__colorForTechnique___block_invoke()
{
  void *v0;

  v0 = (void *)colorForTechnique__dotColors;
  colorForTechnique__dotColors = (uint64_t)&unk_1E66CEA90;

}

void __43__ARTechnique_DotGraph__colorForTechnique___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)colorForTechnique__colorForTechnique;
  colorForTechnique__colorForTechnique = v0;

}

- (void)dotGraphWithLines:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  id v23;
  double v24;
  double v25;
  id v26;
  double v27;
  id v28;
  int v29;
  const __CFString *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  char v47;
  __CFString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  id v59;
  ARTechnique *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id location;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v60 = self;
  -[ARTechnique delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ARTechnique delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[ARTechnique delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARTechnique delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARTechnique colorForTechnique:](ARTechnique, "colorForTechnique:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("\"(%p)\"[style=filled fillcolor=%@]"), v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v11);

      v12 = (void *)MEMORY[0x1E0CB3940];
      -[ARTechnique delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("\"(%p)\" -> \"(%p)\"[arrowhead=\"empty\" style=dotted]"), self, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v14);

    }
  }
  v15 = (void *)MEMORY[0x1E0CB37A0];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("\"(%p)\"[label=\"{%@|(%p)"), self, v17, self);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_initWeak(&location, self);
    -[ARTechnique imageSize](self, "imageSize");
    v20 = v19;
    v21 = objc_loadWeakRetained(&location);
    objc_msgSend(v21, "imageSize");
    objc_msgSend(v58, "appendFormat:", CFSTR("|(%d x %d)"), (int)v20, (int)v22);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = objc_initWeak(&location, self);
      -[ARTechnique networkInputScaleBeforeRotation](self, "networkInputScaleBeforeRotation");
      v25 = v24;
      v26 = objc_loadWeakRetained(&location);
      objc_msgSend(v26, "networkInputScaleBeforeRotation");
      objc_msgSend(v58, "appendFormat:", CFSTR("|(%d x %d)"), (int)v25, (int)v27);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_initWeak(&location, self);
        v29 = -[ARTechnique isParallel](self, "isParallel");
        v30 = CFSTR("Sequential");
        if (v29)
          v30 = CFSTR("Parallel");
        objc_msgSend(v58, "appendFormat:", CFSTR("|%@"), v30);

        objc_destroyWeak(&location);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_initWeak(&location, self);
          objc_msgSend(v58, "appendString:", CFSTR("|{ℹ"));
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v31 = objc_loadWeakRetained(&location);
          objc_msgSend(v31, "synchronizedResultDataClasses");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v70 != v34)
                  objc_enumerationMutation(v32);
                NSStringFromClass(*(Class *)(*((_QWORD *)&v69 + 1) + 8 * i));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "appendFormat:", CFSTR("|%@"), v36);

              }
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
            }
            while (v33);
          }

          objc_msgSend(v58, "appendString:", CFSTR("}"));
          objc_destroyWeak(&location);
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[ARTechnique performSelector:](v60, "performSelector:", sel_shouldOperateOnHighResolutionImages))
  {
    objc_msgSend(v58, "appendString:", CFSTR("|HighResOnly"));
  }
  -[ARTechnique requiredTimeInterval](v60, "requiredTimeInterval");
  if (v37 > 0.0)
  {
    -[ARTechnique requiredTimeInterval](v60, "requiredTimeInterval");
    objc_msgSend(v58, "appendFormat:", CFSTR("|Required time interval: %dms"), (int)(v38 * 1000.0));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[ARTechnique resultDataClasses](v60, "resultDataClasses");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      objc_msgSend(v58, "appendString:", CFSTR("|{ℹ"));
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      -[ARTechnique resultDataClasses](v60, "resultDataClasses");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v66 != v43)
              objc_enumerationMutation(v41);
            NSStringFromClass(*(Class *)(*((_QWORD *)&v65 + 1) + 8 * j));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "appendFormat:", CFSTR("|%@"), v45);

          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        }
        while (v42);
      }

      objc_msgSend(v58, "appendString:", CFSTR("}"));
    }
  }
  objc_msgSend(v58, "appendString:", CFSTR("}\"]"));
  v46 = (void *)MEMORY[0x1E0CB3940];
  objc_opt_class();
  v47 = objc_opt_isKindOfClass();
  if ((v47 & 1) != 0)
  {
    v48 = CFSTR("lightgray");
  }
  else
  {
    +[ARTechnique colorForTechnique:](ARTechnique, "colorForTechnique:", v60);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v46, "stringWithFormat:", CFSTR("%@[style=filled fillcolor=%@]"), v58, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObject:", v49);

  if ((v47 & 1) == 0)
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[ARTechnique splitTechniques](v60, "splitTechniques");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v62 != v52)
          objc_enumerationMutation(v50);
        v54 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
        v55 = (void *)MEMORY[0x1E0CB3940];
        objc_opt_class();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v56 = CFSTR("[shape=square]");
        else
          v56 = &stru_1E6676798;
        objc_msgSend(v55, "stringWithFormat:", CFSTR("\"(%p)\"%@ -> \"(%p)\"[style=dashed penwidth=5]"), v60, v56, v54);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObject:", v57);

        objc_msgSend(v54, "dotGraphWithLines:", v59);
      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v51);
  }

}

- (ARTechnique)init
{
  ARTechnique *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NSNumber *traceKey;
  NSArray *splitTechniques;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ARTechnique;
  v2 = -[ARTechnique init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      for (i = 0; i != v7; ++i)
        v8 = objc_msgSend(v5, "characterAtIndex:", i) + 263 * v8;
      v10 = v8 & 0x1FFF;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v3, "numberWithUnsignedShort:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    traceKey = v2->_traceKey;
    v2->_traceKey = (NSNumber *)v11;

    splitTechniques = v2->_splitTechniques;
    v2->_splitTechniques = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v2;
}

- (unint64_t)requiredSensorDataTypes
{
  return 0;
}

- (unint64_t)optionalSensorDataTypes
{
  return 0;
}

- (double)requiredTimeInterval
{
  return 0.0;
}

- (int64_t)captureBehavior
{
  return 0;
}

- (BOOL)deterministicMode
{
  return 0;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "splitTechniques");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARTechnique setSplitTechniques:](self, "setSplitTechniques:", v5);

  objc_msgSend(v4, "splitTechniqueFowardingStrategy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ARTechnique setSplitTechniqueFowardingStrategy:](self, "setSplitTechniqueFowardingStrategy:", v6);
}

- (id)processData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ARTechnique splitTechniques](self, "splitTechniques", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v7 = v4;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    v7 = v4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[ARTechnique splitTechniqueFowardingStrategy](self, "splitTechniqueFowardingStrategy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12
          || (-[ARTechnique splitTechniqueFowardingStrategy](self, "splitTechniqueFowardingStrategy"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "shouldProcessData:", v7),
              v13,
              v14))
        {
          objc_msgSend(v11, "processData:", v7);
          v15 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v15;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v7;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a4;
  -[ARTechnique delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v9, a3);

  }
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  return a3;
}

- (id)techniqueOfClass:(Class)a3
{
  ARTechnique *v4;

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = self;
  else
    v4 = 0;
  return v4;
}

+ (id)techniqueOfClass:(Class)a3 inArray:(id)a4
{
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy_;
      v21 = __Block_byref_object_dispose_;
      objc_msgSend(v10, "techniqueOfClass:", a3);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (void *)v18[5];
      if (v11)
        goto LABEL_8;
      objc_msgSend(v10, "splitTechniques");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __40__ARTechnique_techniqueOfClass_inArray___block_invoke;
      v16[3] = &unk_1E66738B0;
      v16[4] = &v17;
      v16[5] = a3;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

      v11 = (void *)v18[5];
      if (v11)
      {
LABEL_8:
        v4 = v11;
        v13 = 0;
      }
      else
      {
        v13 = 1;
      }
      _Block_object_dispose(&v17, 8);

      if (!v13)
        break;
      if (v7 == ++v9)
      {
        v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v7 = v14;
        if (v14)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v4 = 0;
  }

  return v4;
}

void __40__ARTechnique_techniqueOfClass_inArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "techniqueOfClass:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a4 = 1;
}

- (id)techniqueMatchingPredicate:(id)a3
{
  ARTechnique *v4;

  if (objc_msgSend(a3, "evaluateWithObject:", self))
    v4 = self;
  else
    v4 = 0;
  return v4;
}

+ (id)techniqueMatchingPredicate:(id)a3 inArray:(id)a4
{
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy_;
      v24 = __Block_byref_object_dispose_;
      objc_msgSend(v11, "techniqueMatchingPredicate:", v6);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (void *)v21[5];
      if (v12)
      {
        v4 = v12;
        v13 = 1;
      }
      else
      {
        objc_msgSend(v11, "splitTechniques");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __50__ARTechnique_techniqueMatchingPredicate_inArray___block_invoke;
        v17[3] = &unk_1E66738D8;
        v19 = &v20;
        v18 = v6;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

        v15 = (void *)v21[5];
        if (v15)
        {
          v4 = v15;
          v13 = 1;
        }
        else
        {
          v13 = 0;
        }

      }
      _Block_object_dispose(&v20, 8);

      if (v13)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v4 = 0;
  }

  return v4;
}

void __50__ARTechnique_techniqueMatchingPredicate_inArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "techniqueMatchingPredicate:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return 0;
}

- (id)techniques
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@(%p)>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[ARTechnique splitTechniques](self, "splitTechniques");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "splitTechniques");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      -[ARTechnique splitTechniqueFowardingStrategy](self, "splitTechniqueFowardingStrategy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "splitTechniqueFowardingStrategy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 == v10;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  ARTechniqueForwardingStrategy *splitTechniqueFowardingStrategy;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[ARTechnique description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARTechnique requiredTimeInterval](self, "requiredTimeInterval");
  objc_msgSend(v5, "appendFormat:", CFSTR(" time: %lfs"), v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = -[ARTechnique performSelector:](self, "performSelector:", sel_isBusy);
    v8 = CFSTR("Busy");
    if (!v7)
      v8 = CFSTR("NotBusy");
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v8);
  }
  v9 = -[ARTechnique deterministicMode](self, "deterministicMode");
  v10 = CFSTR("Non-Deterministic");
  if (v9)
    v10 = CFSTR("Deterministic");
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v10);
  splitTechniqueFowardingStrategy = self->_splitTechniqueFowardingStrategy;
  if (splitTechniqueFowardingStrategy)
  {
    -[ARTechniqueForwardingStrategy description](splitTechniqueFowardingStrategy, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\nForwarding Strategy: %@"), v12);

  }
  if (-[NSArray count](self->_splitTechniques, "count"))
  {
    v13 = v5;
    objc_msgSend(v5, "appendFormat:", CFSTR("\nSplit Techniques:"));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_splitTechniques;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "_fullDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t|\t"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "appendFormat:", CFSTR("\n\t| - %@"), v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v5 = v13;
  }
  return v5;
}

- (ARTechnique)initWithTechniques:(id)a3
{
  id v4;
  ARParentTechnique *v5;

  v4 = a3;
  v5 = -[ARParentTechnique initWithTechniques:]([ARParentTechnique alloc], "initWithTechniques:", v4);

  return &v5->super;
}

- (ARTechnique)initWithParallelTechniques:(id)a3
{
  id v4;
  ARParentTechnique *v5;

  v4 = a3;
  v5 = -[ARParentTechnique initWithParallelTechniques:]([ARParentTechnique alloc], "initWithParallelTechniques:", v4);

  return &v5->super;
}

- (double)bonusLatency
{
  return self->_bonusLatency;
}

- (void)setBonusLatency:(double)a3
{
  self->_bonusLatency = a3;
}

- (NSNumber)traceKey
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (ARTechniqueDelegate)delegate
{
  return (ARTechniqueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (void)setPowerUsage:(unint64_t)a3
{
  self->_powerUsage = a3;
}

- (ARTechniqueForwardingStrategy)splitTechniqueFowardingStrategy
{
  return (ARTechniqueForwardingStrategy *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSplitTechniqueFowardingStrategy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)splitTechniques
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSplitTechniques:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitTechniques, 0);
  objc_storeStrong((id *)&self->_splitTechniqueFowardingStrategy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traceKey, 0);
}

void __ARTechnique_Request_to_Result_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CC400;
  v2[1] = &unk_1E66CC430;
  v3[0] = &unk_1E66CC418;
  v3[1] = &unk_1E66CC448;
  v2[2] = &unk_1E66CC460;
  v2[3] = &unk_1E66CC490;
  v3[2] = &unk_1E66CC478;
  v3[3] = &unk_1E66CC4A8;
  v2[4] = &unk_1E66CC4C0;
  v2[5] = &unk_1E66CC4F0;
  v3[4] = &unk_1E66CC4D8;
  v3[5] = &unk_1E66CC508;
  v2[6] = &unk_1E66CC520;
  v2[7] = &unk_1E66CC550;
  v3[6] = &unk_1E66CC538;
  v3[7] = &unk_1E66CC568;
  v2[8] = &unk_1E66CC580;
  v2[9] = &unk_1E66CC5B0;
  v3[8] = &unk_1E66CC598;
  v3[9] = &unk_1E66CC5C8;
  v2[10] = &unk_1E66CC5E0;
  v2[11] = &unk_1E66CC610;
  v3[10] = &unk_1E66CC5F8;
  v3[11] = &unk_1E66CC628;
  v2[12] = &unk_1E66CC640;
  v2[13] = &unk_1E66CC670;
  v3[12] = &unk_1E66CC658;
  v3[13] = &unk_1E66CC688;
  v2[14] = &unk_1E66CC6A0;
  v2[15] = &unk_1E66CC6D0;
  v3[14] = &unk_1E66CC6B8;
  v3[15] = &unk_1E66CC6E8;
  v2[16] = &unk_1E66CC700;
  v2[17] = &unk_1E66CC730;
  v3[16] = &unk_1E66CC718;
  v3[17] = &unk_1E66CC748;
  v2[18] = &unk_1E66CC760;
  v2[19] = &unk_1E66CC790;
  v3[18] = &unk_1E66CC778;
  v3[19] = &unk_1E66CC7A8;
  v2[20] = &unk_1E66CC7C0;
  v2[21] = &unk_1E66CC7F0;
  v3[20] = &unk_1E66CC7D8;
  v3[21] = &unk_1E66CC808;
  v2[22] = &unk_1E66CC820;
  v2[23] = &unk_1E66CC850;
  v3[22] = &unk_1E66CC838;
  v3[23] = &unk_1E66CC868;
  v2[24] = &unk_1E66CC880;
  v2[25] = &unk_1E66CC8B0;
  v3[24] = &unk_1E66CC898;
  v3[25] = &unk_1E66CC8C8;
  v2[26] = &unk_1E66CC8E0;
  v2[27] = &unk_1E66CC910;
  v3[26] = &unk_1E66CC8F8;
  v3[27] = &unk_1E66CC928;
  v2[28] = &unk_1E66CC940;
  v2[29] = &unk_1E66CC970;
  v3[28] = &unk_1E66CC958;
  v3[29] = &unk_1E66CC988;
  v2[30] = &unk_1E66CC9A0;
  v2[31] = &unk_1E66CC9D0;
  v3[30] = &unk_1E66CC9B8;
  v3[31] = &unk_1E66CC9E8;
  v2[32] = &unk_1E66CCA00;
  v2[33] = &unk_1E66CCA30;
  v3[32] = &unk_1E66CCA18;
  v3[33] = &unk_1E66CCA48;
  v2[34] = &unk_1E66CCA60;
  v2[35] = &unk_1E66CCA90;
  v3[34] = &unk_1E66CCA78;
  v3[35] = &unk_1E66CCAA8;
  v2[36] = &unk_1E66CCAC0;
  v3[36] = &unk_1E66CCAD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Request_to_Result_keyToCode;
  ARTechnique_Request_to_Result_keyToCode = v0;

}

void __ARTechnique_Request_begin_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CC400;
  v2[1] = &unk_1E66CC430;
  v3[0] = &unk_1E66CCAF0;
  v3[1] = &unk_1E66CCB08;
  v2[2] = &unk_1E66CC460;
  v2[3] = &unk_1E66CC490;
  v3[2] = &unk_1E66CCB20;
  v3[3] = &unk_1E66CCB38;
  v2[4] = &unk_1E66CC4C0;
  v2[5] = &unk_1E66CC4F0;
  v3[4] = &unk_1E66CCB50;
  v3[5] = &unk_1E66CCB68;
  v2[6] = &unk_1E66CC520;
  v2[7] = &unk_1E66CC550;
  v3[6] = &unk_1E66CCB80;
  v3[7] = &unk_1E66CCB98;
  v2[8] = &unk_1E66CC580;
  v2[9] = &unk_1E66CC5B0;
  v3[8] = &unk_1E66CCBB0;
  v3[9] = &unk_1E66CCBC8;
  v2[10] = &unk_1E66CC5E0;
  v2[11] = &unk_1E66CC610;
  v3[10] = &unk_1E66CCBE0;
  v3[11] = &unk_1E66CCBF8;
  v2[12] = &unk_1E66CC640;
  v2[13] = &unk_1E66CC670;
  v3[12] = &unk_1E66CCC10;
  v3[13] = &unk_1E66CCC28;
  v2[14] = &unk_1E66CC6A0;
  v2[15] = &unk_1E66CC6D0;
  v3[14] = &unk_1E66CCC40;
  v3[15] = &unk_1E66CCC58;
  v2[16] = &unk_1E66CC700;
  v2[17] = &unk_1E66CC730;
  v3[16] = &unk_1E66CCC70;
  v3[17] = &unk_1E66CCC88;
  v2[18] = &unk_1E66CC760;
  v2[19] = &unk_1E66CC790;
  v3[18] = &unk_1E66CCCA0;
  v3[19] = &unk_1E66CCCB8;
  v2[20] = &unk_1E66CC7C0;
  v2[21] = &unk_1E66CC7F0;
  v3[20] = &unk_1E66CCCD0;
  v3[21] = &unk_1E66CCCE8;
  v2[22] = &unk_1E66CC820;
  v2[23] = &unk_1E66CC850;
  v3[22] = &unk_1E66CCD00;
  v3[23] = &unk_1E66CCD18;
  v2[24] = &unk_1E66CC880;
  v2[25] = &unk_1E66CC8B0;
  v3[24] = &unk_1E66CCD30;
  v3[25] = &unk_1E66CCD48;
  v2[26] = &unk_1E66CC8E0;
  v2[27] = &unk_1E66CC910;
  v3[26] = &unk_1E66CCD60;
  v3[27] = &unk_1E66CCD78;
  v2[28] = &unk_1E66CC940;
  v2[29] = &unk_1E66CC970;
  v3[28] = &unk_1E66CCD90;
  v3[29] = &unk_1E66CCDA8;
  v2[30] = &unk_1E66CC9A0;
  v2[31] = &unk_1E66CC9D0;
  v3[30] = &unk_1E66CCDC0;
  v3[31] = &unk_1E66CCDD8;
  v2[32] = &unk_1E66CCA00;
  v2[33] = &unk_1E66CCA30;
  v3[32] = &unk_1E66CCDF0;
  v3[33] = &unk_1E66CCE08;
  v2[34] = &unk_1E66CCA60;
  v2[35] = &unk_1E66CCA90;
  v3[34] = &unk_1E66CCE20;
  v3[35] = &unk_1E66CCE38;
  v2[36] = &unk_1E66CCAC0;
  v3[36] = &unk_1E66CCE50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Request_begin_keyToCode;
  ARTechnique_Request_begin_keyToCode = v0;

}

void __ARTechnique_Request_to_ResultEnd_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CC400;
  v2[1] = &unk_1E66CC430;
  v3[0] = &unk_1E66CCE68;
  v3[1] = &unk_1E66CCE80;
  v2[2] = &unk_1E66CC460;
  v2[3] = &unk_1E66CC490;
  v3[2] = &unk_1E66CCE98;
  v3[3] = &unk_1E66CCEB0;
  v2[4] = &unk_1E66CC4C0;
  v2[5] = &unk_1E66CC4F0;
  v3[4] = &unk_1E66CCEC8;
  v3[5] = &unk_1E66CCEE0;
  v2[6] = &unk_1E66CC520;
  v2[7] = &unk_1E66CC550;
  v3[6] = &unk_1E66CCEF8;
  v3[7] = &unk_1E66CCF10;
  v2[8] = &unk_1E66CC580;
  v2[9] = &unk_1E66CC5B0;
  v3[8] = &unk_1E66CCF28;
  v3[9] = &unk_1E66CCF40;
  v2[10] = &unk_1E66CC5E0;
  v2[11] = &unk_1E66CC610;
  v3[10] = &unk_1E66CCF58;
  v3[11] = &unk_1E66CCF70;
  v2[12] = &unk_1E66CC640;
  v2[13] = &unk_1E66CC670;
  v3[12] = &unk_1E66CCF88;
  v3[13] = &unk_1E66CCFA0;
  v2[14] = &unk_1E66CC6A0;
  v2[15] = &unk_1E66CC6D0;
  v3[14] = &unk_1E66CCFB8;
  v3[15] = &unk_1E66CCFD0;
  v2[16] = &unk_1E66CC700;
  v2[17] = &unk_1E66CC730;
  v3[16] = &unk_1E66CCFE8;
  v3[17] = &unk_1E66CD000;
  v2[18] = &unk_1E66CC760;
  v2[19] = &unk_1E66CC790;
  v3[18] = &unk_1E66CD018;
  v3[19] = &unk_1E66CD030;
  v2[20] = &unk_1E66CC7C0;
  v2[21] = &unk_1E66CC7F0;
  v3[20] = &unk_1E66CD048;
  v3[21] = &unk_1E66CD060;
  v2[22] = &unk_1E66CC820;
  v2[23] = &unk_1E66CC850;
  v3[22] = &unk_1E66CD078;
  v3[23] = &unk_1E66CD090;
  v2[24] = &unk_1E66CC880;
  v2[25] = &unk_1E66CC8B0;
  v3[24] = &unk_1E66CD0A8;
  v3[25] = &unk_1E66CD0C0;
  v2[26] = &unk_1E66CC8E0;
  v2[27] = &unk_1E66CC910;
  v3[26] = &unk_1E66CD0D8;
  v3[27] = &unk_1E66CD0F0;
  v2[28] = &unk_1E66CC940;
  v2[29] = &unk_1E66CC970;
  v3[28] = &unk_1E66CD108;
  v3[29] = &unk_1E66CD120;
  v2[30] = &unk_1E66CC9A0;
  v2[31] = &unk_1E66CC9D0;
  v3[30] = &unk_1E66CD138;
  v3[31] = &unk_1E66CD150;
  v2[32] = &unk_1E66CCA00;
  v2[33] = &unk_1E66CCA30;
  v3[32] = &unk_1E66CD168;
  v3[33] = &unk_1E66CD180;
  v2[34] = &unk_1E66CCA60;
  v2[35] = &unk_1E66CCA90;
  v3[34] = &unk_1E66CD198;
  v3[35] = &unk_1E66CD1B0;
  v2[36] = &unk_1E66CCAC0;
  v3[36] = &unk_1E66CD1C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Request_to_ResultEnd_keyToCode;
  ARTechnique_Request_to_ResultEnd_keyToCode = v0;

}

void __ARTechnique_Request_fulfilled_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CC400;
  v2[1] = &unk_1E66CC430;
  v3[0] = &unk_1E66CD1E0;
  v3[1] = &unk_1E66CD1F8;
  v2[2] = &unk_1E66CC460;
  v2[3] = &unk_1E66CC490;
  v3[2] = &unk_1E66CD210;
  v3[3] = &unk_1E66CD228;
  v2[4] = &unk_1E66CC4C0;
  v2[5] = &unk_1E66CC4F0;
  v3[4] = &unk_1E66CD240;
  v3[5] = &unk_1E66CD258;
  v2[6] = &unk_1E66CC520;
  v2[7] = &unk_1E66CC550;
  v3[6] = &unk_1E66CD270;
  v3[7] = &unk_1E66CD288;
  v2[8] = &unk_1E66CC580;
  v2[9] = &unk_1E66CC5B0;
  v3[8] = &unk_1E66CD2A0;
  v3[9] = &unk_1E66CD2B8;
  v2[10] = &unk_1E66CC5E0;
  v2[11] = &unk_1E66CC610;
  v3[10] = &unk_1E66CD2D0;
  v3[11] = &unk_1E66CD2E8;
  v2[12] = &unk_1E66CC640;
  v2[13] = &unk_1E66CC670;
  v3[12] = &unk_1E66CD300;
  v3[13] = &unk_1E66CD318;
  v2[14] = &unk_1E66CC6A0;
  v2[15] = &unk_1E66CC6D0;
  v3[14] = &unk_1E66CD330;
  v3[15] = &unk_1E66CD348;
  v2[16] = &unk_1E66CC700;
  v2[17] = &unk_1E66CC730;
  v3[16] = &unk_1E66CD360;
  v3[17] = &unk_1E66CD378;
  v2[18] = &unk_1E66CC760;
  v2[19] = &unk_1E66CC790;
  v3[18] = &unk_1E66CD390;
  v3[19] = &unk_1E66CD3A8;
  v2[20] = &unk_1E66CC7C0;
  v2[21] = &unk_1E66CC7F0;
  v3[20] = &unk_1E66CD3C0;
  v3[21] = &unk_1E66CD3D8;
  v2[22] = &unk_1E66CC820;
  v2[23] = &unk_1E66CC850;
  v3[22] = &unk_1E66CD3F0;
  v3[23] = &unk_1E66CD408;
  v2[24] = &unk_1E66CC880;
  v2[25] = &unk_1E66CC8B0;
  v3[24] = &unk_1E66CD420;
  v3[25] = &unk_1E66CD438;
  v2[26] = &unk_1E66CC8E0;
  v2[27] = &unk_1E66CC910;
  v3[26] = &unk_1E66CD450;
  v3[27] = &unk_1E66CD468;
  v2[28] = &unk_1E66CC940;
  v2[29] = &unk_1E66CC970;
  v3[28] = &unk_1E66CD480;
  v3[29] = &unk_1E66CD498;
  v2[30] = &unk_1E66CC9A0;
  v2[31] = &unk_1E66CC9D0;
  v3[30] = &unk_1E66CD4B0;
  v3[31] = &unk_1E66CD4C8;
  v2[32] = &unk_1E66CCA00;
  v2[33] = &unk_1E66CCA30;
  v3[32] = &unk_1E66CD4E0;
  v3[33] = &unk_1E66CD4F8;
  v2[34] = &unk_1E66CCA60;
  v2[35] = &unk_1E66CCA90;
  v3[34] = &unk_1E66CD510;
  v3[35] = &unk_1E66CD528;
  v2[36] = &unk_1E66CCAC0;
  v3[36] = &unk_1E66CD540;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Request_fulfilled_keyToCode;
  ARTechnique_Request_fulfilled_keyToCode = v0;

}

void __ARTechnique_Result_Drop_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E66CD738;
  v2[1] = &unk_1E66CD768;
  v3[0] = &unk_1E66CD750;
  v3[1] = &unk_1E66CD780;
  v2[2] = &unk_1E66CD798;
  v2[3] = &unk_1E66CD7C8;
  v3[2] = &unk_1E66CD7B0;
  v3[3] = &unk_1E66CD7E0;
  v2[4] = &unk_1E66CD7F8;
  v2[5] = &unk_1E66CD828;
  v3[4] = &unk_1E66CD810;
  v3[5] = &unk_1E66CD840;
  v2[6] = &unk_1E66CD858;
  v2[7] = &unk_1E66CD888;
  v3[6] = &unk_1E66CD870;
  v3[7] = &unk_1E66CD8A0;
  v2[8] = &unk_1E66CD8B8;
  v2[9] = &unk_1E66CD8E8;
  v3[8] = &unk_1E66CD8D0;
  v3[9] = &unk_1E66CD900;
  v2[10] = &unk_1E66CD918;
  v2[11] = &unk_1E66CD948;
  v3[10] = &unk_1E66CD930;
  v3[11] = &unk_1E66CD960;
  v2[12] = &unk_1E66CD978;
  v2[13] = &unk_1E66CD9A8;
  v3[12] = &unk_1E66CD990;
  v3[13] = &unk_1E66CD9C0;
  v2[14] = &unk_1E66CD9D8;
  v2[15] = &unk_1E66CDA08;
  v3[14] = &unk_1E66CD9F0;
  v3[15] = &unk_1E66CDA20;
  v2[16] = &unk_1E66CDA38;
  v2[17] = &unk_1E66CDA68;
  v3[16] = &unk_1E66CDA50;
  v3[17] = &unk_1E66CDA80;
  v2[18] = &unk_1E66CDA98;
  v2[19] = &unk_1E66CDAC8;
  v3[18] = &unk_1E66CDAB0;
  v3[19] = &unk_1E66CDAE0;
  v2[20] = &unk_1E66CDAF8;
  v2[21] = &unk_1E66CDB28;
  v3[20] = &unk_1E66CDB10;
  v3[21] = &unk_1E66CDB40;
  v2[22] = &unk_1E66CDB58;
  v2[23] = &unk_1E66CDB88;
  v3[22] = &unk_1E66CDB70;
  v3[23] = &unk_1E66CDBA0;
  v2[24] = &unk_1E66CDBB8;
  v2[25] = &unk_1E66CDBE8;
  v3[24] = &unk_1E66CDBD0;
  v3[25] = &unk_1E66CDC00;
  v2[26] = &unk_1E66CDC18;
  v2[27] = &unk_1E66CDC48;
  v3[26] = &unk_1E66CDC30;
  v3[27] = &unk_1E66CDC60;
  v2[28] = &unk_1E66CDC78;
  v2[29] = &unk_1E66CDCA8;
  v3[28] = &unk_1E66CDC90;
  v3[29] = &unk_1E66CDCC0;
  v2[30] = &unk_1E66CDCD8;
  v2[31] = &unk_1E66CDD08;
  v3[30] = &unk_1E66CDCF0;
  v3[31] = &unk_1E66CDD20;
  v2[32] = &unk_1E66CDD38;
  v2[33] = &unk_1E66CDD50;
  v3[32] = &unk_1E66CDD38;
  v3[33] = &unk_1E66CDD68;
  v2[34] = &unk_1E66CDD80;
  v2[35] = &unk_1E66CDDB0;
  v3[34] = &unk_1E66CDD98;
  v3[35] = &unk_1E66CDDC8;
  v2[36] = &unk_1E66CDDE0;
  v3[36] = &unk_1E66CDDF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARTechnique_Result_Drop_keyToCode;
  ARTechnique_Result_Drop_keyToCode = v0;

}

@end
