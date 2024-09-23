@implementation AVTAvatarAttributeEditorState

+ (id)buildStateFromCoreModel:(id)a3 avatarConfiguration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  AVTAvatarAttributeEditorState *v52;
  AVTAvatarAttributeEditorState *v53;
  void *v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v55 = v5;
  objc_msgSend(v5, "groups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v92;
    v72 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v92 != v57)
          objc_enumerationMutation(obj);
        v59 = v7;
        v8 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v7);
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_msgSend(v8, "categories");
        v61 = (id)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
        if (v63)
        {
          v62 = *(_QWORD *)v88;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v88 != v62)
                objc_enumerationMutation(v61);
              v64 = v9;
              v10 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v9);
              objc_msgSend(v10, "pairing");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11)
              {
                objc_msgSend(v6, "presetForCategory:", objc_msgSend(v10, "presetCategory"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "pairing");
                v13 = v6;
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "presetForCategory:", objc_msgSend(v14, "pairedCategory"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqualToString:", v17);

                if (v18)
                {
                  v19 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v10, "pairing");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "pairedCategory"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v21);

                }
                v6 = v72;
              }
              v85 = 0u;
              v86 = 0u;
              v83 = 0u;
              v84 = 0u;
              objc_msgSend(v10, "pickers");
              v68 = (id)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v84;
                v65 = *(_QWORD *)v84;
                do
                {
                  v25 = 0;
                  v66 = v23;
                  do
                  {
                    if (*(_QWORD *)v84 != v24)
                      objc_enumerationMutation(v68);
                    v26 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v25);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v27 = v26;
                      v79 = 0u;
                      v80 = 0u;
                      v81 = 0u;
                      v82 = 0u;
                      objc_msgSend(v27, "subpickers");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
                      if (v29)
                      {
                        v69 = v27;
                        v70 = v25;
                        v30 = 0;
                        v31 = 0;
                        v32 = *(_QWORD *)v80;
                        v33 = -1;
                        v73 = v28;
                        v74 = *(_QWORD *)v80;
                        do
                        {
                          v34 = 0;
                          v71 = v31 + v29;
                          v35 = v30;
                          v36 = v33;
                          v77 = v31;
                          v78 = v29;
                          do
                          {
                            if (*(_QWORD *)v80 != v32)
                              objc_enumerationMutation(v28);
                            v33 = v31 + v34;
                            v37 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v34);
                            objc_msgSend(v6, "colorPresetForSettingKind:", objc_msgSend(v37, "destination"), objc_msgSend(v37, "colorCategory"));
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            v38 = objc_msgSend(v37, "destination") != 1 || v35 == 0;
                            if (v38)
                            {
                              if (!v30)
                              {
                                v30 = v35;
                                v33 = v36;
                                goto LABEL_41;
                              }
                            }
                            else
                            {
                              v76 = v33;
                              objc_msgSend(v35, "colorPreset");
                              v75 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v75, "name");
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v30, "colorPreset");
                              v40 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v40, "name");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v39, "isEqualToString:", v41))
                              {
                                objc_msgSend(v35, "colorPreset");
                                v42 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v42, "variation");
                                v44 = v43;
                                objc_msgSend(v30, "colorPreset");
                                v45 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v45, "variation");
                                v47 = v44 == v46;

                                v28 = v73;
                                v6 = v72;
                              }
                              else
                              {
                                v47 = 0;
                              }

                              v38 = !v47;
                              v33 = v76;
                              if (!v38)
                                v33 = v36;
                              v32 = v74;
                            }

                            ++v34;
                            v35 = v30;
                            v36 = v33;
                            v31 = v77;
                          }
                          while (v78 != v34);
                          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
                          v31 = v71;
                        }
                        while (v29);
LABEL_41:

                        v24 = v65;
                        v23 = v66;
                        v27 = v69;
                        v25 = v70;
                      }
                      else
                      {
                        v33 = -1;
                      }

                      v48 = objc_msgSend(v27, "initialState");
                      if (v48 <= v33)
                        v49 = v33;
                      else
                        v49 = v48;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v49);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "identifier");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "setObject:forKeyedSubscript:", v50, v51);

                    }
                    ++v25;
                  }
                  while (v25 != v23);
                  v23 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
                }
                while (v23);
              }

              v9 = v64 + 1;
            }
            while (v64 + 1 != v63);
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
          }
          while (v63);
        }

        v7 = v59 + 1;
      }
      while (v59 + 1 != v58);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    }
    while (v58);
  }

  v52 = [AVTAvatarAttributeEditorState alloc];
  v53 = -[AVTAvatarAttributeEditorState initWithPairedStates:multicolorEnabledStates:multicolorSelectedStates:](v52, "initWithPairedStates:multicolorEnabledStates:multicolorSelectedStates:", v60, v67, MEMORY[0x1E0C9AA70]);

  return v53;
}

- (AVTAvatarAttributeEditorState)init
{
  return -[AVTAvatarAttributeEditorState initWithPairedStates:multicolorEnabledStates:multicolorSelectedStates:](self, "initWithPairedStates:multicolorEnabledStates:multicolorSelectedStates:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
}

- (AVTAvatarAttributeEditorState)initWithPairedStates:(id)a3 multicolorEnabledStates:(id)a4 multicolorSelectedStates:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTAvatarAttributeEditorState *v11;
  uint64_t v12;
  NSMutableDictionary *pairedStates;
  uint64_t v14;
  NSMutableDictionary *multicolorEnabledStates;
  uint64_t v16;
  NSMutableDictionary *multicolorSelectedStates;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarAttributeEditorState;
  v11 = -[AVTAvatarAttributeEditorState init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "mutableCopy");
    pairedStates = v11->_pairedStates;
    v11->_pairedStates = (NSMutableDictionary *)v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    multicolorEnabledStates = v11->_multicolorEnabledStates;
    v11->_multicolorEnabledStates = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(v10, "mutableCopy");
    multicolorSelectedStates = v11->_multicolorSelectedStates;
    v11->_multicolorSelectedStates = (NSMutableDictionary *)v16;

  }
  return v11;
}

- (BOOL)isCategoryPaired:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AVTAvatarAttributeEditorState pairedStates](self, "pairedStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setCategory:(int64_t)a3 inPairedState:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorState pairedStates](self, "pairedStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (int64_t)enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[AVTAvatarAttributeEditorState multicolorEnabledStates](self, "multicolorEnabledStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (void)setEnabledMulticolorSubpickersIndex:(int64_t)a3 forMulticolorPickerIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorState multicolorEnabledStates](self, "multicolorEnabledStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (int64_t)selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[AVTAvatarAttributeEditorState multicolorSelectedStates](self, "multicolorSelectedStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (void)setSelectedMulticolorSubpickersIndex:(int64_t)a3 forMulticolorPickerIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorState multicolorSelectedStates](self, "multicolorSelectedStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (NSMutableDictionary)pairedStates
{
  return self->_pairedStates;
}

- (void)setPairedStates:(id)a3
{
  objc_storeStrong((id *)&self->_pairedStates, a3);
}

- (NSMutableDictionary)multicolorEnabledStates
{
  return self->_multicolorEnabledStates;
}

- (void)setMulticolorEnabledStates:(id)a3
{
  objc_storeStrong((id *)&self->_multicolorEnabledStates, a3);
}

- (NSMutableDictionary)multicolorSelectedStates
{
  return self->_multicolorSelectedStates;
}

- (void)setMulticolorSelectedStates:(id)a3
{
  objc_storeStrong((id *)&self->_multicolorSelectedStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multicolorSelectedStates, 0);
  objc_storeStrong((id *)&self->_multicolorEnabledStates, 0);
  objc_storeStrong((id *)&self->_pairedStates, 0);
}

@end
