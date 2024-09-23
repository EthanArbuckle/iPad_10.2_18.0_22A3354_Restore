@implementation ASCStatefulOffer

- (ASCStatefulOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 defaultOffer:(id)a9 buyOffer:(id)a10 openOffer:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ASCStatefulOffer *v23;
  uint64_t v24;
  ASCAdamID *id;
  uint64_t v26;
  NSDictionary *titles;
  uint64_t v28;
  NSDictionary *subtitles;
  uint64_t v30;
  ASCOffer *defaultOffer;
  uint64_t v32;
  ASCOffer *buyOffer;
  uint64_t v34;
  ASCOffer *openOffer;
  id v37;
  id v38;
  objc_super v39;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v38 = a7;
  v37 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v39.receiver = self;
  v39.super_class = (Class)ASCStatefulOffer;
  v23 = -[ASCStatefulOffer init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy", v37, v38);
    id = v23->_id;
    v23->_id = (ASCAdamID *)v24;

    v26 = objc_msgSend(v18, "copy");
    titles = v23->_titles;
    v23->_titles = (NSDictionary *)v26;

    v28 = objc_msgSend(v19, "copy");
    subtitles = v23->_subtitles;
    v23->_subtitles = (NSDictionary *)v28;

    v23->_flags = a6;
    objc_storeStrong((id *)&v23->_ageRating, a7);
    objc_storeStrong((id *)&v23->_metrics, a8);
    v30 = objc_msgSend(v20, "copyWithZone:", 0);
    defaultOffer = v23->_defaultOffer;
    v23->_defaultOffer = (ASCOffer *)v30;

    v32 = objc_msgSend(v21, "copyWithZone:", 0);
    buyOffer = v23->_buyOffer;
    v23->_buyOffer = (ASCOffer *)v32;

    v34 = objc_msgSend(v22, "copyWithZone:", 0);
    openOffer = v23->_openOffer;
    v23->_openOffer = (ASCOffer *)v34;

  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCStatefulOffer)initWithCoder:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ASCStatefulOffer *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

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
          ASCOfferDecodeForKey(v4, CFSTR("defaultOffer"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            ASCOfferDecodeForKey(v4, CFSTR("buyOffer"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            ASCOfferDecodeForKey(v4, CFSTR("openOffer"));
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v8;
            v15 = v9;
            v16 = (void *)v13;
            self = -[ASCStatefulOffer initWithID:titles:subtitles:flags:ageRating:metrics:defaultOffer:buyOffer:openOffer:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:defaultOffer:buyOffer:openOffer:", v5, v6, v7, v14, v15, v10, v11, v12, v13);

            v9 = v15;
            v17 = self;
          }
          else
          {
            v50 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v50)
              -[ASCStatefulOffer initWithCoder:].cold.5(v50, v51, v52, v53, v54, v55, v56, v57);
            v17 = 0;
          }

        }
        else
        {
          v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v42)
            -[ASCStatefulOffer initWithCoder:].cold.4(v42, v43, v44, v45, v46, v47, v48, v49);
          v17 = 0;
        }

      }
      else
      {
        v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v34)
          -[ASCStatefulOffer initWithCoder:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
        v17 = 0;
      }

    }
    else
    {
      v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v26)
        -[ASCStatefulOffer initWithCoder:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
      v17 = 0;
    }

  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v18)
      -[ASCStatefulOffer initWithCoder:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v17 = 0;
  }

  return v17;
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
  id v12;

  v4 = a3;
  -[ASCStatefulOffer id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCStatefulOffer titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titles"));

  -[ASCStatefulOffer subtitles](self, "subtitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitles"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCStatefulOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCStatefulOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ageRating"));

  -[ASCStatefulOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("metrics"));

  -[ASCStatefulOffer defaultOffer](self, "defaultOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("defaultOffer"));

  -[ASCStatefulOffer buyOffer](self, "buyOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("buyOffer"));

  -[ASCStatefulOffer openOffer](self, "openOffer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("openOffer"));

}

- (ASCStatefulOffer)offerWithMetrics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[ASCStatefulOffer id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCStatefulOffer titles](self, "titles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCStatefulOffer subtitles](self, "subtitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASCStatefulOffer flags](self, "flags");
  -[ASCStatefulOffer ageRating](self, "ageRating");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCStatefulOffer defaultOffer](self, "defaultOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCStatefulOffer buyOffer](self, "buyOffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCStatefulOffer openOffer](self, "openOffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v5, "initWithID:titles:subtitles:flags:ageRating:metrics:defaultOffer:buyOffer:openOffer:", v6, v7, v8, v9, v10, v4, v11, v12, v13);

  return (ASCStatefulOffer *)v14;
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
  unint64_t v12;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCStatefulOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCStatefulOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCStatefulOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCStatefulOffer flags](self, "flags"));
  -[ASCStatefulOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCStatefulOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCStatefulOffer defaultOffer](self, "defaultOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCStatefulOffer buyOffer](self, "buyOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  -[ASCStatefulOffer openOffer](self, "openOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  v12 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v12;
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
  void *v43;
  char v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

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
    -[ASCStatefulOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCStatefulOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCStatefulOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_39;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_39;
            }
            v18 = -[ASCStatefulOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCStatefulOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              v54 = v19;
              if (v19 && v20)
              {
                v22 = v19;
                v23 = v21;
                v24 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v23;
                v19 = v54;
                if (v24)
                {
LABEL_27:
                  v52 = v21;
                  -[ASCStatefulOffer metrics](self, "metrics");
                  v25 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = (void *)v26;
                  v53 = (void *)v25;
                  if (v25 && v26)
                  {
                    v28 = (void *)v26;
                    v29 = objc_msgSend(v53, "isEqual:", v26);
                    v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      v50 = v27;
                      -[ASCStatefulOffer defaultOffer](self, "defaultOffer");
                      v30 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "defaultOffer");
                      v31 = objc_claimAutoreleasedReturnValue();
                      v32 = (void *)v31;
                      v51 = (void *)v30;
                      if (v30 && v31)
                      {
                        v33 = (void *)v31;
                        v34 = objc_msgSend(v51, "isEqual:", v31);
                        v32 = v33;
                        if (v34)
                        {
LABEL_33:
                          v48 = v32;
                          -[ASCStatefulOffer buyOffer](self, "buyOffer");
                          v35 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v7, "buyOffer");
                          v36 = objc_claimAutoreleasedReturnValue();
                          v37 = (void *)v36;
                          v49 = (void *)v35;
                          if (v35 && v36)
                          {
                            v38 = (void *)v36;
                            v39 = objc_msgSend(v49, "isEqual:", v36);
                            v37 = v38;
                            if (v39)
                              goto LABEL_36;
                          }
                          else if (v35 == v36)
                          {
LABEL_36:
                            -[ASCStatefulOffer openOffer](self, "openOffer", v37);
                            v40 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v7, "openOffer");
                            v41 = objc_claimAutoreleasedReturnValue();
                            v42 = (void *)v41;
                            if (v40 && v41)
                            {
                              v43 = (void *)v41;
                              v44 = objc_msgSend(v40, "isEqual:", v41);
                              v42 = v43;
                              v45 = v40;
                              v17 = v44;
                            }
                            else
                            {
                              v45 = v40;
                              v17 = v40 == (void *)v41;
                            }

                            v37 = v47;
                            goto LABEL_50;
                          }
                          v17 = 0;
LABEL_50:

                          v32 = v48;
                          goto LABEL_51;
                        }
                      }
                      else if (v30 == v31)
                      {
                        goto LABEL_33;
                      }
                      v17 = 0;
LABEL_51:

                      v27 = v50;
                      goto LABEL_52;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_52:

                  v21 = v52;
                  v19 = v54;
                  goto LABEL_53;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_53:

              goto LABEL_54;
            }
LABEL_39:
            v17 = 0;
LABEL_54:

            goto LABEL_55;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_55:

        goto LABEL_56;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_56:

    goto LABEL_57;
  }
  v17 = 0;
LABEL_57:

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

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCStatefulOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCStatefulOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCStatefulOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCStatefulOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCStatefulOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCStatefulOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCStatefulOffer defaultOffer](self, "defaultOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("defaultOffer"));

  -[ASCStatefulOffer buyOffer](self, "buyOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("buyOffer"));

  -[ASCStatefulOffer openOffer](self, "openOffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("openOffer"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
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

- (ASCOffer)defaultOffer
{
  return self->_defaultOffer;
}

- (ASCOffer)buyOffer
{
  return self->_buyOffer;
}

- (ASCOffer)openOffer
{
  return self->_openOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openOffer, 0);
  objc_storeStrong((id *)&self->_buyOffer, 0);
  objc_storeStrong((id *)&self->_defaultOffer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCStatefulOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCStatefulOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCStatefulOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCStatefulOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCStatefulOffer because defaultOffer was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
