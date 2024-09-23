@implementation CHStrokeUtilities

+ (void)getAddedStrokes:(id *)a3 removedStrokeIdentifiers:(id *)a4 inStrokeProvider:(id)a5 lastGroupingResult:(id)a6 shouldCancel:(id)a7
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t (**v104)(void);
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v128;
  void *v129;
  id v130;
  uint64_t (**v131)(void);
  _QWORD v132[4];
  uint64_t (**v133)(void);
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t buf[4];
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v130 = a6;
  v131 = (uint64_t (**)(void))a7;
  if (!v9)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }

  }
  v128 = v9;
  objc_msgSend_orderedStrokes(v9, v10, v11, v12, v13, v14);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v22, v23, v24, v25, v26);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend_strokeGroups(v130, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v138, (uint64_t)v147, 16, v35);
  if (v41)
  {
    v42 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v139 != v42)
          objc_enumerationMutation(v33);
        objc_msgSend_strokeIdentifiers(*(void **)(*((_QWORD *)&v138 + 1) + 8 * i), v36, v37, v38, v39, v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionSet_(v27, v45, (uint64_t)v44, v46, v47, v48);

      }
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v138, (uint64_t)v147, 16, v40);
    }
    while (v41);
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v49 = v129;
  v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v134, (uint64_t)v146, 16, v51);
  if (v57)
  {
    v58 = *(_QWORD *)v135;
    if (v131)
    {
      while (2)
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v135 != v58)
            objc_enumerationMutation(v49);
          v60 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * j);
          objc_msgSend_encodedStrokeIdentifier(v60, v52, v53, v54, v55, v56);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_containsObject_(v27, v62, (uint64_t)v61, v63, v64, v65) & 1) != 0)
            objc_msgSend_removeObject_(v27, v66, (uint64_t)v61, v67, v68, v69);
          else
            objc_msgSend_addObject_(v21, v66, (uint64_t)v60, v67, v68, v69);
          if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend_count(v21, v70, v71, v72, v73, v74), 2) <= 0x28F5C28F5C28F5CuLL
            && (v131[2]() & 1) != 0)
          {

            v27 = 0;
            goto LABEL_52;
          }

        }
        v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v134, (uint64_t)v146, 16, v56);
        if (v57)
          continue;
        break;
      }
    }
    else
    {
      do
      {
        for (k = 0; k != v57; ++k)
        {
          if (*(_QWORD *)v135 != v58)
            objc_enumerationMutation(v49);
          v76 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
          objc_msgSend_encodedStrokeIdentifier(v76, v52, v53, v54, v55, v56);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_containsObject_(v27, v78, (uint64_t)v77, v79, v80, v81) & 1) != 0)
            objc_msgSend_removeObject_(v27, v82, (uint64_t)v77, v83, v84, v85);
          else
            objc_msgSend_addObject_(v21, v82, (uint64_t)v76, v83, v84, v85);
          objc_msgSend_count(v21, v86, v87, v88, v89, v90);

        }
        v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v134, (uint64_t)v146, 16, v56);
      }
      while (v57);
    }
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v91 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
  {
    v97 = objc_msgSend_count(v21, v92, v93, v94, v95, v96);
    v103 = objc_msgSend_count(v27, v98, v99, v100, v101, v102);
    *(_DWORD *)buf = 134218240;
    v143 = v97;
    v144 = 2048;
    v145 = v103;
    _os_log_impl(&dword_1BE607000, v91, OS_LOG_TYPE_DEBUG, "  Stroke provider change added %ld strokes, removed %ld strokes.", buf, 0x16u);
  }

  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = sub_1BE67C6E4;
  v132[3] = &unk_1E77F2B08;
  v104 = v131;
  v133 = v104;
  objc_msgSend_indexesOfObjectsPassingTest_(v21, v105, (uint64_t)v132, v106, v107, v108);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104 && (((uint64_t (*)(uint64_t (**)(void)))v104[2])(v104) & 1) != 0)
  {

    goto LABEL_52;
  }
  if (objc_msgSend_count(v114, v109, v110, v111, v112, v113))
  {
    objc_msgSend_removeObjectsAtIndexes_(v21, v115, (uint64_t)v114, v116, v117, v118);
    if (qword_1EF568E88 == -1)
    {
      v119 = (id)qword_1EF568E30;
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
      {
LABEL_46:

        goto LABEL_47;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v119 = (id)qword_1EF568E30;
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
        goto LABEL_46;
    }
    v125 = objc_msgSend_count(v114, v120, v121, v122, v123, v124);
    *(_DWORD *)buf = 134217984;
    v143 = v125;
    _os_log_impl(&dword_1BE607000, v119, OS_LOG_TYPE_DEBUG, "  Ignoring %ld added strokes that cannot enumerate their points.", buf, 0xCu);
    goto LABEL_46;
  }
LABEL_47:

  if (a3)
    *a3 = objc_retainAutorelease(v21);
  if (a4)
  {
    v27 = objc_retainAutorelease(v27);
    *a4 = v27;
  }
LABEL_52:

}

+ (id)strokeForIdentifier:(id)a3 inStrokeProvider:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isEqual;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_strokeIdentifierFromData_(v6, v7, (uint64_t)v5, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend_isValidStrokeIdentifier_(v6, v12, (uint64_t)v11, v13, v14, v15) & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v39 = (id)qword_1EF568E28;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = 0;
      _os_log_impl(&dword_1BE607000, v39, OS_LOG_TYPE_DEBUG, "isValidStrokeIdentifier: %d", buf, 8u);
    }
LABEL_24:

    v21 = 0;
    goto LABEL_25;
  }
  objc_msgSend_strokeForIdentifier_(v6, v12, (uint64_t)v11, v13, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend_orderedStrokes(v6, v16, v17, v18, v19, v20, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v53, (uint64_t)v61, 16, v24);
    if (v30)
    {
      v31 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v54 != v31)
            objc_enumerationMutation(v22);
          objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v53 + 1) + 8 * i), v25, v26, v27, v28, v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v33, v34, (uint64_t)v11, v35, v36, v37);

          if ((isEqual & 1) != 0)
          {

            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v39 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend_strokeProviderVersion(v6, v46, v47, v48, v49, v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v58 = v5;
              v59 = 2112;
              v60 = v51;
              _os_log_impl(&dword_1BE607000, v39, OS_LOG_TYPE_FAULT, "StrokeProviderError: Inconsistency in stroke provider. Stroke with id %@ is exposed but this id can not be resolved by stroke provider version %@.", buf, 0x16u);

            }
            goto LABEL_24;
          }
        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v53, (uint64_t)v61, 16, v29);
        if (v30)
          continue;
        break;
      }
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v39 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_strokeProviderVersion(v6, v40, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = v5;
      v59 = 2112;
      v60 = v45;
      _os_log_impl(&dword_1BE607000, v39, OS_LOG_TYPE_FAULT, "Stroke Grouping Logic Error: Failed to get stroke with id %@. The stroke is not exposed by stroke provider version %@.", buf, 0x16u);

    }
    goto LABEL_24;
  }
LABEL_25:

  return v21;
}

+ (id)strokesForIdentifiers:(id)a3 inStrokeProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v13 = objc_msgSend_count(v5, v8, v9, v10, v11, v12);
  objc_msgSend_arrayWithCapacity_(v7, v14, v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = v5;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v46, (uint64_t)v54, 16, v21);
  if (v22)
  {
    v23 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        v26 = (void *)objc_opt_class();
        objc_msgSend_strokeForIdentifier_inStrokeProvider_(v26, v27, v25, (uint64_t)v6, v28, v29, (_QWORD)v46);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v38 = (id)qword_1EF568E28;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_strokeProviderVersion(v6, v39, v40, v41, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v51 = v25;
            v52 = 2112;
            v53 = v44;
            _os_log_impl(&dword_1BE607000, v38, OS_LOG_TYPE_ERROR, "Failed to get stroke with id: %@ from stroke provider version %@, return empty group instead.", buf, 0x16u);

          }
          v37 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_15;
        }
        objc_msgSend_addObject_(v18, v30, (uint64_t)v34, v31, v32, v33);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v35, (uint64_t)&v46, (uint64_t)v54, 16, v36);
      if (v22)
        continue;
      break;
    }
  }

  v37 = v18;
LABEL_15:

  return v37;
}

+ (id)sortedStrokesForIdentifiers:(id)a3 inStrokeProvider:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v5 = a4;
  objc_msgSend_allObjects(a3, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1BE67CED4;
  v23[3] = &unk_1E77F2B30;
  v12 = v5;
  v24 = v12;
  objc_msgSend_sortedArrayUsingComparator_(v11, v13, (uint64_t)v23, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v18, (uint64_t)v17, (uint64_t)v12, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)strokeIdentifiersForData:(id)a3 withStrokeProvider:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = v6;
  v13 = 0;
  if (v5 && v6)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v14 = v5;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v44, (uint64_t)v50, 16, v16);
    if (v21)
    {
      v22 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v14);
          v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend_strokeIdentifierFromData_(v12, v17, (uint64_t)v24, v18, v19, v20, (_QWORD)v44);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25
            || (objc_opt_respondsToSelector() & 1) != 0
            && !objc_msgSend_isValidStrokeIdentifier_(v12, v26, (uint64_t)v25, v27, v28, v29))
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v30 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_encodedStrokeIdentifier(v24, v31, v32, v33, v34, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_description(v36, v37, v38, v39, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v49 = v42;
              _os_log_impl(&dword_1BE607000, v30, OS_LOG_TYPE_ERROR, "retrieving stroke identifier gave nil or invalid result. Encoded stroke identifier: %@", buf, 0xCu);

            }
            v13 = 0;
            goto LABEL_19;
          }
          objc_msgSend_addObject_(v13, v26, (uint64_t)v25, v27, v28, v29);

        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v44, (uint64_t)v50, 16, v20);
        if (v21)
          continue;
        break;
      }
    }
LABEL_19:

  }
  return v13;
}

+ (id)encodedStrokeIdentifiers:(id)a3 withStrokeProvider:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v6)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v5;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v29, (uint64_t)v33, 16, v15);
    if (v20)
    {
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v13);
          objc_msgSend_encodedStrokeIdentifier_(v6, v16, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22), v17, v18, v19, (_QWORD)v29);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v12, v24, (uint64_t)v23, v25, v26, v27);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v29, (uint64_t)v33, 16, v19);
      }
      while (v20);
    }

  }
  return v12;
}

+ (double)distanceFromPoint:(CGPoint)a3 toStroke:(id)a4 withStrokeProvider:(id)a5
{
  double y;
  double x;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double MidX;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat MidY;
  double v31;
  CGRect v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  v8 = a5;
  objc_msgSend_strokeIdentifierFromData_(v8, v9, (uint64_t)a4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeForIdentifier_(v8, v14, (uint64_t)v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v18, v19, v20, v21, v22, v23);
  MidX = CGRectGetMidX(v33);
  objc_msgSend_bounds(v18, v25, v26, v27, v28, v29);
  MidY = CGRectGetMidY(v34);
  v31 = sqrt((y - MidY) * (y - MidY) + (x - MidX) * (x - MidX));

  return v31;
}

+ (double)distanceFromPoint:(CGPoint)a3 toStrokes:(id)a4 withStrokeProvider:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, (uint64_t)v26, 16, v12);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    v18 = 1.79769313e308;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v10);
        objc_msgSend_distanceFromPoint_toStroke_withStrokeProvider_(CHStrokeUtilities, v13, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (uint64_t)v9, v14, v15, x, y, (_QWORD)v22);
        if (v20 < v18)
          v18 = v20;
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, (uint64_t)v26, 16, v15);
    }
    while (v16);
  }
  else
  {
    v18 = 1.79769313e308;
  }

  return v18;
}

+ (void)enumeratePointsForStroke:(id)a3 interpolationType:(int64_t)a4 resolution:(int64_t)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  double v11;
  NSObject *v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint8_t buf[16];

  v9 = a3;
  v10 = a6;
  if (!v9)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v12 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v12, OS_LOG_TYPE_ERROR, "Unexpected nil stroke passed to enumeration method. Skipping.", buf, 2u);
    }
    goto LABEL_25;
  }
  if (!a4)
    goto LABEL_11;
  if (a4 == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((unint64_t)a5 >= 3)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v19 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_FAULT, "timestep must be > 0", buf, 2u);
        }

        v11 = 0.0;
      }
      else
      {
        v11 = dbl_1BE8D5C48[a5];
      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = sub_1BE67D914;
      v24[3] = &unk_1E77F2B58;
      v25 = v10;
      objc_msgSend_enumeratePointsWithDistanceStep_usingBlock_(v9, v20, (uint64_t)v24, v21, v22, v23, v11);
      v12 = v25;
LABEL_25:

      goto LABEL_26;
    }
LABEL_11:
    if ((unint64_t)a5 >= 3)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v14 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_FAULT, "timestep must be > 0", buf, 2u);
      }

      v13 = 0.0;
    }
    else
    {
      v13 = dbl_1BE8D5C30[a5];
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1BE67D908;
    v26[3] = &unk_1E77F2B58;
    v27 = v10;
    objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v9, v15, (uint64_t)v26, v16, v17, v18, v13);
    v12 = v27;
    goto LABEL_25;
  }
LABEL_26:

}

+ (BOOL)isPointEnumerationSupportedForStroke:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE67D9F0;
  v8[3] = &unk_1E77F2B80;
  v8[4] = &v9;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v4, v5, (uint64_t)v3, 0, 1, (uint64_t)v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (double)durationOfStrokesInStrokeGroup:(id)a3 strokeProvider:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;

  v5 = a3;
  v6 = a4;
  objc_msgSend_firstStrokeIdentifier(v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastStrokeIdentifier(v5, v13, v14, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v18;
  v24 = 0;
  v25 = 0.0;
  if (v12 && v18)
  {
    objc_msgSend_strokeIdentifierFromData_(v6, v19, (uint64_t)v12, v20, v21, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifierFromData_(v6, v27, (uint64_t)v23, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v31;
    v37 = 0;
    v24 = 0;
    if (v26 && v31)
    {
      objc_msgSend_strokeForIdentifier_(v6, v32, (uint64_t)v26, v33, v34, v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeForIdentifier_(v6, v38, (uint64_t)v36, v39, v40, v41);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v24 && v37)
    {
      objc_msgSend_endTimestamp(v37, v42, v43, v44, v45, v46);
      v48 = v47;
      objc_msgSend_startTimestamp(v24, v49, v50, v51, v52, v53);
      v25 = v48 - v54;
    }
  }
  else
  {
    v37 = 0;
  }

  return v25;
}

+ (double)speedForFinalTimeRange:(double)a3 stroke:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t (**v18)(_QWORD, _QWORD);
  double v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  float32x2_t v23;
  double v24;
  double v25;
  float64x2_t v27;
  _QWORD v28[6];
  _QWORD v29[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = vcvtpd_s64_f64(a3 * 120.0);
  v5 = MEMORY[0x1E0C80A78](a4);
  v7 = (char *)&v27 - v6;
  v8 = (void *)MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v27 - v9;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BE67DE24;
  v29[3] = &unk_1E77F2BA8;
  v29[4] = &v30;
  v29[5] = v4;
  v29[6] = v7;
  v29[7] = (char *)&v27 - v9;
  objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v8, v12, (uint64_t)v29, v13, v14, v15, 0.00833333333);
  v16 = v31[3];
  v17 = -1.0;
  if (v16 >= v4)
  {
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = sub_1BE67DE60;
    v28[3] = &unk_1E77F2BC8;
    v28[4] = v16 % v4;
    v28[5] = v4;
    v18 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1C3B81A84](v28);
    v19 = 0.0;
    if (v4 >= 2)
    {
      for (i = 1; i != v4; i = v21 + 2)
      {
        v27 = *(float64x2_t *)&v7[16 * v18[2](v18, i)];
        v21 = i - 1;
        v22 = v18[2](v18, v21);
        v23 = vsub_f32(vcvt_f32_f64(v27), vcvt_f32_f64(*(float64x2_t *)&v7[16 * v22]));
        v19 = v19 + sqrtf(vaddv_f32(vmul_f32(v23, v23)));
      }
    }
    v24 = *(double *)&v10[8 * v18[2](v18, 0)];
    v25 = *(double *)&v10[8 * v18[2](v18, v4 - 1)] - v24;
    if (v25 <= 0.0)
      v17 = -1.0;
    else
      v17 = v19 / v25;

  }
  _Block_object_dispose(&v30, 8);
  return v17;
}

+ (double)arcLengthForStroke:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  _QWORD v8[7];
  _QWORD v9[3];
  char v10;
  _QWORD v11[6];
  __int128 v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4012000000;
  v11[3] = sub_1BE67DFDC;
  v11[4] = nullsub_10;
  v11[5] = &unk_1BE94989A;
  v12 = *MEMORY[0x1E0C9D538];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v4 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE67DFEC;
  v8[3] = &unk_1E77F2BF0;
  v8[4] = v9;
  v8[5] = &v13;
  v8[6] = v11;
  objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v4, v5, (uint64_t)v3, 0, 1, (uint64_t)v8);
  v6 = v14[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

+ (CGRect)boundsForStrokes:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v3;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16, v10);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v8);
        objc_msgSend_bounds(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v18), v11, v12, v13, v14, v15, (_QWORD)v27);
        v36.origin.x = v19;
        v36.origin.y = v20;
        v36.size.width = v21;
        v36.size.height = v22;
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        v34 = CGRectUnion(v33, v36);
        x = v34.origin.x;
        y = v34.origin.y;
        width = v34.size.width;
        height = v34.size.height;
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, (uint64_t)v31, 16, v15);
    }
    while (v16);
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (CGRect)boundingBoxOfPoints:(const void *)a3 rotatedAroundPoint:(CGPoint)a4 byAngle:(double)a5
{
  double y;
  double x;
  float v8;
  __float2 v9;
  uint64_t v10;
  double cosval;
  double sinval;
  unint64_t v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = __sincosf_stret(v8);
  v10 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (v10)
  {
    cosval = v9.__cosval;
    sinval = v9.__sinval;
    v13 = v10 >> 4;
    if (v13 <= 1)
      v13 = 1;
    v14 = (double *)(*(_QWORD *)a3 + 8);
    v15 = 1.79769313e308;
    v16 = -1.79769313e308;
    v17 = -1.79769313e308;
    v18 = 1.79769313e308;
    do
    {
      v19 = *(v14 - 1) - x;
      v20 = *v14 - y;
      v21 = x + cosval * v19 - v20 * sinval;
      v22 = y + v20 * cosval + sinval * v19;
      if (v21 < v18)
        v18 = v21;
      if (v21 > v17)
        v17 = v21;
      if (v22 < v15)
        v15 = v22;
      if (v22 > v16)
        v16 = v22;
      v14 += 2;
      --v13;
    }
    while (v13);
    v23 = v17 - v18;
    v24 = v16 - v15;
  }
  else
  {
    v18 = 1.79769313e308;
    v15 = 1.79769313e308;
    v23 = -1.79769313e308 - 1.79769313e308;
    v24 = -1.79769313e308 - 1.79769313e308;
  }
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v15;
  result.origin.x = v18;
  return result;
}

+ (vector<CGRect,)horizontallyOverlappedChunks:(id)a2
{
  uint64_t *v5;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat *v10;
  CGFloat *v11;
  CGRect *v12;
  CGFloat v13;
  CGFloat v14;
  CGRect *var0;
  CGRect *var1;
  CGRect *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  CGRect *v24;
  CGRect *v25;
  CGSize size;
  CGRect *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  vector<CGRect, std::allocator<CGRect>> *result;
  CGRect *v33;
  CGRect *v34;
  CGRect *v35;
  CGRect *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  CGRect *v41;
  CGSize v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v5 = (uint64_t *)MEMORY[0x1E0C9D628];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v10 = *(CGFloat **)a4;
  v11 = (CGFloat *)*((_QWORD *)a4 + 1);
  if (*(CGFloat **)a4 != v11)
  {
    while (1)
    {
      while (1)
      {
        v13 = *v10;
        v14 = v10[2];
        v43.origin.x = *v10;
        v43.origin.y = -8.98846567e307;
        v43.size.width = v14;
        v43.size.height = 1.79769313e308;
        v48.origin.x = x;
        v48.origin.y = y;
        v48.size.width = width;
        v48.size.height = height;
        if (!CGRectIntersectsRect(v43, v48))
          break;
        v44.origin.x = v13;
        v44.origin.y = -8.98846567e307;
        v44.size.width = v14;
        v44.size.height = 1.79769313e308;
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        v45 = CGRectUnion(v44, v49);
        x = v45.origin.x;
        y = v45.origin.y;
        width = v45.size.width;
        height = v45.size.height;
        v10 += 4;
        if (v10 == v11)
        {
LABEL_26:
          v28 = *v5;
          v29 = v5[1];
          v30 = v5[2];
          v31 = v5[3];
          goto LABEL_28;
        }
      }
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      if (!CGRectEqualToRect(v46, *(CGRect *)v5))
        break;
LABEL_5:
      height = 1.79769313e308;
      y = -8.98846567e307;
      x = v13;
      width = v14;
      v10 += 4;
      if (v10 == v11)
        goto LABEL_26;
    }
    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 < var0)
    {
      var1->origin.x = x;
      var1->origin.y = y;
      v12 = var1 + 1;
      var1->size.width = width;
      var1->size.height = height;
LABEL_4:
      retstr->var1 = v12;
      goto LABEL_5;
    }
    v17 = retstr->var0;
    v18 = var1 - retstr->var0;
    v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 59)
      sub_1BE61F930();
    v20 = (char *)var0 - (char *)v17;
    if (v20 >> 4 > v19)
      v19 = v20 >> 4;
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0)
      v21 = 0x7FFFFFFFFFFFFFFLL;
    else
      v21 = v19;
    if (v21)
    {
      if (v21 >> 59)
        sub_1BE61F100();
      v22 = (char *)operator new(32 * v21);
      v23 = (uint64_t)&v22[32 * v18];
      *(CGFloat *)v23 = x;
      *(CGFloat *)(v23 + 8) = y;
      *(CGFloat *)(v23 + 16) = width;
      *(CGFloat *)(v23 + 24) = height;
      v24 = (CGRect *)v23;
      if (var1 == v17)
      {
LABEL_20:
        v25 = (CGRect *)&v22[32 * v21];
        v12 = (CGRect *)(v23 + 32);
        retstr->var0 = v24;
        retstr->var1 = (CGRect *)(v23 + 32);
        retstr->var2.var0 = v25;
        if (!var1)
          goto LABEL_4;
        goto LABEL_25;
      }
    }
    else
    {
      v22 = 0;
      v23 = 32 * v18;
      *(CGFloat *)v23 = x;
      *(CGFloat *)(v23 + 8) = y;
      *(CGFloat *)(v23 + 16) = width;
      *(CGFloat *)(v23 + 24) = height;
      v24 = (CGRect *)(32 * v18);
      if (var1 == v17)
        goto LABEL_20;
    }
    do
    {
      size = var1[-1].size;
      v24[-1].origin = var1[-1].origin;
      v24[-1].size = size;
      --v24;
      --var1;
    }
    while (var1 != v17);
    var1 = v17;
    v27 = (CGRect *)&v22[32 * v21];
    v12 = (CGRect *)(v23 + 32);
    retstr->var0 = v24;
    retstr->var1 = (CGRect *)(v23 + 32);
    retstr->var2.var0 = v27;
    if (!v17)
      goto LABEL_4;
LABEL_25:
    operator delete(var1);
    goto LABEL_4;
  }
  v31 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v30 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  v29 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  v28 = *MEMORY[0x1E0C9D628];
LABEL_28:
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  result = (vector<CGRect, std::allocator<CGRect>> *)CGRectEqualToRect(v47, *(CGRect *)&v28);
  if ((_DWORD)result)
  {
    v34 = retstr->var1;
    v33 = retstr->var2.var0;
    if (v34 >= v33)
    {
      v36 = retstr->var0;
      v37 = v34 - retstr->var0;
      v38 = v37 + 1;
      if ((unint64_t)(v37 + 1) >> 59)
        sub_1BE61F930();
      v39 = (char *)v33 - (char *)v36;
      if (v39 >> 4 > v38)
        v38 = v39 >> 4;
      if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFE0)
        v40 = 0x7FFFFFFFFFFFFFFLL;
      else
        v40 = v38;
      if (v40)
      {
        if (v40 >> 59)
          sub_1BE61F100();
        result = (vector<CGRect, std::allocator<CGRect>> *)operator new(32 * v40);
      }
      else
      {
        result = 0;
      }
      v41 = (CGRect *)((char *)result + 32 * v37);
      v41->origin.x = x;
      v41->origin.y = y;
      v41->size.width = width;
      v41->size.height = height;
      v35 = v41 + 1;
      if (v34 != v36)
      {
        do
        {
          v42 = v34[-1].size;
          v41[-1].origin = v34[-1].origin;
          v41[-1].size = v42;
          --v41;
          --v34;
        }
        while (v34 != v36);
        v34 = v36;
      }
      retstr->var0 = v41;
      retstr->var1 = v35;
      retstr->var2.var0 = (CGRect *)((char *)result + 32 * v40);
      if (v34)
        operator delete(v34);
    }
    else
    {
      v34->origin.x = x;
      v34->origin.y = y;
      v35 = v34 + 1;
      v34->size.width = width;
      v34->size.height = height;
    }
    retstr->var1 = v35;
  }
  return result;
}

+ (double)horizontalOverlapOfIndividualStrokeBounds:(const void *)a3 otherStrokeBounds:(const void *)a4
{
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat *v11;
  double v12;
  CGRect *v13;
  CGRect *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect *__p;
  CGRect *v21;
  CGFloat *v22;
  CGFloat *v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend_horizontallyOverlappedChunks_(CHStrokeUtilities, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  objc_msgSend_horizontallyOverlappedChunks_(CHStrokeUtilities, v7, (uint64_t)a4, v8, v9, v10);
  v11 = v22;
  v12 = 0.0;
  v13 = __p;
  if (v22 != v23 && __p != v21)
  {
    do
    {
      v14 = __p;
      if (__p != v21)
      {
        v16 = v11[2];
        v15 = v11[3];
        v18 = *v11;
        v17 = v11[1];
        do
        {
          v24.origin.x = v18;
          v24.origin.y = v17;
          v24.size.width = v16;
          v24.size.height = v15;
          v25 = CGRectIntersection(v24, *v14);
          v12 = v12 + v25.size.width;
          ++v14;
        }
        while (v14 != v21);
      }
      v11 += 4;
    }
    while (v11 != v23);
    v13 = __p;
  }
  if (v13)
    operator delete(v13);
  if (v22)
    operator delete(v22);
  return v12;
}

+ (CGRect)unionStrokeBounds:(const void *)a3 usingStrokeCountLimit:(int64_t)a4 reverseOrder:(BOOL)a5
{
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  CGRect result;

  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v11 = *(_QWORD *)a3;
  v12 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
  if (v12 >= a4)
    v13 = a4;
  else
    v13 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
  if (a5)
  {
    if (v13)
    {
      v14 = 0;
      v15 = -1;
      do
      {
        *(CGRect *)&v7 = CGRectUnion(*(CGRect *)&v7, *(CGRect *)(v11 + 32 * (v12 + v15)));
        ++v14;
        v11 = *(_QWORD *)a3;
        v12 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
        if (v12 >= a4)
          v16 = a4;
        else
          v16 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
        --v15;
      }
      while (v14 < v16);
    }
  }
  else if (v13)
  {
    v17 = 0;
    v18 = 0;
    do
    {
      *(CGRect *)&v7 = CGRectUnion(*(CGRect *)&v7, *(CGRect *)(v11 + v17));
      ++v18;
      v11 = *(_QWORD *)a3;
      v19 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
      if (v19 >= a4)
        v19 = a4;
      v17 += 32;
    }
    while (v18 < v19);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)unionStrokeBounds:(const void *)a3 aroundXPosition:(double)a4 usingOneSideStrokeCountLimit:(int64_t)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v11 = *(_QWORD *)a3;
  v12 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  v13 = v12 >> 5;
  if (!v12)
  {
LABEL_5:
    v17 = (v13 + ~a5) & ~((uint64_t)(v13 + ~a5) >> 63);
    v18 = v13 - v17;
    if ((uint64_t)v13 <= v17)
      goto LABEL_10;
    goto LABEL_8;
  }
  v15 = 0;
  v16 = 0;
  while (CGRectGetMidX(*(CGRect *)(v11 + v15)) <= a4)
  {
    ++v16;
    v11 = *(_QWORD *)a3;
    v15 += 32;
    if (v16 >= (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5)
      goto LABEL_5;
  }
  v13 = v16;
  v17 = (v16 + ~a5) & ~((uint64_t)(v16 + ~a5) >> 63);
  v18 = v16 - v17;
  if ((uint64_t)v16 > v17)
  {
LABEL_8:
    v19 = 32 * v17;
    do
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v30 = CGRectUnion(v29, *(CGRect *)(*(_QWORD *)a3 + v19));
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
      v19 += 32;
      --v18;
    }
    while (v18);
  }
LABEL_10:
  v20 = v13 + a5;
  v21 = *(_QWORD *)a3;
  v22 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
  if (v20 < v22)
    v22 = v20;
  if (v13 < v22)
  {
    v23 = 32 * v13;
    do
    {
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v32 = CGRectUnion(v31, *(CGRect *)(v21 + v23));
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      ++v13;
      v21 = *(_QWORD *)a3;
      v24 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5;
      if (v20 < v24)
        v24 = v20;
      v23 += 32;
    }
    while (v13 < v24);
  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

+ (id)createDrawingForStrokeIdentifiers:(id)a3 strokeProvider:(id)a4 interpolationType:(int64_t)a5 resolution:(int64_t)a6 cancellationBlock:(id)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v12 = a7;
  objc_msgSend_strokesForIdentifiers_inStrokeProvider_(a1, v13, (uint64_t)a3, (uint64_t)a4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(a1, v17, (uint64_t)v16, a5, a6, (uint64_t)v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)createDrawingForStrokes:(id)a3 interpolationType:(int64_t)a4 resolution:(int64_t)a5 cancellationBlock:(id)a6
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CHDrawing *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  CHDrawing *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  id v38;
  uint64_t (**v39)(void);
  id obj;
  CHDrawing *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v47;
  CHDrawing *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v39 = (uint64_t (**)(void))a6;
  v43 = objc_alloc_init(CHDrawing);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v38;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v49, (uint64_t)v53, 16, v8);
  if (v9)
  {
    v10 = *(_QWORD *)v50;
    if (v39)
    {
      v11 = MEMORY[0x1E0C809B0];
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v12);
        if ((v39[2]() & 1) != 0)
          break;
        v14 = (void *)objc_opt_class();
        v44 = v11;
        v45 = 3221225472;
        v46 = sub_1BE67EDB4;
        v47 = &unk_1E77F2C18;
        v15 = v43;
        v48 = v15;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v14, v16, v13, a4, a5, (uint64_t)&v44);
        objc_msgSend_endStroke(v15, v17, v18, v19, v20, v21);

        if (v9 == ++v12)
        {
          v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v49, (uint64_t)v53, 16, v23);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v24 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          v27 = (void *)objc_opt_class();
          v44 = v24;
          v45 = 3221225472;
          v46 = sub_1BE67EDB4;
          v47 = &unk_1E77F2C18;
          v28 = v43;
          v48 = v28;
          objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v27, v29, v26, a4, a5, (uint64_t)&v44);
          objc_msgSend_endStroke(v28, v30, v31, v32, v33, v34);

        }
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v49, (uint64_t)v53, 16, v36);
      }
      while (v9);
    }
  }

  return v43;
}

+ (vector<CGPoint,)convexHullForStroke:(id)a2
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v15, 1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convexHullForStrokes_(a2, v10, (uint64_t)v9, v11, v12, v13);

  return result;
}

+ (vector<CGPoint,)convexHullForStrokes:(id)a2
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(__n128 *, __n128 *);
  void (*v33)(uint64_t);
  void *v34;
  void *__p;
  void *v36;
  uint64_t v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x4812000000;
  v32 = sub_1BE67F118;
  v33 = sub_1BE67F13C;
  v34 = &unk_1BE94989A;
  __p = 0;
  v36 = 0;
  v37 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = a4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v40, 16, v7);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v13 = (void *)objc_opt_class();
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = sub_1BE67F154;
        v24[3] = &unk_1E77F2B80;
        v24[4] = &v29;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v13, v14, v12, 0, 1, (uint64_t)v24);
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v15, (uint64_t)&v25, (uint64_t)v40, 16, v16);
    }
    while (v8);
  }

  if (v30[7] == v30[6])
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v21 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v5;
      _os_log_impl(&dword_1BE607000, v21, OS_LOG_TYPE_ERROR, "Strokes with no enumerable points found, recognition results may be affected. Strokes: %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend_convexHullForPoints_(a2, v17, (uint64_t)(v30 + 6), v18, v19, v20);
  }
  _Block_object_dispose(&v29, 8);
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }

  return result;
}

+ (vector<CGPoint,)convexHullForStrokes:(id)a2 inDrawing:(SEL)a3
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  __n128 (*v26)(__n128 *, __n128 *);
  void (*v27)(uint64_t);
  void *v28;
  void *__p;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x4812000000;
  v26 = sub_1BE67F118;
  v27 = sub_1BE67F13C;
  v28 = &unk_1BE94989A;
  __p = 0;
  v30 = 0;
  v31 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BE67F46C;
  v20[3] = &unk_1E77F2C40;
  v9 = v8;
  v21 = v9;
  v22 = &v23;
  objc_msgSend_enumerateIndexesUsingBlock_(a4, v10, (uint64_t)v20, v11, v12, v13);
  if (v24[7] == v24[6])
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v18 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_impl(&dword_1BE607000, v18, OS_LOG_TYPE_ERROR, "Drawing with no enumerable points found, recognition results may be affected. Drawing: %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend_convexHullForPoints_(a2, v14, (uint64_t)(v24 + 6), v15, v16, v17);
  }

  _Block_object_dispose(&v23, 8);
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }

  return result;
}

+ (vector<CGPoint,)convexHullForPoints:()vector<CGPoint
{
  double v4;
  double *v7;
  double *v8;
  unint64_t v9;
  double *v10;
  int64_t v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  CGPoint *v15;
  __compressed_pair<CGPoint *, std::allocator<CGPoint>> *p_end_cap;
  CGPoint **p_end;
  CGPoint *v18;
  unint64_t v19;
  uint64_t v20;
  double *v21;
  double *v22;
  uint64_t v23;
  CGPoint *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  CGPoint *end;
  CGPoint *begin;
  unint64_t v52;
  unint64_t v53;
  CGPoint *value;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  CGPoint *v59;
  size_t v60;
  CGPoint *v61;
  CGPoint *v62;
  CGPoint *v63;
  int v64;
  unint64_t v65;
  __int16 v66;
  unint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = *(double **)a4;
  v7 = (double *)*((_QWORD *)a4 + 1);
  v9 = ((uint64_t)v7 - *(_QWORD *)a4) >> 4;
  if (v7 == *(double **)a4)
  {
    v8 = (double *)*((_QWORD *)a4 + 1);
  }
  else
  {
    v10 = *(double **)a4;
    do
    {
      v4 = *v10;
      v10 += 2;
    }
    while (v10 != v7);
  }
  v11 = (char *)v7 - (char *)v8;
  v12 = ((char *)v7 - (char *)v8) >> 4;
  if (v12 < v9)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v9 - ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4);
      v64 = 134218240;
      v65 = v14;
      v66 = 2048;
      v67 = v9;
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_ERROR, "Removed %lu NaN-Points from %lu given points before calculating convex hull.", (uint8_t *)&v64, 0x16u);
    }

    v8 = *(double **)a4;
    v7 = (double *)*((_QWORD *)a4 + 1);
    v11 = (int64_t)v7 - *(_QWORD *)a4;
    v12 = v11 >> 4;
  }
  if ((unint64_t)v11 <= 0x1F)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (v7 != v8)
    {
      v15 = (CGPoint *)operator new(v11);
      p_end_cap = &retstr->__end_cap_;
      p_end = &retstr->__end_;
      retstr->__begin_ = v15;
      retstr->__end_ = v15;
      v18 = &v15[v12];
      p_end_cap->__value_ = v18;
      result = (vector<CGPoint, std::allocator<CGPoint>> *)memcpy(v15, v8, v11);
      *p_end = v18;
    }
    return result;
  }
  v19 = 126 - 2 * __clz(v12);
  if (v7 == v8)
    v20 = 0;
  else
    v20 = v19;
  sub_1BE68167C(v8, v7, v20, 1, v4);
  v22 = *(double **)a4;
  v21 = (double *)*((_QWORD *)a4 + 1);
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v23 = (char *)v21 - (char *)v22;
  if (v21 != v22)
  {
    if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF9)
      sub_1BE61F930();
    v24 = (CGPoint *)operator new(2 * v23);
    retstr->__begin_ = v24;
    retstr->__end_cap_.__value_ = &v24[v23 >> 3];
    bzero(v24, 2 * v23);
    retstr->__end_ = (CGPoint *)((char *)v24 + 2 * v23);
  }
  if (v23 < 1)
  {
    v29 = -1;
  }
  else
  {
    v25 = 0;
    v26 = 0;
    if (v23 >> 4 <= 1)
      v27 = 1;
    else
      v27 = v23 >> 4;
    do
    {
      v28 = 16 * v25;
      do
      {
        v29 = v25;
        v30 = v28;
        if (v25 < 2)
          break;
        v31 = (void *)objc_opt_class();
        result = (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend_threePointsOrientationWithOrigin_pointA_pointB_(v31, v32, v33, v34, v35, v36, *(double *)((char *)&retstr->__begin_[-2].x + v30), *(double *)((char *)&retstr->__begin_[-1] + v30 - 8), *(double *)((char *)&retstr->__begin_[-1].x + v30), *(double *)((char *)retstr->__begin_ + v30 - 8), *(double *)(*(_QWORD *)a4 + 16 * v26), *(double *)(*(_QWORD *)a4 + 16 * v26 + 8));
        v28 = v30 - 16;
        --v25;
      }
      while (v37 <= 0.000000001);
      v25 = v29 + 1;
      *(CGPoint *)((char *)retstr->__begin_ + v30) = *(CGPoint *)(*(_QWORD *)a4 + 16 * v26++);
    }
    while (v26 != v27);
    if (v23 >= 17)
    {
      v38 = (v23 >> 4) - 2;
      v39 = v29 + 1;
      do
      {
        v41 = 16 * v39;
        do
        {
          v29 = v39;
          v42 = v41;
          if (v39 <= v25)
            break;
          v43 = (void *)objc_opt_class();
          result = (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend_threePointsOrientationWithOrigin_pointA_pointB_(v43, v44, v45, v46, v47, v48, *(double *)((char *)&retstr->__begin_[-2].x + v42), *(double *)((char *)&retstr->__begin_[-1] + v42 - 8), *(double *)((char *)&retstr->__begin_[-1].x + v42), *(double *)((char *)retstr->__begin_ + v42 - 8), *(double *)(*(_QWORD *)a4 + 16 * v38), *(double *)(*(_QWORD *)a4 + 16 * v38 + 8));
          v41 = v42 - 16;
          v39 = v29 - 1;
        }
        while (v49 <= 0.000000001);
        v39 = v29 + 1;
        *(CGPoint *)((char *)retstr->__begin_ + v42) = *(CGPoint *)(*(_QWORD *)a4 + 16 * v38);
      }
      while (v38-- > 0);
    }
  }
  begin = retstr->__begin_;
  end = retstr->__end_;
  v52 = end - retstr->__begin_;
  v53 = v29 - v52;
  if (v29 <= v52)
  {
    if (v29 >= v52)
      return result;
    v63 = &begin[v29];
    goto LABEL_55;
  }
  value = retstr->__end_cap_.__value_;
  if (v53 <= value - end)
  {
    bzero(retstr->__end_, 16 * v53);
    v63 = &end[v53];
LABEL_55:
    retstr->__end_ = v63;
    return result;
  }
  if (v29 >> 60)
    sub_1BE61F930();
  v55 = (char *)value - (char *)begin;
  v56 = v55 >> 3;
  if (v55 >> 3 <= v29)
    v56 = v29;
  if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
    v57 = 0xFFFFFFFFFFFFFFFLL;
  else
    v57 = v56;
  if (v57 >> 60)
    sub_1BE61F100();
  v58 = (char *)operator new(16 * v57);
  v59 = (CGPoint *)&v58[16 * v52];
  v60 = v53;
  v61 = (CGPoint *)&v58[16 * v57];
  bzero(v59, v60 * 16);
  v62 = &v59[v60];
  if (end != begin)
  {
    do
    {
      v59[-1] = end[-1];
      --v59;
      --end;
    }
    while (end != begin);
    end = begin;
  }
  retstr->__begin_ = v59;
  retstr->__end_ = v62;
  retstr->__end_cap_.__value_ = v61;
  if (end)
    operator delete(end);
  return result;
}

+ (vector<CGPoint,)enlargedConvexHull:()vector<CGPoint withMargin:(std:(SEL)a3 :(const void *)a4 allocator<CGPoint>> *)result
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v11;
  CGPoint *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGPoint *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  uint64_t v25;
  double *v26;
  double v27;
  float32_t v28;
  float v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  float v39;
  float v40;
  BOOL v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  float v53;
  double v54;
  CGPoint *value;
  CGPoint *begin;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  CGPoint *v61;
  CGPoint *v62;
  double v63;

  v63 = a5;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v11 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
  if (v11 >= -15)
  {
    v13 = 0;
    v14 = v11 >> 4;
    v15 = (v11 >> 4) - 1;
    v16 = (v11 >> 4) & ~(v11 >> 63);
    v17 = -1;
    while (1)
    {
      v19 = v17 + 1;
      v20 = *(_QWORD *)a4;
      if (v17 == -1)
        v21 = v15;
      else
        v21 = v17;
      v22 = (double *)(v20 + 16 * v21);
      v24 = *v22;
      v23 = v22[1];
      if (v19 == v14)
        v25 = 0;
      else
        v25 = v17 + 1;
      v26 = (double *)(v20 + 16 * v25);
      v27 = v26[1];
      v28 = v27 - v23;
      v29 = *v26 - v24;
      v30.f32[0] = v28;
      v30.f32[1] = -v29;
      if (v28 != 0.0 || v29 != 0.0)
      {
        v31 = vmul_f32(v30, v30);
        v31.i32[0] = vadd_f32(v31, (float32x2_t)vdup_lane_s32((int32x2_t)v31, 1)).u32[0];
        v32 = vrsqrte_f32((float32x2_t)v31.u32[0]);
        v33 = vmul_f32(v32, vrsqrts_f32((float32x2_t)v31.u32[0], vmul_f32(v32, v32)));
        v30 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vmul_n_f32(v30, vmul_f32(v33, vrsqrts_f32((float32x2_t)v31.u32[0], vmul_f32(v33, v33))).f32[0])), v63));
      }
      v34 = v24 + v30.f32[0];
      v35 = v23 + v30.f32[1];
      v36 = *v26 + v30.f32[0];
      v37 = v27 + v30.f32[1];
      if (v17 == -1)
        goto LABEL_5;
      v38 = v7 - v5;
      v39 = v6 - a5;
      v40 = (float)(v39 * v39) + (float)(v38 * v38);
      v41 = v40 <= 0.0;
      v42 = v39 / v40;
      if (v40 > 0.0)
        v43 = v38 / v40;
      else
        v43 = v38;
      if (v41)
        v44 = v39;
      else
        v44 = v42;
      v45 = v36 - v34;
      v46 = v37 - v35;
      v47 = (float)(v46 * v46) + (float)(v45 * v45);
      if (v47 > 0.0)
      {
        v45 = v45 / v47;
        v46 = v46 / v47;
      }
      v48 = v43;
      v49 = v44;
      v50 = v45;
      v51 = v46;
      v52 = v48 * v51 - v50 * v49;
      if (v52 != 0.0)
      {
        v53 = (v50 * (a5 - v35) - (v5 - v34) * v51) / v52;
        v54 = v53;
        v8 = v5 + v54 * v48;
        v9 = a5 + v54 * v49;
      }
      value = retstr->__end_cap_.__value_;
      if (v13 >= value)
        break;
      v13->x = v8;
      v13->y = v9;
      v18 = v13 + 1;
LABEL_4:
      retstr->__end_ = v18;
      v13 = v18;
LABEL_5:
      a5 = v35;
      v5 = v34;
      v6 = v37;
      v7 = v36;
      v17 = v19;
      if (v19 == v16)
        return result;
    }
    begin = retstr->__begin_;
    v57 = v13 - retstr->__begin_;
    v58 = v57 + 1;
    if ((unint64_t)(v57 + 1) >> 60)
      sub_1BE61F930();
    v59 = (char *)value - (char *)begin;
    if (v59 >> 3 > v58)
      v58 = v59 >> 3;
    if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0)
      v60 = 0xFFFFFFFFFFFFFFFLL;
    else
      v60 = v58;
    if (v60)
    {
      if (v60 >> 60)
        sub_1BE61F100();
      result = (vector<CGPoint, std::allocator<CGPoint>> *)operator new(16 * v60);
      v61 = (CGPoint *)((char *)result + 16 * v57);
      v61->x = v8;
      v61->y = v9;
      v62 = v61;
      if (v13 == begin)
      {
LABEL_36:
        v18 = v61 + 1;
        retstr->__begin_ = v62;
        retstr->__end_ = v61 + 1;
        retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
        if (!v13)
          goto LABEL_4;
        goto LABEL_41;
      }
    }
    else
    {
      result = 0;
      v61 = (CGPoint *)(16 * v57);
      v61->x = v8;
      v61->y = v9;
      v62 = (CGPoint *)(16 * v57);
      if (v13 == begin)
        goto LABEL_36;
    }
    do
    {
      v62[-1] = v13[-1];
      --v62;
      --v13;
    }
    while (v13 != begin);
    v13 = retstr->__begin_;
    v18 = v61 + 1;
    retstr->__begin_ = v62;
    retstr->__end_ = v61 + 1;
    retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
    if (!v13)
      goto LABEL_4;
LABEL_41:
    operator delete(v13);
    goto LABEL_4;
  }
  return result;
}

+ (id)polygonForStrokes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  CHPolygon *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *__p;
  _BYTE *v19;

  objc_msgSend_convexHullForStrokes_(a1, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (v19 - __p) >> 4;
  v7 = malloc_type_calloc(v6, 0x10uLL, 0x1000040451B5BE8uLL);
  v8 = (uint64_t)v7;
  if (v19 != __p)
  {
    if (v6 <= 1)
      v9 = 1;
    else
      v9 = (v19 - __p) >> 4;
    v10 = 16 * v6 - 16;
    v11 = v7;
    do
    {
      *v11++ = *(_OWORD *)&__p[v10];
      v10 -= 16;
      --v9;
    }
    while (v9);
  }
  v12 = [CHPolygon alloc];
  v16 = (void *)objc_msgSend_initWithVertices_vertexCount_(v12, v13, v8, v6, v14, v15);
  if (__p)
    operator delete(__p);
  return v16;
}

+ (double)circumferenceRatioOfCircleFittedToPoints:(const void *)a3 circleCenter:(CGPoint *)a4 circleRadius:(double *)a5
{
  uint64_t v5;
  float64x2_t v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  int64x2_t v10;
  double result;
  int64x2_t v12;
  BOOL v13;
  BOOL v14;
  int64x2_t v15;
  int64x2_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  double v22;
  int64x2_t v23;
  int64x2_t v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  float64x2_t v29;
  float32_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float v33;
  double v34;
  float32x2_t v35;
  float32_t v36;
  float32x2_t v37;
  int32x2_t v38;
  float32x2_t v39;
  float32_t v40;
  float32x2_t v41;
  int32x2_t v42;

  v5 = *((_QWORD *)a3 + 1);
  v6 = *(float64x2_t *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 8);
  v8 = *(float64x2_t *)(v7 + 16);
  v9 = *(float64x2_t *)(*(_QWORD *)(v7 + 8) + 16);
  v10 = (int64x2_t)vsubq_f64(v8, v6);
  result = 0.0;
  if (*(double *)v10.i64 != 0.0 || *(double *)&v10.i64[1] != 0.0)
  {
    v12 = (int64x2_t)vsubq_f64(v9, v8);
    v13 = *(double *)v12.i64 == 0.0 && *(double *)v10.i64 == 0.0;
    v14 = *(double *)&v12.i64[1] == 0.0 && *(double *)v12.i64 == 0.0;
    if (!v13 && !v14)
    {
      if (*(double *)v10.i64 == 0.0)
      {
        v15 = (int64x2_t)vsubq_f64(v8, v9);
        v16 = (int64x2_t)vsubq_f64(v9, v6);
        v18 = v9.f64[1];
        v17 = v9.f64[0];
        v19 = v8.f64[1];
        v9.f64[0] = v8.f64[0];
        v20 = v6.f64[1];
        v8.f64[0] = v6.f64[0];
        v21 = vdivq_f64((float64x2_t)vzip2q_s64(v16, v15), (float64x2_t)vzip1q_s64(v16, v15));
        v22 = v21.f64[1];
        if (v21.f64[0] == v21.f64[1])
          return result;
      }
      else
      {
        v19 = v9.f64[1];
        v20 = v8.f64[1];
        if (*(double *)v12.i64 == 0.0)
        {
          v23 = (int64x2_t)vsubq_f64(v9, v6);
          v24 = (int64x2_t)vsubq_f64(v6, v8);
          v18 = v6.f64[1];
          v17 = v6.f64[0];
          v21 = vdivq_f64((float64x2_t)vzip2q_s64(v24, v23), (float64x2_t)vzip1q_s64(v24, v23));
          v22 = v21.f64[1];
          if (v21.f64[0] == v21.f64[1])
            return result;
        }
        else
        {
          v18 = v8.f64[1];
          v17 = v8.f64[0];
          v20 = v6.f64[1];
          v8.f64[0] = v6.f64[0];
          v21 = vdivq_f64((float64x2_t)vzip2q_s64(v10, v12), (float64x2_t)vzip1q_s64(v10, v12));
          v22 = v21.f64[1];
          if (v21.f64[0] == v21.f64[1])
            return result;
        }
      }
      v25 = (v22 * (v17 + v8.f64[0]) + v22 * v21.f64[0] * (v20 - v19) - v21.f64[0] * (v9.f64[0] + v17))
          / (v22 - v21.f64[0] + v22 - v21.f64[0]);
      v26 = v21.f64[0] == 0.0;
      v27 = (v19 + v18) * 0.5 + -1.0 / v22 * (v25 - (v9.f64[0] + v17) * 0.5);
      v28 = (v18 + v20) * 0.5 + -1.0 / v21.f64[0] * (v25 - (v17 + v8.f64[0]) * 0.5);
      if (v26)
        v28 = v27;
      v29.f64[0] = v25;
      v29.f64[1] = v28;
      v31.f32[0] = v8.f64[0];
      v30 = v20;
      v31.f32[1] = v30;
      v32 = vsub_f32(vcvt_f32_f64(v29), v31);
      v33 = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
      if (a4)
      {
        a4->x = v25;
        a4->y = v28;
      }
      v34 = v33;
      if (a5)
        *a5 = v34;
      v35.f32[0] = v17;
      v36 = v18;
      v35.f32[1] = v36;
      v37 = vsub_f32(v31, v35);
      v38 = (int32x2_t)vmul_f32(v37, v37);
      v39.f32[0] = v9.f64[0];
      v40 = v19;
      v39.f32[1] = v40;
      v41 = vsub_f32(v35, v39);
      v42 = (int32x2_t)vmul_f32(v41, v41);
      return vaddvq_f64(vcvtq_f64_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v42, v38), (float32x2_t)vzip2_s32(v42, v38)))))
           / v34;
    }
  }
  return result;
}

+ (double)vectorMeanWithoutOutliers:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double *v19;
  unint64_t v20;
  double *v21;
  double v22;
  int v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)a3;
  v5 = *((_QWORD *)a3 + 1);
  v6 = (v5 - *(_QWORD *)a3) >> 3;
  if (v5 == *(_QWORD *)a3)
  {
    v4 = *((_QWORD *)a3 + 1);
  }
  else
  {
    v7 = *(_QWORD *)a3;
    do
      v7 += 8;
    while (v7 != v5);
  }
  if (v6 > (v5 - v4) >> 3)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v6 - ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
      v25 = 134218240;
      v26 = v9;
      v27 = 2048;
      v28 = v6;
      _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_ERROR, "Removed %lu NaNs from %lu given values before calculating vector mean without outliers.", (uint8_t *)&v25, 0x16u);
    }

  }
  std::__sort<std::__less<double,double> &,double *>();
  v10 = *(_QWORD *)a3;
  v11 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  v12 = v11 >> 3;
  v13 = (v11 >> 3) / 5uLL;
  v14 = 0.0;
  if (v13 < (v11 >> 3) - v13)
  {
    v15 = v12 - 2 * v13;
    if (v15 < 2)
    {
      v16 = (v11 >> 3) / 5uLL;
LABEL_18:
      v20 = v16 + v13 - v12;
      v21 = (double *)(v10 + 8 * v16);
      do
      {
        v22 = *v21++;
        v14 = v14 + v22;
      }
      while (!__CFADD__(v20++, 1));
      return v14 / (double)(uint64_t)(v12 - 2 * v13);
    }
    v17 = ((unint64_t)v11 >> 3) & 1;
    v18 = v15 - v17;
    v16 = v13 + v18;
    v19 = (double *)(v10 + 8 * v13 + 8);
    do
    {
      v14 = v14 + *(v19 - 1) + *v19;
      v19 += 2;
      v18 -= 2;
    }
    while (v18);
    if (v17)
      goto LABEL_18;
  }
  return v14 / (double)(uint64_t)(v12 - 2 * v13);
}

+ (double)lineOrientationForStrokePoints:(const void *)a3 error:(double *)a4
{
  float64x2_t *v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float64x2_t v12;
  float64x2_t *v13;
  unint64_t v14;
  unint64_t v15;
  float64x2_t *v16;
  float64x2_t v17;
  float64x2_t v18;
  unint64_t v19;
  float64x2_t v20;
  float64x2_t *v21;
  unint64_t v23;
  float64x2_t v24;
  float64x2_t v25;
  unint64_t v26;
  float64x2_t *v27;
  float64x2_t v28;
  long double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  _BOOL4 v47;
  double v48;
  double v49;
  double v50;
  long double v53;
  float64x2_t v54;

  v5 = *(float64x2_t **)a3;
  v6 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if ((unint64_t)v6 < 0x20)
  {
    v7 = 0.0;
    if (a4)
    {
      v8 = 1.79769313e308;
LABEL_47:
      *a4 = v8;
      return v7;
    }
    return v7;
  }
  v9 = v6 >> 4;
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  if (v10 < 2)
  {
    v11 = 0;
    v12 = 0uLL;
LABEL_12:
    v15 = v10 - v11;
    v16 = &v5[v11];
    do
    {
      v17 = *v16++;
      v12 = vaddq_f64(v12, v17);
      --v15;
    }
    while (v15);
    goto LABEL_14;
  }
  v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
  v13 = v5 + 1;
  v12 = 0uLL;
  v14 = v10 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    v12 = vaddq_f64(vaddq_f64(v12, v13[-1]), *v13);
    v13 += 2;
    v14 -= 2;
  }
  while (v14);
  if (v10 != v11)
    goto LABEL_12;
LABEL_14:
  v18 = vdivq_f64(v12, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v9), 0));
  if (v10 < 2)
  {
    v19 = 0;
    v20 = 0uLL;
LABEL_19:
    v26 = v10 - v19;
    v27 = &v5[v19];
    do
    {
      v28 = *v27++;
      _Q2 = vsubq_f64(v28, v18);
      v20 = vmlaq_n_f64(v20, _Q2, _Q2.f64[0]);
      _D3 = _Q2.f64[1];
      __asm { FMLA            D1, D3, V2.D[1] }
      --v26;
    }
    while (v26);
    goto LABEL_21;
  }
  v19 = v10 & 0xFFFFFFFFFFFFFFFELL;
  v21 = v5 + 1;
  v20 = 0uLL;
  _D1 = 0.0;
  v23 = v10 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    v24 = vsubq_f64(v21[-1], v18);
    v25 = vsubq_f64(*v21, v18);
    _D1 = _D1
        + COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v24, v24).f64[1])
        + COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v25, v25).f64[1]);
    v20 = vaddq_f64(vaddq_f64(v20, vmulq_n_f64(v24, v24.f64[0])), vmulq_n_f64(v25, v25.f64[0]));
    v21 += 2;
    v23 -= 2;
  }
  while (v23);
  if (v10 != v19)
    goto LABEL_19;
LABEL_21:
  if (v20.f64[0] == 0.0 || _D1 == 0.0)
  {
    v46 = _D1 == 0.0;
    v47 = v20.f64[0] == 0.0;
    v48 = 1.79769313e308;
    if (!v47 || !v46)
      v48 = 0.0;
    v49 = 1.57079633;
    if (v47 && v46)
      v49 = 0.0;
    if (v20.f64[1] == 0.0)
      v50 = 0.0;
    else
      v50 = 1.79769313e308;
    _ZF = v20.f64[0] == 0.0;
    if (v20.f64[0] == 0.0)
      v8 = v48;
    else
      v8 = v50;
    if (_ZF)
      v7 = v49;
    else
      v7 = 0.0;
    if (a4)
      goto LABEL_47;
  }
  else
  {
    *(_QWORD *)&v53 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v20, 1), v20);
    v54 = v18;
    v34 = atan(v53);
    v7 = -v34;
    if (a4)
    {
      v35 = vmlad_n_f64(v54.f64[1], -v53, v54.f64[0]);
      v36 = sqrt(v53 * v53 + 1.0);
      v37 = cos(v34);
      v38 = sin(v7);
      v39 = &v5->f64[1];
      v40 = 0.0;
      v41 = 1.79769313e308;
      v42 = -1.79769313e308;
      do
      {
        v43 = *(v39 - 1);
        v44 = vabdd_f64(*v39 + -v53 * v43, v35) / v36;
        if (v40 <= v44)
          v40 = v44;
        v45 = v43 * v37 - *v39 * v38;
        if (v45 < v41)
          v41 = v45;
        if (v45 > v42)
          v42 = v45;
        v39 += 2;
        --v10;
      }
      while (v10);
      v8 = v40 / ((v42 - v41 + 1.0) * 0.1);
      goto LABEL_47;
    }
  }
  return v7;
}

+ (double)threePointsOrientationWithOrigin:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5
{
  return (a4.x - a3.x) * (a5.y - a3.y) - (a4.y - a3.y) * (a5.x - a3.x);
}

+ (double)distanceFromPoint:(CGPoint)a3 toSegmentFromPoint:(CGPoint)a4 toPoint:(CGPoint)a5
{
  CGFloat y;
  CGPoint v6;
  float32x2_t v7;
  float v8;
  CGFloat v9;
  float32x2_t v10;
  float32x2_t v11;
  float32_t v12;
  double v13;
  CGFloat v14;
  float32x2_t v15;

  y = a5.y;
  v6 = a4;
  v7 = vcvt_f32_f64(vsubq_f64((float64x2_t)a5, (float64x2_t)a4));
  v8 = vaddv_f32(vmul_f32(v7, v7));
  if (v8 == 0.0)
  {
    v9 = a3.y;
    v10 = vcvt_f32_f64((float64x2_t)a3);
  }
  else
  {
    v11.f32[0] = a3.x - a4.x;
    v12 = a3.y - a4.y;
    v11.f32[1] = v12;
    v13 = vaddv_f32(vmul_f32(v11, v7)) / v8;
    if (v13 > 1.0)
      v13 = 1.0;
    if (v13 < 0.0)
      v13 = 0.0;
    v14 = a3.y;
    v10 = vcvt_f32_f64((float64x2_t)a3);
    v6 = (CGPoint)vmlaq_n_f64((float64x2_t)v6, vcvtq_f64_f32(v7), v13);
  }
  v15 = vsub_f32(v10, vcvt_f32_f64((float64x2_t)v6));
  return sqrtf(vaddv_f32(vmul_f32(v15, v15)));
}

+ (double)distanceFromRectangle:(CGRect)a3 toRectangle:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double MinY;
  double v77;
  double v78;
  double MaxY;
  double v80;
  double MinX;
  double v82;
  double v83;
  double v84;
  double MaxX;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v91 = a3.size.height;
  v11 = 0.0;
  if (CGRectIntersectsRect(a3, a4))
    return v11;
  v92.origin.x = v10;
  v92.origin.y = v9;
  v92.size.width = v8;
  v92.size.height = v91;
  MinX = CGRectGetMinX(v92);
  v93.origin.x = v10;
  v93.origin.y = v9;
  v93.size.width = v8;
  v93.size.height = v91;
  MinY = CGRectGetMinY(v93);
  v94.origin.x = v10;
  v94.origin.y = v9;
  v94.size.width = v8;
  v94.size.height = v91;
  MaxX = CGRectGetMaxX(v94);
  v95.origin.x = v10;
  v95.origin.y = v9;
  v95.size.width = v8;
  v95.size.height = v91;
  v77 = CGRectGetMinY(v95);
  v96.origin.x = v10;
  v96.origin.y = v9;
  v96.size.width = v8;
  v96.size.height = v91;
  v87 = CGRectGetMaxX(v96);
  v97.origin.x = v10;
  v97.origin.y = v9;
  v97.size.width = v8;
  v97.size.height = v91;
  MaxY = CGRectGetMaxY(v97);
  v98.origin.x = v10;
  v98.origin.y = v9;
  v98.size.width = v8;
  v98.size.height = v91;
  v89 = CGRectGetMinX(v98);
  v99.origin.x = v10;
  v99.origin.y = v9;
  v99.size.width = v8;
  v99.size.height = v91;
  v83 = CGRectGetMaxY(v99);
  v12 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v12, v13, v14, v15, v16, v17, MinX, MinY, x, y, width, height);
  v19 = fmin(v18, 3.40282347e38);
  v20 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v20, v21, v22, v23, v24, v25, MaxX, v77, x, y, width, height);
  v27 = fmin(v19, v26);
  v28 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v28, v29, v30, v31, v32, v33, v87, MaxY, x, y, width, height);
  v35 = fmin(v27, v34);
  v36 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v36, v37, v38, v39, v40, v41, v89, v83, x, y, width, height);
  v11 = fmin(v35, v42);
  if (fabs(v11) < 0.001)
    return v11;
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  v84 = CGRectGetMinX(v100);
  v101.origin.x = x;
  v101.origin.y = y;
  v101.size.width = width;
  v101.size.height = height;
  v78 = CGRectGetMinY(v101);
  v102.origin.x = x;
  v102.origin.y = y;
  v102.size.width = width;
  v102.size.height = height;
  v86 = CGRectGetMaxX(v102);
  v103.origin.x = x;
  v103.origin.y = y;
  v103.size.width = width;
  v103.size.height = height;
  v80 = CGRectGetMinY(v103);
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = width;
  v104.size.height = height;
  v88 = CGRectGetMaxX(v104);
  v105.origin.x = x;
  v105.origin.y = y;
  v105.size.width = width;
  v105.size.height = height;
  v82 = CGRectGetMaxY(v105);
  v106.origin.x = x;
  v106.origin.y = y;
  v106.size.width = width;
  v106.size.height = height;
  v90 = CGRectGetMinX(v106);
  v107.origin.x = x;
  v107.origin.y = y;
  v107.size.width = width;
  v107.size.height = height;
  v44 = CGRectGetMaxY(v107);
  v45 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v45, v46, v47, v48, v49, v50, v84, v78, v10, v9, v8, v91);
  v52 = fmin(v11, v51);
  v53 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v53, v54, v55, v56, v57, v58, v86, v80, v10, v9, v8, v91);
  v60 = fmin(v52, v59);
  v61 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v61, v62, v63, v64, v65, v66, v88, v82, v10, v9, v8, v91);
  v68 = fmin(v60, v67);
  v69 = (void *)objc_opt_class();
  objc_msgSend_distanceFromPoint_toRectangle_(v69, v70, v71, v72, v73, v74, v90, v44, v10, v9, v8, v91);
  return fmin(v68, v75);
}

+ (double)distanceFromPoint:(CGPoint)a3 toRectangle:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  BOOL v12;
  float64x2_t v13;
  float64x2_t v14;
  float32x2_t v15;
  double result;
  float32x2_t v17;
  double v18;
  float64x2_t v19;
  float64x2_t v20;
  float32x2_t v21;
  double v22;
  double MaxY;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double MaxX;
  double MinX;
  double v29;
  double MinY;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v31 = a3.y;
  v29 = a3.x;
  MinX = CGRectGetMinX(a4);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MinY = CGRectGetMinY(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxX = CGRectGetMaxX(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v25 = CGRectGetMinY(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v24 = CGRectGetMaxX(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MaxY = CGRectGetMaxY(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v26 = CGRectGetMinX(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v8 = CGRectGetMaxY(v38);
  v9.f64[0] = MinX;
  v10.f64[0] = v29;
  if (v29 < MinX)
  {
    v11 = v31;
    v12 = v31 <= v8;
    v13.f64[0] = v29;
    v13.f64[1] = v31;
    v14.f64[0] = v26;
    v14.f64[1] = v8;
    v15 = vsub_f32(vcvt_f32_f64(v13), vcvt_f32_f64(v14));
    result = sqrtf(vaddv_f32(vmul_f32(v15, v15)));
    if (v12)
      result = MinX - v29;
    v10.f64[1] = v31;
    v17 = vcvt_f32_f64(v10);
    v18 = MinY;
LABEL_9:
    v9.f64[1] = v18;
    v21 = vsub_f32(v17, vcvt_f32_f64(v9));
    v22 = sqrtf(vaddv_f32(vmul_f32(v21, v21)));
    if (v11 < v18)
      return v22;
    return result;
  }
  v9.f64[0] = MaxX;
  if (v29 > MaxX)
  {
    v11 = v31;
    v19.f64[0] = v29;
    v19.f64[1] = v31;
    v20.f64[0] = v24;
    v20.f64[1] = MaxY;
    *(float32x2_t *)&v19.f64[0] = vsub_f32(vcvt_f32_f64(v19), vcvt_f32_f64(v20));
    result = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v19.f64[0], *(float32x2_t *)&v19.f64[0])));
    if (v31 <= MaxY)
      result = v29 - v24;
    v10.f64[1] = v31;
    v17 = vcvt_f32_f64(v10);
    v18 = v25;
    goto LABEL_9;
  }
  v12 = v31 <= v8;
  result = v31 - v8;
  if (v12)
    result = 0.0;
  if (v31 < MinY)
    return MinY - v31;
  return result;
}

+ (double)horizontalDistanceBetweenRectangle:(CGRect)a3 rectangle:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  double MinX;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v12 = CGRectGetMinX(v28);
  v13 = MinX <= v12;
  if (MinX <= v12)
    v14 = x;
  else
    v14 = v11;
  if (v13)
    v15 = y;
  else
    v15 = v10;
  if (v13)
    v16 = width;
  else
    v16 = v9;
  if (v13)
    v17 = height;
  else
    v17 = v8;
  v27 = CGRectGetMinX(*(CGRect *)&v14);
  v29.origin.x = v11;
  v29.origin.y = v10;
  v29.size.width = v9;
  v29.size.height = v8;
  MaxX = CGRectGetMaxX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v18 = CGRectGetMaxX(v30);
  v19 = MaxX < v18;
  if (MaxX >= v18)
    v20 = x;
  else
    v20 = v11;
  if (v19)
    v21 = v10;
  else
    v21 = y;
  if (v19)
    v22 = v9;
  else
    v22 = width;
  if (v19)
    v23 = v8;
  else
    v23 = height;
  return v27 - CGRectGetMaxX(*(CGRect *)&v20);
}

+ (double)verticalDistanceBetweenRectangle:(CGRect)a3 rectangle:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxY;
  double MinY;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v12 = CGRectGetMinY(v28);
  v13 = MinY <= v12;
  if (MinY <= v12)
    v14 = x;
  else
    v14 = v11;
  if (v13)
    v15 = y;
  else
    v15 = v10;
  if (v13)
    v16 = width;
  else
    v16 = v9;
  if (v13)
    v17 = height;
  else
    v17 = v8;
  v27 = CGRectGetMinY(*(CGRect *)&v14);
  v29.origin.x = v11;
  v29.origin.y = v10;
  v29.size.width = v9;
  v29.size.height = v8;
  MaxY = CGRectGetMaxY(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v18 = CGRectGetMaxY(v30);
  v19 = MaxY < v18;
  if (MaxY >= v18)
    v20 = x;
  else
    v20 = v11;
  if (v19)
    v21 = v10;
  else
    v21 = y;
  if (v19)
    v22 = v9;
  else
    v22 = width;
  if (v19)
    v23 = v8;
  else
    v23 = height;
  return v27 - CGRectGetMaxY(*(CGRect *)&v20);
}

+ (vector<CGPoint,)regularizedPathFromPoints:()vector<CGPoint delta:(std:(SEL)a3 :(const void *)a4 allocator<CGPoint>> *)result gamma:(double)a5 outError:(double)a6
{
  float64x2_t *v11;
  float64x2_t *v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  float64x2_t v17;
  float64x2_t *v18;
  unint64_t v19;
  unint64_t v20;
  float64x2_t *v21;
  float64x2_t v22;
  double v23;
  unint64_t v25;
  double v26;
  float64x2_t v27;
  float64x2_t *v28;
  unint64_t v29;
  float64x2_t v30;
  float64x2_t v31;
  unint64_t v32;
  double *v33;
  double v34;
  CGPoint *v35;
  CGPoint *v36;
  CGPoint *v37;
  unint64_t v38;
  double v45;
  CGPoint *v46;
  double *f64;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGPoint *value;
  CGPoint *begin;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  CGPoint *v61;
  CGPoint *v62;

  if (a7)
    *a7 = 0.0;
  v12 = *(float64x2_t **)a4;
  v11 = (float64x2_t *)*((_QWORD *)a4 + 1);
  v13 = (int64_t)v11 - *(_QWORD *)a4;
  v14 = v13 >> 4;
  if ((unint64_t)v13 < 0x20)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (v11 == v12)
      return result;
LABEL_28:
    v35 = (CGPoint *)operator new(v13);
    retstr->__begin_ = v35;
    v36 = &v35[v14];
    retstr->__end_cap_.__value_ = v36;
    result = (vector<CGPoint, std::allocator<CGPoint>> *)memcpy(v35, v12, v13);
    retstr->__end_ = v36;
    return result;
  }
  if (v14 <= 1)
    v15 = 1;
  else
    v15 = v13 >> 4;
  if (v15 < 2)
  {
    v16 = 0;
    v17 = 0uLL;
LABEL_14:
    v20 = v15 - v16;
    v21 = &v12[v16];
    do
    {
      v22 = *v21++;
      v17 = vaddq_f64(v17, v22);
      --v20;
    }
    while (v20);
    goto LABEL_16;
  }
  v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
  v18 = v12 + 1;
  v17 = 0uLL;
  v19 = v15 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    v17 = vaddq_f64(vaddq_f64(v17, v18[-1]), *v18);
    v18 += 2;
    v19 -= 2;
  }
  while (v19);
  if (v15 != v16)
    goto LABEL_14;
LABEL_16:
  v23 = (double)v14;
  _Q0 = vdivq_f64(v17, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v14), 0));
  if (v15 < 2)
  {
    v25 = 0;
    v26 = 0.0;
    v27.f64[0] = 0.0;
    goto LABEL_22;
  }
  v25 = v15 & 0xFFFFFFFFFFFFFFFELL;
  v28 = v12 + 1;
  v27 = 0uLL;
  v29 = v15 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    v30 = vsubq_f64(v28[-1], _Q0);
    v31 = vsubq_f64(*v28, _Q0);
    v27 = vaddq_f64(vaddq_f64(v27, vmulq_n_f64(v30, v30.f64[0])), vmulq_n_f64(v31, v31.f64[0]));
    v28 += 2;
    v29 -= 2;
  }
  while (v29);
  if (v15 != v25)
  {
    v26 = v27.f64[1];
LABEL_22:
    v32 = v15 - v25;
    v33 = &v12[v25].f64[1];
    do
    {
      v34 = *(v33 - 1) - _Q0.f64[0];
      v26 = v26 + v34 * (*v33 - _Q0.f64[1]);
      v27.f64[0] = v27.f64[0] + v34 * v34;
      v33 += 2;
      --v32;
    }
    while (v32);
    v27.f64[1] = v26;
  }
  if (v27.f64[0] / v23 == 0.0)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    if (v11 == v12)
      return result;
    if (v13 < 0)
      sub_1BE61F930();
    goto LABEL_28;
  }
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v11 != v12)
  {
    v37 = 0;
    v38 = 0;
    _D12 = v27.f64[1] / v23 / (v27.f64[0] / v23);
    __asm { FMLS            D10, D12, V0.D[0] }
    v45 = 0.0;
    while (1)
    {
      f64 = v12[v38].f64;
      v48 = *f64;
      v49 = f64[1];
      v50 = _D10 + _D12 * *f64;
      v51 = v50 - v49;
      v52 = vabdd_f64(v50, v49);
      if (v51 < 0.0)
        v53 = -a5;
      else
        v53 = a5;
      v54 = v49 + v53 * pow(v52, a6);
      value = retstr->__end_cap_.__value_;
      if (v37 < value)
      {
        v37->x = v48;
        v37->y = v54;
        v46 = v37 + 1;
      }
      else
      {
        begin = retstr->__begin_;
        v57 = v37 - retstr->__begin_;
        v58 = v57 + 1;
        if ((unint64_t)(v57 + 1) >> 60)
          sub_1BE61F930();
        v59 = (char *)value - (char *)begin;
        if (v59 >> 3 > v58)
          v58 = v59 >> 3;
        if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0)
          v60 = 0xFFFFFFFFFFFFFFFLL;
        else
          v60 = v58;
        if (v60)
        {
          if (v60 >> 60)
            sub_1BE61F100();
          result = (vector<CGPoint, std::allocator<CGPoint>> *)operator new(16 * v60);
          v61 = (CGPoint *)((char *)result + 16 * v57);
          v61->x = v48;
          v61->y = v54;
          v62 = v61;
          if (v37 != begin)
          {
            do
            {
LABEL_49:
              v62[-1] = v37[-1];
              --v62;
              --v37;
            }
            while (v37 != begin);
            v37 = retstr->__begin_;
            v46 = v61 + 1;
            retstr->__begin_ = v62;
            retstr->__end_ = v61 + 1;
            retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
            if (!v37)
              goto LABEL_33;
LABEL_53:
            operator delete(v37);
            goto LABEL_33;
          }
        }
        else
        {
          result = 0;
          v61 = (CGPoint *)(16 * v57);
          v61->x = v48;
          v61->y = v54;
          v62 = (CGPoint *)(16 * v57);
          if (v37 != begin)
            goto LABEL_49;
        }
        v46 = v61 + 1;
        retstr->__begin_ = v62;
        retstr->__end_ = v61 + 1;
        retstr->__end_cap_.__value_ = (CGPoint *)((char *)result + 16 * v60);
        if (v37)
          goto LABEL_53;
      }
LABEL_33:
      retstr->__end_ = v46;
      v45 = v45 + (v49 - v54) * (v49 - v54);
      ++v38;
      v12 = *(float64x2_t **)a4;
      v14 = (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4;
      v37 = v46;
      if (v14 <= v38)
        goto LABEL_55;
    }
  }
  v45 = 0.0;
LABEL_55:
  if (a7)
    *a7 = v45 / (double)v14;
  return result;
}

+ (BOOL)isStrokeClassificationTextOrMath:(int64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void *)objc_opt_class();
  if ((objc_msgSend_isStrokeClassificationMath_(v4, v5, a3, v6, v7, v8) & 1) != 0)
    return 1;
  v10 = (void *)objc_opt_class();
  return objc_msgSend_isStrokeClassificationText_(v10, v11, a3, v12, v13, v14);
}

+ (BOOL)isStrokeClassificationMath:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

+ (BOOL)isStrokeClassificationText:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

+ (BOOL)isScriptClassificationMath:(int64_t)a3
{
  return a3 == 16 || (a3 & 0xFFFFFFFFFFFFFFFCLL) == 12;
}

+ (BOOL)isMatchingStrokeClassification:(int64_t)a3 scriptClassification:(int64_t)a4
{
  BOOL result;
  unint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  result = 0;
  if ((unint64_t)a4 <= 0x10)
  {
    if (((1 << a4) & 0xEFE) != 0)
    {
      v6 = a3 - 1;
      return v6 < 2;
    }
    if (((1 << a4) & 0x1F000) != 0)
    {
      v6 = a3 - 3;
      return v6 < 2;
    }
    if (a4 == 8)
    {
      v7 = (void *)objc_opt_class();
      v12 = objc_msgSend_isStrokeClassificationTextOrMath_(v7, v8, a3, v9, v10, v11) ^ 1;
      if (a3)
        return v12;
      else
        return 0;
    }
  }
  return result;
}

+ (id)scriptClassificationClasses
{
  return &unk_1E7827C50;
}

+ (id)defaultScriptClassificationDictionary
{
  if (qword_1EF567FC0 != -1)
    dispatch_once(&qword_1EF567FC0, &unk_1E77F1510);
  return (id)qword_1EF567FB8;
}

+ (BOOL)isStroke:(id)a3 intersectingPolygon:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  BOOL v35;
  const char *v36;
  BOOL v37;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  CGRect v46;
  CGRect v47;

  v5 = a3;
  v6 = a4;
  objc_msgSend_polygonDrawing(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v12, v13, v14, v15, v16, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend_bounds(v5, v26, v27, v28, v29, v30);
  v47.origin.x = v31;
  v47.origin.y = v32;
  v47.size.width = v33;
  v47.size.height = v34;
  v46.origin.x = v19;
  v46.origin.y = v21;
  v46.size.width = v23;
  v46.size.height = v25;
  v35 = CGRectIntersectsRect(v46, v47);

  if (v35)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_1BE681628;
    v39[3] = &unk_1E77F2C68;
    v40 = v6;
    v41 = &v42;
    objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v36, (uint64_t)v5, 0, 1, (uint64_t)v39);
    v37 = *((_BYTE *)v43 + 24) != 0;

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

@end
