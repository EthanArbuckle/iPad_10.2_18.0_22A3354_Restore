@implementation ASCLockup

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11 features:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  ASCLockup *v26;
  uint64_t v27;
  ASCAdamID *id;
  uint64_t v29;
  NSString *kind;
  uint64_t v31;
  ASCViewMetrics *metrics;
  uint64_t v33;
  ASCArtwork *icon;
  uint64_t v35;
  NSString *heading;
  uint64_t v37;
  NSString *title;
  uint64_t v39;
  NSString *subtitle;
  uint64_t v41;
  NSString *ageRating;
  uint64_t v43;
  ASCOffer *offer;
  uint64_t v45;
  NSArray *features;
  id v49;
  objc_super v50;

  v17 = a3;
  v49 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v50.receiver = self;
  v50.super_class = (Class)ASCLockup;
  v26 = -[ASCLockup init](&v50, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v17, "copy");
    id = v26->_id;
    v26->_id = (ASCAdamID *)v27;

    v29 = objc_msgSend(v49, "copy");
    kind = v26->_kind;
    v26->_kind = (NSString *)v29;

    v31 = objc_msgSend(v18, "copy");
    metrics = v26->_metrics;
    v26->_metrics = (ASCViewMetrics *)v31;

    v33 = objc_msgSend(v19, "copy");
    icon = v26->_icon;
    v26->_icon = (ASCArtwork *)v33;

    v35 = objc_msgSend(v20, "copy");
    heading = v26->_heading;
    v26->_heading = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    title = v26->_title;
    v26->_title = (NSString *)v37;

    v39 = objc_msgSend(v22, "copy");
    subtitle = v26->_subtitle;
    v26->_subtitle = (NSString *)v39;

    v41 = objc_msgSend(v23, "copy");
    ageRating = v26->_ageRating;
    v26->_ageRating = (NSString *)v41;

    v43 = objc_msgSend(v24, "copyWithZone:", 0);
    offer = v26->_offer;
    v26->_offer = (ASCOffer *)v43;

    v45 = objc_msgSend(v25, "copy");
    features = v26->_features;
    v26->_features = (NSArray *)v45;

  }
  return v26;
}

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11
{
  return -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:](self, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:", a3, a4, a5, a6, a7, a8, a9, a10, a11, MEMORY[0x1E0C9AA60]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  ASCLockup *v18;
  ASCLockup *v19;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heading"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ageRating"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ASCOfferDecodeForKey(v4, CFSTR("offer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ASCLockupFeaturesDecodeForKey(v4, CFSTR("features"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v5;
      v13 = v6;
      v40 = v6;
      v14 = (void *)v7;
      v15 = v7;
      v16 = v5;
      v17 = (void *)v8;
      v18 = -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:](self, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:", v12, v13, v38, v15, v39, v8, v37, v9, v10, v11);

      v5 = v16;
      self = v18;

      v6 = v40;
      v19 = v18;
    }
    else
    {
      v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v28)
        -[ASCLockup initWithCoder:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);
      v19 = 0;
    }

  }
  else
  {
    v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v20)
      -[ASCLockup initWithCoder:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    v19 = 0;
  }

  return v19;
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
  id v14;

  v4 = a3;
  -[ASCLockup id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCLockup kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kind"));

  -[ASCLockup metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("metrics"));

  -[ASCLockup icon](self, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("icon"));

  -[ASCLockup heading](self, "heading");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("heading"));

  -[ASCLockup title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("title"));

  -[ASCLockup subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("subtitle"));

  -[ASCLockup ageRating](self, "ageRating");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ageRating"));

  -[ASCLockup offer](self, "offer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("offer"));

  -[ASCLockup features](self, "features");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("features"));

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
  unint64_t v14;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockup id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockup kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCLockup metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCLockup icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCLockup heading](self, "heading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCLockup title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCLockup subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  -[ASCLockup ageRating](self, "ageRating");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  -[ASCLockup offer](self, "offer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  -[ASCLockup features](self, "features");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  v14 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockup *v4;
  ASCLockup *v5;
  ASCLockup *v6;
  BOOL v7;
  ASCLockup *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
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
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
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

  v4 = (ASCLockup *)a3;
  if (self != v4)
  {
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
    v8 = v6;

    if (!v8)
    {
      v7 = 0;
LABEL_69:

      goto LABEL_70;
    }
    -[ASCLockup id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockup id](v8, "id");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
      {
LABEL_12:
        -[ASCLockup kind](self, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockup kind](v8, "kind");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
          {
LABEL_15:
            -[ASCLockup metrics](self, "metrics");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASCLockup metrics](v8, "metrics");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if (objc_msgSend(v15, "isEqual:", v16))
              {
LABEL_18:
                -[ASCLockup icon](self, "icon");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ASCLockup icon](v8, "icon");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if (v18 && v19)
                {
                  v21 = v18;
                  v66 = v15;
                  v22 = v17;
                  v23 = v18;
                  v24 = v20;
                  v25 = objc_msgSend(v21, "isEqual:", v20);
                  v20 = v24;
                  v18 = v23;
                  v17 = v22;
                  v15 = v66;
                  if (v25)
                  {
LABEL_21:
                    v64 = v20;
                    v65 = v18;
                    -[ASCLockup heading](self, "heading");
                    v26 = objc_claimAutoreleasedReturnValue();
                    -[ASCLockup heading](v8, "heading");
                    v27 = objc_claimAutoreleasedReturnValue();
                    v28 = (void *)v27;
                    v67 = (void *)v26;
                    if (v26 && v27)
                    {
                      v29 = (void *)v27;
                      v30 = objc_msgSend(v67, "isEqual:", v27);
                      v28 = v29;
                      if (v30)
                      {
LABEL_24:
                        v62 = v28;
                        -[ASCLockup title](self, "title");
                        v31 = objc_claimAutoreleasedReturnValue();
                        -[ASCLockup title](v8, "title");
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
LABEL_27:
                            v60 = v33;
                            -[ASCLockup subtitle](self, "subtitle");
                            v36 = objc_claimAutoreleasedReturnValue();
                            -[ASCLockup subtitle](v8, "subtitle");
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
LABEL_30:
                                v58 = v38;
                                -[ASCLockup ageRating](self, "ageRating");
                                v41 = objc_claimAutoreleasedReturnValue();
                                -[ASCLockup ageRating](v8, "ageRating");
                                v42 = objc_claimAutoreleasedReturnValue();
                                v43 = (void *)v42;
                                v59 = (void *)v41;
                                if (v41 && v42)
                                {
                                  v44 = (void *)v42;
                                  v45 = objc_msgSend(v59, "isEqual:", v42);
                                  v43 = v44;
                                  if (v45)
                                  {
LABEL_33:
                                    -[ASCLockup offer](self, "offer", v43);
                                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[ASCLockup offer](v8, "offer");
                                    v47 = objc_claimAutoreleasedReturnValue();
                                    v56 = (void *)v47;
                                    v57 = v46;
                                    if (v46 && v47)
                                    {
                                      if (objc_msgSend(v46, "isEqual:", v47))
                                        goto LABEL_36;
                                    }
                                    else if (v46 == (void *)v47)
                                    {
LABEL_36:
                                      -[ASCLockup features](self, "features");
                                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[ASCLockup features](v8, "features");
                                      v49 = objc_claimAutoreleasedReturnValue();
                                      v50 = (void *)v49;
                                      if (v48 && v49)
                                      {
                                        v51 = (void *)v49;
                                        v52 = objc_msgSend(v48, "isEqual:", v49);
                                        v50 = v51;
                                        v53 = v48;
                                        v7 = v52;
                                      }
                                      else
                                      {
                                        v53 = v48;
                                        v7 = v48 == (void *)v49;
                                      }

                                      goto LABEL_60;
                                    }
                                    v7 = 0;
LABEL_60:

                                    v43 = v55;
                                    goto LABEL_61;
                                  }
                                }
                                else if (v41 == v42)
                                {
                                  goto LABEL_33;
                                }
                                v7 = 0;
LABEL_61:

                                v38 = v58;
                                goto LABEL_62;
                              }
                            }
                            else if (v36 == v37)
                            {
                              goto LABEL_30;
                            }
                            v7 = 0;
LABEL_62:

                            v33 = v60;
                            goto LABEL_63;
                          }
                        }
                        else if (v31 == v32)
                        {
                          goto LABEL_27;
                        }
                        v7 = 0;
LABEL_63:

                        v28 = v62;
                        goto LABEL_64;
                      }
                    }
                    else if (v26 == v27)
                    {
                      goto LABEL_24;
                    }
                    v7 = 0;
LABEL_64:

                    v20 = v64;
                    v18 = v65;
                    goto LABEL_65;
                  }
                }
                else if (v18 == (void *)v19)
                {
                  goto LABEL_21;
                }
                v7 = 0;
LABEL_65:

                goto LABEL_66;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_18;
            }
            v7 = 0;
LABEL_66:

            goto LABEL_67;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        v7 = 0;
LABEL_67:

        goto LABEL_68;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    v7 = 0;
LABEL_68:

    goto LABEL_69;
  }
  v7 = 1;
LABEL_70:

  return v7;
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
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockup id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCLockup kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("kind"));

  -[ASCLockup metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("metrics"));

  -[ASCLockup icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("icon"));

  -[ASCLockup heading](self, "heading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("heading"));

  -[ASCLockup title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("title"));

  -[ASCLockup subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("subtitle"));

  -[ASCLockup ageRating](self, "ageRating");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("ageRating"));

  -[ASCLockup offer](self, "offer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("offer"));

  -[ASCLockup features](self, "features");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[ASCLockup features](self, "features");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, CFSTR("features"));

  }
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)featureWithClass:(Class)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ASCLockup features](self, "features", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)lockupByAddingFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ASCLockup *v19;
  ASCLockup *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  -[ASCLockup features](self, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __35__ASCLockup_lockupByAddingFeature___block_invoke;
  v22[3] = &unk_1E75608B8;
  v7 = v4;
  v23 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v22);
  v21 = v7;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "addObject:", v7);
  else
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v8, v7);
  v19 = [ASCLockup alloc];
  -[ASCLockup id](self, "id");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup kind](self, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup icon](self, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup heading](self, "heading");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup subtitle](self, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup ageRating](self, "ageRating");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup offer](self, "offer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:](v19, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v6);

  return v20;
}

uint64_t __35__ASCLockup_lockupByAddingFeature___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (ASCLockup)lockupWithOffer:(id)a3
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
  ASCLockup *v13;
  void *v15;
  ASCLockup *v16;

  v4 = a3;
  v16 = [ASCLockup alloc];
  -[ASCLockup id](self, "id");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup heading](self, "heading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup ageRating](self, "ageRating");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockup features](self, "features");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:](v16, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:", v15, v5, v6, v7, v8, v9, v10, v11, v4, v12);

  return v13;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSString)kind
{
  return self->_kind;
}

- (ASCViewMetrics)metrics
{
  return self->_metrics;
}

- (ASCArtwork)icon
{
  return self->_icon;
}

- (NSString)heading
{
  return self->_heading;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 icon:(id)a5 heading:(id)a6 title:(id)a7 subtitle:(id)a8 ageRating:(id)a9 offer:(id)a10
{
  return -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:](self, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

- (BOOL)isEditorsChoice
{
  void *v2;
  char v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditorsChoice");

  return v3;
}

- (float)productRating
{
  void *v2;
  float v3;
  float v4;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productRating");
  v4 = v3;

  return v4;
}

- (NSString)productRatingBadge
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productRatingBadge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)productDescription
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)distributorBundleId
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distributorBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appVersionId
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appVersionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)developerId
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "developerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)webDistributionDomains
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webDistributionDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)supportUrl
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)contentRatingsBySystem
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentRatingsBySystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)isDistributor
{
  void *v2;
  char v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDistributor");

  return v3;
}

- (NSString)developerName
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "developerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ASCLockupDisplayContext)displayContext
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupDisplayContext *)v3;
}

- (NSString)privacyPolicyUrl
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyPolicyUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)eula
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eula");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)genreName
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genreName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)genreID
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genreID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)subgenres
{
  void *v2;
  void *v3;
  void *v4;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "subgenres");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (ASCScreenshots)screenshots
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCScreenshots *)v3;
}

- (ASCTrailers)trailers
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCTrailers *)v3;
}

- (BOOL)hasMedia
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[ASCLockup screenshots](self, "screenshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[ASCLockup trailers](self, "trailers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

- (NSString)productPageMetadata
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productPageMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)productPageDescription
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productPageDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)productVariantID
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productVariantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)contentProviderTeamID
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contentProviderTeamID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_variant_has_internal_content())
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[ASCLockup id](self, "id");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("Lockup for %@ Adam ID does not include Safari extension feature."), v8);

      v10 = objc_alloc(MEMORY[0x1E0C99DA0]);
      v11 = *MEMORY[0x1E0C99768];
      v12 = *MEMORY[0x1E0CB2D68];
      v15[0] = *MEMORY[0x1E0CB2D80];
      v15[1] = v12;
      v16[0] = CFSTR("Set ASCLockupContextSafariExtension context on lockup request");
      v16[1] = CFSTR("Possibly a mismatching JS version for ASC");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v10, "initWithName:reason:userInfo:", v11, v9, v13);

      objc_exception_throw(v14);
    }
    v5 = &stru_1E7562EE8;
  }

  return (NSString *)v5;
}

- (NSString)shortName
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSSet)signpostTags
{
  void *v2;
  void *v3;

  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signpostTags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (ASCLockup)lockupWithSignpostTags:(id)a3
{
  id v4;
  ASCLockupFeatureSignpostTags *v5;
  void *v6;

  v4 = a3;
  v5 = -[ASCLockupFeatureSignpostTags initWithSignpostTags:]([ASCLockupFeatureSignpostTags alloc], "initWithSignpostTags:", v4);

  -[ASCLockup lockupByAddingFeature:](self, "lockupByAddingFeature:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockup *)v6;
}

- (BOOL)requiresSSOEntitlement
{
  void *v3;
  void *v4;
  char v5;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "requiresSSOEntitlement");
  }
  else
  {
    if (os_variant_has_internal_content())
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[ASCLockup id](self, "id");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("Lockup for %@ Adam ID does not include Single Sign On feature."), v8);

      v10 = objc_alloc(MEMORY[0x1E0C99DA0]);
      v11 = *MEMORY[0x1E0C99768];
      v12 = *MEMORY[0x1E0CB2D68];
      v15[0] = *MEMORY[0x1E0CB2D80];
      v15[1] = v12;
      v16[0] = CFSTR("Set ASCLockupContextSingleSignOn context on lockup request");
      v16[1] = CFSTR("Possibly a mismatching JS version for ASC");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v10, "initWithName:reason:userInfo:", v11, v9, v13);

      objc_exception_throw(v14);
    }
    v5 = 0;
  }

  return v5;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCLockup because id was missing", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCLockupKind because kind was missing", a5, a6, a7, a8, 0);
}

@end
