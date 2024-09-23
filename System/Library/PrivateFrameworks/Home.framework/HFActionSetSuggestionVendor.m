@implementation HFActionSetSuggestionVendor

+ (NSSet)supportedBuiltInActionSetTypes
{
  if (_MergedGlobals_297 != -1)
    dispatch_once(&_MergedGlobals_297, &__block_literal_global_2_27);
  return (NSSet *)(id)qword_1ED379A98;
}

void __61__HFActionSetSuggestionVendor_supportedBuiltInActionSetTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8228];
  v6[0] = *MEMORY[0x1E0CB8240];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB8210];
  v6[2] = *MEMORY[0x1E0CB8218];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED379A98;
  qword_1ED379A98 = v4;

}

- (HFActionSetSuggestionVendor)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_actionSet_filter_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionSetSuggestionVendor.m"), 49, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFActionSetSuggestionVendor init]",
    v5);

  return 0;
}

- (HFActionSetSuggestionVendor)initWithHome:(id)a3 actionSet:(id)a4
{
  return -[HFActionSetSuggestionVendor initWithHome:actionSet:filter:](self, "initWithHome:actionSet:filter:", a3, a4, 0);
}

- (HFActionSetSuggestionVendor)initWithHome:(id)a3 actionSet:(id)a4 filter:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFActionSetSuggestionVendor *v12;
  HFActionSetSuggestionVendor *v13;
  uint64_t v14;
  void *services;
  uint64_t v16;
  NSArray *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFActionSetSuggestionVendor;
  v12 = -[HFActionSetSuggestionVendor init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_home, a3);
    objc_storeStrong((id *)&v13->_actionSet, a4);
    if (v11)
    {
      objc_msgSend(v11, "services");
      v14 = objc_claimAutoreleasedReturnValue();
      services = v13->_services;
      v13->_services = (NSArray *)v14;
    }
    else
    {
      objc_msgSend(v9, "accessories");
      services = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(services, "na_flatMap:", &__block_literal_global_11_12);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v13->_services;
      v13->_services = (NSArray *)v16;

    }
  }

  return v13;
}

id __61__HFActionSetSuggestionVendor_initWithHome_actionSet_filter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)build
{
  return -[HFActionSetSuggestionVendor buildWithOutDependentServiceTypes:](self, "buildWithOutDependentServiceTypes:", 0);
}

- (id)buildWithOutDependentServiceTypes:(id *)a3
{
  void *v5;
  void *v6;
  HFActionSetBuilder *v7;
  void *v8;
  void *v9;
  HFActionSetBuilder *v10;
  void *v11;
  HFActionSetBuilder *v12;
  _QWORD v14[4];
  HFActionSetBuilder *v15;

  -[HFActionSetSuggestionVendor actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HFActionSetBuilder alloc];
  -[HFActionSetSuggestionVendor actionSet](self, "actionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetSuggestionVendor home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFActionSetBuilder initWithExistingObject:inHome:](v7, "initWithExistingObject:inHome:", v8, v9);

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8238]))
    -[HFActionSetSuggestionVendor _actionBuildersForCustomActionSet](self, "_actionBuildersForCustomActionSet");
  else
    -[HFActionSetSuggestionVendor _actionBuildersForBuiltInActionSetWithType:outDependentServiceTypes:](self, "_actionBuildersForBuiltInActionSetWithType:outDependentServiceTypes:", v6, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HFActionSetSuggestionVendor_buildWithOutDependentServiceTypes___block_invoke;
  v14[3] = &unk_1EA72C4F8;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "na_each:", v14);

  return v12;
}

uint64_t __65__HFActionSetSuggestionVendor_buildWithOutDependentServiceTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction:", a2);
}

- (id)_actionBuildersForBuiltInActionSetWithType:(id)a3 outDependentServiceTypes:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  id *v59;
  _QWORD v60[5];
  _QWORD v61[3];
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[2];
  _QWORD v65[7];
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8240]))
  {
    v9 = *MEMORY[0x1E0CB9A30];
    v72[0] = *MEMORY[0x1E0CB9A70];
    v72[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetPowerState:forServicesOfTypes:](self, "_actionBuildersToSetPowerState:forServicesOfTypes:", 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

    -[HFActionSetSuggestionVendor _actionBuildersToSetLightbulbBrightness:](self, "_actionBuildersToSetLightbulbBrightness:", 0.3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v12);

    +[HFColorPalette warmWhiteColor](HFColorPalette, "warmWhiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetLightbulbColorWithPaletteColor:](self, "_actionBuildersToSetLightbulbColorWithPaletteColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v14);

    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetBlindsPositionOpen:](self, "_actionBuildersToSetTargetBlindsPositionOpen:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v15);

    v71 = *MEMORY[0x1E0CB9B30];
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v71;
    v18 = 1;
LABEL_3:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v19);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8228]))
  {
    v58 = a4;
    if (qword_1ED379AA0 != -1)
      dispatch_once(&qword_1ED379AA0, &__block_literal_global_18_5);
    v19 = (id)qword_1ED379AA8;
    -[HFActionSetSuggestionVendor _actionBuildersToSetPowerState:forServicesOfTypes:](self, "_actionBuildersToSetPowerState:forServicesOfTypes:", 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v20);

    v70 = *MEMORY[0x1E0CB9A28];
    v21 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetDoorState:forServicesOfTypes:](self, "_actionBuildersToSetTargetDoorState:forServicesOfTypes:", 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v23);

    v69 = *MEMORY[0x1E0CB9A80];
    v24 = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetLockState:forServicesOfTypes:](self, "_actionBuildersToSetTargetLockState:forServicesOfTypes:", 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v26);

    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetBlindsPositionOpen:](self, "_actionBuildersToSetTargetBlindsPositionOpen:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v27);

    v28 = *MEMORY[0x1E0CB9AA0];
    v68[0] = *MEMORY[0x1E0CB9A70];
    v68[1] = v28;
    v68[2] = v24;
    v68[3] = v21;
    v68[4] = *MEMORY[0x1E0CB9B30];
    v29 = (void *)MEMORY[0x1E0C99D20];
    v30 = v68;
    v31 = 5;
LABEL_12:
    objc_msgSend(v29, "arrayWithObjects:count:", v30, v31, v58);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v42);

    a4 = v59;
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8218]))
  {
    v58 = a4;
    if (qword_1ED379AB0 != -1)
      dispatch_once(&qword_1ED379AB0, &__block_literal_global_22_8);
    v19 = (id)qword_1ED379AB8;
    -[HFActionSetSuggestionVendor _actionBuildersToSetPowerState:forServicesOfTypes:](self, "_actionBuildersToSetPowerState:forServicesOfTypes:", 0, v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v32);

    v67 = *MEMORY[0x1E0CB9A28];
    v33 = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetDoorState:forServicesOfTypes:](self, "_actionBuildersToSetTargetDoorState:forServicesOfTypes:", 1, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v35);

    v66 = *MEMORY[0x1E0CB9A80];
    v36 = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetLockState:forServicesOfTypes:](self, "_actionBuildersToSetTargetLockState:forServicesOfTypes:", 1, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v38);

    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetSecuritySystemState:](self, "_actionBuildersToSetTargetSecuritySystemState:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v39);

    v40 = *MEMORY[0x1E0CB9AA0];
    v65[0] = *MEMORY[0x1E0CB9A70];
    v65[1] = v40;
    v41 = *MEMORY[0x1E0CB9B10];
    v65[2] = *MEMORY[0x1E0CB9A10];
    v65[3] = v41;
    v65[4] = v36;
    v65[5] = v33;
    v65[6] = *MEMORY[0x1E0CB9AA8];
    v29 = (void *)MEMORY[0x1E0C99D20];
    v30 = v65;
    v31 = 7;
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8210]))
  {
    v46 = *MEMORY[0x1E0CB9A30];
    v64[0] = *MEMORY[0x1E0CB9A70];
    v45 = v64[0];
    v64[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetPowerState:forServicesOfTypes:](self, "_actionBuildersToSetPowerState:forServicesOfTypes:", 1, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v48);

    -[HFActionSetSuggestionVendor _actionBuildersToSetLightbulbBrightness:](self, "_actionBuildersToSetLightbulbBrightness:", 0.7);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v49);

    +[HFColorPalette warmWhiteColor](HFColorPalette, "warmWhiteColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetLightbulbColorWithPaletteColor:](self, "_actionBuildersToSetLightbulbColorWithPaletteColor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v51);

    v63 = *MEMORY[0x1E0CB9A28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetDoorState:forServicesOfTypes:](self, "_actionBuildersToSetTargetDoorState:forServicesOfTypes:", 0, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v53);

    v62 = *MEMORY[0x1E0CB9A80];
    v54 = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetLockState:forServicesOfTypes:](self, "_actionBuildersToSetTargetLockState:forServicesOfTypes:", 0, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v56);

    -[HFActionSetSuggestionVendor _actionBuildersToSetTargetSecuritySystemState:](self, "_actionBuildersToSetTargetSecuritySystemState:", 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v57);

    v61[0] = v45;
    v61[1] = v54;
    v61[2] = *MEMORY[0x1E0CB9AA8];
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v61;
    v18 = 3;
    goto LABEL_3;
  }
LABEL_14:
  if (*a4)
    *a4 = (id)objc_msgSend(v8, "copy");
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_7;
  v60[3] = &unk_1EA729200;
  v60[4] = self;
  objc_msgSend(v7, "na_filter:", v60);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

void __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9AA0];
  v4[0] = *MEMORY[0x1E0CB9A70];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CB9A30];
  v4[2] = *MEMORY[0x1E0CB9AF0];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379AA8;
  qword_1ED379AA8 = v2;

}

void __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9AA0];
  v5[0] = *MEMORY[0x1E0CB9A70];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0CB9B10];
  v5[2] = *MEMORY[0x1E0CB9A10];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0CB9A30];
  v5[4] = *MEMORY[0x1E0CB9AF0];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379AB8;
  qword_1ED379AB8 = v3;

}

uint64_t __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_8;
  v9[3] = &unk_1EA72BC40;
  v10 = v3;
  v6 = v3;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7 ^ 1u;
}

uint64_t __99__HFActionSetSuggestionVendor__actionBuildersForBuiltInActionSetWithType_outDependentServiceTypes___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasSameTargetAsAction:", a2);
}

- (id)_actionBuildersToSetPowerState:(BOOL)a3 forServicesOfTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HFActionSetSuggestionVendor *v13;
  BOOL v14;

  v6 = a4;
  -[HFActionSetSuggestionVendor services](self, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HFActionSetSuggestionVendor__actionBuildersToSetPowerState_forServicesOfTypes___block_invoke;
  v11[3] = &unk_1EA73B950;
  v12 = v6;
  v13 = self;
  v14 = a3;
  v8 = v6;
  objc_msgSend(v7, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HFCharacteristicWriteActionBuilder *__81__HFActionSetSuggestionVendor__actionBuildersToSetPowerState_forServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HFCharacteristicWriteActionBuilder *v9;
  uint64_t v10;
  HFCharacteristicWriteActionBuilder *i;
  void *v12;
  void *v13;
  HFCharacteristicWriteActionBuilder *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "associatedServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "serviceType");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (HFCharacteristicWriteActionBuilder *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (HFCharacteristicWriteActionBuilder *)((char *)i + 1))
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(v3, "hf_characteristicOfType:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && (objc_msgSend(v12, "hf_isWritable") & 1) != 0)
          {

            v14 = [HFCharacteristicWriteActionBuilder alloc];
            objc_msgSend(*(id *)(a1 + 40), "home");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[HFItemBuilder initWithHome:](v14, "initWithHome:", v15);

            -[HFCharacteristicWriteActionBuilder setCharacteristic:](v9, "setCharacteristic:", v13);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFCharacteristicWriteActionBuilder setTargetValue:](v9, "setTargetValue:", v16);

            v8 = v13;
            goto LABEL_17;
          }

        }
        v9 = (HFCharacteristicWriteActionBuilder *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_actionBuildersToSetLightbulbColorWithPaletteColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HFActionSetSuggestionVendor services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke;
  v9[3] = &unk_1EA7343A8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  HFColorControlItem *v6;
  void *v7;
  HFColorControlItem *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  HFCharacteristicWriteActionBuilder *(*v18)(uint64_t, void *, void *);
  void *v19;
  uint64_t v20;
  id v21;

  v3 = a2;
  objc_msgSend(v3, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A70]);

  if (v5)
  {
    v6 = [HFColorControlItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "_controlItemValueSourceForService:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFColorControlItem initWithValueSource:displayResults:](v6, "initWithValueSource:displayResults:", v7, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFColorControlItem supportsItemRepresentingServices:](v8, "supportsItemRepresentingServices:", v9);

    v11 = 0;
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "colorValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFColorControlItem characteristicValuesForValue:](v8, "characteristicValuesForValue:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke_2;
      v19 = &unk_1EA73B978;
      v20 = *(_QWORD *)(a1 + 32);
      v21 = v3;
      objc_msgSend(v13, "na_dictionaryByMappingValues:", &v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allValues", v16, v17, v18, v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

HFCharacteristicWriteActionBuilder *__82__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbColorWithPaletteColor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HFCharacteristicWriteActionBuilder *v7;
  void *v8;
  HFCharacteristicWriteActionBuilder *v9;
  void *v10;

  v5 = a3;
  v6 = a2;
  v7 = [HFCharacteristicWriteActionBuilder alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFItemBuilder initWithHome:](v7, "initWithHome:", v8);

  objc_msgSend(*(id *)(a1 + 40), "hf_characteristicOfType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicWriteActionBuilder setCharacteristic:](v9, "setCharacteristic:", v10);
  -[HFCharacteristicWriteActionBuilder setTargetValue:](v9, "setTargetValue:", v5);

  return v9;
}

- (id)_actionBuildersToSetLightbulbBrightness:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[HFActionSetSuggestionVendor services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbBrightness___block_invoke;
  v8[3] = &unk_1EA73B9A0;
  *(double *)&v8[5] = a3;
  v8[4] = self;
  objc_msgSend(v5, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

HFCharacteristicWriteActionBuilder *__71__HFActionSetSuggestionVendor__actionBuildersToSetLightbulbBrightness___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  HFCharacteristicWriteActionBuilder *v9;
  void *v10;
  HFCharacteristicWriteActionBuilder *v11;

  v3 = a2;
  objc_msgSend(v3, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A70]);

  if (v5)
  {
    objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x1E0CB87C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hf_isWritable"))
    {
      objc_msgSend(v6, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_characteristicValueForPercentage:", *(double *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = [HFCharacteristicWriteActionBuilder alloc];
        objc_msgSend(*(id *)(a1 + 32), "home");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HFItemBuilder initWithHome:](v9, "initWithHome:", v10);

        -[HFCharacteristicWriteActionBuilder setCharacteristic:](v11, "setCharacteristic:", v6);
        -[HFCharacteristicWriteActionBuilder setTargetValue:](v11, "setTargetValue:", v8);
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_actionBuildersToSetTargetDoorState:(int64_t)a3 forServicesOfTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HFActionSetSuggestionVendor *v13;
  int64_t v14;

  v6 = a4;
  -[HFActionSetSuggestionVendor services](self, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HFActionSetSuggestionVendor__actionBuildersToSetTargetDoorState_forServicesOfTypes___block_invoke;
  v11[3] = &unk_1EA73B9C8;
  v12 = v6;
  v13 = self;
  v14 = a3;
  v8 = v6;
  objc_msgSend(v7, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HFCharacteristicWriteActionBuilder *__86__HFActionSetSuggestionVendor__actionBuildersToSetTargetDoorState_forServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFCharacteristicWriteActionBuilder *v8;
  void *v9;
  HFCharacteristicWriteActionBuilder *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AA8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "hf_isWritable"))
    {
      v8 = [HFCharacteristicWriteActionBuilder alloc];
      objc_msgSend(*(id *)(a1 + 40), "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HFItemBuilder initWithHome:](v8, "initWithHome:", v9);

      -[HFCharacteristicWriteActionBuilder setCharacteristic:](v10, "setCharacteristic:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicWriteActionBuilder setTargetValue:](v10, "setTargetValue:", v11);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_actionBuildersToSetTargetLockState:(int64_t)a3 forServicesOfTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HFActionSetSuggestionVendor *v13;
  int64_t v14;

  v6 = a4;
  -[HFActionSetSuggestionVendor services](self, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HFActionSetSuggestionVendor__actionBuildersToSetTargetLockState_forServicesOfTypes___block_invoke;
  v11[3] = &unk_1EA73B9C8;
  v12 = v6;
  v13 = self;
  v14 = a3;
  v8 = v6;
  objc_msgSend(v7, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HFCharacteristicWriteActionBuilder *__86__HFActionSetSuggestionVendor__actionBuildersToSetTargetLockState_forServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFCharacteristicWriteActionBuilder *v8;
  void *v9;
  HFCharacteristicWriteActionBuilder *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AE0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "hf_isWritable"))
    {
      v8 = [HFCharacteristicWriteActionBuilder alloc];
      objc_msgSend(*(id *)(a1 + 40), "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HFItemBuilder initWithHome:](v8, "initWithHome:", v9);

      -[HFCharacteristicWriteActionBuilder setCharacteristic:](v10, "setCharacteristic:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicWriteActionBuilder setTargetValue:](v10, "setTargetValue:", v11);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_actionBuildersToSetTargetSecuritySystemState:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[HFActionSetSuggestionVendor services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__HFActionSetSuggestionVendor__actionBuildersToSetTargetSecuritySystemState___block_invoke;
  v8[3] = &unk_1EA73B9A0;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v5, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

HFCharacteristicWriteActionBuilder *__77__HFActionSetSuggestionVendor__actionBuildersToSetTargetSecuritySystemState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  HFCharacteristicWriteActionBuilder *v8;
  void *v9;
  HFCharacteristicWriteActionBuilder *v10;
  void *v11;

  objc_msgSend(a2, "hf_characteristicOfType:", *MEMORY[0x1E0CB8B00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hf_isWritable"))
  {
    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "hf_isValidValue:", v6),
          v6,
          !v7))
    {
      v10 = 0;
    }
    else
    {
      v8 = [HFCharacteristicWriteActionBuilder alloc];
      objc_msgSend(*(id *)(a1 + 32), "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HFItemBuilder initWithHome:](v8, "initWithHome:", v9);

      -[HFCharacteristicWriteActionBuilder setCharacteristic:](v10, "setCharacteristic:", v4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicWriteActionBuilder setTargetValue:](v10, "setTargetValue:", v11);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_actionBuildersToSetTargetBlindsPositionOpen:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[HFActionSetSuggestionVendor services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HFActionSetSuggestionVendor__actionBuildersToSetTargetBlindsPositionOpen___block_invoke;
  v8[3] = &unk_1EA73B9F0;
  v9 = a3;
  v8[4] = self;
  objc_msgSend(v5, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

HFCharacteristicWriteActionBuilder *__76__HFActionSetSuggestionVendor__actionBuildersToSetTargetBlindsPositionOpen___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  HFCharacteristicWriteActionBuilder *v11;
  id v12;
  void *v13;
  HFCharacteristicWriteActionBuilder *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9B30]);

  if (v5)
  {
    objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AF0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "hf_isWritable"))
    {
      v8 = *(unsigned __int8 *)(a1 + 40);
      objc_msgSend(v7, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
        objc_msgSend(v9, "maximumValue");
      else
        objc_msgSend(v9, "minimumValue");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        if (*(_BYTE *)(a1 + 40))
          v13 = &unk_1EA7CD8F0;
        else
          v13 = &unk_1EA7CD900;
        v12 = v13;
      }
      v14 = [HFCharacteristicWriteActionBuilder alloc];
      objc_msgSend(*(id *)(a1 + 32), "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HFItemBuilder initWithHome:](v14, "initWithHome:", v15);

      -[HFCharacteristicWriteActionBuilder setCharacteristic:](v11, "setCharacteristic:", v7);
      -[HFCharacteristicWriteActionBuilder setTargetValue:](v11, "setTargetValue:", v12);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_actionBuildersForCustomActionSet
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFActionSetSuggestionVendor services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HFActionSetSuggestionVendor__actionBuildersForCustomActionSet__block_invoke;
  v6[3] = &unk_1EA73BA18;
  v6[4] = self;
  objc_msgSend(v3, "na_flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __64__HFActionSetSuggestionVendor__actionBuildersForCustomActionSet__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionBuildersForCustomActionSetWithService:", a2);
}

- (id)_actionBuildersForCustomActionSetWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  HFActionSetSuggestionVendor *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionSetServiceSuggestionMetadata metadataForServiceType:](HFActionSetServiceSuggestionMetadata, "metadataForServiceType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "primaryCharacteristicType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_characteristicOfType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "hf_isWritable"))
    {
      -[HFActionSetSuggestionVendor actionSet](self, "actionSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hf_characteristicWriteActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke;
      v29[3] = &unk_1EA73B220;
      v12 = v4;
      v30 = v12;
      v13 = objc_msgSend(v10, "na_any:", v29);

      if ((v13 & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        -[HFActionSetSuggestionVendor _deriveActionForPrimaryCharacteristic:](self, "_deriveActionForPrimaryCharacteristic:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isMutuallyExclusiveAction") & 1) == 0)
          {
            objc_msgSend(v15, "matchingExistingActions");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "na_map:", &__block_literal_global_37_5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "secondaryCharacteristicTypes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = v11;
            v25[1] = 3221225472;
            v25[2] = __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_3;
            v25[3] = &unk_1EA73BA60;
            v26 = v12;
            v27 = self;
            v28 = v18;
            v20 = v18;
            objc_msgSend(v19, "na_map:", v25);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObjectsFromArray:", v21);

            v11 = MEMORY[0x1E0C809B0];
          }
          v23[0] = v11;
          v23[1] = 3221225472;
          v23[2] = __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_4;
          v23[3] = &unk_1EA73BA88;
          v23[4] = self;
          v24 = v12;
          objc_msgSend(v16, "na_map:", v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = 0;
        }

      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

id __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "hf_characteristicOfType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_deriveActionForSecondaryCharacteristic:candidateServices:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HFCharacteristicWriteActionBuilder *__76__HFActionSetSuggestionVendor__actionBuildersForCustomActionSetWithService___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  HFCharacteristicWriteActionBuilder *v4;
  void *v5;
  HFCharacteristicWriteActionBuilder *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = [HFCharacteristicWriteActionBuilder alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFItemBuilder initWithHome:](v4, "initWithHome:", v5);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characteristicType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_characteristicOfType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicWriteActionBuilder setCharacteristic:](v6, "setCharacteristic:", v10);

  objc_msgSend(v3, "targetValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicWriteActionBuilder setTargetValue:](v6, "setTargetValue:", v11);
  return v6;
}

- (id)_deriveActionForPrimaryCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HFActionSetSuggestionVendor home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke;
  v24[3] = &unk_1EA73BAB0;
  v9 = v4;
  v25 = v9;
  objc_msgSend(v7, "na_map:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_2;
  v23[3] = &unk_1EA7283A0;
  v23[4] = self;
  objc_msgSend(v10, "na_filter:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "room");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_3;
  v21[3] = &unk_1EA7283A0;
  v22 = v16;
  v17 = v16;
  objc_msgSend(v12, "na_filter:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetSuggestionVendor _deriveActionForPrimaryCharacteristic:candidateServices:targetThreshold:](self, "_deriveActionForPrimaryCharacteristic:candidateServices:targetThreshold:", v9, v18, 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    -[HFActionSetSuggestionVendor _deriveActionForPrimaryCharacteristic:candidateServices:targetThreshold:](self, "_deriveActionForPrimaryCharacteristic:candidateServices:targetThreshold:", v9, v12, 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

id __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_serviceOfType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

uint64_t __69__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (id)_deriveActionForPrimaryCharacteristic:(id)a3 candidateServices:(id)a4 targetThreshold:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  -[HFActionSetSuggestionVendor actionSet](self, "actionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_characteristicWriteActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __103__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic_candidateServices_targetThreshold___block_invoke;
  v29 = &unk_1EA73B190;
  v12 = v9;
  v30 = v12;
  v13 = v8;
  v31 = v13;
  objc_msgSend(v11, "na_filter:", &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count", v26, v27, v28, v29))
  {
    v15 = (void *)MEMORY[0x1E0CBA458];
    objc_msgSend(v13, "characteristicType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_suggestionVendorForCharacteristicType:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "suggestedActionForCharacteristic:candidateActions:", v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "matchingExistingActions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (double)(unint64_t)objc_msgSend(v20, "count");
      v22 = v21 / (double)(unint64_t)objc_msgSend(v12, "count");

      if (v22 < a5)
        v23 = 0;
      else
        v23 = v19;
      v24 = v23;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __103__HFActionSetSuggestionVendor__deriveActionForPrimaryCharacteristic_candidateServices_targetThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v6))
  {
    objc_msgSend(v3, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "characteristicType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_deriveActionForSecondaryCharacteristic:(id)a3 candidateServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "hf_isWritable"))
  {
    -[HFActionSetSuggestionVendor actionSet](self, "actionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_characteristicWriteActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __89__HFActionSetSuggestionVendor__deriveActionForSecondaryCharacteristic_candidateServices___block_invoke;
    v20 = &unk_1EA73B190;
    v10 = v6;
    v21 = v10;
    v22 = v7;
    objc_msgSend(v9, "na_filter:", &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count", v17, v18, v19, v20))
    {
      v12 = (void *)MEMORY[0x1E0CBA458];
      objc_msgSend(v10, "characteristicType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hf_suggestionVendorForCharacteristicType:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "suggestedActionForCharacteristic:candidateActions:", v10, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __89__HFActionSetSuggestionVendor__deriveActionForSecondaryCharacteristic_candidateServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  uint64_t v14;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    objc_msgSend(v3, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "characteristicType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "characteristicType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v3, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "service");
      v17 = v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "containsObject:", v13);

      v9 = v17;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_controlItemValueSourceForService:(id)a3
{
  id v3;
  HFSimpleAggregatedCharacteristicValueSource *v4;
  HFNullValueSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFSimpleAggregatedCharacteristicValueSource *v10;

  v3 = a3;
  v4 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v5 = objc_alloc_init(HFNullValueSource);
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_serviceDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v4, "initWithValueSource:characteristics:primaryServiceDescriptor:", v5, v8, v9);
  return v10;
}

- (HFActionSetSuggestionFilter)filter
{
  return self->_filter;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)services
{
  return self->_services;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
