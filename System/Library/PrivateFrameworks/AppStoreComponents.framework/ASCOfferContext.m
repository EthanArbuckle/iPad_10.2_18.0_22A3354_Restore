@implementation ASCOfferContext

- (ASCOfferContext)initWithFlags:(int64_t)a3 presentingSceneIdentifier:(id)a4 presentingSceneBundleIdentifier:(id)a5 externalDeepLinkURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  ASCOfferContext *v13;
  ASCOfferContext *v14;
  uint64_t v15;
  NSString *presentingSceneIdentifier;
  uint64_t v17;
  NSString *presentingSceneBundleIdentifier;
  uint64_t v19;
  NSURL *externalDeepLinkURL;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ASCOfferContext;
  v13 = -[ASCOfferContext init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_flags = a3;
    v15 = objc_msgSend(v10, "copy");
    presentingSceneIdentifier = v14->_presentingSceneIdentifier;
    v14->_presentingSceneIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    presentingSceneBundleIdentifier = v14->_presentingSceneBundleIdentifier;
    v14->_presentingSceneBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    externalDeepLinkURL = v14->_externalDeepLinkURL;
    v14->_externalDeepLinkURL = (NSURL *)v19;

  }
  return v14;
}

- (ASCOfferContext)initWithFlags:(int64_t)a3
{
  return -[ASCOfferContext initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:](self, "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:", a3, 0, 0, 0);
}

- (ASCOfferContext)init
{
  return -[ASCOfferContext initWithFlags:](self, "initWithFlags:", 0);
}

- (BOOL)supportsDSIDLessInstall
{
  return -[ASCOfferContext flags](self, "flags") & 1;
}

- (BOOL)shouldInstallParentApp
{
  return ((unint64_t)-[ASCOfferContext flags](self, "flags") >> 1) & 1;
}

- (BOOL)universalLinkRequired
{
  return ((unint64_t)-[ASCOfferContext flags](self, "flags") >> 2) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  ASCOfferContext *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalDeepLinkURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASCOfferContext initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:](self, "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCOfferContext flags](self, "flags"), CFSTR("flags"));
  -[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("presentingSceneIdentifier"));

  -[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("presentingSceneBundleIdentifier"));

  -[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("externalDeepLinkURL"));

}

- (id)offerContextByAddingFlags:(int64_t)a3
{
  int64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[ASCOfferContext flags](self, "flags") | a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:", v4, v6, v7, v8);

  return v9;
}

- (ASCOfferContext)offerContextWithPresentingSceneIdentifier:(id)a3 presentingSceneBundleIdentifier:(id)a4 externalDeepLinkURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:", -[ASCOfferContext flags](self, "flags"), v10, v9, v8);

  return (ASCOfferContext *)v11;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  unint64_t v4;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCOfferContext flags](self, "flags"));
  v4 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  int v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;

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
    v8 = -[ASCOfferContext supportsDSIDLessInstall](self, "supportsDSIDLessInstall");
    if (v8 == objc_msgSend(v7, "supportsDSIDLessInstall"))
    {
      v9 = -[ASCOfferContext shouldInstallParentApp](self, "shouldInstallParentApp");
      if (v9 == objc_msgSend(v7, "shouldInstallParentApp"))
      {
        -[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "presentingSceneIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
          {
LABEL_14:
            -[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "presentingSceneBundleIdentifier");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if (objc_msgSend(v15, "isEqual:", v16))
              {
LABEL_17:
                -[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "externalDeepLinkURL");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if (v18 && v19)
                {
                  if (objc_msgSend(v18, "isEqual:", v19))
                  {
LABEL_20:
                    v21 = -[ASCOfferContext universalLinkRequired](self, "universalLinkRequired");
                    v10 = v21 ^ objc_msgSend(v7, "universalLinkRequired") ^ 1;
LABEL_27:

                    goto LABEL_28;
                  }
                }
                else if (v18 == (void *)v19)
                {
                  goto LABEL_20;
                }
                LOBYTE(v10) = 0;
                goto LABEL_27;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_17;
            }
            LOBYTE(v10) = 0;
LABEL_28:

            goto LABEL_29;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_14;
        }
        LOBYTE(v10) = 0;
LABEL_29:

        goto LABEL_10;
      }
    }
  }
  LOBYTE(v10) = 0;
LABEL_10:

  return v10;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferContext supportsDSIDLessInstall](self, "supportsDSIDLessInstall"), CFSTR("supportsDSIDLessInstall"));
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferContext shouldInstallParentApp](self, "shouldInstallParentApp"), CFSTR("shouldInstallParentApp"));
  -[ASCOfferContext presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("presentingSceneIdentifier"));

  -[ASCOfferContext presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("presentingSceneBundleIdentifier"));

  -[ASCOfferContext externalDeepLinkURL](self, "externalDeepLinkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("externalDeepLinkURL"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferContext universalLinkRequired](self, "universalLinkRequired"), CFSTR("universalLinkRequired"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (NSURL)externalDeepLinkURL
{
  return self->_externalDeepLinkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDeepLinkURL, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
}

@end
