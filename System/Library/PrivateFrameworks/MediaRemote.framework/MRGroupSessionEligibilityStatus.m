@implementation MRGroupSessionEligibilityStatus

- (MRGroupSessionEligibilityStatus)initWithCoder:(id)a3
{
  id v4;
  MRGroupSessionEligibilityStatus *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRGroupSessionEligibilityStatus;
  v5 = -[MRGroupSessionEligibilityStatus init](&v9, sel_init);
  if (v5)
  {
    -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSession:](v5, "setIsEligibleForHostingGroupSession:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ehgs")));
    -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSessionExcludingAcknowledgements:](v5, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ehgsea")));
    -[MRGroupSessionEligibilityStatus setIsEligibleForJoiningGroupSession:](v5, "setIsEligibleForJoiningGroupSession:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ejgS")));
    -[MRGroupSessionEligibilityStatus setIsManateeEnabled:](v5, "setIsManateeEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mte")));
    -[MRGroupSessionEligibilityStatus setIdsAccountIsValid:](v5, "setIdsAccountIsValid:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("acv")));
    -[MRGroupSessionEligibilityStatus setMediaAccountHostingState:](v5, "setMediaAccountHostingState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mhs")));
    -[MRGroupSessionEligibilityStatus setMediaAccountJoiningState:](v5, "setMediaAccountJoiningState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mjs")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cmus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRGroupSessionEligibilityStatus setCurrentMediaUserState:](v5, "setCurrentMediaUserState:", v6);

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("mus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRGroupSessionEligibilityStatus setMediaUserStates:](v5, "setMediaUserStates:", v7);

    -[MRGroupSessionEligibilityStatus setRouteType:](v5, "setRouteType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rt")));
    -[MRGroupSessionEligibilityStatus setRouteIsValidForHosting:](v5, "setRouteIsValidForHosting:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rvH")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MRGroupSessionEligibilityStatus *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MRGroupSessionEligibilityStatus);
  -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSession:](v4, "setIsEligibleForHostingGroupSession:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"));
  -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSessionExcludingAcknowledgements:](v4, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  -[MRGroupSessionEligibilityStatus setIsEligibleForJoiningGroupSession:](v4, "setIsEligibleForJoiningGroupSession:", -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession"));
  -[MRGroupSessionEligibilityStatus setIsManateeEnabled:](v4, "setIsManateeEnabled:", -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled"));
  -[MRGroupSessionEligibilityStatus setIdsAccountIsValid:](v4, "setIdsAccountIsValid:", -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid"));
  -[MRGroupSessionEligibilityStatus setMediaAccountHostingState:](v4, "setMediaAccountHostingState:", -[MRGroupSessionEligibilityStatus mediaAccountHostingState](self, "mediaAccountHostingState"));
  -[MRGroupSessionEligibilityStatus setMediaAccountJoiningState:](v4, "setMediaAccountJoiningState:", -[MRGroupSessionEligibilityStatus mediaAccountJoiningState](self, "mediaAccountJoiningState"));
  -[MRGroupSessionEligibilityStatus currentMediaUserState](self, "currentMediaUserState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[MRGroupSessionEligibilityStatus setCurrentMediaUserState:](v4, "setCurrentMediaUserState:", v6);

  -[MRGroupSessionEligibilityStatus mediaUserStates](self, "mediaUserStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[MRGroupSessionEligibilityStatus setMediaUserStates:](v4, "setMediaUserStates:", v8);

  -[MRGroupSessionEligibilityStatus setRouteType:](v4, "setRouteType:", -[MRGroupSessionEligibilityStatus routeType](self, "routeType"));
  -[MRGroupSessionEligibilityStatus setRouteIsValidForHosting:](v4, "setRouteIsValidForHosting:", -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting"));
  return v4;
}

- (void)setRouteType:(unsigned __int8)a3
{
  self->_routeType = a3;
}

- (void)setRouteIsValidForHosting:(BOOL)a3
{
  self->_routeIsValidForHosting = a3;
}

- (void)setMediaUserStates:(id)a3
{
  objc_storeStrong((id *)&self->_mediaUserStates, a3);
}

- (void)setMediaAccountJoiningState:(unint64_t)a3
{
  self->_mediaAccountJoiningState = a3;
}

- (void)setMediaAccountHostingState:(unint64_t)a3
{
  self->_mediaAccountHostingState = a3;
}

- (void)setIsManateeEnabled:(BOOL)a3
{
  self->_isManateeEnabled = a3;
}

- (void)setIsEligibleForJoiningGroupSession:(BOOL)a3
{
  self->_isEligibleForJoiningGroupSession = a3;
}

- (void)setIsEligibleForHostingGroupSession:(BOOL)a3
{
  self->_isEligibleForHostingGroupSession = a3;
}

- (void)setIdsAccountIsValid:(BOOL)a3
{
  self->_idsAccountIsValid = a3;
}

- (void)setCurrentMediaUserState:(id)a3
{
  objc_storeStrong((id *)&self->_currentMediaUserState, a3);
}

- (unsigned)routeType
{
  return self->_routeType;
}

- (BOOL)routeIsValidForHosting
{
  return self->_routeIsValidForHosting;
}

- (NSArray)mediaUserStates
{
  return self->_mediaUserStates;
}

- (unint64_t)mediaAccountJoiningState
{
  return self->_mediaAccountJoiningState;
}

- (unint64_t)mediaAccountHostingState
{
  return self->_mediaAccountHostingState;
}

- (BOOL)isManateeEnabled
{
  return self->_isManateeEnabled;
}

- (BOOL)isEligibleForJoiningGroupSession
{
  return self->_isEligibleForJoiningGroupSession;
}

- (BOOL)isEligibleForHostingGroupSession
{
  return self->_isEligibleForHostingGroupSession;
}

- (BOOL)idsAccountIsValid
{
  return self->_idsAccountIsValid;
}

- (MRMediaUserState)currentMediaUserState
{
  return self->_currentMediaUserState;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUserStates, 0);
  objc_storeStrong((id *)&self->_currentMediaUserState, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"), CFSTR("ehgs"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"), CFSTR("ehgsea"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession"), CFSTR("ejgS"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled"), CFSTR("mte"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid"), CFSTR("acv"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MRGroupSessionEligibilityStatus mediaAccountHostingState](self, "mediaAccountHostingState"), CFSTR("mhs"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MRGroupSessionEligibilityStatus mediaAccountJoiningState](self, "mediaAccountJoiningState"), CFSTR("mjs"));
  -[MRGroupSessionEligibilityStatus currentMediaUserState](self, "currentMediaUserState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("cmus"));

  -[MRGroupSessionEligibilityStatus mediaUserStates](self, "mediaUserStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("mus"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[MRGroupSessionEligibilityStatus routeType](self, "routeType"), CFSTR("rt"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting"), CFSTR("rvH"));

}

- (BOOL)isEqual:(id)a3
{
  MRGroupSessionEligibilityStatus *v4;
  MRGroupSessionEligibilityStatus *v5;
  MRGroupSessionEligibilityStatus *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  char v20;
  void *v22;
  void *v23;

  v4 = (MRGroupSessionEligibilityStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v20 = 1;
    goto LABEL_19;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v20 = 0;
    goto LABEL_19;
  }
  v6 = v5;
  v7 = -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession");
  if (v7 != -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](v6, "isEligibleForHostingGroupSession"))
    goto LABEL_15;
  v8 = -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements");
  if (v8 != -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](v6, "isEligibleForHostingGroupSessionExcludingAcknowledgements"))goto LABEL_15;
  v9 = -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession");
  if (v9 != -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](v6, "isEligibleForJoiningGroupSession"))
    goto LABEL_15;
  v10 = -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled");
  if (v10 != -[MRGroupSessionEligibilityStatus isManateeEnabled](v6, "isManateeEnabled"))
    goto LABEL_15;
  v11 = -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid");
  if (v11 != -[MRGroupSessionEligibilityStatus idsAccountIsValid](v6, "idsAccountIsValid"))
    goto LABEL_15;
  v12 = -[MRGroupSessionEligibilityStatus mediaAccountHostingState](self, "mediaAccountHostingState") == 0;
  if (v12 == (-[MRGroupSessionEligibilityStatus mediaAccountHostingState](v6, "mediaAccountHostingState") != 0))
    goto LABEL_15;
  v13 = -[MRGroupSessionEligibilityStatus mediaAccountJoiningState](self, "mediaAccountJoiningState") == 0;
  if (v13 == (-[MRGroupSessionEligibilityStatus mediaAccountJoiningState](v6, "mediaAccountJoiningState") != 0))
    goto LABEL_15;
  v14 = -[MRGroupSessionEligibilityStatus routeType](self, "routeType") == 0;
  if (v14 == (-[MRGroupSessionEligibilityStatus routeType](v6, "routeType") != 0))
    goto LABEL_15;
  v15 = -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting");
  if (v15 != -[MRGroupSessionEligibilityStatus routeIsValidForHosting](v6, "routeIsValidForHosting"))
    goto LABEL_15;
  -[MRGroupSessionEligibilityStatus currentMediaUserState](self, "currentMediaUserState");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[MRGroupSessionEligibilityStatus currentMediaUserState](v6, "currentMediaUserState");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 == v17)
  {

    goto LABEL_21;
  }
  v18 = v17;
  v19 = objc_msgSend(v16, "isEqual:", v17);

  if ((v19 & 1) != 0)
  {
LABEL_21:
    -[MRGroupSessionEligibilityStatus mediaUserStates](self, "mediaUserStates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRGroupSessionEligibilityStatus mediaUserStates](v6, "mediaUserStates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == v23)
      v20 = 1;
    else
      v20 = objc_msgSend(v22, "isEqual:", v23);

    goto LABEL_16;
  }
LABEL_15:
  v20 = 0;
LABEL_16:

LABEL_19:
  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("eligibleForHosting=%d"), -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", isEligibleForHostingGroupSessionExcludingAcknowledgements=%d"), -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", eligibleForJoining=%d"), -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", manatee=%d"), -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", idsAccountValid=%d"), -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid"));
  v7 = -[MRGroupSessionEligibilityStatus mediaAccountHostingState](self, "mediaAccountHostingState");
  if (v7 - 1 > 5)
    v8 = CFSTR("Indeterminate");
  else
    v8 = off_1E30CD6B0[v7 - 1];
  objc_msgSend(v6, "appendFormat:", CFSTR(", mediaAccountHostingState=%@"), v8);
  v9 = -[MRGroupSessionEligibilityStatus mediaAccountJoiningState](self, "mediaAccountJoiningState");
  if (v9 - 1 > 4)
    v10 = CFSTR("Indeterminate");
  else
    v10 = off_1E30CD6E0[v9 - 1];
  objc_msgSend(v6, "appendFormat:", CFSTR(", mediaAccountJoiningState=%@"), v10);
  objc_msgSend(v6, "appendFormat:", CFSTR(", routeType=%d"), -[MRGroupSessionEligibilityStatus routeType](self, "routeType"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", routeValidForHosting=%d"), -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting"));
  -[MRGroupSessionEligibilityStatus currentMediaUserState](self, "currentMediaUserState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", currentMediaUserState=%@"), v11);

  -[MRGroupSessionEligibilityStatus mediaUserStates](self, "mediaUserStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 2)
  {
    -[MRGroupSessionEligibilityStatus mediaUserStates](self, "mediaUserStates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", mediaUserStates=%@"), v14);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)dictionaryDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isEligibleForHostingGroupSession"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isEligibleForHostingGroupSessionExcludingAcknowledgements"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isEligibleForJoiningGroupSession"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isManateeEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("idsAccountIsValid"));

  v9 = -[MRGroupSessionEligibilityStatus mediaAccountHostingState](self, "mediaAccountHostingState") - 1;
  if (v9 > 5)
    v10 = CFSTR("Indeterminate");
  else
    v10 = off_1E30CD6B0[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("mediaAccountHostingState"));
  v11 = -[MRGroupSessionEligibilityStatus mediaAccountJoiningState](self, "mediaAccountJoiningState") - 1;
  if (v11 > 4)
    v12 = CFSTR("Indeterminate");
  else
    v12 = off_1E30CD6E0[v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("mediaAccountJoiningState"));
  -[MRGroupSessionEligibilityStatus currentMediaUserState](self, "currentMediaUserState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("currentMediaUserState"));

  -[MRGroupSessionEligibilityStatus mediaUserStates](self, "mediaUserStates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaUserStates"));

  MRGroupSessionRouteTypeDescription(-[MRGroupSessionEligibilityStatus routeType](self, "routeType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("routeType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("routeIsValidForHosting"));

  return v3;
}

- (id)differenceFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRGroupSessionEligibilityStatus dictionaryDescription](self, "dictionaryDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_new();
  v13 = (void *)v12;
  if (!self)
  {
    v27 = CFSTR("Changed to nil");
    goto LABEL_18;
  }
  if (!v4)
  {
    v27 = CFSTR("Changed from nil");
    goto LABEL_18;
  }
  v30 = v4;
  v31 = (void *)v12;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = v11;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v15)
    goto LABEL_15;
  v16 = v15;
  v17 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v33 != v17)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v19);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v26 = v20;
        v25 = v20;
      }
      else
      {
        v22 = v21;
        v23 = objc_msgSend(v20, "isEqual:", v21);

        if ((v23 & 1) != 0)
          continue;
        v24 = (void *)MEMORY[0x1E0D4D0B8];
        objc_msgSend(v6, "objectForKeyedSubscript:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pairWithFirst:second:", v25, v26);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v20, v19);
      }

    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  }
  while (v16);
LABEL_15:

  v13 = v31;
  objc_msgSend(v31, "description");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  v4 = v30;
LABEL_18:

  return v27;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

@end
