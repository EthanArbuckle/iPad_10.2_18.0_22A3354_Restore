@implementation WDMedicalRecordTableViewUtility

+ (void)registerReuseIdentifiersWithTableView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;

  v3 = a3;
  v4 = objc_opt_class();
  +[HRTimelineHeaderView reuseIdentifier](HRTimelineHeaderView, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v4, v5);

  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));
  v6 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordCategorySectionHeaderCell, "defaultReuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v7);

  v8 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordCategoryMinimizedSectionHeaderCell, "defaultReuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v8, v9);

  v10 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordReferenceRangeViewCell, "defaultReuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v10, v11);

  v12 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordBrandCell, "defaultReuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v12, v13);

  v14 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordStandaloneCell, "defaultReuseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v14, v15);

  v16 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordSectionHeaderCell, "defaultReuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v16, v17);

  v18 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineProviderTitleCell, "defaultReuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v18, v19);

  v20 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineContentSubtitleCell, "defaultReuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v20, v21);

  v22 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineValueCell, "defaultReuseIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v22, v23);

  v24 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelinePanelTitleCell, "defaultReuseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v24, v25);

  v26 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineAppendixCell, "defaultReuseIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v26, v27);

  v28 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordDetailTitleCell, "defaultReuseIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v28, v29);

  v30 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordDetailSubtitleCell, "defaultReuseIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v30, v31);

  v32 = objc_opt_class();
  +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordDetailAttributedSubtitleCell, "defaultReuseIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v32, v33);

  v34 = objc_opt_class();
  +[HRConceptHeaderCell defaultReuseIdentifier](HRConceptHeaderCell, "defaultReuseIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v34, v35);

  v36 = objc_opt_class();
  +[WDMedicalRecordSpacerTextCell defaultReuseIdentifier](WDMedicalRecordSpacerTextCell, "defaultReuseIdentifier");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v36, v37);

}

+ (id)medicalRecordCellWithTableView:(id)a3 displayItem:(id)a4 clinicalAccount:(id)a5 accountOwner:(id)a6 clinicalDataSourcesProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  objc_class *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  objc_class *v92;
  NSObject *v93;
  id v94;
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  id v101;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  switch(objc_msgSend(v13, "displayItemType"))
  {
    case 1:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineProviderTitleCell, "defaultReuseIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", 1);
      objc_msgSend(v13, "brandableObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v22);

      goto LABEL_24;
    case 2:
      +[WDMedicalRecordSpacerTextCell defaultReuseIdentifier](WDMedicalRecordSpacerTextCell, "defaultReuseIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v24);

      objc_msgSend(v18, "setUseTallTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      break;
    case 3:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordCategoryMinimizedSectionHeaderCell, "defaultReuseIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      objc_msgSend(v13, "metricColors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "keyColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F720]), "initWithTopColor:bottomColor:", v27, v27);
      objc_msgSend(v18, "setGradient:", v28);

      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      goto LABEL_36;
    case 4:
      v29 = v15;
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineContentSubtitleCell, "defaultReuseIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v31);

      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      objc_msgSend(v18, "setShowDisclosureIndicator:", objc_msgSend(v13, "showDisclosureIndicator"));
      objc_msgSend(v18, "setUseRegularFontForSubtitle:", objc_msgSend(v13, "useRegularFontForSubtitle"));
      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      objc_msgSend(v13, "medicalRecord");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "medicalRecordOriginType");

      if (v33 == 3)
      {
        objc_msgSend(v13, "medicalRecord");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "originIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "signedClinicalDataRecordIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v18, "setCurrentSignedClinicalDataRecordIdentifier:", v36);
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke;
          v97[3] = &unk_1E74D17E0;
          v98 = v18;
          v99 = v36;
          v100 = v13;
          v101 = a1;
          objc_msgSend(v16, "fetchSignedClinicalDataRecordWithIdentifier:completion:", v99, v97);

        }
        else
        {
          _HKInitializeLogging();
          v93 = *MEMORY[0x1E0CB52D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_FAULT))
            +[WDMedicalRecordTableViewUtility medicalRecordCellWithTableView:displayItem:clinicalAccount:accountOwner:clinicalDataSourcesProvider:].cold.1((uint64_t)v35, v93);
        }

      }
      else
      {
        objc_msgSend(v13, "subtitle");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSubtitle:", v86);

      }
      v15 = v29;
      break;
    case 5:
      v94 = v16;
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineValueCell, "defaultReuseIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v38);

      objc_msgSend(v13, "valueString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unitString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:unit:", v39, v40);

      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      objc_msgSend(v13, "medicalRecord");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "medicalRecordOriginType");

      v95 = v15;
      v43 = v14;
      if (v42 == 3)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "checkmarkSymbol");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      v87 = (void *)MEMORY[0x1E0CB3778];
      objc_msgSend(v13, "subtitle");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "attributedStringText:textColor:symbol:symbolColor:useLargeSpacing:", v88, v89, v44, v90, 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setAttributedSubtitleText:", v91);
      v14 = v43;
      v16 = v94;
      v15 = v95;
      break;
    case 6:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordReferenceRangeViewCell, "defaultReuseIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v45);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "subtitle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSubtitle:", v46);

      objc_msgSend(v13, "chartValueWithRange");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValueInRange:", v47);

      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      objc_msgSend(v13, "medicalRecord");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "medicalRecordOriginType");

      if (v49 == 3)
      {
        v50 = (void *)MEMORY[0x1E0CB3778];
        objc_msgSend(v13, "subtitle");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v96 = v15;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "checkmarkSymbol");
        v53 = v16;
        v54 = v14;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "attributedStringText:textColor:symbol:symbolColor:useLargeSpacing:", v51, v52, v55, v56, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v54;
        v16 = v53;

        v15 = v96;
        objc_msgSend(v18, "setAttributedSubtitleText:", v57);
      }
      else
      {
        objc_msgSend(v13, "subtitle");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSubtitle:", v57);
      }

      break;
    case 7:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelineAppendixCell, "defaultReuseIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v58);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v59);
      goto LABEL_15;
    case 8:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordTimelinePanelTitleCell, "defaultReuseIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v60);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v61);

      objc_msgSend(v13, "subtitle");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSubtitle:", v59);
LABEL_15:

      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      v62 = objc_msgSend(v13, "separatorStyle");
      v63 = objc_msgSend(v13, "separatorHidden");
      v64 = v18;
      v65 = v62;
      goto LABEL_25;
    case 9:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordSectionHeaderCell, "defaultReuseIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v66);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v20);
      goto LABEL_24;
    case 10:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordBrandCell, "defaultReuseIdentifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v67);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v27, "setSeparatorInsets:");
      objc_msgSend(v27, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      if (v14 && v16)
      {
        objc_msgSend(v27, "setBrandable:dataProvider:", v14, v16);
        objc_msgSend(v16, "nameAndFormattedBirthDateForAccountOwner:", v15);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "brandDetailLabel");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setText:", v68);

        objc_msgSend(v27, "_updateLabelVisibility");
        v70 = v27;
      }
      else
      {
        v92 = (objc_class *)objc_opt_class();
        NSStringFromClass(v92);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        HKErrorTableViewCell();
        v70 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v70;

LABEL_36:
      break;
    case 11:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordStandaloneCell, "defaultReuseIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v71);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v72);

      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      goto LABEL_28;
    case 14:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordDetailTitleCell, "defaultReuseIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v75);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v76);

      objc_msgSend(v13, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDateSubtitle:", v20);
      goto LABEL_24;
    case 15:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordDetailSubtitleCell, "defaultReuseIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v77);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v78);

      objc_msgSend(v13, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSubtitle:", v20);
      goto LABEL_24;
    case 16:
    case 17:
      +[WDMedicalRecordGroupableCell defaultReuseIdentifier](WDMedicalRecordDetailAttributedSubtitleCell, "defaultReuseIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v19);

      objc_msgSend(v13, "attributedSubtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAttributedSubtitle:", v20);
LABEL_24:

      objc_msgSend(v13, "separatorInsets");
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      v79 = objc_msgSend(v13, "separatorStyle");
      v63 = objc_msgSend(v13, "separatorHidden");
      v64 = v18;
      v65 = v79;
LABEL_25:
      objc_msgSend(v64, "setSeparatorDashStyle:hidden:", v65, v63);
      break;
    case 18:
      +[HRConceptHeaderCell defaultReuseIdentifier](HRConceptHeaderCell, "defaultReuseIdentifier");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v81);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      objc_msgSend(v13, "image");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHeaderImage:", v82);

      objc_msgSend(v13, "title");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v83);

      objc_msgSend(v13, "metricColors");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "keyColor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCategoryColor:", v85);

LABEL_28:
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      break;
    default:
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      HKErrorTableViewCell();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v18;
}

void __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_2;
    v8[3] = &unk_1E74D1288;
    v9 = a1[4];
    v10 = a1[5];
    v11 = v5;
    v12 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_cold_1((uint64_t)a1, (uint64_t)v6, v7);
  }

}

void __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "currentSignedClinicalDataRecordIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "subtitle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedMeaningfulDateStringWithDateTitle:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributedSubtitleText:", v6);

  }
}

+ (void)medicalRecordCellWithTableView:(uint64_t)a1 displayItem:(NSObject *)a2 clinicalAccount:accountOwner:clinicalDataSourcesProvider:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1BC30A000, a2, OS_LOG_TYPE_FAULT, "%{public}@ has no ClinicalSourcesDataProvider", (uint8_t *)&v2, 0xCu);
}

void __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1BC30A000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch SCD record with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
