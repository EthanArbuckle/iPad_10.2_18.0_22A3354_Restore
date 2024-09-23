@implementation MNTransitInstruction

- (MNTransitInstruction)initWithContext:(int64_t)a3
{
  MNTransitInstruction *v4;
  MNTransitInstruction *v5;
  MNTransitInstruction *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MNTransitInstruction;
  v4 = -[MNTransitInstruction init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)instructionForUncertainArrivalToStationStep:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "originStop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composedRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getStationForStop:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = v9;
    else
      v10 = v7;
    objc_msgSend(v10, "bestName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      _MNLocalizedStringFromThisBundle(CFSTR("Transit_Instructions_UncertainArrivalWithStationName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _MNLocalizedStringFromThisBundle(CFSTR("Transit_Instructions_UncertainArrivalWithNoStationName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    _MNLocalizedStringFromThisBundle(CFSTR("Transit_Instructions_UncertainArrivalWithNoStationName_Spoken"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)_fillInInstructions
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  void *v78;
  _QWORD v79[4];
  void *v80;
  _QWORD v81[4];
  void *v82;
  _QWORD v83[4];
  void *v84;
  _QWORD v85[4];
  void *v86;
  _QWORD v87[4];
  void *v88;

  v3 = -[MNTransitInstruction context](self, "context");
  if (v3 == 1)
  {
    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_11;
    v81[3] = &unk_1E61D1B98;
    v6 = &v82;
    v82 = &__block_literal_global_1;
    MNMap(v24, v81);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_navigation_firstObjectPassingTest:", &__block_literal_global_21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMajorFormattedInstruction:](self, "setMajorFormattedInstruction:", v27);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v25;
    v79[1] = 3221225472;
    v79[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_12;
    v79[3] = &unk_1E61D1B98;
    v10 = &v80;
    v80 = &__block_literal_global_1;
    MNMap(v28, v79);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_navigation_firstObjectPassingTest:", &__block_literal_global_21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMinorFormattedInstruction:](self, "setMinorFormattedInstruction:", v30);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v25;
    v77[1] = 3221225472;
    v77[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_13;
    v77[3] = &unk_1E61D1B98;
    v14 = &v78;
    v78 = &__block_literal_global_1;
    MNMap(v31, v77);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_navigation_firstObjectPassingTest:", &__block_literal_global_21);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setTertiaryFormattedInstruction:](self, "setTertiaryFormattedInstruction:", v33);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v34, &__block_literal_global_32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMajorInstructionStrings:](self, "setMajorInstructionStrings:", v35);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v36, &__block_literal_global_33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMinorInstructionStrings:](self, "setMinorInstructionStrings:", v37);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = &__block_literal_global_34;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_5;
    v87[3] = &unk_1E61D1B98;
    v6 = &v88;
    v88 = &__block_literal_global_1;
    MNMap(v4, v87);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_navigation_firstObjectPassingTest:", &__block_literal_global_21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMajorFormattedInstruction:](self, "setMajorFormattedInstruction:", v8);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v5;
    v85[1] = 3221225472;
    v85[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_6;
    v85[3] = &unk_1E61D1B98;
    v10 = &v86;
    v86 = &__block_literal_global_1;
    MNMap(v9, v85);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_navigation_firstObjectPassingTest:", &__block_literal_global_21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMinorFormattedInstruction:](self, "setMinorFormattedInstruction:", v12);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v5;
    v83[1] = 3221225472;
    v83[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_7;
    v83[3] = &unk_1E61D1B98;
    v14 = &v84;
    v84 = &__block_literal_global_1;
    MNMap(v13, v83);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_navigation_firstObjectPassingTest:", &__block_literal_global_21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setTertiaryFormattedInstruction:](self, "setTertiaryFormattedInstruction:", v16);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v17, &__block_literal_global_29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMajorInstructionStrings:](self, "setMajorInstructionStrings:", v18);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v19, &__block_literal_global_30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setMinorInstructionStrings:](self, "setMinorInstructionStrings:", v20);

    -[MNTransitInstruction instructionSetsForInstructionType:](self, "instructionSetsForInstructionType:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = &__block_literal_global_31;
LABEL_5:
    __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v21, v23);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitInstruction setTertiaryInstructionStrings:](self, "setTertiaryInstructionStrings:", v38);

  }
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "departureBarFormattedString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setDepartureBarInstruction:](self, "setDepartureBarInstruction:", v40);

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setDepartureBarStyle:](self, "setDepartureBarStyle:", objc_msgSend(v41, "departureBarFormatStyle"));

  v42 = objc_alloc(MEMORY[0x1E0D26FD8]);
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "departureBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v42, "initWithGeoFormattedString:", v44);
  -[MNTransitInstruction setDepartureBarInstructionString:](self, "setDepartureBarInstructionString:", v45);

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setDepartureBarFormatStyle:](self, "setDepartureBarFormatStyle:", objc_msgSend(v46, "departureBarStyle"));

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "countStopsFormattedString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setCountStopsFormattedString:](self, "setCountStopsFormattedString:", v48);

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "expandableListFormattedString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setExpandableListFormattedString:](self, "setExpandableListFormattedString:", v50);

  v51 = objc_alloc(MEMORY[0x1E0D26FD8]);
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "countStopsText");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v51, "initWithGeoFormattedString:", v53);
  -[MNTransitInstruction setCountStopsString:](self, "setCountStopsString:", v54);

  v55 = objc_alloc(MEMORY[0x1E0D26FD8]);
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "transitListInstruction");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "expandableListFormatted");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v55, "initWithGeoFormattedString:", v58);
  -[MNTransitInstruction setExpandableListString:](self, "setExpandableListString:", v59);

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "primaryTimeFormattedString");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setPrimaryTimeInstruction:](self, "setPrimaryTimeInstruction:", v61);

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "secondaryTimeFormattedString");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setSecondaryTimeinstruction:](self, "setSecondaryTimeinstruction:", v63);

  v64 = objc_alloc(MEMORY[0x1E0D26FD8]);
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "transitListInstruction");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "timeInstructions");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "primaryText");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v64, "initWithGeoFormattedString:", v68);
  -[MNTransitInstruction setPrimaryTimeInstructionString:](self, "setPrimaryTimeInstructionString:", v69);

  v70 = objc_alloc(MEMORY[0x1E0D26FD8]);
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "transitListInstruction");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "timeInstructions");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "secondaryText");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v70, "initWithGeoFormattedString:", v74);
  -[MNTransitInstruction setSecondaryTimeInstructionString:](self, "setSecondaryTimeInstructionString:", v75);

  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction setHideTimeInstructionsWhenCollapsed:](self, "setHideTimeInstructionsWhenCollapsed:", objc_msgSend(v76, "hideTimeInstructionsIfCollapsed"));

}

id __43__MNTransitInstruction__fillInInstructions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "formatStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

BOOL __43__MNTransitInstruction__fillInInstructions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_3(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_geo_compactMap:", &__block_literal_global_25, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {

          goto LABEL_11;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "formatStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FD8]), "initWithGeoFormattedString:", v2);
  else
    v6 = 0;

  return v6;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MNMap(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MNMap(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noticeFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MNMap(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transitListInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandFormatteds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transitListInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailFormatteds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transitListInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noticeFormatteds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "transitSignInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MNMap(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "transitSignInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MNMap(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "transitSignInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noticeFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MNMap(v4, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transitSignInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandFormatteds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transitSignInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailFormatteds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transitSignInstruction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noticeFormatteds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)instructionSet
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "-[MNTransitInstruction instructionSet]";
    v6 = 2080;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
    v8 = 1024;
    v9 = 240;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v4, 0x1Cu);
  }

  return 0;
}

- (id)overridenInstructionsMapping
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "-[MNTransitInstruction overridenInstructionsMapping]";
    v6 = 2080;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
    v8 = 1024;
    v9 = 246;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v4, 0x1Cu);
  }

  return 0;
}

- (id)instructionSetsForInstructionType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitInstruction overridenInstructionsMapping](self, "overridenInstructionsMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instructions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "addObject:", v9);
  -[MNTransitInstruction instructionSet](self, "instructionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MNTransitInstruction instructionSet](self, "instructionSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (id)formattedInstructionForType:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      -[MNTransitInstruction majorFormattedInstruction](self, "majorFormattedInstruction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 1:
      -[MNTransitInstruction minorFormattedInstruction](self, "minorFormattedInstruction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 2:
      -[MNTransitInstruction tertiaryFormattedInstruction](self, "tertiaryFormattedInstruction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 3:
      -[MNTransitInstruction primaryTimeInstruction](self, "primaryTimeInstruction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_14;
      -[MNTransitInstruction primaryTimeInstruction](self, "primaryTimeInstruction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = (void **)v19;
      goto LABEL_13;
    case 4:
      -[MNTransitInstruction secondaryTimeinstruction](self, "secondaryTimeinstruction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[MNTransitInstruction secondaryTimeinstruction](self, "secondaryTimeinstruction");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
        v9 = (void *)MEMORY[0x1E0C99D20];
        v10 = &v18;
LABEL_13:
        objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_14:
        v11 = 0;
      }

      return v11;
    default:
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315650;
        v13 = "-[MNTransitInstruction formattedInstructionForType:]";
        v14 = 2080;
        v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
        v16 = 1024;
        v17 = 288;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v12, 0x1Cu);
      }

      return 0;
  }
}

- (id)instructionStringForType:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      -[MNTransitInstruction majorInstructionStrings](self, "majorInstructionStrings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 1:
      -[MNTransitInstruction minorInstructionStrings](self, "minorInstructionStrings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 2:
      -[MNTransitInstruction tertiaryInstructionStrings](self, "tertiaryInstructionStrings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 3:
      -[MNTransitInstruction primaryTimeInstructionString](self, "primaryTimeInstructionString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_14;
      -[MNTransitInstruction primaryTimeInstructionString](self, "primaryTimeInstructionString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = (void **)v19;
      goto LABEL_13;
    case 4:
      -[MNTransitInstruction secondaryTimeInstructionString](self, "secondaryTimeInstructionString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[MNTransitInstruction secondaryTimeInstructionString](self, "secondaryTimeInstructionString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
        v9 = (void *)MEMORY[0x1E0C99D20];
        v10 = &v18;
LABEL_13:
        objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_14:
        v11 = 0;
      }

      return v11;
    default:
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315650;
        v13 = "-[MNTransitInstruction instructionStringForType:]";
        v14 = 2080;
        v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
        v16 = 1024;
        v17 = 312;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v12, 0x1Cu);
      }

      return 0;
  }
}

- (int64_t)context
{
  return self->_context;
}

- (NSArray)majorInstructionStrings
{
  return self->_majorInstructionStrings;
}

- (void)setMajorInstructionStrings:(id)a3
{
  objc_storeStrong((id *)&self->_majorInstructionStrings, a3);
}

- (NSArray)minorInstructionStrings
{
  return self->_minorInstructionStrings;
}

- (void)setMinorInstructionStrings:(id)a3
{
  objc_storeStrong((id *)&self->_minorInstructionStrings, a3);
}

- (NSArray)tertiaryInstructionStrings
{
  return self->_tertiaryInstructionStrings;
}

- (void)setTertiaryInstructionStrings:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryInstructionStrings, a3);
}

- (int64_t)departureBarStyle
{
  return self->_departureBarStyle;
}

- (void)setDepartureBarStyle:(int64_t)a3
{
  self->_departureBarStyle = a3;
}

- (GEOComposedString)departureBarInstructionString
{
  return self->_departureBarInstructionString;
}

- (void)setDepartureBarInstructionString:(id)a3
{
  objc_storeStrong((id *)&self->_departureBarInstructionString, a3);
}

- (int)departureBarFormatStyle
{
  return self->_departureBarFormatStyle;
}

- (void)setDepartureBarFormatStyle:(int)a3
{
  self->_departureBarFormatStyle = a3;
}

- (GEOComposedString)countStopsString
{
  return self->_countStopsString;
}

- (void)setCountStopsString:(id)a3
{
  objc_storeStrong((id *)&self->_countStopsString, a3);
}

- (GEOComposedString)expandableListString
{
  return self->_expandableListString;
}

- (void)setExpandableListString:(id)a3
{
  objc_storeStrong((id *)&self->_expandableListString, a3);
}

- (GEOComposedString)primaryTimeInstructionString
{
  return self->_primaryTimeInstructionString;
}

- (void)setPrimaryTimeInstructionString:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTimeInstructionString, a3);
}

- (GEOComposedString)secondaryTimeInstructionString
{
  return self->_secondaryTimeInstructionString;
}

- (void)setSecondaryTimeInstructionString:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTimeInstructionString, a3);
}

- (BOOL)hideTimeInstructionsWhenCollapsed
{
  return self->_hideTimeInstructionsWhenCollapsed;
}

- (void)setHideTimeInstructionsWhenCollapsed:(BOOL)a3
{
  self->_hideTimeInstructionsWhenCollapsed = a3;
}

- (NSArray)majorFormattedInstruction
{
  return self->_majorFormattedInstruction;
}

- (void)setMajorFormattedInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)minorFormattedInstruction
{
  return self->_minorFormattedInstruction;
}

- (void)setMinorFormattedInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)tertiaryFormattedInstruction
{
  return self->_tertiaryFormattedInstruction;
}

- (void)setTertiaryFormattedInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (GEOServerFormattedString)departureBarInstruction
{
  return self->_departureBarInstruction;
}

- (void)setDepartureBarInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_departureBarInstruction, a3);
}

- (GEOServerFormattedString)countStopsFormattedString
{
  return self->_countStopsFormattedString;
}

- (void)setCountStopsFormattedString:(id)a3
{
  objc_storeStrong((id *)&self->_countStopsFormattedString, a3);
}

- (GEOServerFormattedString)expandableListFormattedString
{
  return self->_expandableListFormattedString;
}

- (void)setExpandableListFormattedString:(id)a3
{
  objc_storeStrong((id *)&self->_expandableListFormattedString, a3);
}

- (GEOServerFormattedString)primaryTimeInstruction
{
  return self->_primaryTimeInstruction;
}

- (void)setPrimaryTimeInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTimeInstruction, a3);
}

- (GEOServerFormattedString)secondaryTimeinstruction
{
  return self->_secondaryTimeinstruction;
}

- (void)setSecondaryTimeinstruction:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTimeinstruction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTimeinstruction, 0);
  objc_storeStrong((id *)&self->_primaryTimeInstruction, 0);
  objc_storeStrong((id *)&self->_expandableListFormattedString, 0);
  objc_storeStrong((id *)&self->_countStopsFormattedString, 0);
  objc_storeStrong((id *)&self->_departureBarInstruction, 0);
  objc_storeStrong((id *)&self->_tertiaryFormattedInstruction, 0);
  objc_storeStrong((id *)&self->_minorFormattedInstruction, 0);
  objc_storeStrong((id *)&self->_majorFormattedInstruction, 0);
  objc_storeStrong((id *)&self->_secondaryTimeInstructionString, 0);
  objc_storeStrong((id *)&self->_primaryTimeInstructionString, 0);
  objc_storeStrong((id *)&self->_expandableListString, 0);
  objc_storeStrong((id *)&self->_countStopsString, 0);
  objc_storeStrong((id *)&self->_departureBarInstructionString, 0);
  objc_storeStrong((id *)&self->_tertiaryInstructionStrings, 0);
  objc_storeStrong((id *)&self->_minorInstructionStrings, 0);
  objc_storeStrong((id *)&self->_majorInstructionStrings, 0);
}

@end
