@implementation PCNativeAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeAsset)init
{
  PCNativeAsset *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCNativeAsset;
  result = -[PCNativeAsset init](&v3, sel_init);
  if (result)
    result->_location = -1;
  return result;
}

- (PCNativeAsset)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  PCNativeAsset *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  NSString *name;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  NSArray *assetInformation;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  NSString *treatment;

  v4 = a3;
  v11 = (PCNativeAsset *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("name"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v17;

    v11->_location = (int)objc_msgSend_decodeInt32ForKey_(v4, v19, (uint64_t)CFSTR("location"), v20, v21, v22, v23);
    v24 = objc_alloc(MEMORY[0x24BDBCF20]);
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v32 = (void *)objc_msgSend_initWithObjects_(v24, v27, v25, v28, v29, v30, v31, v26, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, (uint64_t)CFSTR("assetInformation"), v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    assetInformation = v11->_assetInformation;
    v11->_assetInformation = (NSArray *)v37;

    v11->_adamID = objc_msgSend_decodeInt64ForKey_(v4, v39, (uint64_t)CFSTR("adamID"), v40, v41, v42, v43);
    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("treatment"), v46, v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    treatment = v11->_treatment;
    v11->_treatment = (NSString *)v49;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  double v58;
  id v59;

  v4 = a3;
  objc_msgSend_name(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("name"), v13, v14, v15);

  v22 = objc_msgSend_location(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt32_forKey_(v4, v23, v22, (uint64_t)CFSTR("location"), v24, v25, v26);
  objc_msgSend_assetInformation(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("assetInformation"), v35, v36, v37);

  v44 = objc_msgSend_adamID(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v4, v45, v44, (uint64_t)CFSTR("adamID"), v46, v47, v48);
  objc_msgSend_treatment(self, v49, v50, v51, v52, v53, v54);
  v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v59, (uint64_t)CFSTR("treatment"), v56, v57, v58);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (NSArray)assetInformation
{
  return self->_assetInformation;
}

- (void)setAssetInformation:(id)a3
{
  objc_storeStrong((id *)&self->_assetInformation, a3);
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(unint64_t)a3
{
  self->_adamID = a3;
}

- (NSString)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_treatment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_assetInformation, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
