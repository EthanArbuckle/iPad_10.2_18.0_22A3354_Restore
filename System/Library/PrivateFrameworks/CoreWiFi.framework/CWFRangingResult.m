@implementation CWFRangingResult

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSData *identifier;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSData *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  CWFCorrectEthernetAddressString(self->_MACAddress);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = (void *)objc_msgSend_initWithData_encoding_(v10, v11, (uint64_t)self->_identifier, 4, v12);
    v14 = self->_identifier;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  CWFHexadecimalStringFromData(v14, v4, v5, v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("mac=%@, id='%@' (%@), dist=%f, stddev=%f, measurements=[%@]"), v17, v18, v8, v13, v15, *(_QWORD *)&self->_distance, *(_QWORD *)&self->_standardDeviation, self->_measurements);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (identifier)
  return v19;
}

- (BOOL)isEqualToRangingResult:(id)a3
{
  id v4;
  NSString *MACAddress;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  NSData *identifier;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSData *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSData *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int status;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t numberOfValidMeasurements;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSArray *measurements;
  NSArray *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSArray *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  void *v109;
  NSArray *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;

  v4 = a3;
  MACAddress = self->_MACAddress;
  objc_msgSend_MACAddress(v4, v6, v7, v8, v9);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (MACAddress != v14)
  {
    if (!self->_MACAddress
      || (objc_msgSend_MACAddress(v4, v10, v11, v12, v13), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
      goto LABEL_38;
    }
    v20 = (void *)v15;
    v21 = self->_MACAddress;
    objc_msgSend_MACAddress(v4, v16, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      isEqual = 0;
LABEL_37:

      goto LABEL_38;
    }
    v114 = v22;
    v115 = v20;
  }
  identifier = self->_identifier;
  objc_msgSend_identifier(v4, v10, v11, v12, v13);
  v32 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (identifier != v32)
  {
    if (!self->_identifier
      || (objc_msgSend_identifier(v4, v28, v29, v30, v31), (v33 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
      v22 = v114;
      v20 = v115;
      goto LABEL_36;
    }
    v38 = (void *)v33;
    v39 = self->_identifier;
    objc_msgSend_identifier(v4, v34, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43) & 1) == 0)
    {

      isEqual = 0;
      v22 = v114;
      v20 = v115;
      if (MACAddress == v14)
        goto LABEL_38;
      goto LABEL_37;
    }
    v112 = v40;
    v113 = v38;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v28, v29, v30, v31, self->_distance);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_distance(v4, v46, v47, v48, v49);
  objc_msgSend_numberWithDouble_(v45, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqualToNumber_(v44, v55, (uint64_t)v54, v56, v57))
  {

    isEqual = 0;
    goto LABEL_34;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v58, v59, v60, v61, self->_standardDeviation);
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)MEMORY[0x1E0CB37E8];
  v64 = (void *)v62;
  objc_msgSend_standardDeviation(v4, v65, v66, v67, v68);
  objc_msgSend_numberWithDouble_(v63, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToNumber_(v64, v74, (uint64_t)v73, v75, v76))
  {
    v111 = v64;
    status = self->_status;
    if (status == objc_msgSend_status(v4, v77, v78, v79, v80))
    {
      numberOfValidMeasurements = self->_numberOfValidMeasurements;
      if (numberOfValidMeasurements == objc_msgSend_numberOfValidMeasurements(v4, v82, v83, v84, v85))
      {
        measurements = self->_measurements;
        objc_msgSend_measurements(v4, v87, v88, v89, v90);
        v92 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (measurements == v92)
        {
          isEqual = 1;
        }
        else
        {
          if (self->_measurements)
          {
            v110 = v92;
            objc_msgSend_measurements(v4, v93, v94, v95, v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            if (v97)
            {
              v102 = self->_measurements;
              v109 = v97;
              objc_msgSend_measurements(v4, v98, v99, v100, v101);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v102, v104, (uint64_t)v103, v105, v106);

              v97 = v109;
            }
            else
            {
              isEqual = 0;
            }
            v64 = v111;

            v92 = v110;
            goto LABEL_32;
          }
          isEqual = 0;
        }
        v64 = v111;
LABEL_32:

        goto LABEL_33;
      }
    }
    isEqual = 0;
    v64 = v111;
  }
  else
  {
    isEqual = 0;
  }
LABEL_33:

LABEL_34:
  v107 = identifier == v32;
  v22 = v114;
  v20 = v115;
  if (!v107)
  {

  }
LABEL_36:

  if (MACAddress != v14)
    goto LABEL_37;
LABEL_38:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFRangingResult *v4;
  CWFRangingResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRangingResult;

  v4 = (CWFRangingResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToRangingResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToRangingResult = objc_msgSend_isEqualToRangingResult_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToRangingResult = 0;
  }

  return isEqualToRangingResult;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v6 = objc_msgSend_hash(self->_MACAddress, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_identifier, v7, v8, v9, v10) ^ v6;
  v16 = v11 ^ objc_msgSend_hash(self->_measurements, v12, v13, v14, v15) ^ self->_status;
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v17, v18, v19, v20, self->_distance);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v16 ^ objc_msgSend_hash(v21, v22, v23, v24, v25);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v27, v28, v29, v30, self->_standardDeviation);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v26 ^ objc_msgSend_hash(v31, v32, v33, v34, v35) ^ self->_numberOfValidMeasurements;

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFRangingResult, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMACAddress_(v11, v12, (uint64_t)self->_MACAddress, v13, v14);
  objc_msgSend_setIdentifier_(v11, v15, (uint64_t)self->_identifier, v16, v17);
  objc_msgSend_setDistance_(v11, v18, v19, v20, v21, self->_distance);
  objc_msgSend_setStandardDeviation_(v11, v22, v23, v24, v25, self->_standardDeviation);
  objc_msgSend_setStatus_(v11, v26, self->_status, v27, v28);
  objc_msgSend_setMeasurements_(v11, v29, (uint64_t)self->_measurements, v30, v31);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *MACAddress;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v19;

  MACAddress = self->_MACAddress;
  v19 = a3;
  objc_msgSend_encodeObject_forKey_(v19, v5, (uint64_t)MACAddress, (uint64_t)CFSTR("_MACAddress"), v6);
  objc_msgSend_encodeObject_forKey_(v19, v7, (uint64_t)self->_identifier, (uint64_t)CFSTR("_identifier"), v8);
  objc_msgSend_encodeDouble_forKey_(v19, v9, (uint64_t)CFSTR("_distance"), v10, v11, self->_distance);
  objc_msgSend_encodeDouble_forKey_(v19, v12, (uint64_t)CFSTR("_standardDeviation"), v13, v14, self->_standardDeviation);
  objc_msgSend_encodeInteger_forKey_(v19, v15, self->_status, (uint64_t)CFSTR("_status"), v16);
  objc_msgSend_encodeObject_forKey_(v19, v17, (uint64_t)self->_measurements, (uint64_t)CFSTR("_measurements"), v18);

}

- (CWFRangingResult)initWithCoder:(id)a3
{
  id v4;
  CWFRangingResult *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *MACAddress;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSData *identifier;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *measurements;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CWFRangingResult;
  v5 = -[CWFRangingResult init](&v39, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_MACAddress"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    MACAddress = v5->_MACAddress;
    v5->_MACAddress = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_identifier"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v14;

    objc_msgSend_decodeDoubleForKey_(v4, v16, (uint64_t)CFSTR("_distance"), v17, v18);
    v5->_distance = v19;
    objc_msgSend_decodeDoubleForKey_(v4, v20, (uint64_t)CFSTR("_standardDeviation"), v21, v22);
    v5->_standardDeviation = v23;
    v5->_status = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("_status"), v25, v26);
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend_setWithObjects_(v27, v30, v28, v31, v32, v29, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("_measurements"), v35);
    v36 = objc_claimAutoreleasedReturnValue();
    measurements = v5->_measurements;
    v5->_measurements = (NSArray *)v36;

  }
  return v5;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(double)a3
{
  self->_standardDeviation = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)numberOfValidMeasurements
{
  return self->_numberOfValidMeasurements;
}

- (void)setNumberOfValidMeasurements:(unint64_t)a3
{
  self->_numberOfValidMeasurements = a3;
}

- (NSArray)measurements
{
  return self->_measurements;
}

- (void)setMeasurements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end
