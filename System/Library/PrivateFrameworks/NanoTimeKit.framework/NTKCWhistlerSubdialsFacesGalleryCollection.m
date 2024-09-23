@implementation NTKCWhistlerSubdialsFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(CFSTR("FACE_STYLE_34_IN_TITLE_CASE"), CFSTR("Modular Compact"));
}

- (id)facesForDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  void *v62;
  void *v63;
  id obj;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _QWORD v98[2];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("DAB81146-4105-445B-94AD-14033A199AC4"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(0, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke;
    v93[3] = &unk_1E6BCD930;
    v94 = v6;
    v8 = v6;
    objc_msgSend(&unk_1E6CA96E8, "enumerateObjectsUsingBlock:", v93);
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:forDevice:](NTKFaceBackgroundStyleEditOption, "optionWithBackgroundStyle:forDevice:", 1, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v7;
    v89[1] = 3221225472;
    v89[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2;
    v89[3] = &unk_1E6BD0B40;
    v90 = v3;
    v91 = v11;
    v12 = v10;
    v92 = v12;
    v13 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v89);
    v14 = v92;
    v15 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("E7B1CD81-445C-4840-9F24-3A32B510B6A1"));
    v18 = objc_msgSend(v3, "supportsCapability:", v17);

    if (v18)
    {
      +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pigmentSetForDomain:bundle:", v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pigmentsFromMostRecentAddableCollectionsForSlot:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:forDevice:](NTKFaceBackgroundStyleEditOption, "optionWithBackgroundStyle:forDevice:", 1, v3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_102;
      v85[3] = &unk_1E6BD0B40;
      v27 = v3;
      v86 = v27;
      v87 = v25;
      v28 = v26;
      v88 = v28;
      v29 = v25;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v85);
      if (NTKShowCarbonara(v27) && (unint64_t)objc_msgSend(v28, "count") >= 7)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", 6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObjectAtIndex:", 6);
        objc_msgSend(v28, "insertObject:atIndex:", v30, 0);

      }
      v31 = v88;
      v15 = v28;

    }
    else
    {
      if (NTKShowGossamerUI(v3))
      {
        +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("special.multicolor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v32);

        v33 = 4;
      }
      else
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v98[0] = CFSTR("seasons.spring2015.white");
        v98[1] = CFSTR("seasons.black");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v82 != v37)
                objc_enumerationMutation(v34);
              +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v39);

            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
          }
          while (v36);
        }

        v33 = 3;
      }
      +[NTKFaceColorEditOption standardColorValuesForDevice:](NTKFaceColorEditOption, "standardColorValuesForDevice:", v3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "subarrayWithRange:", 0, v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v42 = v41;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v78;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v78 != v45)
              objc_enumerationMutation(v42);
            +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorEditOption, "optionWithFaceColor:forDevice:", objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "integerValue"), v3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "pigmentEditOption");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v48);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
        }
        while (v44);
      }
      v62 = v42;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDualTimeStyleEditOption optionWithStyle:forDevice:](NTKDualTimeStyleEditOption, "optionWithStyle:forDevice:", 0, v3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObject:", v50);

      +[NTKDualTimeStyleEditOption optionWithStyle:forDevice:](NTKDualTimeStyleEditOption, "optionWithStyle:forDevice:", 1, v3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v49;
      objc_msgSend(v49, "addObject:", v51);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v63 = v16;
      obj = v16;
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
      if (v67)
      {
        v65 = *(_QWORD *)v74;
        do
        {
          v52 = 0;
          do
          {
            if (*(_QWORD *)v74 != v65)
              objc_enumerationMutation(obj);
            v68 = v52;
            v53 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v52);
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v54 = v66;
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v95, 16);
            if (v55)
            {
              v56 = v55;
              v57 = *(_QWORD *)v70;
              do
              {
                for (k = 0; k != v56; ++k)
                {
                  if (*(_QWORD *)v70 != v57)
                    objc_enumerationMutation(v54);
                  v59 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
                  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, v3);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "selectOption:forCustomEditMode:slot:", v53, 10, 0);
                  objc_msgSend(v60, "selectOption:forCustomEditMode:slot:", v59, 15, 0);
                  objc_msgSend(v15, "addObject:", v60);

                }
                v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v95, 16);
              }
              while (v56);
            }

            v52 = v68 + 1;
          }
          while (v68 + 1 != v67);
          v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
        }
        while (v67);
      }

      v16 = v63;
    }

  }
  return v15;
}

void __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;

  v5 = a2;
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, *(_QWORD *)(a1 + 32));
  if (objc_claimAutoreleasedReturnValue())
  {
    +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", 7);
    objc_claimAutoreleasedReturnValue();
    +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", 18);
    objc_claimAutoreleasedReturnValue();
    __asm { BR              X10 }
  }

}

uint64_t __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", a3, a2);
}

void __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_102(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  const __CFString *v37;
  void *v38;
  _QWORD v39[3];
  _QWORD v40[3];
  const __CFString *v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    switch(a3)
    {
      case 0:
        v51[0] = CFSTR("top");
        v51[1] = CFSTR("center");
        v52[0] = &unk_1E6CA9790;
        v52[1] = &unk_1E6CA97A8;
        v51[2] = CFSTR("bottom");
        v52[2] = &unk_1E6CA97C0;
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = v52;
        v9 = v51;
        goto LABEL_19;
      case 1:
        v49[0] = CFSTR("top");
        v49[1] = CFSTR("center");
        v50[0] = &unk_1E6CA97D8;
        v50[1] = &unk_1E6CA97F0;
        v49[2] = CFSTR("bottom");
        v50[2] = &unk_1E6CA9808;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v50;
        v16 = v49;
        goto LABEL_12;
      case 2:
        v47[0] = CFSTR("top");
        v47[1] = CFSTR("center");
        v48[0] = &unk_1E6CA9820;
        v48[1] = &unk_1E6CA9838;
        v47[2] = CFSTR("bottom");
        v48[2] = &unk_1E6CA9850;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v48;
        v16 = v47;
        goto LABEL_12;
      case 3:
        v45[0] = CFSTR("top");
        v45[1] = CFSTR("center");
        v46[0] = &unk_1E6CA9868;
        v46[1] = &unk_1E6CA9880;
        v45[2] = CFSTR("bottom");
        v46[2] = &unk_1E6CA9898;
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = v46;
        v9 = v45;
        goto LABEL_19;
      case 4:
        v43[0] = CFSTR("top");
        v43[1] = CFSTR("center");
        v44[0] = &unk_1E6CA98B0;
        v44[1] = &unk_1E6CA98C8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(*(id *)(a1 + 32), "supportsUrsa"))
          goto LABEL_13;
        +[NTKBundleComplication bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:](NTKBundleComplication, "bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.apple.NanoCompass.complications.compass.bearing"), CFSTR("com.apple.NanoCompass.watchkitapp"), 0);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
        {
          v41 = CFSTR("bottom");
          v42 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }

        v11 = 0;
        goto LABEL_14;
      case 5:
        v39[0] = CFSTR("top");
        v39[1] = CFSTR("center");
        v40[0] = &unk_1E6CA98E0;
        v40[1] = &unk_1E6CA98F8;
        v39[2] = CFSTR("bottom");
        v40[2] = &unk_1E6CA9910;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v40;
        v16 = v39;
LABEL_12:
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v11 = 0;
        v12 = 0;
LABEL_14:
        v10 = 1;
        goto LABEL_21;
      case 6:
        if (NTKShowCarbonara(*(void **)(a1 + 32)))
        {
          v19 = objc_alloc(MEMORY[0x1E0C94578]);
          NTKCarbonaraWidgetIntent();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intent:", CFSTR("com.apple.NanoHome.NanoHomeWidgets"), CFSTR("com.apple.NanoHome"), CFSTR("com.apple.HomeEnergyUI.EnergyForecastComplication"), v20);

          +[NTKWidgetComplication complicationWithDescriptor:](NTKApricotComplication, "complicationWithDescriptor:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = CFSTR("bottom");
          v38 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = CFSTR("top");
          v35[1] = CFSTR("center");
          v36[0] = &unk_1E6CA9928;
          v36[1] = &unk_1E6CA9940;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = 0;
        }
        else
        {
          v33[0] = CFSTR("top");
          v33[1] = CFSTR("center");
          v34[0] = &unk_1E6CA9958;
          v34[1] = &unk_1E6CA9970;
          v33[2] = CFSTR("bottom");
          v34[2] = &unk_1E6CA9988;
          v7 = (void *)MEMORY[0x1E0C99D80];
          v8 = v34;
          v9 = v33;
LABEL_19:
          objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
          v11 = 0;
        }
        v12 = 0;
LABEL_21:
        objc_msgSend(v6, "_setFaceGalleryComplicationTypesForSlots:canRepeat:", v13, 1);
        v23 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_172;
        v29[3] = &unk_1E6BD0B68;
        v24 = v6;
        v30 = v24;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v29);
        v27[0] = v23;
        v27[1] = 3221225472;
        v27[2] = __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_174;
        v27[3] = &unk_1E6BD0B90;
        v25 = v24;
        v28 = v25;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v27);
        +[NTKDualTimeStyleEditOption optionWithStyle:forDevice:](NTKDualTimeStyleEditOption, "optionWithStyle:forDevice:", v10, *(_QWORD *)(a1 + 32));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "selectOption:forCustomEditMode:slot:", v26, 15, 0);
        objc_msgSend(v25, "selectOption:forCustomEditMode:slot:", v5, 10, 0);
        objc_msgSend(v25, "selectOption:forCustomEditMode:slot:", *(_QWORD *)(a1 + 40), 17, 0);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);

        break;
      case 7:
        v31[0] = CFSTR("top");
        v31[1] = CFSTR("center");
        v32[0] = &unk_1E6CA99A0;
        v32[1] = &unk_1E6CA99B8;
        v31[2] = CFSTR("bottom");
        v32[2] = &unk_1E6CA99D0;
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = v32;
        v9 = v31;
        goto LABEL_19;
      default:
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        goto LABEL_21;
    }
  }

}

uint64_t __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", a3, a2);
}

uint64_t __61__NTKCWhistlerSubdialsFacesGalleryCollection_facesForDevice___block_invoke_2_174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", a3, a2);
}

@end
