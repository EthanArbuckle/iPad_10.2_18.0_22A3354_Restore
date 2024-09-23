@implementation WFCalendarEventContentItem

+ (id)itemWithEKEvent:(id)a3 fromEventStore:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "itemWithObject:named:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEventStore:", v6);

  return v7;
}

+ (id)propertyBuilders
{
  uint64_t v3;
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
  id v15;
  void *v16;
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
  _QWORD v106[6];
  _QWORD v107[6];
  _QWORD v108[22];

  v108[20] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Start Date"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.startDate"), v105, objc_opt_class());
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "timeUnits:", 8444);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v107[0] = MEMORY[0x24BDAC760];
  v107[1] = 3221225472;
  v107[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke;
  v107[3] = &__block_descriptor_48_e74_v24__0__WFCalendarEventContentItemChangeTransaction_8__NSDateComponents_16l;
  v107[4] = 8444;
  v107[5] = a1;
  objc_msgSend(v103, "setterBlock:", v107);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "removable:", 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v101;
  WFLocalizedContentPropertyNameMarker(CFSTR("End Date"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.endDate"), v100, objc_opt_class());
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "timeUnits:", 8444);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v3;
  v106[1] = 3221225472;
  v106[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_2;
  v106[3] = &__block_descriptor_48_e56_v24__0__WFCalendarEventContentItemChangeTransaction_8_16l;
  v106[4] = 8444;
  v106[5] = a1;
  objc_msgSend(v98, "setterBlock:", v106);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "removable:", 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v96;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is All Day"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.allDay"), v94, objc_opt_class());
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not All Day"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "negativeName:", v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Event"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "singularItemName:", v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setterBlock:", &__block_literal_global_4455);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v88;
  WFLocalizedContentPropertyNameMarker(CFSTR("Calendar"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.calendar.title"), v87, objc_opt_class());
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "possibleValuesGetter:", &__block_literal_global_72);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v85;
  WFLocalizedContentPropertyNameMarker(CFSTR("Location"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("location"), v84, objc_opt_class());
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sortable:", 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setterBlock:", &__block_literal_global_86_4457);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v108[4] = v81;
  WFLocalizedContentPropertyNameMarker(CFSTR("Has Alarms"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.hasAlarms"), v79, objc_opt_class());
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Has No Alarms"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "negativeName:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Event"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "singularItemName:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v108[5] = v74;
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_94, v73, objc_opt_class());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "timeUnits:", 240);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setterBlock:", &__block_literal_global_98);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "removable:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v108[6] = v69;
  WFLocalizedContentPropertyNameMarker(CFSTR("Canceled"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("isCanceled"), v67, objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Canceled"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "displayName:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Canceled"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "negativeName:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v108[7] = v62;
  WFLocalizedContentPropertyNameMarker(CFSTR("My Status"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("myStatus"), v61, objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFEKParticipantContentItem possibleStatuses](WFEKParticipantContentItem, "possibleStatuses");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "possibleValues:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setterBlock:", &__block_literal_global_112_4468);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v108[8] = v57;
  WFLocalizedContentPropertyNameMarker(CFSTR("Organizer"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_114, v56, objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v108[9] = v55;
  WFLocalizedContentPropertyNameMarker(CFSTR("Organizer Is Me"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_118, v53, objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Organizer Is Not Me"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "negativeName:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v108[10] = v50;
  WFLocalizedContentPropertyNameMarker(CFSTR("Attendees"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_123_4473, v49, objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "multipleValues:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setterBlock:", &__block_literal_global_129);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v108[11] = v46;
  WFLocalizedContentPropertyNameMarker(CFSTR("Number of Attendees"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_131, v45, objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v108[12] = v44;
  WFLocalizedContentPropertyNameMarker(CFSTR("URL"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.URL"), v43, objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "filterable:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sortable:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setterBlock:", &__block_literal_global_140);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "canLowercaseName:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v108[13] = v38;
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.title"), v37, objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setterBlock:", &__block_literal_global_145_4476);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removable:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v108[14] = v34;
  WFLocalizedContentPropertyNameMarker(CFSTR("Notes"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.notes"), v33, objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortable:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendable:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setterBlock:", &__block_literal_global_152);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v108[15] = v29;
  WFLocalizedContentPropertyNameMarker(CFSTR("Attachments"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("attachments"), v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortable:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removable:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "multipleValues:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Attachment"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "singularItemName:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setterBlock:", &__block_literal_global_160);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v108[16] = v21;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.lastModifiedDate"), v20, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tense:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeUnits:", 8444);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userInfo:", CFSTR("WFFileModificationDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v108[17] = v16;
  WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("event.creationDate"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tense:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeUnits:", 8444);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo:", CFSTR("WFFileCreationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v108[18] = v8;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_169, v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo:", CFSTR("WFFileSizeProperty"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filterable:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortable:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v108[19] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 20);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCalendarEventFiltering itemsToQueryForPredicate:](WFCalendarEventFiltering, "itemsToQueryForPredicate:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___WFCalendarEventContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);

}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dateByApplyingComponents:(id)a3 toDateComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "year") == 0x7FFFFFFFFFFFFFFFLL)
    v7 = v6;
  else
    v7 = v5;
  objc_msgSend(v6, "setYear:", objc_msgSend(v7, "year"));
  if (objc_msgSend(v5, "month") == 0x7FFFFFFFFFFFFFFFLL)
    v8 = v6;
  else
    v8 = v5;
  objc_msgSend(v6, "setMonth:", objc_msgSend(v8, "month"));
  if (objc_msgSend(v5, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL)
    v9 = v6;
  else
    v9 = v5;
  objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v9, "weekOfYear"));
  if (objc_msgSend(v5, "day") == 0x7FFFFFFFFFFFFFFFLL)
    v10 = v6;
  else
    v10 = v5;
  objc_msgSend(v6, "setDay:", objc_msgSend(v10, "day"));
  if (objc_msgSend(v5, "hour") == 0x7FFFFFFFFFFFFFFFLL)
    v11 = v6;
  else
    v11 = v5;
  objc_msgSend(v6, "setHour:", objc_msgSend(v11, "hour"));
  if (objc_msgSend(v5, "minute") == 0x7FFFFFFFFFFFFFFFLL)
    v12 = v6;
  else
    v12 = v5;
  objc_msgSend(v6, "setMinute:", objc_msgSend(v12, "minute"));
  if (objc_msgSend(v5, "second") == 0x7FFFFFFFFFFFFFFFLL)
    v13 = v6;
  else
    v13 = v5;
  objc_msgSend(v6, "setSecond:", objc_msgSend(v13, "second"));
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)coercions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  _QWORD v38[13];

  v38[11] = *MEMORY[0x24BDAC8D0];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("CLPlacemark"), CFSTR("CoreLocation"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "placemarkCoercionHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v37, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v35;
  v3 = objc_opt_class();
  objc_msgSend(a1, "streetAddressCoercionHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v3, v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v33;
  v4 = objc_opt_class();
  +[WFCoercionHandler keyPath:](WFCoercionHandler, "keyPath:", CFSTR("event.startDate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v4, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v31;
  v5 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("event.URL"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v5, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v29;
  v6 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("color"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v6, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v27;
  v7 = objc_opt_class();
  objc_msgSend(a1, "mapsLinkCoercionHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v7, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v25;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.ical.ics"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "icsCoercionHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v24, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v22;
  v8 = objc_opt_class();
  objc_msgSend(a1, "participantsCoercionHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v8, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v9;
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("MKMapItem"), CFSTR("MapKit"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapItemCoercionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v12;
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("CLLocation"), CFSTR("CoreLocation"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("structuredLocation.geoLocation"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v15;
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("LNEntity"), CFSTR("LinkMetadata"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "linkEntityCoercionHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 11);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)mapItemCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:availabilityCheck:](WFCoercionHandler, "asynchronousBlock:availabilityCheck:", &__block_literal_global_205, &__block_literal_global_207);
}

+ (id)placemarkCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:availabilityCheck:](WFCoercionHandler, "asynchronousBlock:availabilityCheck:", &__block_literal_global_209, &__block_literal_global_211_4401);
}

+ (id)streetAddressCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:availabilityCheck:](WFCoercionHandler, "asynchronousBlock:availabilityCheck:", &__block_literal_global_212, &__block_literal_global_213);
}

+ (id)mapsLinkCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_215, &__block_literal_global_222);
}

+ (id)icsCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_223);
}

+ (id)participantsCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_225, &__block_literal_global_227);
}

+ (id)linkEntityCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_228);
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("EKEvent"), CFSTR("EventKit"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Location");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Calendar event"), CFSTR("Calendar event"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Calendar events"), CFSTR("Calendar events"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Calendar events"));
}

+ (id)localizedFilterDescription
{
  return WFLocalizedString(CFSTR("Calendar Event"));
}

+ (id)localizedPluralFilterDescription
{
  return WFLocalizedString(CFSTR("Calendar Events"));
}

id __55__WFCalendarEventContentItem_linkEntityCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x24BE5FC70];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "recurrenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithTypeIdentifier:instanceIdentifier:", CFSTR("EventEntity"), v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5FC58]), "initWithIdentifier:", v8);
  return v9;
}

BOOL __57__WFCalendarEventContentItem_participantsCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attendees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

id __57__WFCalendarEventContentItem_participantsCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attendees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_226);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

WFParticipant *__57__WFCalendarEventContentItem_participantsCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFParticipant *v3;

  v2 = a2;
  v3 = -[WFParticipant initWithEKParticipant:]([WFParticipant alloc], "initWithEKParticipant:", v2);

  return v3;
}

id __48__WFCalendarEventContentItem_icsCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "requestedType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFVCalendarFormatter ICSFromCalendarItems:](WFVCalendarFormatter, "ICSFromCalendarItems:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v9, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __53__WFCalendarEventContentItem_mapsLinkCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __53__WFCalendarEventContentItem_mapsLinkCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  DCMutableMapsLink *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_alloc_init(DCMutableMapsLink);
  objc_msgSend(v2, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMutableMapsLink setSearchQuery:](v3, "setSearchQuery:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Open %@ in Maps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[WFStreetAddress stringContainsStreetAddresses:](WFStreetAddress, "stringContainsStreetAddresses:", v2);

  return v3;
}

void __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke_2;
  v9[3] = &unk_24C4DD200;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "getMapItemRepresentationIfPresent:", v9);

}

void __58__WFCalendarEventContentItem_streetAddressCoercionHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "placemark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFStreetAddress streetAddressWithPlacemark:label:](WFStreetAddress, "streetAddressWithPlacemark:label:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v10, 0);

  }
  else
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    +[WFStreetAddress streetAddressesInString:error:](WFStreetAddress, "streetAddressesInString:error:", v11, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_6:
}

BOOL __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "structuredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapKitHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[WFStreetAddress stringContainsStreetAddresses:](WFStreetAddress, "stringContainsStreetAddresses:", v6))
    {
      objc_msgSend(v3, "geoLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

void __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke_2;
  v9[3] = &unk_24C4DD200;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "getMapItemRepresentationIfPresent:", v9);

}

void __54__WFCalendarEventContentItem_placemarkCoercionHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    v7 = (id)v6;
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)v5, "placemark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    +[WFStreetAddress streetAddressesInString:error:](WFStreetAddress, "streetAddressesInString:error:", v10, &v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;

    objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "geoLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v11, "count");
    v15 = *(_QWORD *)(a1 + 40);
    if (v14 && v13)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2050000000;
      v16 = (void *)getMKPlacemarkClass_softClass_4402;
      v31 = getMKPlacemarkClass_softClass_4402;
      if (!getMKPlacemarkClass_softClass_4402)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __getMKPlacemarkClass_block_invoke_4403;
        v27[3] = &unk_24C4E3118;
        v27[4] = &v28;
        __getMKPlacemarkClass_block_invoke_4403((uint64_t)v27);
        v16 = (void *)v29[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v28, 8);
      v18 = [v17 alloc];
      objc_msgSend(v13, "coordinate");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v11, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postalAddress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v18, "initWithCoordinate:postalAddress:", v24, v20, v22);
      (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v25, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v7);
    }

  }
}

BOOL __52__WFCalendarEventContentItem_mapItemCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "structuredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapKitHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __52__WFCalendarEventContentItem_mapItemCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id MKMapItemClass_4412;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a2;
  MKMapItemClass_4412 = getMKMapItemClass_4412();
  objc_msgSend(v6, "structuredLocation");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mapKitHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MKMapItemClass_4412, "_mapItemFromHandle:completionHandler:", v8, v5);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v18, "mutableEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "components:fromDate:", v7, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "dateByApplyingComponents:toDateComponents:", v5, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v10;
      else
        v12 = 0;
      v11 = v12;
    }
    v13 = v11;

    objc_msgSend(v18, "mutableEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "duration");
    objc_msgSend(v13, "dateByAddingTimeInterval:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mutableEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEndDate:", v15);

    objc_msgSend(v18, "mutableEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStartDate:", v13);

  }
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "mutableEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", v7, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "dateByApplyingComponents:toDateComponents:", v15, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v15;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v10;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v11 = v12;
  }
  v13 = v11;

  objc_msgSend(v5, "mutableEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setEndDate:", v13);
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_22;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

uint64_t __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateAttachments:");
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_19(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v12, "mutableEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notes");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingAsNewLine:](v8, "stringByAppendingAsNewLine:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "mutableEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNotes:", v9);

    v4 = v8;
  }
  else
  {
    if (v4)
      v11 = v4;
    else
      v11 = &stru_24C4E3948;
    objc_msgSend(v12, "mutableEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNotes:", v11);
  }

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_18(uint64_t a1, void *a2, __CFString *a3)
{
  const __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3)
    v4 = a3;
  else
    v4 = &stru_24C4E3948;
  v5 = a3;
  objc_msgSend(a2, "mutableEvent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "mutableEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v4);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_16(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "event");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attendees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v9);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_15;
  v67[3] = &unk_24C4DD018;
  v5 = v4;
  v68 = v5;
  objc_msgSend(a3, "if_compactMap:", v67);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Append"));

  if (v8)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v64 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v5, "mutableEvent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addAttendee:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v11);
    }
  }
  else
  {
    objc_msgSend(v5, "mode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Remove"));

    if (v17)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v9 = v6;
      v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v60 != v20)
              objc_enumerationMutation(v9);
            v22 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_msgSend(v5, "mutableEvent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removeAttendee:", v22);

          }
          v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        }
        while (v19);
      }
    }
    else
    {
      objc_msgSend(v5, "mode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("RemoveAll"));

      if (v25)
      {
        v57 = 0uLL;
        v58 = 0uLL;
        v55 = 0uLL;
        v56 = 0uLL;
        objc_msgSend(v5, "mutableEvent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "attendees");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v56;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v56 != v29)
                objc_enumerationMutation(v9);
              v31 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k);
              objc_msgSend(v5, "mutableEvent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "removeAttendee:", v31);

            }
            v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          }
          while (v28);
        }
      }
      else
      {
        v53 = 0uLL;
        v54 = 0uLL;
        v51 = 0uLL;
        v52 = 0uLL;
        objc_msgSend(v5, "mutableEvent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "attendees");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v52;
          do
          {
            for (m = 0; m != v36; ++m)
            {
              if (*(_QWORD *)v52 != v37)
                objc_enumerationMutation(v34);
              v39 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m);
              objc_msgSend(v5, "mutableEvent");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "removeAttendee:", v39);

            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
          }
          while (v36);
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v9 = v6;
        v41 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v48;
          do
          {
            for (n = 0; n != v42; ++n)
            {
              if (*(_QWORD *)v48 != v43)
                objc_enumerationMutation(v9);
              v45 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * n);
              objc_msgSend(v5, "mutableEvent", (_QWORD)v47);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addAttendee:", v45);

            }
            v42 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
          }
          while (v42);
        }
      }
    }
  }

}

id __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v4 = (void *)getEKAttendeeClass_softClass;
  v19 = getEKAttendeeClass_softClass;
  if (!getEKAttendeeClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getEKAttendeeClass_block_invoke;
    v15[3] = &unk_24C4E3118;
    v15[4] = &v16;
    __getEKAttendeeClass_block_invoke((uint64_t)v15);
    v4 = (void *)v17[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v3, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attendeeWithName:emailAddress:phoneNumber:url:", 0, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setParticipantRole:", objc_msgSend(v3, "role"));
  objc_msgSend(v8, "setParticipantStatus:", objc_msgSend(v3, "status"));
  objc_msgSend(v8, "setParticipantType:", objc_msgSend(v3, "type"));
  objc_msgSend(*(id *)(a1 + 32), "mutableEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mutableEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isValidAttendee:forCalendar:", v8, v11))
    v12 = v8;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, id);
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a2, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attendees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_map:", &__block_literal_global_125);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v8);
}

WFParticipant *__46__WFCalendarEventContentItem_propertyBuilders__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  WFParticipant *v3;

  v2 = a2;
  v3 = -[WFParticipant initWithEKParticipant:]([WFParticipant alloc], "initWithEKParticipant:", v2);

  return v3;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_11(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "organizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentUser");

  objc_msgSend(v6, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attendeesNotIncludingOrganizer");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sharingStatus");

  if (v14 | v11)
    v15 = v9;
  else
    v15 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v16);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  WFParticipant *v7;
  void (**v8)(id, WFParticipant *);

  v8 = a4;
  objc_msgSend(a2, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[WFParticipant initWithEKParticipant:]([WFParticipant alloc], "initWithEKParticipant:", v6);
    v8[2](v8, v7);

  }
  else
  {
    v8[2](v8, 0);
  }

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Accepted")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Completed")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Declined")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Delegated")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("In Process")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Pending")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Tentative")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(v4, "mutableEvent");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "selfAttendee");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParticipantStatus:", v6);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "mutableEvent");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  objc_msgSend(v6, "dateByAddingTimeInterval:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEndDate:", v9);
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  id v7;
  WFTimeInterval *v8;
  void *v9;
  void *v10;
  void *v11;
  WFTimeInterval *v12;
  id v13;

  v6 = a4;
  v7 = a2;
  v8 = [WFTimeInterval alloc];
  objc_msgSend(v7, "event");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v11);
  v12 = -[WFTimeInterval initWithTimeInterval:](v8, "initWithTimeInterval:");
  ((void (**)(_QWORD, WFTimeInterval *))a4)[2](v6, v12);

}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "mutableEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v4);

}

id __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;

  WFGetWorkflowEventStore();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "calendarsForEntityType:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_compactMap:", &__block_literal_global_74);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Found in Mail"));

  if (v4)
  {
    v5 = CFSTR("Found in Mail");
  }
  else
  {
    objc_msgSend(v2, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Birthdays"));

    if (!v7)
    {
      objc_msgSend(v2, "title");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v5 = CFSTR("Birthdays");
  }
  WFLocalizedString(v5);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

void __46__WFCalendarEventContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a2;
  if (a3)
    a3 = (void *)objc_msgSend(a3, "BOOLValue");
  objc_msgSend(v5, "mutableEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllDay:", a3);

}

- (id)changeTransaction
{
  WFCalendarEventContentItemChangeTransaction *v3;
  void *v4;
  WFCalendarEventContentItemChangeTransaction *v5;

  v3 = [WFCalendarEventContentItemChangeTransaction alloc];
  -[WFCalendarEventContentItem eventStore](self, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFCalendarEventContentItemChangeTransaction initWithContentItem:eventStore:](v3, "initWithContentItem:eventStore:", self, v4);

  return v5;
}

- (void)copyStateToItem:(id)a3
{
  objc_storeStrong((id *)a3 + 6, self->_eventStore);
}

- (id)myStatus
{
  void *v2;
  void *v3;
  void *v4;

  -[WFCalendarEventContentItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selfAttendee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WFStatusPropertyValueForEKParticipantStatus(objc_msgSend(v3, "participantStatus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)isCanceled
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFCalendarEventContentItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "status") == 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)location
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[WFCalendarEventContentItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)structuredLocation
{
  void *v2;
  void *v3;

  -[WFCalendarEventContentItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "structuredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachments
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFCalendarEventContentItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAttachment");

  if (v4)
  {
    -[WFCalendarEventContentItem event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_map:", &__block_literal_global_176);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

- (id)color
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[WFCalendarEventContentItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGColor");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithCGColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (EKEventStore)eventStore
{
  EKEventStore *eventStore;
  EKEventStore *v3;
  void *v4;

  eventStore = self->_eventStore;
  if (eventStore)
  {
    v3 = eventStore;
  }
  else
  {
    -[WFCalendarEventContentItem event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(v4, &WFDeserializingEventStoreKey);
    v3 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (EKEvent)event
{
  return (EKEvent *)-[WFContentItem objectForClass:](self, "objectForClass:", getEKEventClass());
}

- (void)getMapItemRepresentationIfPresent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[WFCalendarEventContentItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "structuredLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapKitHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__WFCalendarEventContentItem_getMapItemRepresentationIfPresent___block_invoke;
    v8[3] = &unk_24C4E2B18;
    v9 = v4;
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v8, getMKMapItemClass_4412());

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "wfType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToClass:", getEKEventClass());

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentLocation locationWithCalendarSource:](WFContentLocation, "locationWithCalendarSource:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttributionSet attributionSetWithOrigin:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithOrigin:disclosureLevel:originalItemIdentifier:", v10, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFCalendarEventContentItem;
    -[WFContentItem defaultSourceForRepresentation:](&v15, sel_defaultSourceForRepresentation_, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

uint64_t __64__WFCalendarEventContentItem_getMapItemRepresentationIfPresent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __41__WFCalendarEventContentItem_attachments__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "localURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v2, 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void (**)(id, void *))a3;
  -[WFCalendarEventContentItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v4 && v7)
    v4[2](v4, v6);

  return v8 != 0;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    -[WFCalendarEventContentItem event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setDateStyle:", 1);
    objc_msgSend(v7, "setTimeStyle:", 1);
    objc_msgSend(v7, "setDoesRelativeDateFormatting:", 1);
    if (objc_msgSend(v5, "isAllDay"))
    {
      objc_msgSend(v7, "setTimeStyle:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDateInToday:", v6);

      if (v9)
        objc_msgSend(v7, "setDateStyle:", 0);
    }
    objc_msgSend(v7, "stringFromDate:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10);

  }
  return 1;
}

@end
