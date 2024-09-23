@implementation WFContactContentItem

+ (id)cachedContactGroups
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v2 = (void *)cachedContactGroups_contactGroups;
  if (!cachedContactGroups_contactGroups)
  {
    +[WFContactGroup allContactGroups](WFContactGroup, "allContactGroups");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)cachedContactGroups_contactGroups;
    cachedContactGroups_contactGroups = v3;

    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__5819;
    v13 = __Block_byref_object_dispose__5820;
    v14 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__WFContactContentItem_cachedContactGroups__block_invoke;
    v8[3] = &unk_24C4E3118;
    v8[4] = &v9;
    +[WFContact addContactsChangeObserver:](WFContact, "addContactsChangeObserver:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v10[5];
    v10[5] = v5;

    _Block_object_dispose(&v9, 8);
    v2 = (void *)cachedContactGroups_contactGroups;
  }
  return v2;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
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
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v130;
  _QWORD v131[5];
  _QWORD v132[5];
  _QWORD v133[24];

  v133[22] = *MEMORY[0x24BDAC8D0];
  v130 = (void *)objc_opt_new();
  WFLocalizedContentPropertyNameMarker(CFSTR("First Name"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v128, objc_opt_class());
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "userInfo:", &unk_24C50F278);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setterBlock:", &__block_literal_global_115_5750);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v125;
  WFLocalizedContentPropertyNameMarker(CFSTR("Middle Name"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v124, objc_opt_class());
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "userInfo:", &unk_24C50F290);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setterBlock:", &__block_literal_global_122_5752);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v121;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Name"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v120, objc_opt_class());
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "userInfo:", &unk_24C50F2A8);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setterBlock:", &__block_literal_global_127);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v133[2] = v117;
  WFLocalizedContentPropertyNameMarker(CFSTR("Phone Numbers"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_129_5755, v116, objc_opt_class());
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "userInfo:", &unk_24C50F2C0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "multipleValues:", 1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setterBlock:", &__block_literal_global_138);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Phone Number"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "singularItemName:", v111);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v133[3] = v110;
  WFLocalizedContentPropertyNameMarker(CFSTR("Email Addresses"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_142, v109, objc_opt_class());
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "userInfo:", &unk_24C50F2D8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "multipleValues:", 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setterBlock:", &__block_literal_global_148);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Email Address"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "singularItemName:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v133[4] = v103;
  WFLocalizedContentPropertyNameMarker(CFSTR("Street Addresses"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_152_5758, v102, objc_opt_class());
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "userInfo:", &unk_24C50F2F0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "multipleValues:", 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setterBlock:", &__block_literal_global_158);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Street Address"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "singularItemName:", v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v133[5] = v96;
  WFLocalizedContentPropertyNameMarker(CFSTR("URLs"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_162, v95, objc_opt_class());
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "userInfo:", &unk_24C50F308);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "multipleValues:", 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "canLowercaseName:", 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setterBlock:", &__block_literal_global_168);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("URL"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "singularItemName:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v133[6] = v88;
  WFLocalizedContentPropertyNameMarker(CFSTR("Birthday"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("contact.birthday.value"), v87, objc_opt_class());
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "userInfo:", &unk_24C50F320);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "timeUnits:", 8220);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "comparableUnits:", 24);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setterBlock:", &__block_literal_global_179);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v133[7] = v82;
  WFLocalizedContentPropertyNameMarker(CFSTR("Contact Photo"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_181, v81, objc_opt_class());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "userInfo:", &unk_24C50F338);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setterBlock:", &__block_literal_global_188);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v133[8] = v78;
  WFLocalizedContentPropertyNameMarker(CFSTR("Has Photo"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_190, v76, objc_opt_class());
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Has No Photo"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "negativeName:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Contact"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "singularItemName:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "gettable:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "userInfo:", &unk_24C50F350);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v133[9] = v69;
  WFLocalizedContentPropertyNameMarker(CFSTR("Prefix"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v68, objc_opt_class());
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "userInfo:", &unk_24C50F368);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setterBlock:", &__block_literal_global_205_5765);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v133[10] = v65;
  WFLocalizedContentPropertyNameMarker(CFSTR("Suffix"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v64, objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "userInfo:", &unk_24C50F380);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setterBlock:", &__block_literal_global_210);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v133[11] = v61;
  WFLocalizedContentPropertyNameMarker(CFSTR("Nickname"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v60, objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "userInfo:", &unk_24C50F398);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setterBlock:", &__block_literal_global_215_5768);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v133[12] = v57;
  WFLocalizedContentPropertyNameMarker(CFSTR("Phonetic First Name"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v56, objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "userInfo:", &unk_24C50F3B0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setterBlock:", &__block_literal_global_220);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v133[13] = v53;
  WFLocalizedContentPropertyNameMarker(CFSTR("Phonetic Last Name"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v52, objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "userInfo:", &unk_24C50F3C8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setterBlock:", &__block_literal_global_225_5770);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v133[14] = v49;
  WFLocalizedContentPropertyNameMarker(CFSTR("Phonetic Middle Name"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v48, objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "userInfo:", &unk_24C50F3E0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setterBlock:", &__block_literal_global_230);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v133[15] = v45;
  WFLocalizedContentPropertyNameMarker(CFSTR("Company"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v44, objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "userInfo:", &unk_24C50F3F8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setterBlock:", &__block_literal_global_235);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v133[16] = v41;
  WFLocalizedContentPropertyNameMarker(CFSTR("Job Title"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v40, objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "userInfo:", &unk_24C50F410);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setterBlock:", &__block_literal_global_240);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v133[17] = v37;
  WFLocalizedContentPropertyNameMarker(CFSTR("Department"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v36, objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "userInfo:", &unk_24C50F428);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setterBlock:", &__block_literal_global_245);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v133[18] = v33;
  WFLocalizedContentPropertyNameMarker(CFSTR("Notes"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_5745, v32, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "userInfo:", &unk_24C50F440);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sortable:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendable:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setterBlock:", &__block_literal_global_250);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v133[19] = v27;
  WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("contact.creationDate"), v26, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo:", CFSTR("WFFileCreationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tense:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeUnits:", 8444);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v133[20] = v5;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("contact.modificationDate"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo:", CFSTR("WFFileModificationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tense:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeUnits:", 8444);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v133[21] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v133, 22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "addObjectsFromArray:", v11);

  v12 = MEMORY[0x24BDAC760];
  v132[0] = MEMORY[0x24BDAC760];
  v132[1] = 3221225472;
  v132[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_2_260;
  v132[3] = &__block_descriptor_40_e43_v32__0__WFContactContentItem_8_16___v____24l;
  v132[4] = a1;
  WFLocalizedContentPropertyNameMarker(CFSTR("Group"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v132, v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "multipleValues:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v12;
  v131[1] = 3221225472;
  v131[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_4;
  v131[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v131[4] = a1;
  objc_msgSend(v15, "possibleValuesGetter:", v131);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo:", CFSTR("WFContactItemGroupProperty"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gettable:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setterBlock:", &__block_literal_global_270);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "insertObject:atIndex:", v19, 0);

  WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_272, v20, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userInfo:", CFSTR("WFFileSizeProperty"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filterable:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sortable:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "addObject:", v24);

  return v130;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  WFLocalizedString(CFSTR("Full Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior coercingToStringWithDescription:](WFContentItemStringConversionBehavior, "coercingToStringWithDescription:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_METACLASS___WFContactContentItem;
    objc_msgSendSuper2(&v19, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __81__WFContactContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke;
    v14[3] = &unk_24C4DDAE0;
    v15 = v10;
    v16 = v12;
    v17 = v13;
    v18 = a1;
    objc_msgSend(v16, "allowContactsAccessWithCompletionHandler:", v14);

  }
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFContactContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8638]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Contact (singular)"), CFSTR("Contact"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Contacts (plural)"), CFSTR("Contacts"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Contacts"));
}

void __81__WFContactContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend(a2, "allContactsWithSortOrder:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_283);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8.receiver = *(id *)(a1 + 56);
  v8.super_class = (Class)&OBJC_METACLASS___WFContactContentItem;
  objc_msgSendSuper2(&v8, sel_runQuery_withItems_permissionRequestor_completionHandler_, v5, v4, v6, v7);

}

WFContactContentItem *__81__WFContactContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:](WFContactContentItem, "itemWithObject:", a2);
}

- (WFContact)contact
{
  return (WFContact *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)changeTransaction
{
  return -[WFContactContentItemChangeTransaction initWithContentItem:]([WFContactContentItemChangeTransaction alloc], "initWithContentItem:", self);
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFContactContentItem contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasImageData");
LABEL_16:
    v7 = v6;
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFContactContentItem contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasValueForPropertyID:", 17) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[WFContactContentItem contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "hasValueForPropertyID:", 12);

    }
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFContactContentItem contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    v9 = 22;
LABEL_15:
    v6 = objc_msgSend(v8, "hasValueForPropertyID:", v9);
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFContactContentItem contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    v9 = 5;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFContactContentItem contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    v9 = 3;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFContactContentItem contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    v9 = 4;
    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFContactContentItem;
    v7 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v12, sel_canGenerateRepresentationForType_, v4);
  }
LABEL_18:

  return v7;
}

- (id)objectRepresentationsFromLabeledValues:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_294);
}

- (id)unnamedObjectRepresentationsFromLabeledValues:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_296);
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  WFProcessedContacts *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  WFProcessedContacts *v21;
  WFContactFieldEntry *v22;
  void *v23;
  WFContactFieldEntry *v24;
  void *v25;
  void *v26;
  void *v27;
  WFProcessedContacts *v28;
  void *v29;
  WFContactFieldEntry *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContactContentItem contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageData");
    v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = 0;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BEC14E0], "imageWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v13 = (void *)MEMORY[0x24BDBCE30];
    -[WFContactContentItem contact](self, "contact");
    v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();
    -[WFProcessedContacts birthday](v9, "birthday");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithObjects:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItem contact](self, "contact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItem objectRepresentationsFromLabeledValues:](self, "objectRepresentationsFromLabeledValues:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContactContentItem contact](self, "contact");
    v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();
    -[WFProcessedContacts streetAddresses](v9, "streetAddresses");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v10 = (void *)v19;
    -[WFContactContentItem unnamedObjectRepresentationsFromLabeledValues:](self, "unnamedObjectRepresentationsFromLabeledValues:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v12 = (void *)v20;
    goto LABEL_19;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContactContentItem contact](self, "contact");
    v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();
    -[WFProcessedContacts phoneNumbers](v9, "phoneNumbers");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContactContentItem contact](self, "contact");
    v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();
    -[WFProcessedContacts emailAddresses](v9, "emailAddresses");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContactContentItem contact](self, "contact");
    v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();
    -[WFProcessedContacts URLs](v9, "URLs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactContentItem objectRepresentationsFromLabeledValues:](self, "objectRepresentationsFromLabeledValues:", v10);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v21 = [WFProcessedContacts alloc];
    v22 = [WFContactFieldEntry alloc];
    -[WFContactContentItem contact](self, "contact");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFContactFieldEntry initWithContact:](v22, "initWithContact:", v23);
    v30 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFProcessedContacts initWithEntries:](v21, "initWithEntries:", v25);

    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() != a3)
    return 0;
  -[WFContactContentItem contact](self, "contact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "INPersonRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v27);
  v9 = (WFProcessedContacts *)objc_claimAutoreleasedReturnValue();

  v28 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v12;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BEC14A0];
  v7 = *MEMORY[0x24BDF8638];
  v8 = a3;
  objc_msgSend(v6, "typeWithUTType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "conformsToType:", v9);

  if ((_DWORD)v7)
  {
    -[WFContactContentItem contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vCardRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "wfType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToClass:", objc_opt_class());

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributionSetWithCachingIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFContactContentItem;
    -[WFContentItem defaultSourceForRepresentation:](&v12, sel_defaultSourceForRepresentation_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

id __70__WFContactContentItem_unnamedObjectRepresentationsFromLabeledValues___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__WFContactContentItem_objectRepresentationsFromLabeledValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_260(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "cachedContactGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_3;
  v12[3] = &unk_24C4DD9F8;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "if_compactMap:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v8, v11);

}

id __40__WFContactContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cachedContactGroups");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_7;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGroupChangeRequest:");
}

id __40__WFContactContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsContact:", v4))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_249(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a2;
  v4 = a3;
  objc_msgSend(v12, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("Append"));

  if (v6)
  {
    objc_msgSend(v12, "mutableContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "note");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingAsNewLine:](v8, "stringByAppendingAsNewLine:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "mutableContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNote:", v9);

    v4 = v8;
  }
  else
  {
    if (v4)
      v11 = v4;
    else
      v11 = &stru_24C4E3948;
    objc_msgSend(v12, "mutableContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNote:", v11);
  }

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_244(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDepartmentName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_239(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setJobTitle:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_234(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrganizationName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_229(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhoneticMiddleName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_224(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhoneticFamilyName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_219(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhoneticGivenName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_214(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNickname:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_209(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNameSuffix:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_204(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNamePrefix:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_189(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "contact");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v9, "hasImageData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v8);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2;
  objc_msgSend(a3, "PNGRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutableContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageData:", v7);

  objc_msgSend(v4, "mutableContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setThumbnailImageData:", v7);
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_180(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BEC14E0];
  v7 = a4;
  objc_msgSend(a2, "contact");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v9);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "mutableContact");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBirthday:", v4);

}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_167(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateURLs:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_161(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a2, "contact");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v8);

}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_157(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStreetAddresses:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_151(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a2, "contact");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "streetAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v8);

}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateEmailAddresses:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_141(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a2, "contact");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v8);

}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_136(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePhoneNumbers:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a2, "contact");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phoneNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v8);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_126(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFamilyName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_121(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMiddleName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke_113(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableContact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGivenName:", v4);

}

void __40__WFContactContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v7)(_QWORD, _QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a2, "contact");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v11, "valueForPropertyID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v10);

}

uint64_t __43__WFContactContentItem_cachedContactGroups__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)cachedContactGroups_contactGroups;
  cachedContactGroups_contactGroups = 0;

  return +[WFContact removeContactsChangeObserver:](WFContact, "removeContactsChangeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  if (a3)
  {
    v5 = a3;
    -[WFContactContentItem contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "organization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v7);

  }
  -[WFContactContentItem contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "organization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double b;
  double a;
  double d;
  double c;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CGAffineTransform v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[2];

  height = a4.height;
  width = a4.width;
  v54[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, _QWORD))a3;
  -[WFContactContentItem contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "hasImageData")
    || (objc_msgSend(v8, "thumbnailImageData"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = 0;
      goto LABEL_22;
    }
    if (v7)
    {
      objc_msgSend(v8, "contact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "screenScale");
      v27 = v26;

      +[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "shouldReverseLayoutDirection");

      v48 = 0;
      v49 = &v48;
      v50 = 0x2050000000;
      v30 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
      v51 = getCNAvatarImageRenderingScopeClass_softClass;
      if (!getCNAvatarImageRenderingScopeClass_softClass)
      {
        v43 = MEMORY[0x24BDAC760];
        v44 = 3221225472;
        v45 = __getCNAvatarImageRenderingScopeClass_block_invoke;
        v46 = &unk_24C4E3118;
        v47 = &v48;
        __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)&v43);
        v30 = (void *)v49[3];
      }
      v31 = objc_retainAutorelease(v30);
      _Block_object_dispose(&v48, 8);
      objc_msgSend(v31, "scopeWithPointSize:scale:rightToLeft:style:", v29, 0, width, height, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v49 = &v48;
      v50 = 0x2050000000;
      v32 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
      v51 = getCNAvatarImageRendererSettingsClass_softClass;
      if (!getCNAvatarImageRendererSettingsClass_softClass)
      {
        v43 = MEMORY[0x24BDAC760];
        v44 = 3221225472;
        v45 = __getCNAvatarImageRendererSettingsClass_block_invoke;
        v46 = &unk_24C4E3118;
        v47 = &v48;
        __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)&v43);
        v32 = (void *)v49[3];
      }
      v33 = objc_retainAutorelease(v32);
      _Block_object_dispose(&v48, 8);
      objc_msgSend(v33, "defaultSettings");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v49 = &v48;
      v50 = 0x2050000000;
      v35 = (void *)getCNAvatarImageRendererClass_softClass;
      v51 = getCNAvatarImageRendererClass_softClass;
      if (!getCNAvatarImageRendererClass_softClass)
      {
        v43 = MEMORY[0x24BDAC760];
        v44 = 3221225472;
        v45 = __getCNAvatarImageRendererClass_block_invoke;
        v46 = &unk_24C4E3118;
        v47 = &v48;
        __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v43);
        v35 = (void *)v49[3];
      }
      v36 = objc_retainAutorelease(v35);
      _Block_object_dispose(&v48, 8);
      v37 = (void *)objc_msgSend([v36 alloc], "initWithSettings:", v34);
      v52 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "avatarImageForContacts:scope:", v38, v23);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v39 != 0;
      if (v39)
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithPlatformImage:", v39);
        v7[2](v7, v40, 0);

      }
      goto LABEL_19;
    }
LABEL_21:
    v24 = 1;
    goto LABEL_22;
  }
  if (!v7)
    goto LABEL_21;
  v10 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(v8, "thumbnailImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screenScale");
  v15 = v14;

  CGAffineTransformMakeScale(&v42, v15, v15);
  a = v42.a;
  b = v42.b;
  c = v42.c;
  d = v42.d;
  objc_msgSend(v12, "sizeInPixels");
  if (v20 > height * c + a * width)
  {
    objc_msgSend(v12, "sizeInPixels");
    if (v21 > height * d + b * width)
    {
      objc_msgSend(v12, "resizedImageWithSizeInPoints:scale:", width, height, v15);
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v22;
    }
  }
  v53 = *MEMORY[0x24BEC1820];
  v54[0] = &unk_24C50F530;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v7)[2](v7, v12, v23);
  v24 = 1;
LABEL_19:

LABEL_22:
  return v24;
}

@end
