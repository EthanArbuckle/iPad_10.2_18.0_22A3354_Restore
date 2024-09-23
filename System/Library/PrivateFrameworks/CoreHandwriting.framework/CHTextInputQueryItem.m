@implementation CHTextInputQueryItem

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v99;
  __CFString *v100;
  objc_super v101;

  objc_msgSend_correctionResult(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v7, v8, v9, v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_correctionResult(self, v13, v14, v15, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v20, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v26, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v33, (uint64_t)CFSTR(", error: %@"), v34, v35, v36, v32);
    v100 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v100 = &stru_1E77F6F28;
  }

  v101.receiver = self;
  v101.super_class = (Class)CHTextInputQueryItem;
  -[CHTextInputQueryItem description](&v101, sel_description);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_correctionResult(self, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textResult(v42, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topTranscription(v48, v49, v50, v51, v52, v53);
  v54 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v54;
  if (v54)
    v61 = (const __CFString *)v54;
  else
    v61 = &stru_1E77F6F28;
  objc_msgSend_itemIdentifier(self, v55, v56, v57, v58, v59);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemStableIdentifier(self, v63, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_correctionResult(self, v69, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_resultType(v74, v75, v76, v77, v78, v79);
  objc_msgSend_strokeIdentifiers(self, v81, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend_count(v86, v87, v88, v89, v90, v91);
  objc_msgSend_stringByAppendingFormat_(v99, v93, (uint64_t)CFSTR(" text: '%@', itemID: %@, stableItemID: %@, type: %ld, strokes: %ld%@"), v94, v95, v96, v61, v62, v68, v80, v92, v100);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  return v97;
}

- (BOOL)isEqualToTextInputQueryItem:(id)a3
{
  CHTextInputQueryItem *v4;
  CHTextInputQueryItem *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isEqualToArray;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CHTextCorrectionResult *correctionResult;
  char isEqual;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v31;
  CHTextInputQueryItem *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (CHTextInputQueryItem *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      isEqual = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v11 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          v31 = 138412290;
          v32 = v5;
          _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_FAULT, "item should be of class CHTextInputQueryItem: %@", (uint8_t *)&v31, 0xCu);
        }

      }
      objc_msgSend_strokeIdentifiers(v5, v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToArray = objc_msgSend_isEqualToArray_(v12, v13, (uint64_t)self->_strokeIdentifiers, v14, v15, v16);

      correctionResult = self->_correctionResult;
      if (correctionResult)
        isEqual = 0;
      else
        isEqual = isEqualToArray;
      if (correctionResult && isEqualToArray)
      {
        objc_msgSend_correctionResult(v5, v18, v19, v20, v21, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v25, v26, (uint64_t)self->_correctionResult, v27, v28, v29);

      }
    }
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTextInputQueryItem;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTextInputQueryItem = objc_msgSend_isEqualToTextInputQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTextInputQueryItem;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5);
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSNumber)itemStableIdentifier
{
  return self->_itemStableIdentifier;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (CHTextCorrectionResult)correctionResult
{
  return self->_correctionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemStableIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
