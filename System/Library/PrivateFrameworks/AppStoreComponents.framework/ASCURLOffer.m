@implementation ASCURLOffer

- (ASCURLOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 url:(id)a9 isSensitive:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  ASCURLOffer *v22;
  uint64_t v23;
  ASCAdamID *id;
  uint64_t v25;
  NSDictionary *titles;
  uint64_t v27;
  NSDictionary *subtitles;
  uint64_t v29;
  NSArray *metrics;
  uint64_t v31;
  NSURL *url;
  objc_super v34;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ASCURLOffer;
  v22 = -[ASCURLOffer init](&v34, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    id = v22->_id;
    v22->_id = (ASCAdamID *)v23;

    v25 = objc_msgSend(v17, "copy");
    titles = v22->_titles;
    v22->_titles = (NSDictionary *)v25;

    v27 = objc_msgSend(v18, "copy");
    subtitles = v22->_subtitles;
    v22->_subtitles = (NSDictionary *)v27;

    v22->_flags = a6;
    objc_storeStrong((id *)&v22->_ageRating, a7);
    v29 = objc_msgSend(v20, "copy");
    metrics = v22->_metrics;
    v22->_metrics = (NSArray *)v29;

    v31 = objc_msgSend(v21, "copy");
    url = v22->_url;
    v22->_url = (NSURL *)v31;

    v22->_isSensitive = a10;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCURLOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  ASCURLOffer *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;

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
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            LOBYTE(v54) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSensitive"));
            self = -[ASCURLOffer initWithID:titles:subtitles:flags:ageRating:metrics:url:isSensitive:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:url:isSensitive:", v5, v6, v7, v8, v9, v10, v11, v54);
            v12 = self;
          }
          else
          {
            v45 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v45)
              -[ASCURLOffer initWithCoder:].cold.5(v45, v46, v47, v48, v49, v50, v51, v52);
            v12 = 0;
          }

        }
        else
        {
          v37 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v37)
            -[ASCURLOffer initWithCoder:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
          v12 = 0;
        }

      }
      else
      {
        v29 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v29)
          -[ASCURLOffer initWithCoder:].cold.3(v29, v30, v31, v32, v33, v34, v35, v36);
        v12 = 0;
      }

    }
    else
    {
      v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v21)
        -[ASCURLOffer initWithCoder:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
      v12 = 0;
    }

  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v13)
      -[ASCURLOffer initWithCoder:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ASCURLOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("id"));

  -[ASCURLOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("titles"));

  -[ASCURLOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("subtitles"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[ASCURLOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCURLOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("ageRating"));

  -[ASCURLOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("metrics"));

  -[ASCURLOffer url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("url"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ASCURLOffer isSensitive](self, "isSensitive"), CFSTR("isSensitive"));
}

- (ASCURLOffer)offerWithMetrics:(id)a3
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
  uint64_t v14;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[ASCURLOffer id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCURLOffer titles](self, "titles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCURLOffer subtitles](self, "subtitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASCURLOffer flags](self, "flags");
  -[ASCURLOffer ageRating](self, "ageRating");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCURLOffer url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = -[ASCURLOffer isSensitive](self, "isSensitive");
  v12 = (void *)objc_msgSend(v5, "initWithID:titles:subtitles:flags:ageRating:metrics:url:isSensitive:", v6, v7, v8, v9, v10, v4, v11, v14);

  return (ASCURLOffer *)v12;
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
  unint64_t v10;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCURLOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCURLOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCURLOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCURLOffer flags](self, "flags"));
  -[ASCURLOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCURLOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCURLOffer url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCURLOffer isSensitive](self, "isSensitive"));
  v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v10;
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
  char v17;
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
  BOOL v36;
  char v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

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
    -[ASCURLOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCURLOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCURLOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_34;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_34;
            }
            v18 = -[ASCURLOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCURLOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              v43 = v19;
              if (v19 && v20)
              {
                v22 = v19;
                v23 = v21;
                v24 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v23;
                v19 = v43;
                if (v24)
                {
LABEL_27:
                  v41 = v21;
                  -[ASCURLOffer metrics](self, "metrics");
                  v25 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = (void *)v26;
                  v42 = (void *)v25;
                  if (v25 && v26)
                  {
                    v28 = (void *)v26;
                    v29 = objc_msgSend(v42, "isEqual:", v26);
                    v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      v39 = v27;
                      -[ASCURLOffer url](self, "url");
                      v30 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "url");
                      v31 = objc_claimAutoreleasedReturnValue();
                      v32 = (void *)v31;
                      v40 = (void *)v30;
                      if (v30 && v31)
                      {
                        v33 = (void *)v31;
                        v34 = objc_msgSend(v40, "isEqual:", v31);
                        v32 = v33;
                        if (v34)
                        {
LABEL_33:
                          v35 = v32;
                          v36 = -[ASCURLOffer isSensitive](self, "isSensitive");
                          v37 = objc_msgSend(v7, "isSensitive");
                          v32 = v35;
                          v17 = v36 ^ v37 ^ 1;
LABEL_41:

                          v27 = v39;
                          goto LABEL_42;
                        }
                      }
                      else if (v30 == v31)
                      {
                        goto LABEL_33;
                      }
                      v17 = 0;
                      goto LABEL_41;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_42:

                  v21 = v41;
                  v19 = v43;
                  goto LABEL_43;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_43:

              goto LABEL_44;
            }
LABEL_34:
            v17 = 0;
LABEL_44:

            goto LABEL_45;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_46:

    goto LABEL_47;
  }
  v17 = 0;
LABEL_47:

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

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCURLOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCURLOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCURLOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCURLOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCURLOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCURLOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCURLOffer url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, CFSTR("url"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCURLOffer isSensitive](self, "isSensitive"), CFSTR("isSensitive"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
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

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCURLOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCURLOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCURLOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCURLOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCURLOffer because url was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
