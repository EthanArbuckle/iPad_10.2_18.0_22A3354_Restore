@implementation CWFRangingPeer

+ (id)rangingPeerWithMACAddress:(id)a3 PMK:(id)a4
{
  id v5;
  id v6;
  CWFRangingPeer *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CWFRangingPeer);
  objc_msgSend_setIdentifier_(v7, v8, 0, v9, v10);
  objc_msgSend_setMACAddress_(v7, v11, (uint64_t)v6, v12, v13);

  objc_msgSend_setPMK_(v7, v14, (uint64_t)v5, v15, v16);
  return v7;
}

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
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("mac=%@, id='%@' (%@)"), v17, v18, v8, v13, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (identifier)
  return v19;
}

- (BOOL)isEqualToRangingPeer:(id)a3
{
  void *v3;
  id v5;
  unint64_t numberOfMeasurements;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int useCoreRotation;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *MACAddress;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSString *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char isEqual;
  NSData *PMK;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSData *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSData *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSData *identifier;
  NSData *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSData *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSData *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  void *v74;
  void *v75;
  void *v76;

  v5 = a3;
  numberOfMeasurements = self->_numberOfMeasurements;
  if (numberOfMeasurements == objc_msgSend_numberOfMeasurements(v5, v7, v8, v9, v10))
  {
    useCoreRotation = self->_useCoreRotation;
    if (useCoreRotation == objc_msgSend_useCoreRotation(v5, v11, v12, v13, v14))
    {
      MACAddress = self->_MACAddress;
      objc_msgSend_MACAddress(v5, v16, v17, v18, v19);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (MACAddress != v25)
      {
        if (!self->_MACAddress
          || (objc_msgSend_MACAddress(v5, v21, v22, v23, v24), (v26 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          isEqual = 0;
          goto LABEL_31;
        }
        v31 = (void *)v26;
        v32 = self->_MACAddress;
        objc_msgSend_MACAddress(v5, v27, v28, v29, v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v32, v34, (uint64_t)v33, v35, v36))
        {
          isEqual = 0;
LABEL_30:

          goto LABEL_31;
        }
        v75 = v31;
        v76 = v33;
      }
      PMK = self->_PMK;
      objc_msgSend_PMK(v5, v21, v22, v23, v24);
      v43 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (PMK != v43)
      {
        if (!self->_PMK || (objc_msgSend_PMK(v5, v39, v40, v41, v42), (v44 = objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_25:
          isEqual = 0;
          goto LABEL_26;
        }
        v3 = (void *)v44;
        v49 = self->_PMK;
        objc_msgSend_PMK(v5, v45, v46, v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v49, v51, (uint64_t)v50, v52, v53) & 1) == 0)
        {

          isEqual = 0;
LABEL_28:
          v72 = MACAddress == v25;
          v31 = v75;
LABEL_29:
          v33 = v76;
          if (!v72)
            goto LABEL_30;
LABEL_31:

          goto LABEL_32;
        }
        v74 = v50;
      }
      identifier = self->_identifier;
      objc_msgSend_identifier(v5, v39, v40, v41, v42);
      v55 = (NSData *)objc_claimAutoreleasedReturnValue();
      v60 = v55;
      isEqual = identifier == v55;
      if (identifier == v55 || !self->_identifier)
      {

        if (PMK == v43)
        {
LABEL_26:
          v31 = v75;

          v72 = MACAddress == v25;
          goto LABEL_29;
        }
      }
      else
      {
        objc_msgSend_identifier(v5, v56, v57, v58, v59);
        v61 = objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v66 = (void *)v61;
          v67 = self->_identifier;
          objc_msgSend_identifier(v5, v62, v63, v64, v65);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v67, v69, (uint64_t)v68, v70, v71);

          if (PMK == v43)
          {

          }
          else
          {

          }
          goto LABEL_28;
        }

        if (PMK == v43)
          goto LABEL_25;
      }

      goto LABEL_26;
    }
  }
  isEqual = 0;
LABEL_32:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFRangingPeer *v4;
  CWFRangingPeer *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRangingPeer;

  v4 = (CWFRangingPeer *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToRangingPeer = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToRangingPeer = objc_msgSend_isEqualToRangingPeer_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToRangingPeer = 0;
  }

  return isEqualToRangingPeer;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t numberOfMeasurements;
  uint64_t v7;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  numberOfMeasurements = self->_numberOfMeasurements;
  v7 = objc_msgSend_hash(self->_MACAddress, a2, v2, v3, v4) ^ numberOfMeasurements;
  v12 = objc_msgSend_hash(self->_PMK, v8, v9, v10, v11);
  v17 = v7 ^ v12 ^ objc_msgSend_hash(self->_identifier, v13, v14, v15, v16);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v18, self->_useCoreRotation, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24, v25);

  return v26;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFRangingPeer, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMACAddress_(v11, v12, (uint64_t)self->_MACAddress, v13, v14);
  objc_msgSend_setPMK_(v11, v15, (uint64_t)self->_PMK, v16, v17);
  objc_msgSend_setNumberOfMeasurements_(v11, v18, self->_numberOfMeasurements, v19, v20);
  objc_msgSend_setIdentifier_(v11, v21, (uint64_t)self->_identifier, v22, v23);
  objc_msgSend_setUseCoreRotation_(v11, v24, self->_useCoreRotation, v25, v26);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *MACAddress;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;

  MACAddress = self->_MACAddress;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)MACAddress, (uint64_t)CFSTR("_MACAddress"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_PMK, (uint64_t)CFSTR("_PMK"), v9);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v10, self->_numberOfMeasurements, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v13, (uint64_t)CFSTR("_numberOfMeasurements"), v15);

  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)self->_identifier, (uint64_t)CFSTR("_identifier"), v17);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v18, self->_useCoreRotation, v19, v20);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)v23, (uint64_t)CFSTR("_useCoreRotation"), v22);

}

- (CWFRangingPeer)initWithCoder:(id)a3
{
  id v4;
  CWFRangingPeer *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *MACAddress;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSData *PMK;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSData *identifier;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CWFRangingPeer;
  v5 = -[CWFRangingPeer init](&v38, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_MACAddress"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    MACAddress = v5->_MACAddress;
    v5->_MACAddress = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_PMK"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    PMK = v5->_PMK;
    v5->_PMK = (NSData *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_numberOfMeasurements"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfMeasurements = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22, v23);

    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, (uint64_t)CFSTR("_identifier"), v26);
    v27 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v27;

    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, (uint64_t)CFSTR("_useCoreRotation"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useCoreRotation = objc_msgSend_BOOLValue(v32, v33, v34, v35, v36);

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

- (NSData)PMK
{
  return self->_PMK;
}

- (void)setPMK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)numberOfMeasurements
{
  return self->_numberOfMeasurements;
}

- (void)setNumberOfMeasurements:(unint64_t)a3
{
  self->_numberOfMeasurements = a3;
}

- (BOOL)useCoreRotation
{
  return self->_useCoreRotation;
}

- (void)setUseCoreRotation:(BOOL)a3
{
  self->_useCoreRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PMK, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end
