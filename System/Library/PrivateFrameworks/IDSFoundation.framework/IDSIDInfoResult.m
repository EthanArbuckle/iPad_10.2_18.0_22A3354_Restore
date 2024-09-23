@implementation IDSIDInfoResult

- (IDSIDInfoResult)initWithURI:(id)a3 status:(int64_t)a4 endpoints:(id)a5 ktData:(id)a6 gameCenterData:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IDSIDInfoResult *v17;
  IDSIDInfoResult *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSIDInfoResult;
  v17 = -[IDSIDInfoResult init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uri, a3);
    v18->_status = a4;
    objc_storeStrong((id *)&v18->_endpoints, a5);
    objc_storeStrong((id *)&v18->_ktData, a6);
    objc_storeStrong((id *)&v18->_gameCenterData, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_uri(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_status(self, v7, v8, v9);
  objc_msgSend_endpoints(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ktData(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gameCenterData(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("<IDSIDInfoResult %p>: uri %@ status %ld endpoints %@ ktData %@ gameCenterData %@"), v24, self, v6, v10, v14, v18, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  IDSIDInfoResult *v4;
  IDSIDInfoResult *v5;
  NSString *uri;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  IDSIDKTData *ktData;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  IDSIDKTData *v49;
  IDSIDKTData *v50;
  BOOL v51;
  IDSGameCenterData *gameCenterData;
  void *v53;
  const char *v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  IDSGameCenterData *v59;
  IDSGameCenterData *v60;
  IDSIDKTData *v62;
  void *v63;
  void *v64;
  char isEqual;
  void *v66;

  v4 = (IDSIDInfoResult *)a3;
  if (self == v4)
  {
    v51 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      uri = self->_uri;
      objc_msgSend_uri(v5, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToString_(uri, v11, (uint64_t)v10, v12))
      {
        v51 = 0;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, self->_status, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v20 = objc_msgSend_status(v5, v17, v18, v19);
      objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToNumber_(v15, v24, (uint64_t)v23, v25))
      {
        v51 = 0;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v26, (uint64_t)self->_endpoints, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_endpoints(v5, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v29, v34, (uint64_t)v33, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToSet_(v28, v37, (uint64_t)v36, v38))
      {
        v51 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v66 = v28;
      ktData = self->_ktData;
      objc_msgSend_ktData(v5, v39, v40, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(ktData, v44, (uint64_t)v43, v45);
      if ((isEqual & 1) == 0)
      {
        v49 = self->_ktData;
        objc_msgSend_ktData(v5, v46, v47, v48);
        v50 = (IDSIDKTData *)objc_claimAutoreleasedReturnValue();
        if (v49 != v50)
        {
          v51 = 0;
          v28 = v66;

LABEL_20:
          goto LABEL_21;
        }
        v62 = v49;
      }
      v64 = v43;
      gameCenterData = self->_gameCenterData;
      objc_msgSend_gameCenterData(v5, v46, v47, v48, v62);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(gameCenterData, v54, (uint64_t)v53, v55) & 1) != 0)
      {

        v51 = 1;
      }
      else
      {
        v59 = self->_gameCenterData;
        objc_msgSend_gameCenterData(v5, v56, v57, v58);
        v60 = (IDSGameCenterData *)objc_claimAutoreleasedReturnValue();
        v51 = v59 == v60;

      }
      v28 = v66;
      v43 = v64;
      if ((isEqual & 1) == 0)

      goto LABEL_20;
    }
    v51 = 0;
  }
LABEL_24:

  return v51;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  double v33;
  id v34;

  v4 = a3;
  objc_msgSend_uri(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("IDSIDInfoResultURIKey"));

  v14 = objc_msgSend_status(self, v11, v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v15, v14, v16, CFSTR("IDSIDInfoResultStatusKey"));
  objc_msgSend_endpoints(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("IDSIDInfoResultEndpointsKey"));

  objc_msgSend_ktData(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("IDSIDInfoResultKTDataKey"));

  objc_msgSend_gameCenterData(self, v29, v30, v31);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v34, v33, CFSTR("IDSIDInfoResultGameCenterDataKey"));

}

- (IDSIDInfoResult)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  IDSIDInfoResult *v22;

  v4 = a3;
  objc_msgSend_decodeObjectForKey_(v4, v5, (uint64_t)CFSTR("IDSIDInfoResultURIKey"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)CFSTR("IDSIDInfoResultStatusKey"), v9);
  objc_msgSend_decodeObjectForKey_(v4, v11, (uint64_t)CFSTR("IDSIDInfoResultEndpointsKey"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectForKey_(v4, v14, (uint64_t)CFSTR("IDSIDInfoResultKTDataKey"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectForKey_(v4, v17, (uint64_t)CFSTR("IDSIDInfoResultGameCenterDataKey"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (IDSIDInfoResult *)objc_msgSend_initWithURI_status_endpoints_ktData_gameCenterData_(self, v20, (uint64_t)v7, v21, v10, v13, v16, v19);
  return v22;
}

- (NSString)uri
{
  return self->_uri;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (IDSIDKTData)ktData
{
  return self->_ktData;
}

- (IDSGameCenterData)gameCenterData
{
  return self->_gameCenterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterData, 0);
  objc_storeStrong((id *)&self->_ktData, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
