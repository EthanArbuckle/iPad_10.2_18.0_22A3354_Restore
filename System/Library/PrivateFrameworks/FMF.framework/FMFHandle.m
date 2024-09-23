@implementation FMFHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__idsCorrelationIdentifierInternal, 0);
  objc_storeStrong((id *)&self->_qualifiedIdentifier, 0);
  objc_storeStrong((id *)&self->__prettyNameInternal, 0);
  objc_storeStrong((id *)&self->_favoriteOrder, 0);
  objc_storeStrong((id *)&self->_trackingTimestamp, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_expiresByGroupId, 0);
  objc_storeStrong((id *)&self->_invitationSentToIds, 0);
  objc_storeStrong((id *)&self->_aliasServerIds, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_serverId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)handleWithId:(id)a3 serverId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setIdentifier:", v6);
  objc_msgSend(v7, "setQualifiedIdentifier:", v6);

  objc_msgSend(v7, "setServerId:", v5);
  objc_msgSend(v7, "setIdsStatus:", -1);
  objc_msgSend(v7, "setReachable:", 0);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:", floor(v10 * 1000.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTrackingTimestamp:", v11);
  if (objc_msgSend(v7, "isPhoneNumber"))
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sanitizePhoneNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v13);

  }
  return v7;
}

- (FMFHandle)initWithCoder:(id)a3
{
  id v4;
  FMFHandle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (FMFHandle *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setIdentifier:](v5, "setIdentifier:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setServerId:](v5, "setServerId:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setDsid:](v5, "setDsid:", v8);

  objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("expiresByGroupId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setExpiresByGroupId:](v5, "setExpiresByGroupId:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setTrackingTimestamp:](v5, "setTrackingTimestamp:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashedDSID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setHashedDSID:](v5, "setHashedDSID:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("favoriteOrder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle setFavoriteOrder:](v5, "setFavoriteOrder:", v12);

  -[FMFHandle setIdsStatus:](v5, "setIdsStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("idsStatus")));
  -[FMFHandle setReachable:](v5, "setReachable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reachable")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qualifiedIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFHandle setQualifiedIdentifier:](v5, "setQualifiedIdentifier:", v13);
  return v5;
}

- (void)setTrackingTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setServerId:(id)a3
{
  objc_storeStrong((id *)&self->_serverId, a3);
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (void)setQualifiedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setIdsStatus:(int64_t)a3
{
  self->_idsStatus = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHashedDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setExpiresByGroupId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFavoriteOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  -[FMFHandle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[FMFHandle serverId](self, "serverId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serverId"));

  -[FMFHandle dsid](self, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dsid"));

  -[FMFHandle expiresByGroupId](self, "expiresByGroupId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("expiresByGroupId"));

  -[FMFHandle trackingTimestamp](self, "trackingTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("trackingTimestamp"));

  -[FMFHandle hashedDSID](self, "hashedDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("hashedDSID"));

  -[FMFHandle favoriteOrder](self, "favoriteOrder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("favoriteOrder"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FMFHandle idsStatus](self, "idsStatus"), CFSTR("idsStatus"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FMFHandle reachable](self, "reachable"), CFSTR("reachable"));
  -[FMFHandle qualifiedIdentifier](self, "qualifiedIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("qualifiedIdentifier"));

}

- (NSNumber)trackingTimestamp
{
  return self->_trackingTimestamp;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (NSString)qualifiedIdentifier
{
  return self->_qualifiedIdentifier;
}

- (int64_t)idsStatus
{
  return self->_idsStatus;
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (NSNumber)favoriteOrder
{
  return self->_favoriteOrder;
}

- (NSDictionary)expiresByGroupId
{
  return self->_expiresByGroupId;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (BOOL)isPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCharactersInString:", CFSTR("+()-"));
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v5);

  -[FMFHandle identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", &stru_1EA4F34A0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "length") == 0;
  return (char)v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FMFHandle comparisonIdentifier](self, "comparisonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMFHandle comparisonIdentifier](self, "comparisonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comparisonIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  void *v2;
  void *v3;

  -[FMFHandle identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serverId
{
  return self->_serverId;
}

- (void)setInvitationSentToIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)clearFavoriteOrder
{
  -[FMFHandle setFavoriteOrder:](self, "setFavoriteOrder:", 0);
}

- (NSArray)aliasServerIds
{
  return self->_aliasServerIds;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addressBookDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "resetting _prettyNameInternal due to addressBookDidChange", v4, 2u);
  }

  -[FMFHandle set_prettyNameInternal:](self, "set_prettyNameInternal:", 0);
}

- (void)abPreferencesDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "resetting _prettyNameInternal due to abPreferencesDidChange", v4, 2u);
  }

  -[FMFHandle set_prettyNameInternal:](self, "set_prettyNameInternal:", 0);
}

+ (id)handleWithId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "handleWithId:serverId:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)familyHandleWithId:(id)a3 dsid:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "handleWithId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDsid:", v5);
  objc_msgSend(v7, "setIsFamilyMember:", 1);
  return v7;
}

- (void)setICloudId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *identifier;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v7;

}

- (BOOL)isSharingThroughGroupId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[FMFHandle expiresByGroupId](self, "expiresByGroupId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v5);
  return (char)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[FMFHandle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[FMFHandle serverId](self, "serverId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerId:", v6);

  -[FMFHandle expiresByGroupId](self, "expiresByGroupId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpiresByGroupId:", v7);

  -[FMFHandle trackingTimestamp](self, "trackingTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrackingTimestamp:", v8);

  -[FMFHandle hashedDSID](self, "hashedDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHashedDSID:", v9);

  -[FMFHandle favoriteOrder](self, "favoriteOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFavoriteOrder:", v10);

  objc_msgSend(v4, "setIdsStatus:", -[FMFHandle idsStatus](self, "idsStatus"));
  objc_msgSend(v4, "setReachable:", -[FMFHandle reachable](self, "reachable"));
  -[FMFHandle qualifiedIdentifier](self, "qualifiedIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualifiedIdentifier:", v11);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[FMFHandle identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMFHandle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)prettyNameCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[FMFHandle prettyName](self, "prettyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prettyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (id)prettyName
{
  void *v3;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t v14[16];
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  -[FMFHandle _prettyNameInternal](self, "_prettyNameInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FMFHandle _prettyNameInternal](self, "_prettyNameInternal");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    v23 = 0;
    v5 = dispatch_semaphore_create(0);
    +[FMFSession sharedInstance](FMFSession, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __23__FMFHandle_prettyName__block_invoke;
    v15[3] = &unk_1EA4F27F8;
    v17 = &v18;
    v7 = v5;
    v16 = v7;
    objc_msgSend(v6, "getPrettyNameForHandle:completion:", self, v15);

    v8 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      LogCategory_Daemon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DC81B000, v9, OS_LOG_TYPE_DEFAULT, "timeOut prettyName", v14, 2u);
      }

    }
    v10 = (void *)v19[5];
    if (!v10 || !objc_msgSend(v10, "length"))
    {
      -[FMFHandle identifier](self, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19[5];
      v19[5] = v11;

    }
    -[FMFHandle set_prettyNameInternal:](self, "set_prettyNameInternal:", v19[5]);
    v13 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    return v13;
  }
}

void __23__FMFHandle_prettyName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  if (!v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
    dispatch_semaphore_signal(v7);

}

- (id)cachedPrettyName
{
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFHandle.m"), 223, CFSTR("This method should run on Main thread"));

  }
  return -[FMFHandle _prettyNameInternal](self, "_prettyNameInternal");
}

- (void)prettyNameWithCompletion:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, void *);

  v5 = (void (**)(id, void *))a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFHandle.m"), 229, CFSTR("This method should run on Main thread"));

  }
  -[FMFHandle _prettyNameInternal](self, "_prettyNameInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FMFHandle _prettyNameInternal](self, "_prettyNameInternal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v7);

  }
  else
  {
    +[FMFSession sharedInstance](FMFSession, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__FMFHandle_prettyNameWithCompletion___block_invoke;
    v10[3] = &unk_1EA4F25F8;
    v10[4] = self;
    v11 = v5;
    objc_msgSend(v8, "getPrettyNameForHandle:completion:", self, v10);

  }
}

void __38__FMFHandle_prettyNameWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__FMFHandle_prettyNameWithCompletion___block_invoke_2;
  block[3] = &unk_1EA4F2820;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __38__FMFHandle_prettyNameWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_prettyNameInternal:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)idsCorrelationIdentifierWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[FMFHandle _idsCorrelationIdentifierInternal](self, "_idsCorrelationIdentifierInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FMFHandle _idsCorrelationIdentifierInternal](self, "_idsCorrelationIdentifierInternal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__FMFHandle_idsCorrelationIdentifierWithCompletion___block_invoke;
    v7[3] = &unk_1EA4F2848;
    v7[4] = self;
    v8 = v4;
    -[FMFHandle correlationIdentifierForHandle:withCompletion:](self, "correlationIdentifierForHandle:withCompletion:", self, v7);

  }
}

void __52__FMFHandle_idsCorrelationIdentifierWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "set_idsCorrelationIdentifierInternal:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)recordId
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint8_t v10[16];
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  +[FMFSession sharedInstance](FMFSession, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __21__FMFHandle_recordId__block_invoke;
  v11[3] = &unk_1EA4F27F8;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  objc_msgSend(v4, "getRecordIdForHandle:completion:", self, v11);

  v6 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "timeOut recordId", v10, 2u);
    }

  }
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __21__FMFHandle_recordId__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
    dispatch_semaphore_signal(v4);

}

- (id)sanitizePhoneNumber:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCharactersInString:", CFSTR("+"));
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

  objc_msgSend(v4, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFHandle identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_1EA4F34A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)correlationIdentifierForHandle:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  -[FMFHandle IDSRecipientFromHandle:](self, "IDSRecipientFromHandle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v20 = 0;
  v11 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__FMFHandle_correlationIdentifierForHandle_withCompletion___block_invoke;
  v15[3] = &unk_1EA4F2870;
  v13 = v8;
  v16 = v13;
  v18 = v19;
  v14 = v7;
  v17 = v14;
  objc_msgSend(v9, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v10, CFSTR("com.apple.private.alloy.fmf"), CFSTR("com.apple.private.alloy.fmf"), v11, v15);

  _Block_object_dispose(v19, 8);
}

void __59__FMFHandle_correlationIdentifierForHandle_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "senderCorrelationIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1[6] + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(a1[5] + 16))();

}

- (id)IDSRecipientFromHandle:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[FMFHandle isPhoneNumber](self, "isPhoneNumber");
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = IDSCopyIDForPhoneNumber();
  else
    v7 = MEMORY[0x1DF0CE720](v6);
  v8 = (void *)v7;

  return v8;
}

- (BOOL)isFamilyMember
{
  return self->_isFamilyMember;
}

- (void)setIsFamilyMember:(BOOL)a3
{
  self->_isFamilyMember = a3;
}

- (void)setAliasServerIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)invitationSentToIds
{
  return self->_invitationSentToIds;
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSString)_prettyNameInternal
{
  return self->__prettyNameInternal;
}

- (void)set_prettyNameInternal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)_idsCorrelationIdentifierInternal
{
  return self->__idsCorrelationIdentifierInternal;
}

- (void)set_idsCorrelationIdentifierInternal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

@end
