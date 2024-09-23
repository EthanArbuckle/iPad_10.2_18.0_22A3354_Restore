@implementation XRConstantEngineeringValue

- (XRConstantEngineeringValue)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  XRConstantEngineeringValue *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *mnemonic;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id value;

  v4 = a3;
  v12 = (XRConstantEngineeringValue *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
  {
    v12->_implClass = objc_msgSend_decodeIntForKey_(v4, v9, (uint64_t)CFSTR("_implClass"), v10, v11);
    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("_mnemonic"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    mnemonic = v12->_mnemonic;
    v12->_mnemonic = (NSString *)v16;

    v12->_resolvedEtypeID = XREngineeringTypeIDForMnemonic(v12->_mnemonic);
    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend_setWithObjects_(v18, v23, v19, v24, v25, v20, v21, v22, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, (uint64_t)CFSTR("_value"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    value = v12->_value;
    v12->_value = (id)v29;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t implClass;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  implClass = self->_implClass;
  v11 = a3;
  objc_msgSend_encodeInt_forKey_(v11, v5, implClass, (uint64_t)CFSTR("_implClass"), v6);
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_mnemonic, (uint64_t)CFSTR("_mnemonic"), v8);
  objc_msgSend_encodeObject_forKey_(v11, v9, (uint64_t)self->_value, (uint64_t)CFSTR("_value"), v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t resolvedEtypeID;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  resolvedEtypeID = self->_resolvedEtypeID;
  v6 = (void *)objc_msgSend_copy(self->_value, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_engineeringValueWithTypeID_value_(XRConstantEngineeringValue, v7, resolvedEtypeID, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)engineeringValueOfType:(id)a3 value:(id)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = XREngineeringTypeIDForMnemonic(a3);
  objc_msgSend_engineeringValueWithTypeID_value_(a1, v8, v7, (uint64_t)v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)engineeringValueWithTypeID:(unsigned __int16)a3 value:(id)a4
{
  int v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = a4;
  v6 = objc_opt_new();
  objc_storeStrong((id *)(v6 + 8), XR_ENGINEERING_MNEMONIC_BY_ETYPE[v4]);
  *(_WORD *)(v6 + 16) = v4;
  *(_BYTE *)(v6 + 18) = XR_IMPLEMENTATION_CLASS_ID_BY_ETYPE[v4];
  v11 = objc_msgSend_copy(v5, v7, v8, v9, v10);

  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  return (id)v6;
}

- (BOOL)isValid
{
  return self->_value != 0;
}

- (unsigned)implClass
{
  return self->_implClass;
}

- (NSString)engineeringTypeMnemonic
{
  return self->_mnemonic;
}

- (unsigned)engineeringType
{
  return self->_resolvedEtypeID;
}

- (unint64_t)uint64
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_unsignedLongLongValue(self->_value, a2, v2, v3, v4);
}

- (unsigned)uint32
{
  return ((uint64_t (*)(id, char *))MEMORY[0x24BEDD108])(self->_value, sel_unsignedIntValue);
}

- (NSString)string
{
  return (NSString *)self->_value;
}

- (double)fixedDecimal
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  objc_msgSend_doubleValue(self->_value, a2, v2, v3, v4);
  return result;
}

- (BOOL)getValue:(id *)a3 fieldIndex:(unsigned __int16)a4
{
  unsigned int v4;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v7 = self->_value;
  if (objc_msgSend_count(v7, v8, v9, v10, v11) <= (unint64_t)v4)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v12, v4, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || objc_msgSend_conformsToProtocol_(v15, v16, (uint64_t)&unk_25583FE50, v17, v18))
    {
      objc_storeStrong(a3, v15);
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (BOOL)getLengthOfUint64Representation:(unint64_t *)a3
{
  char isKindOfClass;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = isKindOfClass;
  if (a3 && (isKindOfClass & 1) != 0)
    *a3 = objc_msgSend_count(self->_value, v6, v7, v8, v9);
  return v10 & 1;
}

- (void)enumerateUint64Values:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  id v5;
  const char *v6;
  uint64_t v7;
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self->_value;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v17 = objc_msgSend_unsignedLongLongValue(v12, v13, v14, v15, v16);
            v4[2](v4, v9 + v11, v17);
          }
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v13, (uint64_t)&v18, (uint64_t)v22, 16);
        v9 += v11;
      }
      while (v8);
    }

  }
}

- (id)objectValue
{
  return self->_value;
}

- (BOOL)isEqualToConstantEngineeringValue:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  unsigned int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  char isEqualToNumber;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = (unsigned __int16 *)a3;
  if (self->_resolvedEtypeID == v8[8])
  {
    v9 = objc_msgSend_implClass(self, v4, v5, v6, v7);
    v14 = 0;
    if (v9 <= 6)
    {
      if (((1 << v9) & 0x46) != 0)
      {
        objc_msgSend_objectValue(self, v10, v11, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectValue(v8, v25, v26, v27, v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToNumber_(v15, v29, (uint64_t)v20, v30, v31);
        goto LABEL_10;
      }
      if (((1 << v9) & 0x30) != 0)
      {
        objc_msgSend_objectValue(self, v10, v11, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectValue(v8, v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToArray_(v15, v21, (uint64_t)v20, v22, v23);
LABEL_10:
        v14 = isEqualToNumber;

        goto LABEL_11;
      }
      if (v9 == 3)
      {
        objc_msgSend_objectValue(self, v10, v11, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectValue(v8, v32, v33, v34, v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToString_(v15, v36, (uint64_t)v20, v37, v38);
        goto LABEL_10;
      }
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (int64_t)compare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;

  v4 = a3;
  v9 = objc_msgSend_implClass(self, v5, v6, v7, v8);
  v14 = objc_msgSend_implClass(v4, v10, v11, v12, v13);
  v19 = objc_msgSend_implClass(self, v15, v16, v17, v18);
  if (v9 == v14)
  {
    v24 = 0;
    if (v19 <= 6)
    {
      if (((1 << v19) & 0x46) != 0)
        goto LABEL_17;
      if (((1 << v19) & 0x30) != 0)
      {
        objc_msgSend_objectValue(self, v20, v21, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectValue(v4, v26, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_count(v25, v31, v32, v33, v34);
        v40 = objc_msgSend_count(v30, v36, v37, v38, v39);
        v45 = objc_msgSend_count(v25, v41, v42, v43, v44);
        v24 = v45;
        if (v35 == v40)
        {
          if (v45)
          {
            v50 = 0;
            while (1)
            {
              objc_msgSend_objectAtIndexedSubscript_(v25, v46, v50, v48, v49);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v30, v52, v50, v53, v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend_compare_(v51, v56, (uint64_t)v55, v57, v58);

              if (v24)
                break;
              if (objc_msgSend_count(v25, v59, v60, v61, v62) <= (unint64_t)++v50)
              {
                v24 = 0;
                goto LABEL_21;
              }
            }
          }
        }
        else if (v45 < objc_msgSend_count(v30, v46, v47, v48, v49))
        {
          v24 = -1;
        }
        else
        {
          v24 = 1;
        }
        goto LABEL_21;
      }
      if (v19 == 3)
      {
LABEL_17:
        objc_msgSend_objectValue(self, v20, v21, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectValue(v4, v72, v73, v74, v75);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_compare_(v25, v76, (uint64_t)v30, v77, v78);
LABEL_21:

      }
    }
  }
  else if (v19 == objc_msgSend_implClass(v4, v20, v21, v22, v23))
  {
    v24 = 0;
  }
  else
  {
    v67 = objc_msgSend_implClass(self, v63, v64, v65, v66);
    if (v67 < objc_msgSend_implClass(v4, v68, v69, v70, v71))
      v24 = -1;
    else
      v24 = 1;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  XRConstantEngineeringValue *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isEqualToConstantEngineeringValue;

  v4 = (XRConstantEngineeringValue *)a3;
  if (self == v4)
  {
    isEqualToConstantEngineeringValue = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToConstantEngineeringValue = objc_msgSend_isEqualToConstantEngineeringValue_(self, v5, (uint64_t)v4, v6, v7);
    else
      isEqualToConstantEngineeringValue = 0;
  }

  return isEqualToConstantEngineeringValue;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend_objectValue(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_mnemonic, 0);
}

@end
