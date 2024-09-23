@implementation APInstallAttribution

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  uint64_t v11;
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
  uint64_t v33;
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
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  double v90;
  double v91;
  id v92;

  v4 = a3;
  v11 = objc_msgSend_adamId(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeInt64_forKey_(v4, v12, v11, (uint64_t)CFSTR("adamId"), v13, v14, v15);
  v22 = objc_msgSend_campaignId(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt64_forKey_(v4, v23, v22, (uint64_t)CFSTR("campaignId"), v24, v25, v26);
  v33 = objc_msgSend_sourceAppAdamId(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeInt64_forKey_(v4, v34, v33, (uint64_t)CFSTR("sourceAppAdamId"), v35, v36, v37);
  v44 = objc_msgSend_timestamp(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v4, v45, v44, (uint64_t)CFSTR("timestamp"), v46, v47, v48);
  objc_msgSend_adNetworkId(self, v49, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("adNetworkId"), v57, v58, v59);

  objc_msgSend_attributionSignature(self, v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, (uint64_t)CFSTR("attributionSignature"), v68, v69, v70);

  objc_msgSend_contextIdentifier(self, v71, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, (uint64_t)CFSTR("contextIdentifier"), v79, v80, v81);

  objc_msgSend_version(self, v82, v83, v84, v85, v86, v87);
  v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v92, (uint64_t)CFSTR("version"), v89, v90, v91);

}

- (APInstallAttribution)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APInstallAttribution *v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  NSString *adNetworkId;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  NSString *attributionSignature;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  NSUUID *contextIdentifier;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  NSString *version;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)APInstallAttribution;
  v8 = -[APInstallAttribution init](&v55, sel_init);
  if (v8)
  {
    v8->_adamId = objc_msgSend_decodeInt64ForKey_(v4, v5, (uint64_t)CFSTR("adamId"), v6, v7, v9, v10);
    v8->_campaignId = objc_msgSend_decodeInt64ForKey_(v4, v11, (uint64_t)CFSTR("campaignId"), v12, v13, v14, v15);
    v8->_sourceAppAdamId = objc_msgSend_decodeInt64ForKey_(v4, v16, (uint64_t)CFSTR("sourceAppAdamId"), v17, v18, v19, v20);
    v8->_timestamp = objc_msgSend_decodeInt64ForKey_(v4, v21, (uint64_t)CFSTR("timestamp"), v22, v23, v24, v25);
    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("adNetworkId"), v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    adNetworkId = v8->_adNetworkId;
    v8->_adNetworkId = (NSString *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("attributionSignature"), v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    attributionSignature = v8->_attributionSignature;
    v8->_attributionSignature = (NSString *)v38;

    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, (uint64_t)CFSTR("contextIdentifier"), v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    contextIdentifier = v8->_contextIdentifier;
    v8->_contextIdentifier = (NSUUID *)v45;

    v47 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, (uint64_t)CFSTR("version"), v49, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    version = v8->_version;
    v8->_version = (NSString *)v52;

  }
  return v8;
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(unint64_t)a3
{
  self->_adamId = a3;
}

- (unint64_t)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(unint64_t)a3
{
  self->_campaignId = a3;
}

- (unint64_t)sourceAppAdamId
{
  return self->_sourceAppAdamId;
}

- (void)setSourceAppAdamId:(unint64_t)a3
{
  self->_sourceAppAdamId = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
  objc_storeStrong((id *)&self->_adNetworkId, a3);
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSignature, a3);
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
}

@end
