@implementation NRDevicePropertyDiff

- (NRDevicePropertyDiff)initWithValue:(id)a3
{
  id v5;
  NRDevicePropertyDiff *v6;
  NRDevicePropertyDiff *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRDevicePropertyDiff;
  v6 = -[NRDevicePropertyDiff init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDevicePropertyDiff)initWithProtobuf:(id)a3
{
  _QWORD *v4;
  NRDevicePropertyDiff *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *value;

  v4 = a3;
  v5 = -[NRDevicePropertyDiff init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    if (v4)
      v7 = (void *)v4[1];
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v6, "unpackPropertyValue:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = v9;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_value, CFSTR("property value"), v5);
  }

  return v5;
}

- (NRPBDevicePropertyDiff)protobuf
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "packPropertyValue:", self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDevicePropertyDiff setValue:]((uint64_t)v3, v4);

  return (NRPBDevicePropertyDiff *)v3;
}

- (NRDevicePropertyDiff)initWithCoder:(id)a3
{
  id v4;
  NRDevicePropertyDiff *v5;
  uint64_t v6;
  void *v7;
  NRPBDevicePropertyDiff *v8;
  NRDevicePropertyDiff *v9;
  void *v10;
  uint64_t v11;
  NSObject *value;

  v4 = a3;
  v5 = -[NRDevicePropertyDiff init](self, "init");
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, 0x1E449A6A8);
    v11 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = v11;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_value, CFSTR("property value"), v5);
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBDevicePropertyDiff initWithData:]([NRPBDevicePropertyDiff alloc], "initWithData:", v6);
  v9 = -[NRDevicePropertyDiff initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRDevicePropertyDiff protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

+ (id)enclosedClassTypes
{
  return +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  return -[NSObject hash](self->_value, "hash") - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  NRDevicePropertyDiff *v4;
  NSObject *value;
  char v6;

  v4 = (NRDevicePropertyDiff *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  value = self->_value;
  if (value == v4->_value)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSObject isEqual:](value, "isEqual:");
LABEL_7:

  return v6;
}

- (id)description
{
  void *v3;
  char isKindOfClass;
  NSObject *value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[NRTextFormattingUtilities dateFormatter:](NRTextFormattingUtilities, "dateFormatter:", self->_value);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    value = self->_value;
    if ((isKindOfClass & 1) != 0)
      -[NSObject UUIDString](value, "UUIDString");
    else
      -[NSObject description](value, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NRDevicePropertyDiff *v4;

  v4 = -[NRDevicePropertyDiff init](+[NRDevicePropertyDiff allocWithZone:](NRDevicePropertyDiff, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_value, self->_value);
  return v4;
}

+ (id)packPropertyValue:(id)a3
{
  id v4;
  NRPBPropertyValue *v5;
  void *v6;
  void *v7;
  NRPBNumber *v8;
  id v9;
  double v10;
  double v11;
  id v13;
  NRPBNumber *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  NRPBNumber *v33;
  uint64_t v34;
  NRPBNumber *v35;
  NRPBNumber *v36;
  uint64_t v37;
  NRPBNumber *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id obj;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(NRPBPropertyValue);
  if (!v4)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v4, "nr_filteredError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nr_secureArchivedDataWithRootObject:", v7);
    v8 = (NRPBNumber *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NRPBPropertyValue setDataValue:](v5, "setDataValue:", v8);
      -[NRPBPropertyValue setIsError:](v5, "setIsError:", 1);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    v8 = objc_alloc_init(NRPBNumber);
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;

    -[NRPBNumber setDoubleValue:](v8, "setDoubleValue:", v11);
    -[NRPBPropertyValue setNumberValue:](v5, "setNumberValue:", v8);
    -[NRPBPropertyValue setIsDate:](v5, "setIsDate:", 1);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v4;
    v14 = objc_alloc_init(NRPBNumber);
    v15 = objc_retainAutorelease(v13);
    if (!strcmp((const char *)objc_msgSend(v15, "objCType"), "i"))
    {
      v32 = objc_msgSend(v15, "intValue");
      v33 = v14;
      goto LABEL_33;
    }
    v16 = objc_retainAutorelease(v15);
    if (!strcmp((const char *)objc_msgSend(v16, "objCType"), "I"))
    {
      v34 = objc_msgSend(v16, "unsignedIntValue");
      v35 = v14;
LABEL_39:
      -[NRPBNumber setInt32Value:](v35, "setInt32Value:", v34);
LABEL_65:
      -[NRPBNumber setIsUnsigned:](v14, "setIsUnsigned:", 1);
      goto LABEL_66;
    }
    v17 = objc_retainAutorelease(v16);
    if (!strcmp((const char *)objc_msgSend(v17, "objCType"), "q"))
    {
      -[NRPBNumber setInt64Value:](v14, "setInt64Value:", objc_msgSend(v17, "longLongValue"));
      goto LABEL_66;
    }
    v18 = objc_retainAutorelease(v17);
    if (!strcmp((const char *)objc_msgSend(v18, "objCType"), "Q"))
    {
      -[NRPBNumber setInt64Value:](v14, "setInt64Value:", objc_msgSend(v18, "unsignedLongLongValue"));
      goto LABEL_65;
    }
    v19 = objc_retainAutorelease(v18);
    if (!strcmp((const char *)objc_msgSend(v19, "objCType"), "s"))
    {
      -[NRPBNumber setInt32Value:](v14, "setInt32Value:", objc_msgSend(v19, "shortValue"));
      v36 = v14;
      v37 = 1;
    }
    else
    {
      v20 = objc_retainAutorelease(v19);
      if (!strcmp((const char *)objc_msgSend(v20, "objCType"), "S"))
      {
        -[NRPBNumber setInt32Value:](v14, "setInt32Value:", objc_msgSend(v20, "unsignedShortValue"));
        v38 = v14;
        v39 = 1;
        goto LABEL_64;
      }
      v21 = objc_retainAutorelease(v20);
      if (strcmp((const char *)objc_msgSend(v21, "objCType"), "c"))
      {
        v22 = objc_retainAutorelease(v21);
        if (strcmp((const char *)objc_msgSend(v22, "objCType"), "C"))
        {
          v23 = objc_retainAutorelease(v22);
          if (strcmp((const char *)objc_msgSend(v23, "objCType"), "q"))
          {
            v24 = objc_retainAutorelease(v23);
            if (strcmp((const char *)objc_msgSend(v24, "objCType"), "Q"))
            {
              v25 = objc_retainAutorelease(v24);
              if (!strcmp((const char *)objc_msgSend(v25, "objCType"), "B"))
              {
                -[NRPBNumber setBoolValue:](v14, "setBoolValue:", objc_msgSend(v25, "BOOLValue"));
              }
              else
              {
                v26 = objc_retainAutorelease(v25);
                if (strcmp((const char *)objc_msgSend(v26, "objCType"), "f"))
                {
                  v27 = objc_retainAutorelease(v26);
                  if (!strcmp((const char *)objc_msgSend(v27, "objCType"), "d"))
                  {
                    objc_msgSend(v27, "doubleValue");
                    -[NRPBNumber setDoubleValue:](v14, "setDoubleValue:");
                    goto LABEL_66;
                  }
LABEL_68:

                  goto LABEL_69;
                }
                objc_msgSend(v26, "floatValue");
                -[NRPBNumber setFloatValue:](v14, "setFloatValue:");
              }
LABEL_66:
              if (v14)
              {
                -[NRPBPropertyValue setNumberValue:](v5, "setNumberValue:", v14);
                goto LABEL_68;
              }
LABEL_69:

              goto LABEL_10;
            }
            v34 = objc_msgSend(v24, "unsignedIntegerValue");
            v35 = v14;
            goto LABEL_39;
          }
          v32 = objc_msgSend(v23, "integerValue");
          v33 = v14;
LABEL_33:
          -[NRPBNumber setInt32Value:](v33, "setInt32Value:", v32);
          goto LABEL_66;
        }
        -[NRPBNumber setInt32Value:](v14, "setInt32Value:", objc_msgSend(v22, "unsignedCharValue"));
        v38 = v14;
        v39 = 0;
LABEL_64:
        -[NRPBNumber setIsShortOrChar:](v38, "setIsShortOrChar:", v39);
        goto LABEL_65;
      }
      -[NRPBNumber setInt32Value:](v14, "setInt32Value:", objc_msgSend(v21, "charValue"));
      v36 = v14;
      v37 = 0;
    }
    -[NRPBNumber setIsShortOrChar:](v36, "setIsShortOrChar:", v37);
    goto LABEL_66;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v4;
    v14 = objc_alloc_init(NRPBSize);
    v15 = objc_retainAutorelease(v28);
    if (!strcmp((const char *)objc_msgSend(v15, "objCType"), "{CGSize=dd}"))
    {
      objc_msgSend(v15, "sizeValue");
      *(float *)&v29 = v29;
      -[NRPBNumber setWidth:](v14, "setWidth:", v29);
      objc_msgSend(v15, "sizeValue");
      *(float *)&v31 = v30;
      -[NRPBNumber setHeight:](v14, "setHeight:", v31);
      if (!v14)
        goto LABEL_69;
      -[NRPBPropertyValue setSizeValue:](v5, "setSizeValue:", v14);
    }
    goto LABEL_68;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NRPBPropertyValue setStringValue:](v5, "setStringValue:", v4);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NRPBPropertyValue setIsSecurePropertyValue:](v5, "setIsSecurePropertyValue:", 1);
      objc_msgSend(v4, "data");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "fromUUID:", v4);
    }
    v8 = (NRPBNumber *)objc_claimAutoreleasedReturnValue();
    -[NRPBPropertyValue setUUIDValue:](v5, "setUUIDValue:", v8);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NRPBPropertyValue setDataValue:](v5, "setDataValue:", v4);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v4;
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NRPBPropertyValue setArrayValues:](v5, "setArrayValues:", v41);

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v15 = v40;
    v42 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v84 != v44)
            objc_enumerationMutation(v15);
          objc_msgSend(a1, "packPropertyValue:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            -[NRPBPropertyValue arrayValues](v5, "arrayValues");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v46);

          }
        }
        v43 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
      }
      while (v43);
    }

LABEL_83:
    -[NRPBPropertyValue arrayValues](v5, "arrayValues");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");

    if (!v58)
      -[NRPBPropertyValue setArrayValues:](v5, "setArrayValues:", 0);
    goto LABEL_69;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = v4;
    -[NRPBPropertyValue setIsMiniUUIDSet:](v5, "setIsMiniUUIDSet:", 1);
    objc_msgSend(v48, "data");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[NRPBPropertyValue setDataValue:](v5, "setDataValue:", v15);
    goto LABEL_69;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v49 = v4;
    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NRPBPropertyValue setArrayValues:](v5, "setArrayValues:", v50);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v15 = v49;
    v51 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v80 != v53)
            objc_enumerationMutation(v15);
          objc_msgSend(a1, "packPropertyValue:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            -[NRPBPropertyValue arrayValues](v5, "arrayValues");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "addObject:", v55);

          }
        }
        v52 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v52);
    }

    -[NRPBPropertyValue setIsSet:](v5, "setIsSet:", 1);
    goto LABEL_83;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    v5 = 0;
    goto LABEL_10;
  }
  v59 = v4;
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NRPBPropertyValue setArrayValues:](v5, "setArrayValues:", v60);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v59, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  v73 = v59;
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(obj);
        v65 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
        objc_msgSend(v59, "objectForKeyedSubscript:", v65, v73);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "packPropertyValue:", v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          objc_msgSend(a1, "packPropertyValue:", v66);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v68;
          if (v68)
          {
            objc_msgSend(v68, "setDictionaryKey:", v67);
            -[NRPBPropertyValue arrayValues](v5, "arrayValues");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObject:", v69);

            v59 = v73;
          }

        }
      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v62);
  }

  -[NRPBPropertyValue arrayValues](v5, "arrayValues");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "count");

  if (!v72)
    -[NRPBPropertyValue setArrayValues:](v5, "setArrayValues:", 0);

LABEL_10:
  return v5;
}

+ (id)unpackPropertyValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  unsigned __int16 v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  NRSecureDevicePropertyID *v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  NRSecureDevicePropertyID *v52;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasInt32Value");

    objc_msgSend(v4, "numberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      v10 = objc_msgSend(v8, "hasIsShortOrChar");

      objc_msgSend(v4, "numberValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        v13 = objc_msgSend(v11, "isShortOrChar");

        objc_msgSend(v4, "numberValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isUnsigned");

        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "numberValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "int32Value");
        if (v13)
        {
          if (v15)
            objc_msgSend(v16, "numberWithUnsignedShort:", v18);
          else
            objc_msgSend(v16, "numberWithShort:", (__int16)v18);
        }
        else if (v15)
        {
          objc_msgSend(v16, "numberWithUnsignedChar:", v18);
        }
        else
        {
          objc_msgSend(v16, "numberWithChar:", (char)v18);
        }
      }
      else
      {
        v34 = objc_msgSend(v11, "isUnsigned");

        v35 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "numberValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v17, "int32Value");
        if (v34)
          objc_msgSend(v35, "numberWithUnsignedInt:", v36);
        else
          objc_msgSend(v35, "numberWithInt:", v36);
      }
    }
    else
    {
      v28 = objc_msgSend(v8, "hasInt64Value");

      objc_msgSend(v4, "numberValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (!v28)
      {
        v37 = objc_msgSend(v29, "hasFloatValue");

        if (v37)
        {
          v38 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "numberValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          objc_msgSend(v38, "numberWithFloat:");
          v39 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "numberValue");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "hasDoubleValue");

          if (v43)
          {
            v44 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v4, "numberValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            objc_msgSend(v44, "numberWithDouble:");
            v39 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "numberValue");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "hasBoolValue");

            if (!v49)
            {
              v21 = 0;
LABEL_35:
              if (objc_msgSend(v4, "isDate"))
              {
                v51 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v21, "doubleValue");
                objc_msgSend(v51, "dateWithTimeIntervalSinceReferenceDate:");
                v52 = (NRSecureDevicePropertyID *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v52 = v21;
              }
              goto LABEL_38;
            }
            v50 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v4, "numberValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "numberWithBool:", objc_msgSend(v17, "BOOLValue"));
            v39 = objc_claimAutoreleasedReturnValue();
          }
        }
LABEL_34:
        v21 = (void *)v39;

        goto LABEL_35;
      }
      v31 = objc_msgSend(v29, "isUnsigned");

      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "numberValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v17, "int64Value");
      if (v31)
        objc_msgSend(v32, "numberWithUnsignedLongLong:", v33);
      else
        objc_msgSend(v32, "numberWithLongLong:", v33);
    }
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  objc_msgSend(v4, "sizeValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "sizeValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "width");
    v23 = v22;
    objc_msgSend(v4, "sizeValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "height");
    objc_msgSend(v20, "valueWithSize:", v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v27 = (void *)v26;

LABEL_39:
    goto LABEL_40;
  }
  objc_msgSend(v4, "stringValue");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v4, "stringValue");
    v41 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v4, "uUIDValue");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    if (!objc_msgSend(v4, "isSecurePropertyValue"))
    {
      objc_msgSend(v4, "uUIDValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "toUUID");
      v52 = (NRSecureDevicePropertyID *)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    v46 = [NRSecureDevicePropertyID alloc];
    objc_msgSend(v4, "uUIDValue");
    v47 = objc_claimAutoreleasedReturnValue();
LABEL_44:
    v21 = (void *)v47;
    v52 = -[NRSecureDevicePropertyID initWithData:](v46, "initWithData:", v47);
LABEL_38:
    v27 = v52;
    goto LABEL_39;
  }
  objc_msgSend(v4, "dataValue");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    objc_msgSend(v4, "arrayValues");
    v55 = objc_claimAutoreleasedReturnValue();
    if (!v55
      || (v56 = (void *)v55,
          objc_msgSend(v4, "arrayValues"),
          v57 = (void *)objc_claimAutoreleasedReturnValue(),
          v58 = objc_msgSend(v57, "count"),
          v57,
          v56,
          !v58))
    {
      v27 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v4, "arrayValues");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "dictionaryKey");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      v84 = v60;
      v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      objc_msgSend(v4, "arrayValues");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v65; ++i)
          {
            if (*(_QWORD *)v94 != v66)
              objc_enumerationMutation(v63);
            v68 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
            objc_msgSend(v68, "dictionaryKey");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "unpackPropertyValue:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "unpackPropertyValue:", v68);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70)
            {
              if (v71)
                objc_msgSend(v62, "setObject:forKey:", v71, v70);
              else
                objc_msgSend(v62, "removeObjectForKey:", v70);
            }

          }
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
        }
        while (v65);
      }

      if (!objc_msgSend(v62, "count"))
      {
        v27 = 0;
        v60 = v84;
LABEL_90:

        goto LABEL_40;
      }
      v60 = v84;
    }
    else
    {
      if ((objc_msgSend(v4, "isSet") & 1) != 0)
      {
        v62 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v4, "arrayValues");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
        if (v74)
        {
          v75 = v74;
          v76 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v75; ++j)
            {
              if (*(_QWORD *)v86 != v76)
                objc_enumerationMutation(v73);
              objc_msgSend(a1, "unpackPropertyValue:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (v78)
                objc_msgSend(v62, "addObject:", v78);

            }
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
          }
          while (v75);
        }
      }
      else
      {
        v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        objc_msgSend(v4, "arrayValues");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v90;
          do
          {
            for (k = 0; k != v80; ++k)
            {
              if (*(_QWORD *)v90 != v81)
                objc_enumerationMutation(v73);
              objc_msgSend(a1, "unpackPropertyValue:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k));
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              if (v83)
                objc_msgSend(v62, "addObject:", v83);

            }
            v80 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
          }
          while (v80);
        }
      }

      if (!objc_msgSend(v62, "count"))
      {
        v27 = 0;
        goto LABEL_90;
      }
    }
    v27 = (void *)objc_msgSend(v62, "copy");
    goto LABEL_90;
  }
  if (objc_msgSend(v4, "isMiniUUIDSet"))
  {
    v46 = [NRMiniUUIDSet alloc];
    objc_msgSend(v4, "dataValue");
    v47 = objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  if (objc_msgSend(v4, "isError"))
  {
    v72 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "nr_secureUnarchiveObjectOfClasses:withData:", v21, v24);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "dataValue");
  v41 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v27 = (void *)v41;
LABEL_40:

  return v27;
}

- (NSObject)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
