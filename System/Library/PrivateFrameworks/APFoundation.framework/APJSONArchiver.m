@implementation APJSONArchiver

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (APJSONArchiver)initWithArray
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APJSONArchiver *v5;
  uint64_t v6;
  id container;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APJSONArchiver;
  v5 = -[APJSONArchiver init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (id)v6;

  }
  return v5;
}

- (APJSONArchiver)initWithDictionary
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APJSONArchiver *v5;
  uint64_t v6;
  id container;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APJSONArchiver;
  v5 = -[APJSONArchiver init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (id)v6;

  }
  return v5;
}

- (BOOL)_containerIsArray
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)_addClassToContainer:(Class)a3
{
  const char *v4;
  id v5;

  NSStringFromClass(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v4, (uint64_t)v5, (uint64_t)CFSTR("$"));

}

- (void)_addValueToContainer:(id)a3 forKey:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int IsArray;
  id container;
  id v14;

  v14 = a3;
  v9 = a4;
  if (v14)
  {
    IsArray = objc_msgSend__containerIsArray(self, v6, v7, v8);
    container = self->_container;
    if (IsArray)
      objc_msgSend_addObject_(container, v10, (uint64_t)v14, v11);
    else
      objc_msgSend_setValue_forKey_(container, v10, (uint64_t)v14, (uint64_t)v9);
  }

}

- (id)_JSONObjectWithObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  APJSONArchiver *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[5];
  id v96;
  _QWORD v97[5];
  id v98;
  _QWORD v99[5];
  id v100;
  _QWORD v101[5];
  id v102;

  v7 = a3;
  if (v7)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v4, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v7)
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v9, v10, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = v7;
LABEL_8:
      v13 = v12;
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend__valueForNumber_(self, v15, (uint64_t)v7, v16);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_apDefaultSharedFormatter(MEMORY[0x1E0CB36A8], v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromDate_(v20, v21, (uint64_t)v7, v22);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_UUIDString(v7, v28, v29, v30);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = (void *)MEMORY[0x1E0C99DE8];
          v32 = v7;
          v36 = objc_msgSend_count(v32, v33, v34, v35);
          objc_msgSend_arrayWithCapacity_(v31, v37, v36, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = sub_1CF277610;
          v101[3] = &unk_1E8C48478;
          v101[4] = self;
          v40 = v39;
          v102 = v40;
          objc_msgSend_enumerateObjectsUsingBlock_(v32, v41, (uint64_t)v101, v42);

          v43 = v102;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = (void *)MEMORY[0x1E0C99E08];
            v45 = v7;
            v49 = objc_msgSend_count(v45, v46, v47, v48);
            objc_msgSend_dictionaryWithCapacity_(v44, v50, v49, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v99[0] = MEMORY[0x1E0C809B0];
            v99[1] = 3221225472;
            v99[2] = sub_1CF277660;
            v99[3] = &unk_1E8C484A0;
            v99[4] = self;
            v40 = v52;
            v100 = v40;
            objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v45, v53, (uint64_t)v99, v54);

            v43 = v100;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_allObjects(v7, v55, v56, v57);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = (void *)MEMORY[0x1E0C99DE8];
              v62 = objc_msgSend_count(v20, v59, v60, v61);
              objc_msgSend_arrayWithCapacity_(v58, v63, v62, v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v97[0] = MEMORY[0x1E0C809B0];
              v97[1] = 3221225472;
              v97[2] = sub_1CF2776C0;
              v97[3] = &unk_1E8C48478;
              v97[4] = self;
              v66 = v65;
              v98 = v66;
              objc_msgSend_enumerateObjectsUsingBlock_(v20, v67, (uint64_t)v97, v68);
              v69 = v98;
              v13 = v66;

              goto LABEL_17;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v81 = (void *)MEMORY[0x1D17CBC78]();
              v82 = [APJSONArchiver alloc];
              v86 = (void *)objc_msgSend_initWithDictionary(v82, v83, v84, v85);
              v87 = objc_opt_class();
              objc_msgSend__addClassToContainer_(v86, v88, v87, v89);
              objc_msgSend_encodeWithCoder_(v7, v90, (uint64_t)v86, v91);
              objc_msgSend_object(v86, v92, v93, v94);
              v13 = (id)objc_claimAutoreleasedReturnValue();

              objc_autoreleasePoolPop(v81);
              goto LABEL_9;
            }
            v70 = (void *)MEMORY[0x1E0C99DE8];
            v71 = v7;
            v75 = objc_msgSend_count(v71, v72, v73, v74);
            objc_msgSend_arrayWithCapacity_(v70, v76, v75, v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = sub_1CF277710;
            v95[3] = &unk_1E8C48478;
            v95[4] = self;
            v40 = v78;
            v96 = v40;
            objc_msgSend_enumerateObjectsUsingBlock_(v71, v79, (uint64_t)v95, v80);

            v43 = v96;
          }
        }
        v13 = v40;

        goto LABEL_9;
      }
      objc_msgSend_base64EncodedStringWithOptions_(v7, v24, 0, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("data:;base64,%@"), v27, v20);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (id)v23;
LABEL_17:

    goto LABEL_9;
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithInt_(v6, v8, v4, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithInt_(v6, v8, v4, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithLongLong_(v6, v8, a3, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithDouble_(v6, v8, v9, v10, a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__valueForNumber_(self, v11, (uint64_t)v15, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v14, (uint64_t)v13, (uint64_t)v7);

}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithBool_(v6, v8, v4, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v10, (uint64_t)v11, (uint64_t)v7);

}

- (id)_valueForNumber:(id)a3
{
  return a3;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a4;
  objc_msgSend__JSONObjectWithObject_(self, v7, (uint64_t)a3, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addValueToContainer_forKey_(self, v9, (uint64_t)v10, (uint64_t)v6);

}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  objc_msgSend__addValueToContainer_forKey_(self, a2, (uint64_t)CFSTR("Not implemented - encodeBytes:length:forKey:"), (uint64_t)a5);
}

- (id)object
{
  return self->_container;
}

+ (id)JSONObjectWithObject:(id)a3
{
  id v3;
  APJSONArchiver *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(APJSONArchiver);
  objc_msgSend__JSONObjectWithObject_(v4, v5, (uint64_t)v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_container, 0);
}

@end
