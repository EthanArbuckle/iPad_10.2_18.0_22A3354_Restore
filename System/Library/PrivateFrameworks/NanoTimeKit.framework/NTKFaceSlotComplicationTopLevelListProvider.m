@implementation NTKFaceSlotComplicationTopLevelListProvider

- (NTKFaceSlotComplicationTopLevelListProvider)initWithRichSlot:(BOOL)a3 complicationFamily:(int64_t)a4 complications:(id)a5 selectedComplication:(id)a6
{
  id v10;
  id v11;
  NTKFaceSlotComplicationTopLevelListProvider *v12;
  uint64_t v13;
  NSArray *complications;
  objc_super v16;

  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NTKFaceSlotComplicationTopLevelListProvider;
  v12 = -[NTKFaceSlotComplicationTopLevelListProvider init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    complications = v12->_complications;
    v12->_complications = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_selectedItemIgnoringMoreButton, a6);
    v12->_pickerListProviderSlotIsRich = a3;
    v12->_pickerComplicationFamily = a4;
  }

  return v12;
}

- (id)detailListProviderForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKFaceSlotComplicationDetailListProvider *v7;

  if (a3)
  {
    v4 = a3;
    -[NTKFaceSlotComplicationTopLevelListProvider _buildDataIfNeeded](self, "_buildDataIfNeeded");
    -[NTKFaceSlotComplicationTopLevelListProvider complicationsBySectionIdentifier](self, "complicationsBySectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NTKFaceSlotComplicationDetailListProvider initWithRichSlot:complicationFamily:complications:selectedComplication:]([NTKFaceSlotComplicationDetailListProvider alloc], "initWithRichSlot:complicationFamily:complications:selectedComplication:", -[NTKFaceSlotComplicationTopLevelListProvider pickerListProviderSlotIsRich](self, "pickerListProviderSlotIsRich"), self->_pickerComplicationFamily, v6, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSDiffableDataSourceSnapshot)pickerListDataSourceSnapshot
{
  -[NTKFaceSlotComplicationTopLevelListProvider _buildDataIfNeeded](self, "_buildDataIfNeeded");
  return self->_pickerListDataSourceSnapshot;
}

- (void)_buildDataIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  NTKTopLevelSectionInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  BOOL v22;
  void *v23;
  NTKFaceSlotComplicationTopLevelListProvider *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NTKMoreButtonListItem *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  const __CFString *v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  __CFString *v70;
  NTKFaceSlotComplicationTopLevelListProvider *v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  BOOL v93;
  _QWORD v94[6];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  id v103;
  _BYTE v104[128];
  id v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (!self->_pickerListDataSourceSnapshot)
  {
    v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v71 = self;
    -[NTKFaceSlotComplicationTopLevelListProvider complications](self, "complications");
    obj = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    if (v3)
    {
      v4 = v3;
      v70 = 0;
      v5 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v96 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend(v7, "ntk_sectionIdentifier");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = v8;
            if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.DateComplicationsHost")))
            {

              v9 = CFSTR("com.apple.NanoCalendar");
            }
            objc_msgSend(v72, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setObject:forKeyedSubscript:", v10, v9);
              objc_msgSend(v7, "localizedSectionHeaderName");
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (!v11)
                v11 = v9;
              v12 = -[NTKTopLevelSectionInfo initWithIdentifier:localizedSectionName:]([NTKTopLevelSectionInfo alloc], "initWithIdentifier:localizedSectionName:", v9, v11);
              objc_msgSend(v75, "addObject:", v12);

            }
            -[NTKFaceSlotComplicationTopLevelListProvider selectedItemIgnoringMoreButton](v71, "selectedItemIgnoringMoreButton");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "ntk_identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "ntk_identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqual:", v15);

            if (v16)
            {
              v17 = v9;

              v70 = v17;
            }
            if (objc_msgSend(v7, "complicationType") == 31 || objc_msgSend(v7, "complicationType") == 37)
            {
              objc_msgSend(v10, "addObject:", v7);
            }
            else
            {
              if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.NanoWorldClock")))
              {
                v18 = objc_msgSend(v10, "count");
                v19 = v10;
                v20 = v7;
                v21 = &__block_literal_global_84;
              }
              else if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.private.NanoTimer")))
              {
                v18 = objc_msgSend(v10, "count");
                v19 = v10;
                v20 = v7;
                v21 = &__block_literal_global_10_0;
              }
              else
              {
                if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.NanoCompass.watchkitapp.waypoints")))
                {
                  v18 = objc_msgSend(v10, "count");
                  v94[0] = MEMORY[0x1E0C809B0];
                  v94[1] = 3221225472;
                  v94[2] = __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_3;
                  v94[3] = &unk_1E6BD3B80;
                  v94[4] = v71;
                  v94[5] = 1;
                  v21 = v94;
                }
                else
                {
                  v22 = -[NTKFaceSlotComplicationTopLevelListProvider pickerListProviderSlotIsRich](v71, "pickerListProviderSlotIsRich");
                  v18 = objc_msgSend(v10, "count");
                  v92[0] = MEMORY[0x1E0C809B0];
                  v92[1] = 3221225472;
                  v92[2] = __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_4;
                  v92[3] = &__block_descriptor_41_e45_q24__0__NTKComplication_8__NTKComplication_16l;
                  v92[4] = 1;
                  v93 = v22;
                  v21 = v92;
                }
                v19 = v10;
                v20 = v7;
              }
              objc_msgSend(v10, "insertObject:atIndex:", v7, objc_msgSend(v19, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, v18, 1024, v21));
            }

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      }
      while (v4);
    }
    else
    {
      v70 = 0;
    }

    objc_msgSend(v75, "sortUsingComparator:", &__block_literal_global_14_0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    objc_msgSend(v68, "appendSectionsWithIdentifiers:", v75);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v66 = v75;
    v24 = v71;
    v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
    if (v69)
    {
      v67 = *(_QWORD *)v89;
      v65 = CFSTR("com.apple.NanoHome");
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v89 != v67)
            objc_enumerationMutation(v66);
          v73 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v25);
          objc_msgSend(v73, "ntk_identifier", v65);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v26;
          if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.nanotimekit.contacts")))
          {
            v28 = +[NTKPeopleComplication _complicationPickerShouldShowMoreButtonForList:](NTKPeopleComplication, "_complicationPickerShouldShowMoreButtonForList:", v27);
            if ((unint64_t)objc_msgSend(v27, "count") <= 4)
            {
              v29 = objc_msgSend(v27, "count");
              if (!v28)
                goto LABEL_45;
              goto LABEL_52;
            }
LABEL_50:
            if (!v28)
            {
LABEL_47:
              v32 = 0;
              v29 = 3;
              goto LABEL_53;
            }
            goto LABEL_51;
          }
          v30 = objc_msgSend(v26, "isEqualToString:", v65);
          v31 = objc_msgSend(v27, "count");
          if (!v30)
          {
            if (v31 <= 4)
              goto LABEL_47;
LABEL_51:
            v29 = 3;
LABEL_52:
            objc_msgSend(v27, "subarrayWithRange:", 0, v29);
            v34 = objc_claimAutoreleasedReturnValue();

            v32 = 1;
            v27 = (void *)v34;
            goto LABEL_53;
          }
          if (v31 <= 4)
          {
            v29 = objc_msgSend(v27, "count");
LABEL_45:
            v32 = 0;
            goto LABEL_53;
          }
          +[NTKHomeListPickerDataSource topLevelItemsForComplicationFamily:sectionIdentifier:](NTKHomeListPickerDataSource, "topLevelItemsForComplicationFamily:sectionIdentifier:", -[NTKFaceSlotComplicationTopLevelListProvider pickerComplicationFamily](v24, "pickerComplicationFamily"), v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = +[NTKHomeListPickerDataSource shouldShowTopLevelMoreButton](NTKHomeListPickerDataSource, "shouldShowTopLevelMoreButton");
          if ((unint64_t)objc_msgSend(v33, "count") > 4)
          {
            v27 = v33;
            v26 = v76;
            goto LABEL_50;
          }
          v29 = objc_msgSend(v33, "count");
          if (v28)
          {
            v27 = v33;
            v26 = v76;
            goto LABEL_52;
          }
          v32 = 0;
          v27 = v33;
          v26 = v76;
LABEL_53:
          if (-[__CFString isEqual:](v70, "isEqual:", v26))
          {
            -[NTKFaceSlotComplicationTopLevelListProvider selectedItemIgnoringMoreButton](v24, "selectedItemIgnoringMoreButton");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35;
            v37 = v32 ^ 1;
            if (!v35)
              v37 = 1;
            if ((v37 & 1) == 0)
            {
              v86[0] = MEMORY[0x1E0C809B0];
              v86[1] = 3221225472;
              v86[2] = __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_6;
              v86[3] = &unk_1E6BD3C08;
              v38 = v35;
              v87 = v38;
              v39 = objc_msgSend(v27, "indexOfObjectPassingTest:", v86);
              if (v39 != 0x7FFFFFFFFFFFFFFFLL && v39 >= v29)
              {
                objc_msgSend(v27, "subarrayWithRange:", 0, v29 - 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v105 = v38;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "arrayByAddingObjectsFromArray:", v40);
                v42 = objc_claimAutoreleasedReturnValue();

                v27 = (void *)v42;
              }
              v26 = v76;

            }
            -[NTKFaceSlotComplicationTopLevelListProvider setPickerSelectedItem:](v24, "setPickerSelectedItem:", v36);

          }
          v74 = v25;
          if (v32)
          {
            v43 = -[NTKMoreButtonListItem initWithSectionIdentifier:]([NTKMoreButtonListItem alloc], "initWithSectionIdentifier:", v26);
            objc_msgSend(v27, "arrayByAddingObject:", v43);
            v44 = objc_claimAutoreleasedReturnValue();

            v27 = (void *)v44;
          }
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v27);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");
          if (v46 != objc_msgSend(v27, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            v85 = 0u;
            v48 = v27;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v83;
              do
              {
                for (j = 0; j != v50; ++j)
                {
                  if (*(_QWORD *)v83 != v51)
                    objc_enumerationMutation(v48);
                  objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "ntk_identifier");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "addObject:", v53);

                }
                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
              }
              while (v50);
            }

            _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v101 = v47;
              v102 = 2112;
              v103 = v48;
              _os_log_fault_impl(&dword_1B72A3000, v54, OS_LOG_TYPE_FAULT, "NTKListProviderError: Items %@ has a duplicate (%@)", buf, 0x16u);
            }

          }
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v55 = v27;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v79;
            do
            {
              for (k = 0; k != v57; ++k)
              {
                if (*(_QWORD *)v79 != v58)
                  objc_enumerationMutation(v55);
                v60 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
                if (objc_msgSend(v23, "containsObject:", v60))
                {
                  objc_msgSend(v45, "removeObject:", v60);
                  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v60, "ntk_identifier");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v101 = v62;
                    v102 = 2112;
                    v103 = v60;
                    _os_log_fault_impl(&dword_1B72A3000, v61, OS_LOG_TYPE_FAULT, "NTKListProviderError: Item %@ (%@) already in list provider", buf, 0x16u);

                  }
                }
              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
            }
            while (v57);
          }

          objc_msgSend(v45, "array");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObjectsFromArray:", v63);
          objc_msgSend(v68, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v63, v73);

          v25 = v74 + 1;
          v24 = v71;
        }
        while (v74 + 1 != v69);
        v64 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
        v69 = v64;
      }
      while (v64);
    }

    -[NTKFaceSlotComplicationTopLevelListProvider setPickerListDataSourceSnapshot:](v24, "setPickerListDataSourceSnapshot:", v68);
    -[NTKFaceSlotComplicationTopLevelListProvider setComplicationsBySectionIdentifier:](v24, "setComplicationsBySectionIdentifier:", v72);

  }
}

int64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NTKWorldClockComplication compareComplication:toComplication:](NTKWorldClockComplication, "compareComplication:toComplication:", a2, a3);
}

int64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NTKTimerComplication compareComplication:toComplication:](NTKTimerComplication, "compareComplication:toComplication:", a2, a3);
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v7 = v6;
  objc_msgSend(v5, "complication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.NanoCompass.complications.waypoint"));

  objc_msgSend(v7, "complication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.NanoCompass.complications.waypoint"));

  v14 = v10 ? -1 : 1;
  if ((v10 & 1) == 0 && (v13 & 1) == 0)
  {
LABEL_8:
    v15 = objc_msgSend(*(id *)(a1 + 32), "pickerListProviderSlotIsRich");
    objc_msgSend(v5, "ntk_localizedNameWithOptions:forRichComplicationSlot:", *(_QWORD *)(a1 + 40), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ntk_localizedNameWithOptions:forRichComplicationSlot:", *(_QWORD *)(a1 + 40), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v16, "localizedCaseInsensitiveCompare:", v17);

  }
  return v14;
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "ntk_localizedNameWithOptions:forRichComplicationSlot:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ntk_localizedNameWithOptions:forRichComplicationSlot:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "localizedCaseInsensitiveCompare:", v9);
  return v10;
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "ntk_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.nanotimekit.off"));

  if ((v7 & 1) != 0)
  {
    v8 = -1;
  }
  else
  {
    objc_msgSend(v4, "ntk_localizedSectionName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ntk_localizedSectionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "localizedCaseInsensitiveCompare:", v10);

  }
  return v8;
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ntk_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ntk_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)pickerListProviderSlotIsRich
{
  return self->_pickerListProviderSlotIsRich;
}

- (int64_t)pickerComplicationFamily
{
  return self->_pickerComplicationFamily;
}

- (NTKComplication)selectedItemIgnoringMoreButton
{
  return self->_selectedItemIgnoringMoreButton;
}

- (void)setSelectedItemIgnoringMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItemIgnoringMoreButton, a3);
}

- (NSArray)complications
{
  return self->_complications;
}

- (void)setComplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)complicationsBySectionIdentifier
{
  return self->_complicationsBySectionIdentifier;
}

- (void)setComplicationsBySectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NTKComplicationItem)pickerSelectedItem
{
  return self->_pickerSelectedItem;
}

- (void)setPickerSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_pickerSelectedItem, a3);
}

- (void)setPickerListDataSourceSnapshot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerListDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_pickerSelectedItem, 0);
  objc_storeStrong((id *)&self->_complicationsBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_selectedItemIgnoringMoreButton, 0);
}

@end
