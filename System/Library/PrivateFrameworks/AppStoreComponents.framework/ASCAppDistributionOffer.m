@implementation ASCAppDistributionOffer

- (ASCAppDistributionOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 appVersionId:(id)a9 distributorId:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ASCAppDistributionOffer *v23;
  uint64_t v24;
  ASCAdamID *id;
  uint64_t v26;
  NSDictionary *titles;
  uint64_t v28;
  NSDictionary *subtitles;
  uint64_t v30;
  NSArray *metrics;
  uint64_t v32;
  NSString *appVersionId;
  uint64_t v34;
  NSString *distributorId;
  objc_super v37;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)ASCAppDistributionOffer;
  v23 = -[ASCAppDistributionOffer init](&v37, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    id = v23->_id;
    v23->_id = (ASCAdamID *)v24;

    v26 = objc_msgSend(v17, "copy");
    titles = v23->_titles;
    v23->_titles = (NSDictionary *)v26;

    v28 = objc_msgSend(v18, "copy");
    subtitles = v23->_subtitles;
    v23->_subtitles = (NSDictionary *)v28;

    v23->_flags = a6;
    objc_storeStrong((id *)&v23->_ageRating, a7);
    v30 = objc_msgSend(v20, "copy");
    metrics = v23->_metrics;
    v23->_metrics = (NSArray *)v30;

    v32 = objc_msgSend(v21, "copy");
    appVersionId = v23->_appVersionId;
    v23->_appVersionId = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    distributorId = v23->_distributorId;
    v23->_distributorId = (NSString *)v34;

  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAppDistributionOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  ASCAppDistributionOffer *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

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
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appVersionId"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distributorId"));
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
            {
              self = -[ASCAppDistributionOffer initWithID:titles:subtitles:flags:ageRating:metrics:appVersionId:distributorId:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:appVersionId:distributorId:", v5, v6, v7, v8, v9, v10, v11, v12);
              v14 = self;
            }
            else
            {
              v55 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
              if (v55)
                -[ASCAppDistributionOffer initWithCoder:].cold.6(v55, v56, v57, v58, v59, v60, v61, v62);
              v14 = 0;
            }

          }
          else
          {
            v47 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v47)
              -[ASCAppDistributionOffer initWithCoder:].cold.5(v47, v48, v49, v50, v51, v52, v53, v54);
            v14 = 0;
          }

        }
        else
        {
          v39 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v39)
            -[ASCAppDistributionOffer initWithCoder:].cold.4(v39, v40, v41, v42, v43, v44, v45, v46);
          v14 = 0;
        }

      }
      else
      {
        v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v31)
          -[ASCAppDistributionOffer initWithCoder:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);
        v14 = 0;
      }

    }
    else
    {
      v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v23)
        -[ASCAppDistributionOffer initWithCoder:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
      v14 = 0;
    }

  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v15)
      -[ASCAppDistributionOffer initWithCoder:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = 0;
  }

  return v14;
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
  id v11;

  v4 = a3;
  -[ASCAppDistributionOffer id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCAppDistributionOffer titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titles"));

  -[ASCAppDistributionOffer subtitles](self, "subtitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitles"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAppDistributionOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCAppDistributionOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ageRating"));

  -[ASCAppDistributionOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("metrics"));

  -[ASCAppDistributionOffer appVersionId](self, "appVersionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("appVersionId"));

  -[ASCAppDistributionOffer distributorId](self, "distributorId");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("distributorId"));

}

- (ASCAppDistributionOffer)offerWithMetrics:(id)a3
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

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[ASCAppDistributionOffer id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppDistributionOffer titles](self, "titles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppDistributionOffer subtitles](self, "subtitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASCAppDistributionOffer flags](self, "flags");
  -[ASCAppDistributionOffer ageRating](self, "ageRating");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppDistributionOffer appVersionId](self, "appVersionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppDistributionOffer distributorId](self, "distributorId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithID:titles:subtitles:flags:ageRating:metrics:appVersionId:distributorId:", v6, v7, v8, v9, v10, v4, v11, v12);

  return (ASCAppDistributionOffer *)v13;
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
  unint64_t v11;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCAppDistributionOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCAppDistributionOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCAppDistributionOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCAppDistributionOffer flags](self, "flags"));
  -[ASCAppDistributionOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCAppDistributionOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCAppDistributionOffer appVersionId](self, "appVersionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCAppDistributionOffer distributorId](self, "distributorId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  v11 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v11;
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
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

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
    -[ASCAppDistributionOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCAppDistributionOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCAppDistributionOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_36;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_36;
            }
            v18 = -[ASCAppDistributionOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCAppDistributionOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              v47 = v19;
              if (v19 && v20)
              {
                v22 = v19;
                v23 = v21;
                v24 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v23;
                v19 = v47;
                if (v24)
                {
LABEL_27:
                  v45 = v21;
                  -[ASCAppDistributionOffer metrics](self, "metrics");
                  v25 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = (void *)v26;
                  v46 = (void *)v25;
                  if (v25 && v26)
                  {
                    v28 = (void *)v26;
                    v29 = objc_msgSend(v46, "isEqual:", v26);
                    v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      v43 = v27;
                      -[ASCAppDistributionOffer appVersionId](self, "appVersionId");
                      v30 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "appVersionId");
                      v31 = objc_claimAutoreleasedReturnValue();
                      v32 = (void *)v31;
                      v44 = (void *)v30;
                      if (v30 && v31)
                      {
                        v33 = (void *)v31;
                        v34 = objc_msgSend(v44, "isEqual:", v31);
                        v32 = v33;
                        if (v34)
                          goto LABEL_33;
                      }
                      else if (v30 == v31)
                      {
LABEL_33:
                        -[ASCAppDistributionOffer distributorId](self, "distributorId", v32);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v7, "distributorId");
                        v36 = objc_claimAutoreleasedReturnValue();
                        v37 = (void *)v36;
                        if (v35 && v36)
                        {
                          v38 = (void *)v36;
                          v39 = objc_msgSend(v35, "isEqual:", v36);
                          v37 = v38;
                          v40 = v35;
                          v17 = v39;
                        }
                        else
                        {
                          v40 = v35;
                          v17 = v35 == (void *)v36;
                        }

                        v32 = v42;
                        goto LABEL_45;
                      }
                      v17 = 0;
LABEL_45:

                      v27 = v43;
                      goto LABEL_46;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_46:

                  v21 = v45;
                  v19 = v47;
                  goto LABEL_47;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_47:

              goto LABEL_48;
            }
LABEL_36:
            v17 = 0;
LABEL_48:

            goto LABEL_49;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_49:

        goto LABEL_50;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_50:

    goto LABEL_51;
  }
  v17 = 0;
LABEL_51:

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

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAppDistributionOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCAppDistributionOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCAppDistributionOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCAppDistributionOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCAppDistributionOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCAppDistributionOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCAppDistributionOffer appVersionId](self, "appVersionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("appVersionId"));

  -[ASCAppDistributionOffer distributorId](self, "distributorId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("distributorId"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
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

- (NSString)appVersionId
{
  return self->_appVersionId;
}

- (NSString)distributorId
{
  return self->_distributorId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributorId, 0);
  objc_storeStrong((id *)&self->_appVersionId, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppDistributionOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppDistributionOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppDistributionOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppDistributionOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppDistributionOffer because appVersionId was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppDistributionOffer because distributorId was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
