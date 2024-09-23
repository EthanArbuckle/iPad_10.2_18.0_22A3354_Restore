@implementation CHDataDetectorQueryItem

- (void)dealloc
{
  CGPath *estimatedBaseline;
  objc_super v4;

  estimatedBaseline = self->_estimatedBaseline;
  if (estimatedBaseline)
    CGPathRelease(estimatedBaseline);
  v4.receiver = self;
  v4.super_class = (Class)CHDataDetectorQueryItem;
  -[CHDataDetectorQueryItem dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
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
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CHDataDetectorQueryItem;
  -[CHDataDetectorQueryItem description](&v28, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataDetectorResult(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_type(v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v22, (uint64_t)CFSTR(" strokeIdentifiers: %@, result type: %@"), v23, v24, v25, v9, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)isEqualToDataDetectorQueryItem:(id)a3
{
  CHDataDetectorQueryItem *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int isEqual;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int isEqualToString;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const CGPath *v81;
  BOOL v82;
  int v84;
  CHDataDetectorQueryItem *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = (CHDataDetectorQueryItem *)a3;
  if (!v4)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v84 = 138412290;
      v85 = v4;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHDataDetectorQueryItem: %@", (uint8_t *)&v84, 0xCu);
    }

  }
  if (v4 == self)
  {
    v82 = 1;
    goto LABEL_15;
  }
  objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (!isEqual)
    goto LABEL_13;
  objc_msgSend_dataDetectorResult(v4, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_category(v28, v29, v30, v31, v32, v33);
  objc_msgSend_dataDetectorResult(self, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v34 == objc_msgSend_category(v40, v41, v42, v43, v44, v45);

  if (!v46)
    goto LABEL_13;
  objc_msgSend_dataDetectorResult(v4, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_type(v52, v53, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataDetectorResult(self, v59, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_type(v64, v65, v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v58, v71, (uint64_t)v70, v72, v73, v74);

  if (isEqualToString)
  {
    v81 = (const CGPath *)objc_msgSend_estimatedBaseline(v4, v76, v77, v78, v79, v80);
    v82 = CGPathEqualToPath(v81, self->_estimatedBaseline);
  }
  else
  {
LABEL_13:
    v82 = 0;
  }
LABEL_15:

  return v82;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToDataDetectorQueryItem;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToDataDetectorQueryItem = objc_msgSend_isEqualToDataDetectorQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToDataDetectorQueryItem;
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

- (CGPath)estimatedBaseline
{
  return self->_estimatedBaseline;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (DDScannerResult)dataDetectorResult
{
  return self->_dataDetectorResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
