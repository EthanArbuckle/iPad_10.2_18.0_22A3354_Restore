@implementation CSUSearchableKnowledgeDBObject

+ (id)fetchRequest
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], a2, (uint64_t)CFSTR("CSUSearchableKnowledgeDBObject"), v2, v3);
}

- (BOOL)convertToEntity:(id *)a3 error:(id *)a4
{
  uint64_t v4;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  BOOL v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  int v68;
  CSUSearchableKnowledgeObject *v69;
  id v70;
  id v71;

  objc_msgSend_localizedLabelDictionary(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend_labelDictionaryFromString_directoryWriteBack_error_(CSUSearchableKnowledgeObject, v9, (uint64_t)v8, (uint64_t)&v71, (uint64_t)a4);
  v10 = v71;

  if (v10)
  {
    objc_msgSend_localizedSynonymsDictionary(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    objc_msgSend_synonymsDictionaryFromLocaleString_directoryWriteBack_error_(CSUSearchableKnowledgeObject, v16, (uint64_t)v15, (uint64_t)&v70, (uint64_t)a4);
    v17 = v70;

    v18 = v17 != 0;
    if (a3 && v17)
    {
      v69 = [CSUSearchableKnowledgeObject alloc];
      v23 = objc_msgSend_qid(self, v19, v20, v21, v22);
      v28 = objc_msgSend_idType(self, v24, v25, v26, v27);
      objc_msgSend_confidenceValue(self, v29, v30, v31, v32);
      v34 = v33;
      v39 = objc_msgSend_sensitiveLocation(self, v35, v36, v37, v38);
      objc_msgSend_category(self, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vertical(self, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_longitude(self, v50, v51, v52, v53);
      v55 = v54;
      objc_msgSend_latitude(self, v56, v57, v58, v59);
      v61 = v60;
      v68 = objc_msgSend_version(self, v62, v63, v64, v65);
      *a3 = (id)objc_msgSend_initWithQID_idType_localizedLabelDictionary_confidence_sensitiveLocation_category_vertical_localizedSynonymsDictionary_longitude_latitude_version_(v69, v66, v23, v28, (uint64_t)v10, v39, v44, v49, v34, v55, v61, v17, v68);

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)copyFromEntity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t UniqueDbId_idType;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  id v116;

  v4 = a3;
  v9 = objc_msgSend_qid(v4, v5, v6, v7, v8);
  v14 = objc_msgSend_idType(v4, v10, v11, v12, v13);
  UniqueDbId_idType = objc_msgSend_getUniqueDbId_idType_(CSUSearchableKnowledgeDBObject, v15, v9, v14, v16);
  objc_msgSend_setDbUniqueId_(self, v18, UniqueDbId_idType, v19, v20);
  v25 = objc_msgSend_qid(v4, v21, v22, v23, v24);
  objc_msgSend_setQid_(self, v26, v25, v27, v28);
  v33 = objc_msgSend_idType(v4, v29, v30, v31, v32);
  objc_msgSend_setIdType_(self, v34, v33, v35, v36);
  objc_msgSend_confidenceValue(v4, v37, v38, v39, v40);
  objc_msgSend_setConfidenceValue_(self, v41, v42, v43, v44);
  v49 = objc_msgSend_sensitiveLocation(v4, v45, v46, v47, v48);
  objc_msgSend_setSensitiveLocation_(self, v50, v49, v51, v52);
  objc_msgSend_category(v4, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCategory_(self, v58, (uint64_t)v57, v59, v60);

  objc_msgSend_vertical(v4, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVertical_(self, v66, (uint64_t)v65, v67, v68);

  objc_msgSend_longitude(v4, v69, v70, v71, v72);
  objc_msgSend_setLongitude_(self, v73, v74, v75, v76);
  objc_msgSend_latitude(v4, v77, v78, v79, v80);
  objc_msgSend_setLatitude_(self, v81, v82, v83, v84);
  v89 = objc_msgSend_version(v4, v85, v86, v87, v88);
  objc_msgSend_setVersion_(self, v90, v89, v91, v92);
  objc_msgSend_localizedLabelDictionary(v4, v93, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromLabelDictionary_(CSUSearchableKnowledgeObject, v98, (uint64_t)v97, v99, v100);
  v116 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLocalizedLabelDictionary_(self, v101, (uint64_t)v116, v102, v103);
  objc_msgSend_localizedSynonymsDictionary(v4, v104, v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringFromSynonymsDictionary_(CSUSearchableKnowledgeObject, v109, (uint64_t)v108, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLocalizedSynonymsDictionary_(self, v113, (uint64_t)v112, v114, v115);
}

+ (unint64_t)getUniqueDbId:(unint64_t)a3 idType:(signed __int16)a4
{
  return 4 * a3 + a4;
}

@end
