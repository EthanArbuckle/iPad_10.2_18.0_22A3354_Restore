@implementation ASCAlertOffer

- (ASCAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertButtonOffer:(id)a11 alertButtonTitle:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ASCAlertOffer *v25;
  uint64_t v26;
  ASCAdamID *id;
  uint64_t v28;
  NSDictionary *titles;
  uint64_t v30;
  NSDictionary *subtitles;
  uint64_t v32;
  NSArray *metrics;
  uint64_t v34;
  NSString *alertTitle;
  uint64_t v36;
  NSString *alertMessage;
  uint64_t v38;
  ASCOffer *alertButtonOffer;
  uint64_t v40;
  NSString *alertButtonTitle;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v18 = a4;
  v19 = a5;
  v43 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v45.receiver = self;
  v45.super_class = (Class)ASCAlertOffer;
  v25 = -[ASCAlertOffer init](&v45, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v44, "copy", v43);
    id = v25->_id;
    v25->_id = (ASCAdamID *)v26;

    v28 = objc_msgSend(v18, "copy");
    titles = v25->_titles;
    v25->_titles = (NSDictionary *)v28;

    v30 = objc_msgSend(v19, "copy");
    subtitles = v25->_subtitles;
    v25->_subtitles = (NSDictionary *)v30;

    v25->_flags = a6;
    objc_storeStrong((id *)&v25->_ageRating, a7);
    v32 = objc_msgSend(v20, "copy");
    metrics = v25->_metrics;
    v25->_metrics = (NSArray *)v32;

    v34 = objc_msgSend(v21, "copy");
    alertTitle = v25->_alertTitle;
    v25->_alertTitle = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    alertMessage = v25->_alertMessage;
    v25->_alertMessage = (NSString *)v36;

    v38 = objc_msgSend(v23, "copyWithZone:", 0);
    alertButtonOffer = v25->_alertButtonOffer;
    v25->_alertButtonOffer = (ASCOffer *)v38;

    v40 = objc_msgSend(v24, "copy");
    alertButtonTitle = v25->_alertButtonTitle;
    v25->_alertButtonTitle = (NSString *)v40;

  }
  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAlertOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ASCAlertOffer *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    ASCOfferTitlesDecodeForKey(v4, CFSTR("titles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      ASCOfferTitlesDecodeForKey(v4, CFSTR("subtitles"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ageRating"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        ASCMetricsDataDecodeArrayForKey(v4, CFSTR("metrics"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v49 = v9;
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertTitle"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertMessage"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          ASCOfferDecodeForKey(v4, CFSTR("alertButtonOffer"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertButtonTitle"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[ASCAlertOffer initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertButtonOffer:alertButtonTitle:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertButtonOffer:alertButtonTitle:", v5, v6, v7, v8, v49, v10, v48, v47, v11, v12);

          v9 = v49;
          v13 = self;
        }
        else
        {
          v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v38)
            -[ASCAlertOffer initWithCoder:].cold.4(v38, v39, v40, v41, v42, v43, v44, v45);
          v13 = 0;
        }

      }
      else
      {
        v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v30)
          -[ASCAlertOffer initWithCoder:].cold.3(v30, v31, v32, v33, v34, v35, v36, v37);
        v13 = 0;
      }

    }
    else
    {
      v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v22)
        -[ASCAlertOffer initWithCoder:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
      v13 = 0;
    }

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
      -[ASCAlertOffer initWithCoder:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[ASCAlertOffer id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCAlertOffer titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titles"));

  -[ASCAlertOffer subtitles](self, "subtitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitles"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAlertOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCAlertOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ageRating"));

  -[ASCAlertOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("metrics"));

  -[ASCAlertOffer alertTitle](self, "alertTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("alertTitle"));

  -[ASCAlertOffer alertMessage](self, "alertMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("alertMessage"));

  -[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("alertButtonOffer"));

  -[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("alertButtonTitle"));

}

- (ASCAlertOffer)offerWithMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;

  v4 = a3;
  v16 = objc_alloc((Class)objc_opt_class());
  -[ASCAlertOffer id](self, "id");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAlertOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAlertOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASCAlertOffer flags](self, "flags");
  -[ASCAlertOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAlertOffer alertTitle](self, "alertTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAlertOffer alertMessage](self, "alertMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v16, "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertButtonOffer:alertButtonTitle:", v15, v5, v6, v7, v8, v4, v9, v10, v11, v12);

  return (ASCAlertOffer *)v13;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCAlertOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCAlertOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCAlertOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCAlertOffer flags](self, "flags"));
  -[ASCAlertOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCAlertOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCAlertOffer alertTitle](self, "alertTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCAlertOffer alertMessage](self, "alertMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  -[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  -[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  v13 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCAlertOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCAlertOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCAlertOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_42;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_42;
            }
            v18 = -[ASCAlertOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCAlertOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              v58 = v19;
              if (v19 && v20)
              {
                v22 = v19;
                v23 = v21;
                v24 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v23;
                v19 = v58;
                if (v24)
                {
LABEL_27:
                  v56 = v21;
                  -[ASCAlertOffer metrics](self, "metrics");
                  v25 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = (void *)v26;
                  v57 = (void *)v25;
                  if (v25 && v26)
                  {
                    v28 = (void *)v26;
                    v29 = objc_msgSend(v57, "isEqual:", v26);
                    v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      v54 = v27;
                      -[ASCAlertOffer alertTitle](self, "alertTitle");
                      v30 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "alertTitle");
                      v31 = objc_claimAutoreleasedReturnValue();
                      v32 = (void *)v31;
                      v55 = (void *)v30;
                      if (v30 && v31)
                      {
                        v33 = (void *)v31;
                        v34 = objc_msgSend(v55, "isEqual:", v31);
                        v32 = v33;
                        if (v34)
                        {
LABEL_33:
                          v52 = v32;
                          -[ASCAlertOffer alertMessage](self, "alertMessage");
                          v35 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v7, "alertMessage");
                          v36 = objc_claimAutoreleasedReturnValue();
                          v37 = (void *)v36;
                          v53 = (void *)v35;
                          if (v35 && v36)
                          {
                            v38 = (void *)v36;
                            v39 = objc_msgSend(v53, "isEqual:", v36);
                            v37 = v38;
                            if (v39)
                            {
LABEL_36:
                              v50 = v37;
                              -[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer");
                              v40 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "alertButtonOffer");
                              v41 = objc_claimAutoreleasedReturnValue();
                              v51 = v40;
                              v49 = (void *)v41;
                              if (v40 && v41)
                              {
                                if (objc_msgSend(v40, "isEqual:", v41))
                                  goto LABEL_39;
                              }
                              else if (v40 == (void *)v41)
                              {
LABEL_39:
                                -[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle", v49);
                                v42 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v7, "alertButtonTitle");
                                v43 = objc_claimAutoreleasedReturnValue();
                                v44 = (void *)v43;
                                if (v42 && v43)
                                {
                                  v45 = (void *)v43;
                                  v46 = objc_msgSend(v42, "isEqual:", v43);
                                  v44 = v45;
                                  v47 = v42;
                                  v17 = v46;
                                }
                                else
                                {
                                  v47 = v42;
                                  v17 = v42 == (void *)v43;
                                }

                                goto LABEL_55;
                              }
                              v17 = 0;
LABEL_55:

                              v37 = v50;
                              goto LABEL_56;
                            }
                          }
                          else if (v35 == v36)
                          {
                            goto LABEL_36;
                          }
                          v17 = 0;
LABEL_56:

                          v32 = v52;
                          goto LABEL_57;
                        }
                      }
                      else if (v30 == v31)
                      {
                        goto LABEL_33;
                      }
                      v17 = 0;
LABEL_57:

                      v27 = v54;
                      goto LABEL_58;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_58:

                  v21 = v56;
                  v19 = v58;
                  goto LABEL_59;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_59:

              goto LABEL_60;
            }
LABEL_42:
            v17 = 0;
LABEL_60:

            goto LABEL_61;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_62:

    goto LABEL_63;
  }
  v17 = 0;
LABEL_63:

  return v17;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAlertOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCAlertOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCAlertOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCAlertOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCAlertOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCAlertOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCAlertOffer alertTitle](self, "alertTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("alertTitle"));

  -[ASCAlertOffer alertMessage](self, "alertMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("alertMessage"));

  -[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("alertButtonOffer"));

  -[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, CFSTR("alertButtonTitle"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSDictionary)titles
{
  return self->_titles;
}

- (NSDictionary)subtitles
{
  return self->_subtitles;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSNumber)ageRating
{
  return self->_ageRating;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (ASCOffer)alertButtonOffer
{
  return self->_alertButtonOffer;
}

- (NSString)alertButtonTitle
{
  return self->_alertButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertButtonOffer, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAlertOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAlertOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAlertOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAlertOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
