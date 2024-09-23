@implementation HMDBackingStoreTransactionOptions

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8 cdTransactionAuthor:(unint64_t)a9 clientIdentifier:(id)a10
{
  id v16;
  id v17;
  HMDBackingStoreTransactionOptions *v18;
  HMDBackingStoreTransactionOptions *v19;
  HMDBackingStoreTransactionOptions *v20;
  HMDBackingStoreTransactionOptions *v22;
  SEL v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  objc_super v30;

  v16 = a5;
  v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)HMDBackingStoreTransactionOptions;
  v18 = -[HMDBackingStoreTransactionOptions init](&v30, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_4;
  v18->_source = a3;
  v18->_destination = a4;
  objc_storeStrong((id *)&v18->_label, a5);
  v19->_mustReplay = a6;
  v19->_mustPush = a7;
  if (a9)
  {
    v19->_cdTransactionAuthor = a9;
    objc_storeStrong((id *)&v19->_clientIdentifier, a10);
    v20 = v19;
LABEL_4:

    return v19;
  }
  v22 = (HMDBackingStoreTransactionOptions *)_HMFPreconditionFailure();
  return -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:](v22, v23, v24, v25, v26, v27, v28, v29);
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8
{
  return -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:](self, "initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:", a3, a4, a5, a6, a7, 0, 3, 0);
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7
{
  return -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:](self, "initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:", a3, a4, a5, a6, a7, 0);
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4
{
  return -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:](self, "initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:", a3, a4, CFSTR("<UNSET LABEL>"), 0, 0, 0);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (HMDBackingStoreTransactionOptions)initWithCoder:(id)a3
{
  id v4;
  HMDBackingStoreTransactionOptions *v5;
  uint64_t v6;
  NSString *label;
  HMDBackingStoreTransactionOptions *v8;

  v4 = a3;
  v5 = -[HMDBackingStoreTransactionOptions initWithSource:destination:](self, "initWithSource:destination:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.source")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.destination")));
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_mustReplay = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.mustReplay")) != 0;
    v5->_mustPush = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.mustPush"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[HMDBackingStoreTransactionOptions source](self, "source"), CFSTR("HM.source"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[HMDBackingStoreTransactionOptions destination](self, "destination"), CFSTR("HM.destination"));
  -[HMDBackingStoreTransactionOptions label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("HM.label"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[HMDBackingStoreTransactionOptions mustReplay](self, "mustReplay"), CFSTR("HM.mustReplay"));
  objc_msgSend(v5, "encodeBool:forKey:", -[HMDBackingStoreTransactionOptions mustPush](self, "mustPush"), CFSTR("HM.mustPush"));

}

- (id)_description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBackingStoreTransactionOptions label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreTransactionSource:](HMDBackingStoreTransactionOptions, "stringForHMDBackingStoreTransactionSource:", -[HMDBackingStoreTransactionOptions source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreDestination:](HMDBackingStoreTransactionOptions, "stringForHMDBackingStoreDestination:", -[HMDBackingStoreTransactionOptions destination](self, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDBackingStoreTransactionOptions mustReplay](self, "mustReplay"))
    v7 = "yes";
  else
    v7 = "no";
  if (-[HMDBackingStoreTransactionOptions mustPush](self, "mustPush"))
    v8 = "yes";
  else
    v8 = "no";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@/mustReplay=%s/mustPush=%s"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBackingStoreTransactionOptions _description](self, "_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<options: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)debugString:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBackingStoreTransactionOptions label](self, "label", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreDestination:](HMDBackingStoreTransactionOptions, "stringForHMDBackingStoreDestination:", -[HMDBackingStoreTransactionOptions destination](self, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreTransactionSource:](HMDBackingStoreTransactionOptions, "stringForHMDBackingStoreTransactionSource:", -[HMDBackingStoreTransactionOptions source](self, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDBackingStoreTransactionOptions mustReplay](self, "mustReplay"))
    v8 = "yes";
  else
    v8 = "no";
  if (-[HMDBackingStoreTransactionOptions mustPush](self, "mustPush"))
    v9 = "yes";
  else
    v9 = "no";
  objc_msgSend(v4, "stringWithFormat:", CFSTR("label: %@\ndestinations: %@\nsource: %@\nmustReplay: %s\nmustPush:%s"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  BOOL v13;
  unint64_t v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMDBackingStoreTransactionOptions source](self, "source"), v7 == objc_msgSend(v6, "source"))
    && (v8 = -[HMDBackingStoreTransactionOptions destination](self, "destination"), v8 == objc_msgSend(v6, "destination")))
  {
    -[HMDBackingStoreTransactionOptions label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10)
      && (v11 = -[HMDBackingStoreTransactionOptions mustReplay](self, "mustReplay"),
          v11 == objc_msgSend(v6, "mustReplay"))
      && (v12 = -[HMDBackingStoreTransactionOptions mustPush](self, "mustPush"),
          v12 == objc_msgSend(v6, "mustPush")))
    {
      v15 = -[HMDBackingStoreTransactionOptions cdTransactionAuthor](self, "cdTransactionAuthor");
      v13 = v15 == objc_msgSend(v6, "cdTransactionAuthor");
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDBackingStoreTransactionOptions label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)logIdentifier
{
  return CFSTR("BackingStore");
}

- (unint64_t)destination
{
  return self->_destination;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)mustReplay
{
  return self->_mustReplay;
}

- (BOOL)mustPush
{
  return self->_mustPush;
}

- (BOOL)mustSaveArchiveAtomically
{
  return self->_mustSaveArchiveAtomically;
}

- (unint64_t)cdTransactionAuthor
{
  return self->_cdTransactionAuthor;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8 cdTransactionAuthor:(unint64_t)a9 clientIdentifier:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v16;
  id v17;
  HMDBackingStoreTransactionOptions *v18;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v16 = a10;
  v17 = a5;
  v18 = -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:]([HMDBackingStoreTransactionOptions alloc], "initWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:", a3, a4, v17, v12, v11, v10, a9, v16);

  return v18;
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:", a3, a4, a5, a6, a7, a8, 3, 0);
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6 mustSaveArchiveAtomically:(BOOL)a7
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:", a3, a4, CFSTR("<UNSET LABEL>"), a5, a6, a7);
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:mustSaveArchiveAtomically:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:mustSaveArchiveAtomically:", a3, a4, a5, a6, 0);
}

+ (HMDBackingStoreTransactionOptions)defaultLocalOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 0, 0, 0);
}

+ (HMDBackingStoreTransactionOptions)defaultXPCOptions
{
  return (HMDBackingStoreTransactionOptions *)+[HMDBackingStoreTransactionOptions defaultXPCOptionsWithCDTransactionAuthor:clientIdentifier:](HMDBackingStoreTransactionOptions, "defaultXPCOptionsWithCDTransactionAuthor:clientIdentifier:", 3, 0);
}

+ (id)defaultXPCOptionsWithClientIdentifier:(id)a3
{
  return +[HMDBackingStoreTransactionOptions defaultXPCOptionsWithCDTransactionAuthor:clientIdentifier:](HMDBackingStoreTransactionOptions, "defaultXPCOptionsWithCDTransactionAuthor:clientIdentifier:", 3, a3);
}

+ (id)defaultXPCOptionsWithCDTransactionAuthor:(unint64_t)a3 clientIdentifier:(id)a4
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:cdTransactionAuthor:clientIdentifier:", 1, 3, CFSTR("<UNSET LABEL>"), 0, 0, 0, a3, a4);
}

+ (HMDBackingStoreTransactionOptions)defaultCloudOptionsForInitialGraphLoad
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:label:mustReplay:mustPush:mustSaveArchiveAtomically:", 2, 0, CFSTR("HM.BSTO.replayInitialGraphLoad"), 0, 0, 1);
}

+ (HMDBackingStoreTransactionOptions)defaultCloudOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:mustSaveArchiveAtomically:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:mustSaveArchiveAtomically:", 2, 0, 0, 0, 1);
}

+ (HMDBackingStoreTransactionOptions)cloudRequiresPushOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:mustSaveArchiveAtomically:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:mustSaveArchiveAtomically:", 2, 3, 0, 0, 1);
}

+ (HMDBackingStoreTransactionOptions)localPushBackOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 3, 1, 1);
}

+ (HMDBackingStoreTransactionOptions)defaultIDSOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 2, 0, 0, 0);
}

+ (HMDBackingStoreTransactionOptions)defaultLegacyCloudOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 3, 2, 0, 0);
}

+ (HMDBackingStoreTransactionOptions)defaultMetadataCloudOptions
{
  return -[HMDBackingStoreTransactionOptions initWithSource:destination:label:mustReplay:mustPush:]([HMDBackingStoreTransactionOptions alloc], "initWithSource:destination:label:mustReplay:mustPush:", 4, 3, CFSTR("MetadataUpdate"), 0, 0);
}

+ (HMDBackingStoreTransactionOptions)defaultResidenceOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 1, 3, 1, 0);
}

+ (HMDBackingStoreTransactionOptions)defaultPreferencesOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 1, 2, 1, 1);
}

+ (HMDBackingStoreTransactionOptions)defaultOutOfSyncOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 1, 2, 0, 1);
}

+ (id)stringForHMDBackingStoreTransactionSource:(unint64_t)a3
{
  if (a3 < 5)
    return off_24E77E8A8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<UNKNOWN %lu>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForHMDBackingStoreDestination:(unint64_t)a3
{
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("V3"));
    a3 &= ~1uLL;
  }
  if ((a3 & 2) != 0)
  {
    if (objc_msgSend(v5, "length"))
      v6 = "/";
    else
      v6 = "";
    objc_msgSend(v5, "appendFormat:", CFSTR("%sV4"), v6);
    a3 &= ~2uLL;
  }
  if (a3)
  {
    if (objc_msgSend(v5, "length"))
      v7 = "/";
    else
      v7 = "";
    objc_msgSend(v5, "appendFormat:", CFSTR("%s<UNKNOWN 0x%lx>"), v7, a3);
  }
  if (objc_msgSend(v5, "length"))
    v8 = v5;
  else
    v8 = CFSTR("<NoCloud>");

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_66325 != -1)
    dispatch_once(&logCategory__hmf_once_t1_66325, &__block_literal_global_66326);
  return (id)logCategory__hmf_once_v2_66327;
}

void __48__HMDBackingStoreTransactionOptions_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_66327;
  logCategory__hmf_once_v2_66327 = v0;

}

@end
