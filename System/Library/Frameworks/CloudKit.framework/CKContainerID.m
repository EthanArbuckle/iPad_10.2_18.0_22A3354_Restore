@implementation CKContainerID

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKContainerID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  objc_msgSend_containerIdentifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = v9 ^ (2 * objc_msgSend_environment(self, v10, v11, v12));

  return v13;
}

- (int64_t)specialContainerType
{
  return self->_specialContainerType;
}

- (id)ckShortDescription
{
  uint64_t v2;

  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerIdentifier(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_environment(self, v7, v8, v9);
  v13 = CFSTR("UNKNOWN ENVIRONMENT");
  if (v10 == 2)
    v13 = CFSTR("Sandbox");
  if (v10 == 1)
    v13 = CFSTR("Production");
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("%@:%@"), v12, v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_containerIdentifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, (uint64_t)CFSTR("ContainerIdentifier"));

  v13 = objc_msgSend_environment(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v15, v14, v13, (uint64_t)CFSTR("Environment"));
  objc_autoreleasePoolPop(v4);

}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);

}

- (id)sqliteRepresentation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerIdentifier(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_environment(self, v7, v8, v9);
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("%@~%ld"), v12, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKContainerID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const __CFString *v14;
  id v15;

  v15 = a3;
  objc_msgSend_containerIdentifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v15, v8, (uint64_t)CFSTR("containerIdentifier"), (uint64_t)v7, 0);

  v12 = objc_msgSend_environment(self, v9, v10, v11);
  v14 = CFSTR("UNKNOWN ENVIRONMENT");
  if (v12 == 2)
    v14 = CFSTR("Sandbox");
  if (v12 == 1)
    objc_msgSend_addProperty_value_shouldRedact_(v15, v13, (uint64_t)CFSTR("environment"), (uint64_t)CFSTR("Production"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v15, v13, (uint64_t)CFSTR("environment"), (uint64_t)v14, 0);

}

- (BOOL)isEqual:(id)a3
{
  CKContainerID *v4;
  CKContainerID *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int isEqualToString;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = (CKContainerID *)a3;
  if (self == v4)
  {
    v29 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_containerIdentifier(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v5, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v13)
      {

      }
      else
      {
        v17 = (void *)v13;
        objc_msgSend_containerIdentifier(self, v14, v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerIdentifier(v5, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v18, v23, (uint64_t)v22, v24);

        if (!isEqualToString)
        {
          v29 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v30 = objc_msgSend_environment(self, v26, v27, v28);
      v29 = v30 == objc_msgSend_environment(v5, v31, v32, v33);
      goto LABEL_10;
    }
    v29 = 0;
  }
LABEL_11:

  return v29;
}

- (int64_t)environment
{
  return self->_environment;
}

- (CKContainerID)initWithContainerIdentifier:(id)a3 environment:(int64_t)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKContainerID *v13;
  uint64_t v14;
  NSString *containerIdentifier;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  id v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  char hasPrefix;
  id v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  char hasSuffix;
  CKException *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  id v108;
  CKException *v109;
  const char *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  objc_super v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v124 = 0;
  v7 = _CKCheckArgument((uint64_t)"containerIdentifier", v6, 0, 0, 0, &v124);
  v8 = v124;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    v98 = [CKException alloc];
    v102 = objc_msgSend_code(v9, v99, v100, v101);
    objc_msgSend_localizedDescription(v9, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (id)objc_msgSend_initWithCode_format_(v98, v107, v102, (uint64_t)CFSTR("%@"), v106);

    goto LABEL_63;
  }

  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v109 = [CKException alloc];
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v110, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("environment can not be 0"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_code(v111, v112, v113, v114);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v116, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("environment can not be 0"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v117, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (id)objc_msgSend_initWithCode_format_(v109, v122, v115, (uint64_t)CFSTR("%@"), v121);

LABEL_63:
    objc_exception_throw(v108);
  }
  v123.receiver = self;
  v123.super_class = (Class)CKContainerID;
  v13 = -[CKContainerID init](&v123, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v6, v10, v11, v12);
    containerIdentifier = v13->_containerIdentifier;
    v13->_containerIdentifier = (NSString *)v14;

    v13->_environment = a4;
    if (qword_1ECD96BC8 != -1)
      dispatch_once(&qword_1ECD96BC8, &unk_1E1F584D8);
    v19 = (void *)qword_1ECD96B98;
    objc_msgSend_containerIdentifier(v13, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v19, v21, (uint64_t)v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
LABEL_7:
      v27 = objc_msgSend_integerValue(v23, v24, v25, v26);
      objc_msgSend_setSpecialContainerType_(v13, v28, v27, v29);

    }
    else
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v70 = (id)qword_1ECD96BA0;
      v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v141, (uint64_t)v149, 16);
      if (v72)
      {
        v76 = v72;
        v77 = *(_QWORD *)v142;
LABEL_42:
        v78 = 0;
        while (1)
        {
          if (*(_QWORD *)v142 != v77)
            objc_enumerationMutation(v70);
          v79 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * v78);
          objc_msgSend_containerIdentifier(v13, v73, v74, v75);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          hasPrefix = objc_msgSend_hasPrefix_(v80, v81, v79, v82);

          if ((hasPrefix & 1) != 0)
            break;
          if (v76 == ++v78)
          {
            v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v141, (uint64_t)v149, 16);
            if (v76)
              goto LABEL_42;
            goto LABEL_48;
          }
        }
        objc_msgSend_objectForKeyedSubscript_((void *)qword_1ECD96BA0, v73, v79, v75);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          goto LABEL_7;
      }
      else
      {
LABEL_48:

      }
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v84 = (id)qword_1ECD96BA8;
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v137, (uint64_t)v148, 16);
      if (v86)
      {
        v90 = v86;
        v91 = *(_QWORD *)v138;
LABEL_52:
        v92 = 0;
        while (1)
        {
          if (*(_QWORD *)v138 != v91)
            objc_enumerationMutation(v84);
          v93 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * v92);
          objc_msgSend_containerIdentifier(v13, v87, v88, v89);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          hasSuffix = objc_msgSend_hasSuffix_(v94, v95, v93, v96);

          if ((hasSuffix & 1) != 0)
            break;
          if (v90 == ++v92)
          {
            v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v137, (uint64_t)v148, 16);
            if (v90)
              goto LABEL_52;
            goto LABEL_58;
          }
        }
        objc_msgSend_objectForKeyedSubscript_((void *)qword_1ECD96BA8, v87, v93, v89);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          goto LABEL_7;
      }
      else
      {
LABEL_58:

      }
      objc_msgSend_setSpecialContainerType_(v13, v24, 0, v26);
    }
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v30 = (id)qword_1ECD96BB0;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v133, (uint64_t)v147, 16);
    if (v32)
    {
      v36 = v32;
      v37 = *(_QWORD *)v134;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v134 != v37)
            objc_enumerationMutation(v30);
          v39 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
          objc_msgSend_containerIdentifier(v13, v33, v34, v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v39) = objc_msgSend_isEqualToString_(v40, v41, v39, v42);

          if ((_DWORD)v39)
          {
            objc_msgSend_setIsTestContainer_(v13, v33, 1, v35);
            goto LABEL_18;
          }
        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v133, (uint64_t)v147, 16);
        if (v36)
          continue;
        break;
      }
    }
LABEL_18:

    v132 = 0u;
    v130 = 0u;
    v131 = 0u;
    v129 = 0u;
    v43 = (id)qword_1ECD96BB8;
    v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v129, (uint64_t)v146, 16);
    if (v45)
    {
      v49 = v45;
      v50 = *(_QWORD *)v130;
      while (2)
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v130 != v50)
            objc_enumerationMutation(v43);
          v52 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
          objc_msgSend_containerIdentifier(v13, v46, v47, v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v52) = objc_msgSend_hasPrefix_(v53, v54, v52, v55);

          if ((_DWORD)v52)
          {
            objc_msgSend_setIsTestContainer_(v13, v46, 1, v48);
            goto LABEL_28;
          }
        }
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v129, (uint64_t)v146, 16);
        if (v49)
          continue;
        break;
      }
    }
LABEL_28:

    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v56 = (id)qword_1ECD96BC0;
    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v125, (uint64_t)v145, 16);
    if (v58)
    {
      v62 = v58;
      v63 = *(_QWORD *)v126;
      while (2)
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v126 != v63)
            objc_enumerationMutation(v56);
          v65 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * k);
          objc_msgSend_containerIdentifier(v13, v59, v60, v61);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v65) = objc_msgSend_hasPrefix_(v66, v67, v65, v68);

          if ((_DWORD)v65)
          {
            objc_msgSend_setIsAppleInternal_(v13, v59, 1, v61);
            goto LABEL_38;
          }
        }
        v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v125, (uint64_t)v145, 16);
        if (v62)
          continue;
        break;
      }
    }
LABEL_38:

  }
  return v13;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setSpecialContainerType:(int64_t)a3
{
  self->_specialContainerType = a3;
}

- (void)setIsAppleInternal:(BOOL)a3
{
  self->_isAppleInternal = a3;
}

- (id)representativeDataclass
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v4 = objc_msgSend_specialContainerType(self, a2, v2, v3) - 1;
  if (v4 <= 0x21 && ((0x25F7F20DBuLL >> v4) & 1) != 0)
    return **((id **)&unk_1E1F62730 + v4);
  else
    return 0;
}

- (BOOL)isTestContainer
{
  return self->_isTestContainer;
}

- (CKContainerID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  CKContainerID *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("ContainerIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_decodeInt64ForKey_(v4, v9, (uint64_t)CFSTR("Environment"), v10);
  objc_autoreleasePoolPop(v5);
  v13 = (CKContainerID *)objc_msgSend_initWithContainerIdentifier_environment_(self, v12, (uint64_t)v8, v11);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContainerID)initWithSqliteRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  CKContainerID *v25;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_componentsSeparatedByString_(v4, v8, (uint64_t)CFSTR("~"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v10, v11, v12, v13) == 2)
    {
      objc_msgSend_objectAtIndexedSubscript_(v10, v14, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v10, v17, 1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_integerValue(v19, v20, v21, v22);

      self = (CKContainerID *)(id)objc_msgSend_initWithContainerIdentifier_environment_(self, v24, (uint64_t)v16, v23);
      v25 = self;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_sqliteRepresentation(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("sqliteRepresentation"));

  objc_msgSend_properties(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)c2ContainerType
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v8 = objc_msgSend_specialContainerType(self, a2, v2, v3) - 2;
  if (v8 < 0x11 && ((0x1706Du >> v8) & 1) != 0)
    return qword_18A83D110[v8];
  if (objc_msgSend_isAppleInternal(self, v5, v6, v7))
    return 2;
  return 1;
}

- (void)setIsTestContainer:(BOOL)a3
{
  self->_isTestContainer = a3;
}

@end
