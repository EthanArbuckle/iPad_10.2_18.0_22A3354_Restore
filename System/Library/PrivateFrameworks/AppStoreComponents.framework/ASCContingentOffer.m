@implementation ASCContingentOffer

- (ASCContingentOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 organicOffer:(id)a9 streamlinedOffer:(id)a10 offerID:(id)a11 iapItemID:(id)a12 iapItemName:(id)a13 iapProductName:(id)a14 offerType:(int64_t)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  ASCContingentOffer *v29;
  uint64_t v30;
  ASCAdamID *id;
  uint64_t v32;
  NSDictionary *titles;
  uint64_t v34;
  NSDictionary *subtitles;
  uint64_t v36;
  NSArray *metrics;
  uint64_t v38;
  ASCOffer *organicOffer;
  uint64_t v40;
  ASCOffer *streamlinedOffer;
  uint64_t v42;
  NSString *offerID;
  uint64_t v44;
  NSNumber *iapItemID;
  uint64_t v46;
  NSString *iapItemName;
  uint64_t v48;
  NSString *iapProductName;
  id v53;
  id v54;
  id v55;
  objc_super v56;

  v54 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v53 = a7;
  v55 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = v20;
  v27 = a13;
  v28 = a14;
  v56.receiver = self;
  v56.super_class = (Class)ASCContingentOffer;
  v29 = -[ASCContingentOffer init](&v56, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v54, "copy");
    id = v29->_id;
    v29->_id = (ASCAdamID *)v30;

    v32 = objc_msgSend(v19, "copy");
    titles = v29->_titles;
    v29->_titles = (NSDictionary *)v32;

    v34 = objc_msgSend(v26, "copy");
    subtitles = v29->_subtitles;
    v29->_subtitles = (NSDictionary *)v34;

    v29->_flags = a6;
    objc_storeStrong((id *)&v29->_ageRating, v21);
    v36 = objc_msgSend(v55, "copy");
    metrics = v29->_metrics;
    v29->_metrics = (NSArray *)v36;

    v38 = objc_msgSend(v22, "copyWithZone:", 0);
    organicOffer = v29->_organicOffer;
    v29->_organicOffer = (ASCOffer *)v38;

    v40 = objc_msgSend(v23, "copyWithZone:", 0);
    streamlinedOffer = v29->_streamlinedOffer;
    v29->_streamlinedOffer = (ASCOffer *)v40;

    v42 = objc_msgSend(v24, "copy");
    offerID = v29->_offerID;
    v29->_offerID = (NSString *)v42;

    v44 = objc_msgSend(v25, "copy");
    iapItemID = v29->_iapItemID;
    v29->_iapItemID = (NSNumber *)v44;

    v46 = objc_msgSend(v27, "copy");
    iapItemName = v29->_iapItemName;
    v29->_iapItemName = (NSString *)v46;

    v48 = objc_msgSend(v28, "copy");
    iapProductName = v29->_iapProductName;
    v29->_iapProductName = (NSString *)v48;

    v29->_offerType = a15;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCContingentOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ASCContingentOffer *v16;
  void *v17;
  ASCContingentOffer *v18;
  void *v19;
  ASCContingentOffer *v20;
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
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL8 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL8 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL8 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;

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
          ASCOfferDecodeForKey(v4, CFSTR("organicOffer"));
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
          {
            v99 = (void *)v11;
            v97 = v9;
            ASCOfferDecodeForKey(v4, CFSTR("streamlinedOffer"));
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iapItemID"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iapItemName"));
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                if (v96)
                {
                  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iapProductName"));
                  v15 = objc_claimAutoreleasedReturnValue();
                  if (v15)
                  {
                    v94 = v15;
                    v95 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offerType"));
                    v16 = self;
                    v17 = (void *)v15;
                    v9 = v97;
                    v18 = -[ASCContingentOffer initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemName:iapProductName:offerType:](v16, "initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemName:iapProductName:offerType:", v5, v6, v7, v8, v97, v10, v99, v98, v13, v14, v96, v94, v95);
                    v19 = v17;
                    self = v18;
                    v20 = v18;
                  }
                  else
                  {
                    v85 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                    v9 = v97;
                    if (v85)
                      -[ASCContingentOffer initWithCoder:].cold.9(v85, v86, v87, v88, v89, v90, v91, v92);
                    v20 = 0;
                    v19 = 0;
                  }

                }
                else
                {
                  v77 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                  if (v77)
                    -[ASCContingentOffer initWithCoder:].cold.8(v77, v78, v79, v80, v81, v82, v83, v84);
                  v20 = 0;
                }

              }
              else
              {
                v69 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                if (v69)
                  -[ASCContingentOffer initWithCoder:].cold.7(v69, v70, v71, v72, v73, v74, v75, v76);
                v20 = 0;
              }

            }
            else
            {
              v61 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
              if (v61)
                -[ASCContingentOffer initWithCoder:].cold.6(v61, v62, v63, v64, v65, v66, v67, v68);
              v20 = 0;
            }

            v12 = v99;
          }
          else
          {
            v53 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v53)
              -[ASCContingentOffer initWithCoder:].cold.5(v53, v54, v55, v56, v57, v58, v59, v60);
            v20 = 0;
          }

        }
        else
        {
          v45 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v45)
            -[ASCContingentOffer initWithCoder:].cold.4(v45, v46, v47, v48, v49, v50, v51, v52);
          v20 = 0;
        }

      }
      else
      {
        v37 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v37)
          -[ASCContingentOffer initWithCoder:].cold.3(v37, v38, v39, v40, v41, v42, v43, v44);
        v20 = 0;
      }

    }
    else
    {
      v29 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v29)
        -[ASCContingentOffer initWithCoder:].cold.2(v29, v30, v31, v32, v33, v34, v35, v36);
      v20 = 0;
    }

  }
  else
  {
    v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v21)
      -[ASCContingentOffer initWithCoder:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v15;

  v15 = a3;
  -[ASCContingentOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("id"));

  -[ASCContingentOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("titles"));

  -[ASCContingentOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("subtitles"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[ASCContingentOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCContingentOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("ageRating"));

  -[ASCContingentOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("metrics"));

  -[ASCContingentOffer organicOffer](self, "organicOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("organicOffer"));

  -[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("streamlinedOffer"));

  -[ASCContingentOffer offerID](self, "offerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("offerID"));

  -[ASCContingentOffer iapItemID](self, "iapItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("iapItemID"));

  -[ASCContingentOffer iapItemName](self, "iapItemName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("iapItemName"));

  -[ASCContingentOffer iapProductName](self, "iapProductName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("iapProductName"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[ASCContingentOffer offerType](self, "offerType"), CFSTR("offerType"));
}

- (ASCContingentOffer)offerWithMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  -[ASCContingentOffer id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer titles](self, "titles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer subtitles](self, "subtitles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ASCContingentOffer flags](self, "flags");
  -[ASCContingentOffer ageRating](self, "ageRating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer organicOffer](self, "organicOffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer offerID](self, "offerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer iapItemID](self, "iapItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer iapItemName](self, "iapItemName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCContingentOffer iapProductName](self, "iapProductName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemName:iapProductName:offerType:", v5, v17, v16, v14, v6, v18, v13, v7, v8, v9, v10, v11, -[ASCContingentOffer offerType](self, "offerType"));

  return (ASCContingentOffer *)v15;
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
  void *v13;
  void *v14;
  unint64_t v15;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCContingentOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCContingentOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCContingentOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCContingentOffer flags](self, "flags"));
  -[ASCContingentOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCContingentOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCContingentOffer organicOffer](self, "organicOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  -[ASCContingentOffer offerID](self, "offerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  -[ASCContingentOffer iapItemID](self, "iapItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  -[ASCContingentOffer iapItemName](self, "iapItemName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  -[ASCContingentOffer iapProductName](self, "iapProductName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v14);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCContingentOffer offerType](self, "offerType"));
  v15 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v15;
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
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int64_t v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

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
    -[ASCContingentOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCContingentOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCContingentOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_49;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_49;
            }
            v18 = -[ASCContingentOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCContingentOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              if (v19 && v20)
              {
                v22 = v19;
                v66 = v16;
                v23 = v19;
                v24 = v21;
                v25 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v24;
                v19 = v23;
                v16 = v66;
                if (v25)
                {
LABEL_27:
                  v64 = v21;
                  v65 = v19;
                  -[ASCContingentOffer metrics](self, "metrics");
                  v26 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v27 = objc_claimAutoreleasedReturnValue();
                  v28 = (void *)v27;
                  v68 = (void *)v26;
                  if (v26 && v27)
                  {
                    v29 = (void *)v27;
                    v30 = objc_msgSend(v68, "isEqual:", v27);
                    v28 = v29;
                    if (v30)
                    {
LABEL_30:
                      v62 = v28;
                      -[ASCContingentOffer organicOffer](self, "organicOffer");
                      v31 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "organicOffer");
                      v32 = objc_claimAutoreleasedReturnValue();
                      v33 = (void *)v32;
                      v63 = (void *)v31;
                      if (v31 && v32)
                      {
                        v34 = (void *)v32;
                        v35 = objc_msgSend(v63, "isEqual:", v32);
                        v33 = v34;
                        if (v35)
                        {
LABEL_33:
                          v60 = v33;
                          -[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer");
                          v36 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v7, "streamlinedOffer");
                          v37 = objc_claimAutoreleasedReturnValue();
                          v38 = (void *)v37;
                          v61 = (void *)v36;
                          if (v36 && v37)
                          {
                            v39 = (void *)v37;
                            v40 = objc_msgSend(v61, "isEqual:", v37);
                            v38 = v39;
                            if (v40)
                            {
LABEL_36:
                              v58 = v38;
                              -[ASCContingentOffer offerID](self, "offerID");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "offerID");
                              v42 = objc_claimAutoreleasedReturnValue();
                              v59 = v41;
                              v57 = (void *)v42;
                              if (v41 && v42)
                              {
                                if (objc_msgSend(v41, "isEqual:", v42))
                                {
LABEL_39:
                                  -[ASCContingentOffer iapItemID](self, "iapItemID");
                                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v7, "iapItemID");
                                  v44 = objc_claimAutoreleasedReturnValue();
                                  v55 = (void *)v44;
                                  v56 = v43;
                                  if (v43 && v44)
                                  {
                                    if (objc_msgSend(v43, "isEqual:", v44))
                                    {
LABEL_42:
                                      -[ASCContingentOffer iapItemName](self, "iapItemName");
                                      v45 = objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v7, "iapItemName");
                                      v46 = objc_claimAutoreleasedReturnValue();
                                      v54 = (void *)v45;
                                      if (v45 && v46)
                                      {
                                        v47 = (void *)v46;
                                        if (objc_msgSend(v54, "isEqual:", v46))
                                        {
LABEL_45:
                                          v67 = v16;
                                          -[ASCContingentOffer iapProductName](self, "iapProductName");
                                          v48 = objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v7, "iapProductName");
                                          v49 = objc_claimAutoreleasedReturnValue();
                                          v53 = (void *)v48;
                                          if (v48 && v49)
                                          {
                                            v50 = (void *)v49;
                                            if (objc_msgSend(v53, "isEqual:", v49))
                                            {
LABEL_48:
                                              v51 = -[ASCContingentOffer offerType](self, "offerType");
                                              v17 = v51 == objc_msgSend(v7, "offerType");
LABEL_66:

                                              v16 = v67;
                                              goto LABEL_67;
                                            }
                                          }
                                          else
                                          {
                                            v50 = (void *)v49;
                                            if (v53 == (void *)v49)
                                              goto LABEL_48;
                                          }
                                          v17 = 0;
                                          goto LABEL_66;
                                        }
                                      }
                                      else
                                      {
                                        v47 = (void *)v46;
                                        if (v54 == (void *)v46)
                                          goto LABEL_45;
                                      }
                                      v17 = 0;
LABEL_67:

                                      goto LABEL_68;
                                    }
                                  }
                                  else if (v43 == (void *)v44)
                                  {
                                    goto LABEL_42;
                                  }
                                  v17 = 0;
LABEL_68:

                                  goto LABEL_69;
                                }
                              }
                              else if (v41 == (void *)v42)
                              {
                                goto LABEL_39;
                              }
                              v17 = 0;
LABEL_69:

                              v38 = v58;
                              goto LABEL_70;
                            }
                          }
                          else if (v36 == v37)
                          {
                            goto LABEL_36;
                          }
                          v17 = 0;
LABEL_70:

                          v33 = v60;
                          goto LABEL_71;
                        }
                      }
                      else if (v31 == v32)
                      {
                        goto LABEL_33;
                      }
                      v17 = 0;
LABEL_71:

                      v28 = v62;
                      goto LABEL_72;
                    }
                  }
                  else if (v26 == v27)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_72:

                  v21 = v64;
                  v19 = v65;
                  goto LABEL_73;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_73:

              goto LABEL_74;
            }
LABEL_49:
            v17 = 0;
LABEL_74:

            goto LABEL_75;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_75:

        goto LABEL_76;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_76:

    goto LABEL_77;
  }
  v17 = 0;
LABEL_77:

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
  void *v15;
  void *v16;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCContingentOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCContingentOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCContingentOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCContingentOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCContingentOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCContingentOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCContingentOffer organicOffer](self, "organicOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("organicOffer"));

  -[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("streamlinedOffer"));

  -[ASCContingentOffer offerID](self, "offerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("offerID"));

  -[ASCContingentOffer iapItemID](self, "iapItemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, CFSTR("iapItemID"));

  -[ASCContingentOffer iapItemName](self, "iapItemName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, CFSTR("iapItemName"));

  -[ASCContingentOffer iapProductName](self, "iapProductName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, CFSTR("iapProductName"));

  -[ASCDescriber addInteger:withName:](v3, "addInteger:withName:", -[ASCContingentOffer offerType](self, "offerType"), CFSTR("offerType"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
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

- (ASCOffer)organicOffer
{
  return self->_organicOffer;
}

- (ASCOffer)streamlinedOffer
{
  return self->_streamlinedOffer;
}

- (NSString)offerID
{
  return self->_offerID;
}

- (NSNumber)iapItemID
{
  return self->_iapItemID;
}

- (NSString)iapItemName
{
  return self->_iapItemName;
}

- (NSString)iapProductName
{
  return self->_iapProductName;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iapProductName, 0);
  objc_storeStrong((id *)&self->_iapItemName, 0);
  objc_storeStrong((id *)&self->_iapItemID, 0);
  objc_storeStrong((id *)&self->_offerID, 0);
  objc_storeStrong((id *)&self->_streamlinedOffer, 0);
  objc_storeStrong((id *)&self->_organicOffer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because organicOffer was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because offerID was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because iapItemID was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because iapItemName was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCContingentOffer because iapProductName was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
