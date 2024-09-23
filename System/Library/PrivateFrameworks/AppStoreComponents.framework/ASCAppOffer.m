@implementation ASCAppOffer

- (ASCAppOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 baseBuyParams:(id)a9 metricsBuyParams:(id)a10 additionalHeaders:(id)a11 preflightPackageURL:(id)a12 bundleID:(id)a13 itemName:(id)a14 vendorName:(id)a15 capabilities:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  ASCAppOffer *v31;
  uint64_t v32;
  ASCAdamID *id;
  uint64_t v34;
  NSDictionary *titles;
  uint64_t v36;
  NSDictionary *subtitles;
  uint64_t v38;
  NSArray *metrics;
  uint64_t v40;
  NSString *baseBuyParams;
  uint64_t v42;
  NSString *metricsBuyParams;
  uint64_t v44;
  NSDictionary *additionalHeaders;
  uint64_t v46;
  NSURL *preflightPackageURL;
  uint64_t v48;
  NSString *bundleID;
  uint64_t v50;
  NSString *itemName;
  uint64_t v52;
  NSString *vendorName;
  uint64_t v54;
  NSArray *capabilities;
  id v58;
  id v60;
  id v61;
  id v62;
  id v63;
  objc_super v64;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v58 = a7;
  v60 = a7;
  v23 = a8;
  v24 = v21;
  v63 = a9;
  v62 = a10;
  v25 = v22;
  v61 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v30 = a16;
  v64.receiver = self;
  v64.super_class = (Class)ASCAppOffer;
  v31 = -[ASCAppOffer init](&v64, sel_init);
  if (v31)
  {
    v32 = objc_msgSend(v20, "copy");
    id = v31->_id;
    v31->_id = (ASCAdamID *)v32;

    v34 = objc_msgSend(v24, "copy");
    titles = v31->_titles;
    v31->_titles = (NSDictionary *)v34;

    v36 = objc_msgSend(v25, "copy");
    subtitles = v31->_subtitles;
    v31->_subtitles = (NSDictionary *)v36;

    v31->_flags = a6;
    objc_storeStrong((id *)&v31->_ageRating, v58);
    v38 = objc_msgSend(v23, "copy");
    metrics = v31->_metrics;
    v31->_metrics = (NSArray *)v38;

    v40 = objc_msgSend(v63, "copy");
    baseBuyParams = v31->_baseBuyParams;
    v31->_baseBuyParams = (NSString *)v40;

    v42 = objc_msgSend(v62, "copy");
    metricsBuyParams = v31->_metricsBuyParams;
    v31->_metricsBuyParams = (NSString *)v42;

    v44 = objc_msgSend(v61, "copy");
    additionalHeaders = v31->_additionalHeaders;
    v31->_additionalHeaders = (NSDictionary *)v44;

    v46 = objc_msgSend(v26, "copy");
    preflightPackageURL = v31->_preflightPackageURL;
    v31->_preflightPackageURL = (NSURL *)v46;

    v48 = objc_msgSend(v27, "copy");
    bundleID = v31->_bundleID;
    v31->_bundleID = (NSString *)v48;

    v50 = objc_msgSend(v28, "copy");
    itemName = v31->_itemName;
    v31->_itemName = (NSString *)v50;

    v52 = objc_msgSend(v29, "copy");
    vendorName = v31->_vendorName;
    v31->_vendorName = (NSString *)v52;

    v54 = objc_msgSend(v30, "copy");
    capabilities = v31->_capabilities;
    v31->_capabilities = (NSArray *)v54;

  }
  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAppOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  ASCAppOffer *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BOOL8 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL8 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BOOL8 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;

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
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseBuyParams"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metricsBuyParams"));
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            if (v102)
            {
              v95 = v8;
              v98 = v9;
              v12 = objc_alloc(MEMORY[0x1E0C99E60]);
              v13 = objc_opt_class();
              v97 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
              objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preflightPackageURL"));
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              if (v99)
              {
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                if (v96)
                {
                  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
                  v14 = objc_claimAutoreleasedReturnValue();
                  if (v14)
                  {
                    v93 = objc_alloc(MEMORY[0x1E0C99E60]);
                    v15 = objc_opt_class();
                    v94 = (void *)objc_msgSend(v93, "initWithObjects:", v15, objc_opt_class(), 0);
                    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v94, CFSTR("capabilities"));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    self = -[ASCAppOffer initWithID:titles:subtitles:flags:ageRating:metrics:baseBuyParams:metricsBuyParams:additionalHeaders:preflightPackageURL:bundleID:itemName:vendorName:capabilities:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:baseBuyParams:metricsBuyParams:additionalHeaders:preflightPackageURL:bundleID:itemName:vendorName:capabilities:", v5, v6, v7, v95, v98, v10, v11, v102, v101, v100, v99, v96, v14, v16);

                    v17 = (void *)v14;
                    v9 = v98;
                    v18 = self;
                    v19 = (void *)v97;
                  }
                  else
                  {
                    v84 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                    if (v84)
                      -[ASCAppOffer initWithCoder:].cold.9(v84, v85, v86, v87, v88, v89, v90, v91);
                    v18 = 0;
                    v19 = (void *)v97;
                    v9 = v98;
                    v17 = 0;
                  }

                }
                else
                {
                  v76 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                  if (v76)
                    -[ASCAppOffer initWithCoder:].cold.8(v76, v77, v78, v79, v80, v81, v82, v83);
                  v18 = 0;
                  v19 = (void *)v97;
                  v9 = v98;
                }

              }
              else
              {
                v68 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                if (v68)
                  -[ASCAppOffer initWithCoder:].cold.7(v68, v69, v70, v71, v72, v73, v74, v75);
                v18 = 0;
                v19 = (void *)v97;
                v9 = v98;
              }

            }
            else
            {
              v60 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
              if (v60)
                -[ASCAppOffer initWithCoder:].cold.6(v60, v61, v62, v63, v64, v65, v66, v67);
              v18 = 0;
            }

          }
          else
          {
            v52 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v52)
              -[ASCAppOffer initWithCoder:].cold.5(v52, v53, v54, v55, v56, v57, v58, v59);
            v18 = 0;
          }

        }
        else
        {
          v44 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v44)
            -[ASCAppOffer initWithCoder:].cold.4(v44, v45, v46, v47, v48, v49, v50, v51);
          v18 = 0;
        }

      }
      else
      {
        v36 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v36)
          -[ASCAppOffer initWithCoder:].cold.3(v36, v37, v38, v39, v40, v41, v42, v43);
        v18 = 0;
      }

    }
    else
    {
      v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v28)
        -[ASCAppOffer initWithCoder:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);
      v18 = 0;
    }

  }
  else
  {
    v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v20)
      -[ASCAppOffer initWithCoder:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    v18 = 0;
  }

  return v18;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[ASCAppOffer id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCAppOffer titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titles"));

  -[ASCAppOffer subtitles](self, "subtitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitles"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAppOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCAppOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ageRating"));

  -[ASCAppOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("metrics"));

  -[ASCAppOffer baseBuyParams](self, "baseBuyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("baseBuyParams"));

  -[ASCAppOffer metricsBuyParams](self, "metricsBuyParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("metricsBuyParams"));

  -[ASCAppOffer additionalHeaders](self, "additionalHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("additionalHeaders"));

  -[ASCAppOffer preflightPackageURL](self, "preflightPackageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("preflightPackageURL"));

  -[ASCAppOffer bundleID](self, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("bundleID"));

  -[ASCAppOffer itemName](self, "itemName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("itemName"));

  -[ASCAppOffer vendorName](self, "vendorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("vendorName"));

  -[ASCAppOffer capabilities](self, "capabilities");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("capabilities"));

}

- (ASCAppOffer)offerWithMetrics:(id)a3
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
  void *v14;
  int64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v18 = a3;
  v16 = objc_alloc((Class)objc_opt_class());
  -[ASCAppOffer id](self, "id");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer titles](self, "titles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer subtitles](self, "subtitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ASCAppOffer flags](self, "flags");
  -[ASCAppOffer ageRating](self, "ageRating");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer baseBuyParams](self, "baseBuyParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer metricsBuyParams](self, "metricsBuyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer additionalHeaders](self, "additionalHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer preflightPackageURL](self, "preflightPackageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer bundleID](self, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer itemName](self, "itemName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer vendorName](self, "vendorName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOffer capabilities](self, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "initWithID:titles:subtitles:flags:ageRating:metrics:baseBuyParams:metricsBuyParams:additionalHeaders:preflightPackageURL:bundleID:itemName:vendorName:capabilities:", v20, v19, v4, v15, v5, v18, v14, v6, v7, v8, v9, v10, v11, v12);

  return (ASCAppOffer *)v17;
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
  void *v15;
  void *v16;
  unint64_t v17;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCAppOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCAppOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCAppOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCAppOffer flags](self, "flags"));
  -[ASCAppOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCAppOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCAppOffer baseBuyParams](self, "baseBuyParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCAppOffer metricsBuyParams](self, "metricsBuyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  -[ASCAppOffer additionalHeaders](self, "additionalHeaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  -[ASCAppOffer preflightPackageURL](self, "preflightPackageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  -[ASCAppOffer bundleID](self, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  -[ASCAppOffer itemName](self, "itemName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v14);

  -[ASCAppOffer vendorName](self, "vendorName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v15);

  -[ASCAppOffer capabilities](self, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v16);

  v17 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v17;
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
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

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
    -[ASCAppOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCAppOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCAppOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_54;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_54;
            }
            v18 = -[ASCAppOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCAppOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              if (v19 && v20)
              {
                v22 = v19;
                v72 = v14;
                v23 = v16;
                v24 = v19;
                v25 = v21;
                v26 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v25;
                v19 = v24;
                v16 = v23;
                v14 = v72;
                if (v26)
                {
LABEL_27:
                  v70 = v21;
                  v71 = v19;
                  -[ASCAppOffer metrics](self, "metrics");
                  v27 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = (void *)v28;
                  v74 = (void *)v27;
                  if (v27 && v28)
                  {
                    v30 = (void *)v28;
                    v31 = objc_msgSend(v74, "isEqual:", v28);
                    v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      v68 = v29;
                      -[ASCAppOffer baseBuyParams](self, "baseBuyParams");
                      v32 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "baseBuyParams");
                      v33 = objc_claimAutoreleasedReturnValue();
                      v34 = (void *)v33;
                      v69 = (void *)v32;
                      if (v32 && v33)
                      {
                        v35 = (void *)v33;
                        v36 = objc_msgSend(v69, "isEqual:", v33);
                        v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          v66 = v34;
                          -[ASCAppOffer metricsBuyParams](self, "metricsBuyParams");
                          v37 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v7, "metricsBuyParams");
                          v38 = objc_claimAutoreleasedReturnValue();
                          v39 = (void *)v38;
                          v67 = (void *)v37;
                          if (v37 && v38)
                          {
                            v40 = (void *)v38;
                            v41 = objc_msgSend(v67, "isEqual:", v38);
                            v39 = v40;
                            if (v41)
                            {
LABEL_36:
                              v64 = v39;
                              -[ASCAppOffer additionalHeaders](self, "additionalHeaders");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "additionalHeaders");
                              v43 = objc_claimAutoreleasedReturnValue();
                              v65 = v42;
                              v63 = (void *)v43;
                              if (v42 && v43)
                              {
                                if (objc_msgSend(v42, "isEqual:", v43))
                                {
LABEL_39:
                                  -[ASCAppOffer preflightPackageURL](self, "preflightPackageURL");
                                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v7, "preflightPackageURL");
                                  v45 = objc_claimAutoreleasedReturnValue();
                                  v61 = (void *)v45;
                                  v62 = v44;
                                  if (v44 && v45)
                                  {
                                    if (objc_msgSend(v44, "isEqual:", v45))
                                    {
LABEL_42:
                                      -[ASCAppOffer bundleID](self, "bundleID");
                                      v46 = objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v7, "bundleID");
                                      v47 = objc_claimAutoreleasedReturnValue();
                                      v60 = (void *)v46;
                                      if (v46 && v47)
                                      {
                                        v48 = (void *)v47;
                                        if (objc_msgSend(v60, "isEqual:", v47))
                                        {
LABEL_45:
                                          v73 = v14;
                                          v59 = v16;
                                          -[ASCAppOffer itemName](self, "itemName");
                                          v49 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v7, "itemName");
                                          v50 = objc_claimAutoreleasedReturnValue();
                                          v51 = v49;
                                          v58 = (void *)v50;
                                          if (v49 && v50)
                                          {
                                            if (objc_msgSend(v49, "isEqual:", v50))
                                            {
LABEL_48:
                                              -[ASCAppOffer vendorName](self, "vendorName");
                                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v7, "vendorName");
                                              v56 = v52;
                                              v57 = (void *)objc_claimAutoreleasedReturnValue();
                                              if (v52 && v57)
                                              {
                                                if (objc_msgSend(v52, "isEqual:", v57))
                                                  goto LABEL_51;
                                              }
                                              else if (v52 == v57)
                                              {
LABEL_51:
                                                -[ASCAppOffer capabilities](self, "capabilities");
                                                v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v7, "capabilities");
                                                v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (v53 && v55)
                                                  v17 = objc_msgSend(v53, "isEqual:", v55);
                                                else
                                                  v17 = v53 == v55;

                                                goto LABEL_75;
                                              }
                                              v17 = 0;
LABEL_75:

                                              goto LABEL_76;
                                            }
                                          }
                                          else if (v49 == (void *)v50)
                                          {
                                            goto LABEL_48;
                                          }
                                          v17 = 0;
LABEL_76:

                                          v16 = v59;
                                          v14 = v73;
                                          goto LABEL_77;
                                        }
                                      }
                                      else
                                      {
                                        v48 = (void *)v47;
                                        if (v60 == (void *)v47)
                                          goto LABEL_45;
                                      }
                                      v17 = 0;
LABEL_77:

                                      goto LABEL_78;
                                    }
                                  }
                                  else if (v44 == (void *)v45)
                                  {
                                    goto LABEL_42;
                                  }
                                  v17 = 0;
LABEL_78:

                                  goto LABEL_79;
                                }
                              }
                              else if (v42 == (void *)v43)
                              {
                                goto LABEL_39;
                              }
                              v17 = 0;
LABEL_79:

                              v39 = v64;
                              goto LABEL_80;
                            }
                          }
                          else if (v37 == v38)
                          {
                            goto LABEL_36;
                          }
                          v17 = 0;
LABEL_80:

                          v34 = v66;
                          goto LABEL_81;
                        }
                      }
                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }
                      v17 = 0;
LABEL_81:

                      v29 = v68;
                      goto LABEL_82;
                    }
                  }
                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_82:

                  v21 = v70;
                  v19 = v71;
                  goto LABEL_83;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_83:

              goto LABEL_84;
            }
LABEL_54:
            v17 = 0;
LABEL_84:

            goto LABEL_85;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_85:

        goto LABEL_86;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_86:

    goto LABEL_87;
  }
  v17 = 0;
LABEL_87:

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
  void *v17;
  void *v18;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAppOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCAppOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCAppOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCAppOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCAppOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCAppOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCAppOffer baseBuyParams](self, "baseBuyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, CFSTR("baseBuyParams"));

  -[ASCAppOffer metricsBuyParams](self, "metricsBuyParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v11, CFSTR("metricsBuyParams"));

  -[ASCAppOffer additionalHeaders](self, "additionalHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("additionalHeaders"));

  -[ASCAppOffer preflightPackageURL](self, "preflightPackageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, CFSTR("preflightPackageURL"));

  -[ASCAppOffer bundleID](self, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, CFSTR("bundleID"));

  -[ASCAppOffer itemName](self, "itemName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, CFSTR("itemName"));

  -[ASCAppOffer vendorName](self, "vendorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v16, CFSTR("vendorName"));

  -[ASCAppOffer capabilities](self, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v17, CFSTR("capabilities"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
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

- (NSString)baseBuyParams
{
  return self->_baseBuyParams;
}

- (NSString)metricsBuyParams
{
  return self->_metricsBuyParams;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (NSURL)preflightPackageURL
{
  return self->_preflightPackageURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_preflightPackageURL, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_metricsBuyParams, 0);
  objc_storeStrong((id *)&self->_baseBuyParams, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because baseBuyParams was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because metricsBuyParams was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because bundleID was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because itemName was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCAppOffer because vendorName was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
