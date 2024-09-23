@implementation BMUserProofingEvent

- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceRegion:(id)a8 proofingDecision:(id)a9
{
  return -[BMUserProofingEvent initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:](self, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:", a4, a5, a6, a7, a8, a9, a3, 0, 0, 0);
}

- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10
{
  return -[BMUserProofingEvent initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:](self, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:", a4, a5, a6, a7, a8, a9, a3, a10, 0, 0);
}

- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BMUserProofingEvent *v28;
  BMUserProofingEvent *v29;
  uint64_t v30;
  NSString *age;
  uint64_t v32;
  NSString *gender;
  uint64_t v34;
  NSString *skinTone;
  uint64_t v36;
  NSString *ethnicity;
  uint64_t v38;
  NSString *deviceLanguage;
  uint64_t v40;
  NSString *proofingDecision;
  uint64_t v42;
  NSString *issuer;
  uint64_t v44;
  NSString *livenessAssessment;
  uint64_t v46;
  NSString *gestureAssessment;
  objc_super v49;

  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v49.receiver = self;
  v49.super_class = (Class)BMUserProofingEvent;
  v28 = -[BMUserProofingEvent init](&v49, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_absoluteTimestamp = a3;
    v30 = objc_msgSend(v19, "copy");
    age = v29->_age;
    v29->_age = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    gender = v29->_gender;
    v29->_gender = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    skinTone = v29->_skinTone;
    v29->_skinTone = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    ethnicity = v29->_ethnicity;
    v29->_ethnicity = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    deviceLanguage = v29->_deviceLanguage;
    v29->_deviceLanguage = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    proofingDecision = v29->_proofingDecision;
    v29->_proofingDecision = (NSString *)v40;

    v42 = objc_msgSend(v25, "copy");
    issuer = v29->_issuer;
    v29->_issuer = (NSString *)v42;

    v44 = objc_msgSend(v26, "copy");
    livenessAssessment = v29->_livenessAssessment;
    v29->_livenessAssessment = (NSString *)v44;

    v46 = objc_msgSend(v27, "copy");
    gestureAssessment = v29->_gestureAssessment;
    v29->_gestureAssessment = (NSString *)v46;

  }
  return v29;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMUserProofingEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMUserProofingEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("user_proofing"));

}

- (BMUserProofingEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMUserProofingEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("user_proofing"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMUserProofingEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMUserProofingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMUserProofingEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BMUserProofingEvent *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  void *v41;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMUserProofingEvent initWithProto:].cold.2(v5, v24, v25, v26, v27, v28, v29, v30);
      goto LABEL_17;
    }
    v5 = v4;
    -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
    if (v6 != 0.0)
    {
      -[NSObject age](v5, "age");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[NSObject gender](v5, "gender");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          -[NSObject deviceLanguage](v5, "deviceLanguage");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            -[NSObject proofingDecision](v5, "proofingDecision");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
              v15 = v14;
              -[NSObject age](v5, "age");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject gender](v5, "gender");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject skinTone](v5, "skinTone");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject ethnicity](v5, "ethnicity");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject deviceLanguage](v5, "deviceLanguage");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject proofingDecision](v5, "proofingDecision");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject issuer](v5, "issuer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject livenessAssessment](v5, "livenessAssessment");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject gestureAssessment](v5, "gestureAssessment");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              self = -[BMUserProofingEvent initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:](self, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:", v41, v40, v16, v17, v18, v19, v15, v20, v21, v22);

              v23 = self;
LABEL_18:

              goto LABEL_19;
            }
            goto LABEL_14;
          }

        }
      }
    }
LABEL_14:
    __biome_log_for_category();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[BMUserProofingEvent initWithProto:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }
  v23 = 0;
LABEL_19:

  return v23;
}

- (BMUserProofingEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBUserProofingEvent *v5;
  BMUserProofingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBUserProofingEvent initWithData:]([BMPBUserProofingEvent alloc], "initWithData:", v4);

    self = -[BMUserProofingEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  BMPBUserProofingEvent *v3;

  v3 = objc_alloc_init(BMPBUserProofingEvent);
  -[BMPBUserProofingEvent setAbsoluteTimestamp:](v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  -[BMPBUserProofingEvent setAge:](v3, "setAge:", self->_age);
  -[BMPBUserProofingEvent setGender:](v3, "setGender:", self->_gender);
  -[BMPBUserProofingEvent setSkinTone:](v3, "setSkinTone:", self->_skinTone);
  -[BMPBUserProofingEvent setEthnicity:](v3, "setEthnicity:", self->_ethnicity);
  -[BMPBUserProofingEvent setDeviceLanguage:](v3, "setDeviceLanguage:", self->_deviceLanguage);
  -[BMPBUserProofingEvent setProofingDecision:](v3, "setProofingDecision:", self->_proofingDecision);
  -[BMPBUserProofingEvent setIssuer:](v3, "setIssuer:", self->_issuer);
  -[BMPBUserProofingEvent setLivenessAssessment:](v3, "setLivenessAssessment:", self->_livenessAssessment);
  -[BMPBUserProofingEvent setGestureAssessment:](v3, "setGestureAssessment:", self->_gestureAssessment);
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_age, "hash");
  v6 = v5 ^ -[NSString hash](self->_gender, "hash");
  v7 = v6 ^ -[NSString hash](self->_deviceLanguage, "hash") ^ v4;
  v8 = v7 ^ -[NSString hash](self->_proofingDecision, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  double absoluteTimestamp;
  double v9;
  NSString *age;
  NSString *v11;
  uint64_t v12;
  int v13;
  char v14;
  NSString *gender;
  NSString *v16;
  uint64_t v17;
  int v18;
  NSString *skinTone;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  NSString *ethnicity;
  NSString *v26;
  uint64_t v27;
  NSString *deviceLanguage;
  uint64_t v29;
  NSString *proofingDecision;
  uint64_t v31;
  NSString *issuer;
  uint64_t v33;
  NSString *livenessAssessment;
  uint64_t v35;
  NSString *gestureAssessment;
  NSString *v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSString *v46;
  int v47;
  void *v48;
  void *v49;
  NSString *v50;
  int v51;
  void *v52;
  void *v53;
  NSString *v54;
  int v55;
  void *v56;
  void *v57;
  NSString *v58;
  int v59;
  void *v60;
  void *v61;
  NSString *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  void *v69;
  int v70;
  void *v71;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v7, "absoluteTimestamp");
    if (absoluteTimestamp != v9)
    {
      v14 = 0;
LABEL_93:

      goto LABEL_94;
    }
    age = self->_age;
    v11 = age;
    if (!age)
    {
      objc_msgSend(v7, "age");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v71 = 0;
        v13 = 0;
        goto LABEL_12;
      }
      v71 = (void *)v12;
      v11 = self->_age;
    }
    objc_msgSend(v7, "age");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v11, "isEqualToString:", v3))
    {

      v14 = 0;
      goto LABEL_91;
    }
    v13 = 1;
LABEL_12:
    gender = self->_gender;
    v16 = gender;
    if (!gender)
    {
      objc_msgSend(v7, "gender");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v70 = v13;
        v69 = 0;
        v18 = 0;
        goto LABEL_19;
      }
      v69 = (void *)v17;
      v16 = self->_gender;
    }
    objc_msgSend(v7, "gender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v16, "isEqualToString:", v4))
    {
      v14 = 0;
      goto LABEL_88;
    }
    v70 = v13;
    v18 = 1;
LABEL_19:
    skinTone = self->_skinTone;
    v20 = skinTone;
    if (!skinTone)
    {
      objc_msgSend(v7, "skinTone");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v67 = v18;
        v68 = 0;
        v65 = 0;
        goto LABEL_26;
      }
      v65 = (void *)v21;
      v20 = self->_skinTone;
    }
    objc_msgSend(v7, "skinTone");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v20;
    v24 = (void *)v22;
    if (!-[NSString isEqualToString:](v23, "isEqualToString:", v22))
    {
      v14 = 0;
      goto LABEL_84;
    }
    v64 = v24;
    v67 = v18;
    v68 = 1;
LABEL_26:
    ethnicity = self->_ethnicity;
    v26 = ethnicity;
    if (!ethnicity)
    {
      objc_msgSend(v7, "ethnicity");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        v60 = 0;
        v63 = 0;
        goto LABEL_33;
      }
      v60 = (void *)v27;
      v26 = self->_ethnicity;
    }
    objc_msgSend(v7, "ethnicity");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v26, "isEqualToString:"))
    {
      v14 = 0;
      v18 = v67;
      goto LABEL_78;
    }
    v63 = 1;
LABEL_33:
    deviceLanguage = self->_deviceLanguage;
    v62 = deviceLanguage;
    if (!deviceLanguage)
    {
      objc_msgSend(v7, "deviceLanguage");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        v56 = 0;
        v59 = 0;
        goto LABEL_40;
      }
      v56 = (void *)v29;
      deviceLanguage = self->_deviceLanguage;
    }
    objc_msgSend(v7, "deviceLanguage");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](deviceLanguage, "isEqualToString:"))
    {
      v14 = 0;
      v18 = v67;
      goto LABEL_75;
    }
    v59 = 1;
LABEL_40:
    proofingDecision = self->_proofingDecision;
    v58 = proofingDecision;
    if (!proofingDecision)
    {
      objc_msgSend(v7, "proofingDecision");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v52 = 0;
        v55 = 0;
        goto LABEL_47;
      }
      v52 = (void *)v31;
      proofingDecision = self->_proofingDecision;
    }
    objc_msgSend(v7, "proofingDecision");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](proofingDecision, "isEqualToString:"))
    {
      v14 = 0;
      v18 = v67;
      goto LABEL_72;
    }
    v55 = 1;
LABEL_47:
    issuer = self->_issuer;
    v54 = issuer;
    if (!issuer)
    {
      objc_msgSend(v7, "issuer");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        v48 = 0;
        v51 = 0;
        goto LABEL_54;
      }
      v48 = (void *)v33;
      issuer = self->_issuer;
    }
    objc_msgSend(v7, "issuer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](issuer, "isEqualToString:"))
    {
      v14 = 0;
      v18 = v67;
      goto LABEL_69;
    }
    v51 = 1;
LABEL_54:
    livenessAssessment = self->_livenessAssessment;
    v50 = livenessAssessment;
    if (!livenessAssessment)
    {
      objc_msgSend(v7, "livenessAssessment");
      v35 = objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        v45 = 0;
        v47 = 0;
        goto LABEL_61;
      }
      v45 = (void *)v35;
      livenessAssessment = self->_livenessAssessment;
    }
    objc_msgSend(v7, "livenessAssessment");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](livenessAssessment, "isEqualToString:"))
    {
      v14 = 0;
      v18 = v67;
      goto LABEL_66;
    }
    v47 = 1;
LABEL_61:
    gestureAssessment = self->_gestureAssessment;
    v37 = gestureAssessment;
    if (!gestureAssessment)
    {
      objc_msgSend(v7, "gestureAssessment");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        v42 = 0;
        v14 = 1;
        v18 = v67;
LABEL_109:

        if ((v47 & 1) == 0)
        {
LABEL_67:
          if (v50)
          {
            if (!v51)
              goto LABEL_70;
          }
          else
          {

            if ((v51 & 1) == 0)
            {
LABEL_70:
              if (v54)
              {
                if (!v55)
                  goto LABEL_73;
              }
              else
              {

                if ((v55 & 1) == 0)
                {
LABEL_73:
                  if (v58)
                  {
                    if (!v59)
                      goto LABEL_76;
                  }
                  else
                  {

                    if ((v59 & 1) == 0)
                    {
LABEL_76:
                      if (v62)
                      {
                        if (!v63)
                        {
LABEL_79:
                          if (ethnicity)
                          {
                            if (!v68)
                            {
LABEL_85:
                              if (skinTone)
                              {
                                if (v18)
                                {
LABEL_87:
                                  v13 = v70;
LABEL_88:

                                  if (gender)
                                    goto LABEL_89;
                                  goto LABEL_97;
                                }
                              }
                              else
                              {

                                if ((v18 & 1) != 0)
                                  goto LABEL_87;
                              }
                              v13 = v70;
                              if (gender)
                              {
LABEL_89:
                                if (!v13)
                                  goto LABEL_91;
                                goto LABEL_90;
                              }
LABEL_97:

                              if ((v13 & 1) == 0)
                              {
LABEL_91:
                                if (!age)

                                goto LABEL_93;
                              }
LABEL_90:

                              goto LABEL_91;
                            }
                          }
                          else
                          {

                            if ((v68 & 1) == 0)
                              goto LABEL_85;
                          }
                          v24 = v64;
LABEL_84:

                          goto LABEL_85;
                        }
                      }
                      else
                      {

                        if ((v63 & 1) == 0)
                          goto LABEL_79;
                      }
LABEL_78:

                      goto LABEL_79;
                    }
                  }
LABEL_75:

                  goto LABEL_76;
                }
              }
LABEL_72:

              goto LABEL_73;
            }
          }
LABEL_69:

          goto LABEL_70;
        }
LABEL_66:

        goto LABEL_67;
      }
      v43 = v38;
      v37 = self->_gestureAssessment;
    }
    v39 = v37;
    objc_msgSend(v7, "gestureAssessment", v43, v45);
    v46 = gestureAssessment;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSString isEqualToString:](v39, "isEqualToString:", v40);

    if (v46)
    {
      v18 = v67;
      if (!v47)
        goto LABEL_67;
      goto LABEL_66;
    }
    v18 = v67;
    v42 = v44;
    goto LABEL_109;
  }
  v14 = 0;
LABEL_94:

  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)age
{
  return self->_age;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSString)skinTone
{
  return self->_skinTone;
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (NSString)proofingDecision
{
  return self->_proofingDecision;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)livenessAssessment
{
  return self->_livenessAssessment;
}

- (NSString)gestureAssessment
{
  return self->_gestureAssessment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureAssessment, 0);
  objc_storeStrong((id *)&self->_livenessAssessment, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_proofingDecision, 0);
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_skinTone, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_age, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMUserProofingEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMUserProofingEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMUserProofingEvent: tried to initialize with a non-BMPBInferredModeEvent proto", a5, a6, a7, a8, 0);
}

@end
