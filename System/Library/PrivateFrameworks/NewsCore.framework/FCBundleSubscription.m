@implementation FCBundleSubscription

- (BOOL)containsHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "sourceChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    if (objc_msgSend(v4, "isBundlePaid"))
    {
      -[FCBundleSubscription bundleChannelIDs](self, "bundleChannelIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        objc_msgSend(v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[FCBundleSubscription containsTagID:](self, "containsTagID:", v10);

      }
      else
      {
        v11 = 1;
      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)containsTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FCBundleSubscription bundleChannelIDs](self, "bundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v7 = v5;

  if (v7
    && (v8 = -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState"),
        v8 == objc_msgSend(v7, "unprotectedSubscriptionState"))
    && (v9 = -[FCBundleSubscription isPurchaser](self, "isPurchaser"),
        v9 == objc_msgSend(v7, "isPurchaser"))
    && (v10 = -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"),
        v10 == objc_msgSend(v7, "isAmplifyUser"))
    && (v11 = -[FCBundleSubscription isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"),
        v11 == objc_msgSend(v7, "isPaidBundleViaOfferActivated")))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[FCBundleSubscription bundlePurchaseID](self, "bundlePurchaseID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundlePurchaseID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "fc_string:isEqualToString:", v14, v15))
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[FCBundleSubscription servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "servicesBundlePurchaseID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "fc_string:isEqualToString:", v17, v18))
      {
        -[FCBundleSubscription bundleChannelIDs](self, "bundleChannelIDs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bundleChannelIDs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToOrderedSet:", v20))
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          -[FCBundleSubscription bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "bundleChannelIDsVersion");
          v23 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v22;
          v24 = v22;
          v25 = (void *)v23;
          if (objc_msgSend(v21, "fc_string:isEqualToString:", v24, v23))
          {
            -[FCBundleSubscription initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "initialPurchaseTimestamp");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v26 == v27;

          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FCBundleSubscription bundlePurchaseID](self, "bundlePurchaseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscription servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p \n bundlePurchaseID: %@ \n subscriptionState: %lu \n isPurchaser=%@ \n isAmplifyUser=%@ \n servicesBundlePurchaseID=%@ \n>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCBundleSubscription *v4;
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
  FCBundleSubscription *v15;
  NSNumber **p_initialPurchaseTimestamp;
  void *v17;
  FCBundleSubscription *v18;
  void *v19;
  void *v20;

  v4 = objc_alloc_init(FCBundleSubscription);
  -[FCBundleSubscription bundlePurchaseID](self, "bundlePurchaseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[FCBundleSubscription setBundlePurchaseID:](v4, "setBundlePurchaseID:", v6);

  -[FCBundleSubscription bundleChannelIDs](self, "bundleChannelIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[FCBundleSubscription setBundleChannelIDs:](v4, "setBundleChannelIDs:", v8);

  -[FCBundleSubscription bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[FCBundleSubscription setBundleChannelIDsVersion:](v4, "setBundleChannelIDsVersion:", v10);

  -[FCBundleSubscription setUnprotectedSubscriptionState:](v4, "setUnprotectedSubscriptionState:", -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState"));
  -[FCBundleSubscription setIsPurchaser:](v4, "setIsPurchaser:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"));
  -[FCBundleSubscription setIsAmplifyUser:](v4, "setIsAmplifyUser:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"));
  -[FCBundleSubscription setIsPaidBundleViaOfferActivated:](v4, "setIsPaidBundleViaOfferActivated:", -[FCBundleSubscription isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"));
  -[FCBundleSubscription servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[FCBundleSubscription setServicesBundlePurchaseID:](v4, "setServicesBundlePurchaseID:", v12);

  -[FCBundleSubscription initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[FCBundleSubscription setInitialPurchaseTimestamp:](v4, "setInitialPurchaseTimestamp:", v14);

  if (-[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState") <= 1)
    v15 = v4;
  else
    v15 = (FCBundleSubscription *)((char *)&v4->super.isa + 1);
  p_initialPurchaseTimestamp = &v15[1]._initialPurchaseTimestamp;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = v4;
  objc_msgSend(v17, "numberWithUnsignedInteger:", p_initialPurchaseTimestamp);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -113 - (_QWORD)v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v18, (char *)&v4->super.isa + 1, v19, (void *)1);
  objc_setAssociatedObject(v18, (const void *)~(unint64_t)p_initialPurchaseTimestamp, v20, (void *)1);

  return v18;
}

- (BOOL)isSubscribed
{
  return -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState") < 2;
}

- (unint64_t)unprotectedSubscriptionState
{
  return self->_unprotectedSubscriptionState;
}

- (NSString)servicesBundlePurchaseID
{
  return self->_servicesBundlePurchaseID;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSString)bundlePurchaseID
{
  return self->_bundlePurchaseID;
}

- (BOOL)isPaidBundleViaOfferActivated
{
  return self->_isPaidBundleViaOfferActivated;
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (NSOrderedSet)bundleChannelIDs
{
  return self->_bundleChannelIDs;
}

- (void)setUnprotectedSubscriptionState:(unint64_t)a3
{
  self->_unprotectedSubscriptionState = a3;
}

- (void)setBundleChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setServicesBundlePurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setIsPurchaser:(BOOL)a3
{
  self->_isPurchaser = a3;
}

- (void)setIsPaidBundleViaOfferActivated:(BOOL)a3
{
  self->_isPaidBundleViaOfferActivated = a3;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  self->_isAmplifyUser = a3;
}

- (void)setInitialPurchaseTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBundlePurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBundleChannelIDsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (FCBundleSubscription)subscriptionWithSubscriptionState:(unint64_t)a3 bundleChannelIDs:(id)a4
{
  id v5;
  FCBundleSubscription *v6;
  void *v7;

  v5 = a4;
  v6 = objc_alloc_init(FCBundleSubscription);
  -[FCBundleSubscription setUnprotectedSubscriptionState:](v6, "setUnprotectedSubscriptionState:", a3);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCBundleSubscription setBundleChannelIDs:](v6, "setBundleChannelIDs:", v7);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_servicesBundlePurchaseID, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_bundlePurchaseID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCBundleSubscription)initWithCoder:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  FCBundleSubscription *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  FCBundleSubscription *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v3 = a3;
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("subscriptionState"));
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("initialPurchaseTimestamp"));
  if (v8 == 0.0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePurchaseID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("bundleChannelIDs"));
  v26 = (void *)v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleChannelIDsVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isPurchaser"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("servicesBundlePurchaseID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isAmplifyUser"));
  LOBYTE(v25) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isPaidBundleViaOfferActivated"));
  LOBYTE(v24) = v15;
  v16 = -[FCBundleSubscription initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:subscriptionState:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:](self, "initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:subscriptionState:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", v10, v11, v12, v4, v13, v14, v24, v9, v25);

  v17 = 146;
  if (v4 > 1)
    v17 = 147;
  v18 = (unint64_t)v16 + v17;
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v20 = v16;
  objc_msgSend(v19, "numberWithUnsignedInteger:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -147 - (_QWORD)v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v20, (char *)&v16->super.isa + 1, v21, (void *)1);
  objc_setAssociatedObject(v20, (const void *)~v18, v22, (void *)1);

  return v20;
}

- (FCBundleSubscription)initWithBundlePurchaseID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 subscriptionState:(unint64_t)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FCBundleSubscription *v22;
  uint64_t v23;
  NSString *bundlePurchaseID;
  uint64_t v25;
  NSOrderedSet *bundleChannelIDs;
  uint64_t v27;
  NSString *bundleChannelIDsVersion;
  uint64_t v29;
  NSString *servicesBundlePurchaseID;
  uint64_t v31;
  NSNumber *initialPurchaseTimestamp;
  objc_super v34;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a10;
  v34.receiver = self;
  v34.super_class = (Class)FCBundleSubscription;
  v22 = -[FCBundleSubscription init](&v34, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v17, "copy");
    bundlePurchaseID = v22->_bundlePurchaseID;
    v22->_bundlePurchaseID = (NSString *)v23;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v18);
    v25 = objc_claimAutoreleasedReturnValue();
    bundleChannelIDs = v22->_bundleChannelIDs;
    v22->_bundleChannelIDs = (NSOrderedSet *)v25;

    v27 = objc_msgSend(v19, "copy");
    bundleChannelIDsVersion = v22->_bundleChannelIDsVersion;
    v22->_bundleChannelIDsVersion = (NSString *)v27;

    v22->_unprotectedSubscriptionState = a6;
    v22->_isPurchaser = a7;
    v22->_isAmplifyUser = a9;
    v22->_isPaidBundleViaOfferActivated = a11;
    v29 = objc_msgSend(v20, "copy");
    servicesBundlePurchaseID = v22->_servicesBundlePurchaseID;
    v22->_servicesBundlePurchaseID = (NSString *)v29;

    v31 = objc_msgSend(v21, "copy");
    initialPurchaseTimestamp = v22->_initialPurchaseTimestamp;
    v22->_initialPurchaseTimestamp = (NSNumber *)v31;

  }
  return v22;
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isBundlePaid"))
  {
    objc_msgSend(v4, "publisherID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FCBundleSubscription containsTagID:](self, "containsTagID:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (FCBundleSubscription)initWithBundlePurchaseID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 inTrialPeriod:(BOOL)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11
{
  return -[FCBundleSubscription initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:subscriptionState:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:](self, "initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:subscriptionState:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", a3, a4, a5, !a6 && !a9 && !a11, a7, a8);
}

- (BOOL)isServicesBundleUser
{
  void *v2;
  BOOL v3;

  -[FCBundleSubscription servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[FCBundleSubscription bundleChannelIDs](self, "bundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleChannelIDs"));

  -[FCBundleSubscription bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bundleChannelIDsVersion"));

  -[FCBundleSubscription bundlePurchaseID](self, "bundlePurchaseID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundlePurchaseID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState"), CFSTR("subscriptionState"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"), CFSTR("isPurchaser"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"), CFSTR("isAmplifyUser"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCBundleSubscription isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"), CFSTR("isPaidBundleViaOfferActivated"));
  -[FCBundleSubscription servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("servicesBundlePurchaseID"));

  -[FCBundleSubscription initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("initialPurchaseTimestamp"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[FCBundleSubscription bundleChannelIDs](self, "bundleChannelIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscription isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[FCBundleSubscription bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[FCBundleSubscription initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

@end
