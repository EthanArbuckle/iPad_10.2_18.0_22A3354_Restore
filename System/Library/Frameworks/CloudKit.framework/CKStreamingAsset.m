@implementation CKStreamingAsset

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKStreamingAsset)initWithExpectedSizeBytes:(int64_t)a3
{
  CKStreamingAsset *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKStreamingAsset;
  result = -[CKStreamingAsset init](&v5, sel_init);
  if (result)
    result->_expectedSizeBytes = a3;
  return result;
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKStreamingAsset;
  return -[CKStreamingAsset init](&v3, sel_init);
}

- (CKStreamingAsset)init
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("You must call -[%@ initWithExpectedSizeBytes:]"), v5);

  objc_exception_throw(v7);
}

- (void)copyServerFieldsFromStreamingAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  id v55;

  v55 = a3;
  objc_msgSend_fileSignature(v55, v4, v5, v6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceSignature(v55, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadURL(v55, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uploadURL(v55, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uploadURLExpirationDate(v55, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadURLExpirationDate(v55, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_expectedSizeBytes(v55, v27, v28, v29);
  v34 = objc_msgSend_reservedSize(v55, v31, v32, v33);
  objc_msgSend_uploadReceipt(v55, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_immutableRequestOptions(v55, v39, v40, v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend_setUploadURL_(self, v42, (uint64_t)v18, v44);
  if (v22)
    objc_msgSend_setUploadURLExpirationDate_(self, v42, (uint64_t)v22, v44);
  if (v14)
    objc_msgSend_setDownloadURL_(self, v42, (uint64_t)v14, v44);
  if (v26)
    objc_msgSend_setDownloadURLExpirationDate_(self, v42, (uint64_t)v26, v44);
  if (objc_msgSend_hasSize(v55, v42, v43, v44))
  {
    objc_msgSend_setHasSize_(self, v46, 1, v47);
    v51 = objc_msgSend_size(v55, v48, v49, v50);
    objc_msgSend_setSize_(self, v52, v51, v53);
  }
  if (v30)
    objc_msgSend_setExpectedSizeBytes_(self, v46, v30, v47);
  if (v34)
    objc_msgSend_setReservedSize_(self, v46, v34, v47);
  if (v54)
    objc_msgSend_setFileSignature_(self, v46, (uint64_t)v54, v47);
  if (v10)
    objc_msgSend_setReferenceSignature_(self, v46, (uint64_t)v10, v47);
  if (v38)
    objc_msgSend_setUploadReceipt_(self, v46, (uint64_t)v38, v47);
  if (v45)
    objc_msgSend_setRequestOptions_(self, v46, (uint64_t)v45, v47);

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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  id v103;

  v103 = a3;
  objc_msgSend_owner(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v8, (uint64_t)CFSTR("owner"), (uint64_t)v7, 0);

  objc_msgSend_fileSignature(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKHexString(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v17, (uint64_t)CFSTR("fileSignature"), (uint64_t)v16, 0);

  objc_msgSend_referenceSignature(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKHexString(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v26, (uint64_t)CFSTR("referenceSignature"), (uint64_t)v25, 0);

  objc_msgSend_downloadURL(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v35, (uint64_t)CFSTR("downloadURL"), (uint64_t)v34, 0);

  objc_msgSend_uploadURL(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v44, (uint64_t)CFSTR("uploadURL"), (uint64_t)v43, 0);

  objc_msgSend_uploadURLExpirationDate(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v53, (uint64_t)CFSTR("uploadURLExpirationDate"), (uint64_t)v52, 0);

  objc_msgSend_downloadURLExpirationDate(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v62, (uint64_t)CFSTR("downloadURLExpirationDate"), (uint64_t)v61, 0);

  if (objc_msgSend_hasSize(self, v63, v64, v65))
  {
    v69 = (void *)MEMORY[0x1E0CB37E8];
    v70 = objc_msgSend_size(self, v66, v67, v68);
    objc_msgSend_numberWithInteger_(v69, v71, v70, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v103, v74, (uint64_t)CFSTR("size"), (uint64_t)v73, 0);

  }
  objc_msgSend_uploadReceipt(self, v66, v67, v68);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v76, (uint64_t)CFSTR("uploadReceipt"), (uint64_t)v75, 0);

  objc_msgSend_immutableRequestOptions(self, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v81, (uint64_t)CFSTR("requestOptions"), (uint64_t)v80, 0);

  if (objc_msgSend_expectedSizeBytes(self, v82, v83, v84))
  {
    v88 = (void *)MEMORY[0x1E0CB37E8];
    v89 = objc_msgSend_expectedSizeBytes(self, v85, v86, v87);
    objc_msgSend_numberWithInteger_(v88, v90, v89, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v103, v93, (uint64_t)CFSTR("expectedSizeBytes"), (uint64_t)v92, 0);

  }
  if (objc_msgSend_reservedSize(self, v85, v86, v87))
  {
    v97 = (void *)MEMORY[0x1E0CB37E8];
    v98 = objc_msgSend_reservedSize(self, v94, v95, v96);
    objc_msgSend_numberWithInteger_(v97, v99, v98, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v103, v102, (uint64_t)CFSTR("reservedSize"), (uint64_t)v101, 0);

  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKStreamingAsset *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKStreamingAsset *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  id v64;

  v64 = a3;
  v7 = objc_msgSend_expectedSizeBytes(self, v4, v5, v6);
  objc_msgSend_encodeInt64_forKey_(v64, v8, v7, (uint64_t)CFSTR("ExpectedSizeBytes"));
  if (objc_msgSend_hasSize(self, v9, v10, v11))
  {
    v15 = objc_msgSend_size(self, v12, v13, v14);
    objc_msgSend_encodeInt64_forKey_(v64, v16, v15, (uint64_t)CFSTR("Size"));
  }
  objc_msgSend_downloadURL(self, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v18, (uint64_t)v17, (uint64_t)CFSTR("DownloadURL"));

  objc_msgSend_downloadURLExpirationDate(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v23, (uint64_t)v22, (uint64_t)CFSTR("DownloadURLExpirationDate"));

  objc_msgSend_fileSignature(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v28, (uint64_t)v27, (uint64_t)CFSTR("FileSignature"));

  objc_msgSend_referenceSignature(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v33, (uint64_t)v32, (uint64_t)CFSTR("ReferenceSignature"));

  objc_msgSend_owner(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v38, (uint64_t)v37, (uint64_t)CFSTR("Owner"));

  objc_msgSend_uploadURL(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v43, (uint64_t)v42, (uint64_t)CFSTR("UploadURL"));

  objc_msgSend_uploadURLExpirationDate(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v48, (uint64_t)v47, (uint64_t)CFSTR("UploadURLExpirationDate"));

  v52 = objc_msgSend_reservedSize(self, v49, v50, v51);
  objc_msgSend_encodeInt64_forKey_(v64, v53, v52, (uint64_t)CFSTR("ReservedSize"));
  objc_msgSend_uploadReceipt(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v58, (uint64_t)v57, (uint64_t)CFSTR("UploadReceipt"));

  objc_msgSend_immutableRequestOptions(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v63, (uint64_t)v62, (uint64_t)CFSTR("RequestOptions"));

}

- (CKStreamingAsset)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKStreamingAsset *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSURL *downloadURL;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSDate *downloadURLExpirationDate;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSData *fileSignature;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSData *referenceSignature;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSString *owner;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSURL *uploadURL;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  NSDate *uploadURLExpirationDate;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *uploadReceipt;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  C2RequestOptions *immutableRequestOptions;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CKStreamingAsset;
  v7 = -[CKStreamingAsset init](&v51, sel_init);
  if (v7)
  {
    v7->_expectedSizeBytes = objc_msgSend_decodeInt64ForKey_(v4, v5, (uint64_t)CFSTR("ExpectedSizeBytes"), v6);
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, (uint64_t)CFSTR("DownloadURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    downloadURL = v7->_downloadURL;
    v7->_downloadURL = (NSURL *)v10;

    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("DownloadURLExpirationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadURLExpirationDate = v7->_downloadURLExpirationDate;
    v7->_downloadURLExpirationDate = (NSDate *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("FileSignature"));
    v18 = objc_claimAutoreleasedReturnValue();
    fileSignature = v7->_fileSignature;
    v7->_fileSignature = (NSData *)v18;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("ReferenceSignature"));
    v22 = objc_claimAutoreleasedReturnValue();
    referenceSignature = v7->_referenceSignature;
    v7->_referenceSignature = (NSData *)v22;

    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, (uint64_t)CFSTR("Owner"));
    v26 = objc_claimAutoreleasedReturnValue();
    owner = v7->_owner;
    v7->_owner = (NSString *)v26;

    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, (uint64_t)CFSTR("UploadURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    uploadURL = v7->_uploadURL;
    v7->_uploadURL = (NSURL *)v30;

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, (uint64_t)CFSTR("UploadURLExpirationDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    uploadURLExpirationDate = v7->_uploadURLExpirationDate;
    v7->_uploadURLExpirationDate = (NSDate *)v34;

    v7->_reservedSize = objc_msgSend_decodeInt64ForKey_(v4, v36, (uint64_t)CFSTR("ReservedSize"), v37);
    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("UploadReceipt"));
    v40 = objc_claimAutoreleasedReturnValue();
    uploadReceipt = v7->_uploadReceipt;
    v7->_uploadReceipt = (NSString *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("RequestOptions"));
    v44 = objc_claimAutoreleasedReturnValue();
    immutableRequestOptions = v7->_immutableRequestOptions;
    v7->_immutableRequestOptions = (C2RequestOptions *)v44;

    if (objc_msgSend_containsValueForKey_(v4, v46, (uint64_t)CFSTR("Size"), v47))
    {
      v7->_hasSize = 1;
      v7->_size = objc_msgSend_decodeInt64ForKey_(v4, v48, (uint64_t)CFSTR("Size"), v49);
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKStreamingAsset *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t inited;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;

  v4 = [CKStreamingAsset alloc];
  inited = objc_msgSend_initInternal(v4, v5, v6, v7);
  *(_QWORD *)(inited + 56) = objc_msgSend_expectedSizeBytes(self, v9, v10, v11);
  objc_msgSend_downloadURL(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_copy(v15, v16, v17, v18);
  v20 = *(void **)(inited + 88);
  *(_QWORD *)(inited + 88) = v19;

  objc_msgSend_downloadURLExpirationDate(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_copy(v24, v25, v26, v27);
  v29 = *(void **)(inited + 96);
  *(_QWORD *)(inited + 96) = v28;

  objc_msgSend_fileSignature(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_copy(v33, v34, v35, v36);
  v38 = *(void **)(inited + 32);
  *(_QWORD *)(inited + 32) = v37;

  objc_msgSend_referenceSignature(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_copy(v42, v43, v44, v45);
  v47 = *(void **)(inited + 40);
  *(_QWORD *)(inited + 40) = v46;

  objc_msgSend_owner(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_copy(v51, v52, v53, v54);
  v56 = *(void **)(inited + 48);
  *(_QWORD *)(inited + 48) = v55;

  objc_msgSend_uploadURL(self, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_copy(v60, v61, v62, v63);
  v65 = *(void **)(inited + 64);
  *(_QWORD *)(inited + 64) = v64;

  objc_msgSend_uploadURLExpirationDate(self, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_copy(v69, v70, v71, v72);
  v74 = *(void **)(inited + 72);
  *(_QWORD *)(inited + 72) = v73;

  *(_QWORD *)(inited + 80) = objc_msgSend_reservedSize(self, v75, v76, v77);
  objc_msgSend_uploadReceipt(self, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend_copy(v81, v82, v83, v84);
  v86 = *(void **)(inited + 104);
  *(_QWORD *)(inited + 104) = v85;

  objc_msgSend_immutableRequestOptions(self, v87, v88, v89);
  v90 = objc_claimAutoreleasedReturnValue();
  v91 = *(void **)(inited + 24);
  *(_QWORD *)(inited + 24) = v90;

  *(_BYTE *)(inited + 8) = objc_msgSend_hasSize(self, v92, v93, v94);
  *(_QWORD *)(inited + 16) = objc_msgSend_size(self, v95, v96, v97);
  return (id)inited;
}

- (int64_t)size
{
  CKStreamingAsset *v2;
  int64_t size;

  v2 = self;
  objc_sync_enter(v2);
  size = v2->_size;
  objc_sync_exit(v2);

  return size;
}

- (void)setSize:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  CKStreamingAsset *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setHasSize_(obj, v4, 1, v5);
  obj->_size = a3;
  objc_sync_exit(obj);

}

- (C2RequestOptions)requestOptions
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_immutableRequestOptions(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return (C2RequestOptions *)v8;
}

- (void)setRequestOptions:(id)a3
{
  ((void (*)(CKStreamingAsset *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setImmutableRequestOptions_, a3);
}

- (C2RequestOptions)immutableRequestOptions
{
  return (C2RequestOptions *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImmutableRequestOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSData)fileSignature
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)referenceSignature
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReferenceSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOwner:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (int64_t)expectedSizeBytes
{
  return self->_expectedSizeBytes;
}

- (void)setExpectedSizeBytes:(int64_t)a3
{
  self->_expectedSizeBytes = a3;
}

- (NSURL)uploadURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUploadURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSDate)uploadURLExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUploadURLExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (int64_t)reservedSize
{
  return self->_reservedSize;
}

- (void)setReservedSize:(int64_t)a3
{
  self->_reservedSize = a3;
}

- (NSURL)downloadURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownloadURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSDate)downloadURLExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDownloadURLExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_hasSize = a3;
}

- (NSString)uploadReceipt
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUploadReceipt:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_downloadURLExpirationDate, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_uploadURLExpirationDate, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_immutableRequestOptions, 0);
}

@end
