@implementation WFPhotoLibraryFiltering

+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  _BOOL4 v57;
  _BOOL4 v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  __CFString *v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  void *v88;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  uint64_t v94;
  BOOL v95;
  id v96;
  id v97;
  __CFString *v98;
  id obj;
  id obja;
  void *v101;
  unint64_t v103;
  id v104;
  void (**v105)(_QWORD, _QWORD, _QWORD);
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  _QWORD v111[4];
  __CFString *v112;
  void (**v113)(_QWORD, _QWORD, _QWORD);
  id v114;
  _QWORD v115[5];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  void *v127;
  uint8_t buf[4];
  const char *v129;
  __int16 v130;
  const __CFString *v131;
  __int16 v132;
  id v133;
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!a4)
  {
    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentCompoundPredicate notPredicateWithSubpredicate:](WFContentCompoundPredicate, "notPredicateWithSubpredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v16;
    a4 = 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v127, 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v17;
  }
  v104 = v13;
  v105 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  getWFPhotoLibraryFilteringLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = CFSTR("OR");
    v129 = "+[WFPhotoLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:withInp"
           "ut:resultHandler:]";
    *(_DWORD *)buf = 136315650;
    if (a4 == 1)
      v19 = CFSTR("AND");
    v130 = 2114;
    v131 = v19;
    v132 = 2112;
    v133 = v11;
    _os_log_impl(&dword_20BBAD000, v18, OS_LOG_TYPE_INFO, "%s Filtering using predicate of type %{public}@ and subpredicates %@", buf, 0x20u);
  }
  v103 = a4;

  v20 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v22 = (__CFString *)v11;
  v23 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v118;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v118 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        v116 = 0;
        WFPHAssetPredicateFromContentPredicate(v27, &v116);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v116;
        v30 = v29;
        if (v28)
        {
          v31 = v21;
          v32 = v28;
        }
        else
        {
          if (v29)
          {
            v34 = v105;
            ((void (**)(_QWORD, _QWORD, id))v105)[2](v105, 0, v29);

            v35 = v22;
            goto LABEL_22;
          }
          v31 = v20;
          v32 = v27;
        }
        objc_msgSend(v31, "addObject:", v32);

      }
      v24 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
      if (v24)
        continue;
      break;
    }
  }

  v33 = v103;
  if (v103 != 2 || !objc_msgSend(v20, "count"))
  {
    +[WFSharedPhotoLibrary sharedLibrary](WFSharedPhotoLibrary, "sharedLibrary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0;
    objc_msgSend(v37, "fetchOptionsWithError:", &v110);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (__CFString *)v110;

    v36 = v104;
    v34 = v105;
    if (!v38)
    {
      getWFGeneralLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v129 = "+[WFPhotoLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:wit"
               "hInput:resultHandler:]";
        v130 = 2112;
        v131 = v35;
        _os_log_impl(&dword_20BBAD000, v40, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library: %@", buf, 0x16u);
      }

      ((void (**)(_QWORD, _QWORD, __CFString *))v105)[2](v105, 0, v35);
      goto LABEL_94;
    }
    objc_msgSend(v38, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v38, "setIncludeAssetSourceTypes:", 7);
    v101 = v38;
    v98 = v35;
    if (objc_msgSend(v20, "count"))
    {
      v39 = 1;
    }
    else
    {
      objc_msgSend(v12, "sortDescriptors");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      if (v42)
      {
        v96 = v12;
        objc_msgSend(v12, "sortDescriptors");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_opt_new();
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        obj = v43;
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, buf, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v122;
          while (2)
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v122 != v47)
                objc_enumerationMutation(obj);
              v49 = *(id *)(*((_QWORD *)&v121 + 1) + 8 * j);
              objc_msgSend(v49, "comparator");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {

LABEL_45:
                v54 = obj;

                v55 = 0;
                v36 = v104;
                goto LABEL_46;
              }
              objc_msgSend(v49, "property");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              WFPHAssetKeyPathForContentProperty(v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              if (v52)
              {
                objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v52, objc_msgSend(v49, "ascending"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v53 = 0;
              }

              if (!v53)
                goto LABEL_45;
              objc_msgSend(v44, "addObject:", v53);

            }
            v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, buf, 16);
            v36 = v104;
            if (v46)
              continue;
            break;
          }
        }
        v54 = obj;

        v55 = v44;
LABEL_46:

        v38 = v101;
        objc_msgSend(v101, "setSortDescriptors:", v55);

        objc_msgSend(v101, "sortDescriptors");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v56 != 0;

        v34 = v105;
        v33 = v103;
        v12 = v96;
      }
      else
      {
        v39 = 1;
        v38 = v101;
      }
    }
    if (objc_msgSend(v20, "count"))
      v57 = 0;
    else
      v57 = v39;
    v95 = v57;
    if (v12)
      v58 = v57;
    else
      v58 = 0;
    obja = (id)objc_msgSend(v12, "slice");
    v94 = v59;
    if (v58 && obja == (id)0x7FFFFFFFFFFFFFFFLL && v59 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v38, "setFetchLimit:", v59);
    if (v36)
    {
      v91 = v58;
      objc_msgSend(v36, "if_map:", &__block_literal_global_149_10278);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(v60, "mutableCopy");

      if (objc_msgSend(v21, "count"))
      {
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", v33, v21);
        objc_msgSend(v61, "filterUsingPredicate:", v62);

      }
      objc_msgSend(v38, "sortDescriptors");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v63)
      {
        v65 = v61;
        v58 = v91;
        if (v65)
        {
LABEL_80:
          v93 = v65;
          v78 = v65;
          v79 = v78;
          v97 = v12;
          if (v58)
          {
            WFIndexSetFromContentSlice((uint64_t)obja, v94, objc_msgSend(v78, "count"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "objectsAtIndexes:", v80);
            v81 = objc_claimAutoreleasedReturnValue();

            v79 = (void *)v81;
          }
          v82 = (void *)objc_opt_new();
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v83 = v79;
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
          if (v84)
          {
            v85 = v84;
            v86 = *(_QWORD *)v107;
            do
            {
              for (k = 0; k != v85; ++k)
              {
                if (*(_QWORD *)v107 != v86)
                  objc_enumerationMutation(v83);
                +[WFContentItem itemWithObject:](WFPhotoMediaContentItem, "itemWithObject:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * k));
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "addObject:", v88);

              }
              v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
            }
            while (v85);
          }

          if (v95)
          {
            ((void (**)(_QWORD, void *, _QWORD))v105)[2](v105, v82, 0);
            v12 = v97;
          }
          else
          {
            v12 = v97;
            objc_msgSend(a1, "performFallbackFilteringWithItems:withContentPredicates:compoundPredicateType:originalQuery:resultHandler:", v82, v20, v103, v97, v105);
          }
          v36 = v104;
          v35 = v98;
          v65 = v93;

          v34 = v105;
          v38 = v101;
          goto LABEL_93;
        }
LABEL_68:
        v34[2](v34, 0, 0);
        v35 = v98;
LABEL_93:

LABEL_94:
        goto LABEL_95;
      }
      objc_msgSend(v38, "sortDescriptors");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v61;
      objc_msgSend(v61, "sortUsingDescriptors:", v64);
      v58 = v91;
    }
    else
    {
      objc_msgSend(v21, "if_objectsPassingTest:", &__block_literal_global_153);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v92, "count") && (v33 == 1 || objc_msgSend(v21, "count") == 1))
      {
        objc_msgSend(v92, "if_objectsPassingTest:", &__block_literal_global_157);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "firstObject");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = v67;
        if (v67)
        {
          v68 = v67;
        }
        else
        {
          objc_msgSend(v92, "firstObject", 0);
          v68 = (id)objc_claimAutoreleasedReturnValue();
        }
        v71 = v68;
        objc_msgSend(v68, "assetCollection", v89);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v71);
        if (objc_msgSend(v21, "count"))
        {
          v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", v103, v21);
          objc_msgSend(v73, "wf_photoLibraryFilteringPredicate");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setPredicate:", v74);

        }
        getWFPhotoLibraryFilteringLogObject();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v72, "wfName");
          v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v129 = "+[WFPhotoLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:w"
                 "ithInput:resultHandler:]";
          v130 = 2112;
          v131 = v76;
          v132 = 2112;
          v133 = v21;
          _os_log_impl(&dword_20BBAD000, v75, OS_LOG_TYPE_INFO, "%s Performing optimized photo lookup for album %@, remaining predicates %@", buf, 0x20u);

        }
        objc_msgSend(getPHAssetClass_10253(), "fetchAssetsInAssetCollection:options:", v72, v101);
        v77 = objc_claimAutoreleasedReturnValue();

        v38 = v101;
        v65 = (void *)v77;

        v34 = v105;
      }
      else
      {
        if (objc_msgSend(v21, "count"))
        {
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", v33, v21);
          objc_msgSend(v69, "wf_photoLibraryFilteringPredicate");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setPredicate:", v70);

          v38 = v101;
        }
        objc_msgSend(getPHAssetClass_10253(), "fetchAssetsWithOptions:", v38);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v64 = v92;
    }

    if (v65)
      goto LABEL_80;
    goto LABEL_68;
  }
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke;
  v115[3] = &__block_descriptor_40_e60_v32__0__WFContentPredicate_8Q16___v____NSArray___NSError__24l;
  v115[4] = a1;
  v111[0] = MEMORY[0x24BDAC760];
  v111[1] = 3221225472;
  v111[2] = __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3;
  v111[3] = &unk_24C4DF260;
  v114 = a1;
  v112 = (__CFString *)v12;
  v34 = v105;
  v113 = v105;
  -[__CFString if_flatMapAsynchronously:completionHandler:](v22, "if_flatMapAsynchronously:completionHandler:", v115, v111);

  v35 = v112;
LABEL_22:
  v36 = v104;
LABEL_95:

}

void __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v14[0] = a2;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2;
  v12[3] = &unk_24C4E33B0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:withInput:resultHandler:", v10, 1, 0, 0, v12);

}

void __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDBCEE0];
  v4 = a2;
  v7 = (id)objc_msgSend([v3 alloc], "initWithArray:", v4);

  v5 = (void *)a1[6];
  objc_msgSend(v7, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performFallbackFilteringWithItems:withContentPredicates:compoundPredicateType:originalQuery:resultHandler:", v6, 0, 0, a1[4], a1[5]);

}

BOOL __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3_155(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetCollectionType") == 2 && objc_msgSend(v2, "assetCollectionSubtype") == 209;

  return v3;
}

uint64_t __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2_151(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asset");
}

uint64_t __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
