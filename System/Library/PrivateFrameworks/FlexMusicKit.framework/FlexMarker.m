@implementation FlexMarker

- (FlexMarker)initWithName:(id)a3 markerID:(int64_t)a4 position:(int64_t)a5
{
  id v9;
  FlexMarker *v10;
  FlexMarker *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FlexMarker *v16;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FlexMarker;
  v10 = -[FlexMarker init](&v18, sel_init);
  v11 = v10;
  if (v10
    && (objc_storeStrong((id *)&v10->_name, a3),
        v11->_markerID = a4,
        v11->_position = a5,
        !objc_msgSend__decodeTypeAndBarsFromName(v11, v12, v13, v14, v15)))
  {
    v16 = 0;
  }
  else
  {
    v16 = v11;
  }

  return v16;
}

- (FlexMarker)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  FlexMarker *v8;
  uint64_t v9;
  NSString *name;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FlexMarker;
  v8 = -[FlexMarker init](&v32, sel_init);
  if (v8)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("name"), v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("id"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_markerID = objc_msgSend_integerValue(v14, v15, v16, v17, v18);

    objc_msgSend_objectForKey_(v4, v19, (uint64_t)CFSTR("position"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_position = objc_msgSend_longLongValue(v22, v23, v24, v25, v26);

    objc_msgSend__decodeTypeAndBarsFromName(v8, v27, v28, v29, v30);
  }

  return v8;
}

- (id)encodeAsDictionary
{
  uint64_t v2;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("name"), v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  v19 = objc_msgSend_markerID(self, v15, v16, v17, v18);
  objc_msgSend_numberWithInteger_(v14, v20, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v24, (uint64_t)v23, (uint64_t)CFSTR("id"), v25);

  v26 = (void *)MEMORY[0x24BDD16E0];
  v31 = objc_msgSend_position(self, v27, v28, v29, v30);
  objc_msgSend_numberWithLongLong_(v26, v32, v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v36, (uint64_t)v35, (uint64_t)CFSTR("position"), v37);

  return v6;
}

- (FlexMarker)init
{
  FlexMarker *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FlexMarker;
  result = -[FlexMarker init](&v3, sel_init);
  if (result)
  {
    result->_type = 0;
    result->_number = 0;
  }
  return result;
}

- (unint64_t)_decodeTypeAndBarsFromName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char hasPrefix;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t result;
  int64_t v34;

  objc_msgSend_lowercaseString(self->_name, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v6, v7, (uint64_t)CFSTR("bars"), v8, v9);

  if ((hasPrefix & 1) != 0)
  {
    v15 = 2;
LABEL_5:
    objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v11, (uint64_t)self->_name, v13, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scanUpToCharactersFromSet_intoString_(v21, v27, (uint64_t)v26, 0, v28);

    v34 = 0;
    objc_msgSend_scanInteger_(v21, v29, (uint64_t)&v34, v30, v31);
    v32 = v34;
    self->_type = v15;
    self->_number = v32;

    return self->_type;
  }
  objc_msgSend_lowercaseString(self->_name, v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_hasPrefix_(v16, v17, (uint64_t)CFSTR("bar"), v18, v19);

  if (v20)
  {
    v15 = 1;
    goto LABEL_5;
  }
  result = 0;
  self->_type = 0;
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
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
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v55;

  if (objc_msgSend_type(self, a2, v2, v3, v4) == 2)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_name(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_markerID(self, v12, v13, v14, v15);
    v21 = objc_msgSend_position(self, v17, v18, v19, v20);
    v55 = objc_msgSend_number(self, v22, v23, v24, v25);
    objc_msgSend_stringWithFormat_(v10, v26, (uint64_t)CFSTR("NumberOfBars - name: %@ id %ld position %ld # bars %ld"), v27, v28, v11, v16, v21, v55);
  }
  else
  {
    v29 = objc_msgSend_type(self, v6, v7, v8, v9);
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_name(self, v31, v32, v33, v34);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_markerID(self, v35, v36, v37, v38);
    v44 = objc_msgSend_position(self, v40, v41, v42, v43);
    v49 = objc_msgSend_number(self, v45, v46, v47, v48);
    if (v29 == 1)
      objc_msgSend_stringWithFormat_(v30, v50, (uint64_t)CFSTR("BarStartPosition - name: %@ id %ld position %ld bar #%ld"), v51, v52, v11, v39, v44, v49);
    else
      objc_msgSend_stringWithFormat_(v30, v50, (uint64_t)CFSTR("Unknown - name: %@ id %ld position %ld number %ld"), v51, v52, v11, v39, v44, v49);
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)markerID
{
  return self->_markerID;
}

- (int64_t)position
{
  return self->_position;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)number
{
  return self->_number;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
