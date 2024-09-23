@implementation MNServerSessionStateInfo

- (NSDictionary)displayedTrafficBanners
{
  return (NSDictionary *)self->_displayedTrafficBanners;
}

- (void)updateWithRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *v9;
  NSData *sessionState;
  NSData *v11;
  NSData *directionsResponseID;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSData *v17;
  NSData *v18;
  NSData *v19;
  void *v20;
  NSUUID *v21;
  NSUUID *uniqueRouteID;
  NSObject *p_super;
  NSObject *v24;
  NSData *v25;
  NSUUID *v26;
  NSData *v27;
  int v28;
  MNServerSessionStateInfo *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "directionsResponseID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "routeInitializerData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "directionsResponse");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sessionState");
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      sessionState = self->_sessionState;
      self->_sessionState = v9;

      objc_msgSend(v5, "directionsResponseID");
      v11 = (NSData *)objc_claimAutoreleasedReturnValue();
      directionsResponseID = self->_directionsResponseID;
      self->_directionsResponseID = v11;
      v13 = 32;
    }
    else
    {
      objc_msgSend(v5, "etauResponseID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_7;
      objc_msgSend(v5, "routeInitializerData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "etaTrafficUpdateResponse");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sessionState");
      v17 = (NSData *)objc_claimAutoreleasedReturnValue();
      v18 = self->_sessionState;
      self->_sessionState = v17;

      objc_msgSend(v5, "etauResponseID");
      v19 = (NSData *)objc_claimAutoreleasedReturnValue();
      directionsResponseID = self->_etauResponseID;
      self->_etauResponseID = v19;
      v13 = 24;
    }

    v20 = *(Class *)((char *)&self->super.isa + v13);
    *(Class *)((char *)&self->super.isa + v13) = 0;

LABEL_7:
    objc_msgSend(v5, "uniqueRouteID");
    v21 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uniqueRouteID = self->_uniqueRouteID;
    self->_uniqueRouteID = v21;

    MNGetMNServerSessionStateInfoLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = self;
      _os_log_impl(&dword_1B0AD7000, p_super, OS_LOG_TYPE_DEFAULT, "Updating session state with route: %@", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v28) = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: route != nil", (uint8_t *)&v28, 2u);
  }
  MNGetMNServerSessionStateInfoLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v28) = 0;
    _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_ERROR, "Server session state can't be updated with a nil route. The next directions or ETAU request will likely fail.", (uint8_t *)&v28, 2u);
  }

  v25 = self->_sessionState;
  self->_sessionState = 0;

  v26 = self->_uniqueRouteID;
  self->_uniqueRouteID = 0;

  v27 = self->_directionsResponseID;
  self->_directionsResponseID = 0;

  p_super = &self->_etauResponseID->super;
  self->_etauResponseID = 0;
LABEL_9:

}

- (void)updateWithETAUResponse:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  NSData *sessionState;
  NSData *v8;
  NSData *etauResponseID;
  NSData *directionsResponseID;
  NSObject *p_super;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  NSData *v17;
  NSData *v18;
  MNServerSessionStateInfo *v19;
  int v20;
  MNServerSessionStateInfo *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_uniqueRouteID)
  {
    if (!v4)
    {
      MNGetMNServerSessionStateInfoLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      LOWORD(v20) = 0;
      v12 = "Trying to update server session state with a nil ETAU response. Ignoring, but the next directions or ETAU request may fail.";
      v13 = p_super;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 2;
      goto LABEL_6;
    }
    if ((objc_msgSend(v4, "hasSessionState") & 1) != 0)
    {
      objc_msgSend(v5, "sessionState");
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
      sessionState = self->_sessionState;
      self->_sessionState = v6;

      objc_msgSend(v5, "responseId");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      etauResponseID = self->_etauResponseID;
      self->_etauResponseID = v8;

      directionsResponseID = self->_directionsResponseID;
      self->_directionsResponseID = 0;

      MNGetMNServerSessionStateInfoLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = self;
        v12 = "Updating session state from ETAU response: %@";
        v13 = p_super;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 12;
LABEL_6:
        _os_log_impl(&dword_1B0AD7000, v13, v14, v12, (uint8_t *)&v20, v15);
      }
    }
    else
    {
      MNGetMNServerSessionStateInfoLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "formattedText");
        v19 = (MNServerSessionStateInfo *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v19;
        _os_log_impl(&dword_1B0AD7000, p_super, OS_LOG_TYPE_ERROR, "ETAU response has no session state. This is probably a server error. Full ETAU response: %@", (uint8_t *)&v20, 0xCu);

      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v20) = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _uniqueRouteID != nil", (uint8_t *)&v20, 2u);
    }
    MNGetMNServerSessionStateInfoLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "Server session state can only be updated from an ETAU response if there is already an existing route. The next directions or ETAU request will likely fail.", (uint8_t *)&v20, 2u);
    }

    v17 = self->_sessionState;
    self->_sessionState = 0;

    v18 = self->_directionsResponseID;
    self->_directionsResponseID = 0;

    p_super = &self->_etauResponseID->super;
    self->_etauResponseID = 0;
  }
LABEL_7:

}

- (void)addDisplayedBannerID:(id)a3 withEventInfo:(id)a4
{
  id v6;
  NSMutableDictionary *displayedTrafficBanners;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12)
  {
    displayedTrafficBanners = self->_displayedTrafficBanners;
    v8 = v12;
    if (displayedTrafficBanners)
    {
      if (v6)
      {
LABEL_4:
        -[NSMutableDictionary setValue:forKey:](displayedTrafficBanners, "setValue:forKey:", v6, v8);
        goto LABEL_7;
      }
    }
    else
    {
      v9 = (NSMutableDictionary *)objc_opt_new();
      v10 = self->_displayedTrafficBanners;
      self->_displayedTrafficBanners = v9;

      v8 = v12;
      displayedTrafficBanners = self->_displayedTrafficBanners;
      if (v6)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](displayedTrafficBanners, "setValue:forKey:", v11, v12);

  }
LABEL_7:

}

- (void)updateWithSessionState:(id)a3
{
  id v5;
  NSData *etauResponseID;
  NSData *directionsResponseID;
  NSObject *p_super;
  NSObject *v9;
  NSData *sessionState;
  NSData *v11;
  int v12;
  MNServerSessionStateInfo *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_uniqueRouteID)
  {
    objc_storeStrong((id *)&self->_sessionState, a3);
    etauResponseID = self->_etauResponseID;
    self->_etauResponseID = 0;

    directionsResponseID = self->_directionsResponseID;
    self->_directionsResponseID = 0;

    MNGetMNServerSessionStateInfoLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_1B0AD7000, p_super, OS_LOG_TYPE_DEFAULT, "Updating session state from unknown source: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _uniqueRouteID != nil", (uint8_t *)&v12, 2u);
    }
    MNGetMNServerSessionStateInfoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Updating server session state requires an existing route. The next directions or ETAU request will likely fail.", (uint8_t *)&v12, 2u);
    }

    sessionState = self->_sessionState;
    self->_sessionState = 0;

    v11 = self->_directionsResponseID;
    self->_directionsResponseID = 0;

    p_super = &self->_etauResponseID->super;
    self->_etauResponseID = 0;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSData copy](self->_sessionState, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSUUID copy](self->_uniqueRouteID, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSData copy](self->_directionsResponseID, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSData copy](self->_etauResponseID, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSMutableDictionary copy](self->_displayedTrafficBanners, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNServerSessionStateInfo)initWithCoder:(id)a3
{
  id v4;
  MNServerSessionStateInfo *v5;
  uint64_t v6;
  NSData *sessionState;
  uint64_t v8;
  NSUUID *uniqueRouteID;
  uint64_t v10;
  NSData *directionsResponseID;
  uint64_t v12;
  NSData *etauResponseID;
  uint64_t v14;
  NSMutableDictionary *displayedTrafficBanners;
  MNServerSessionStateInfo *v16;

  v4 = a3;
  v5 = -[MNServerSessionStateInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sessionState"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionState = v5->_sessionState;
    v5->_sessionState = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueRouteID"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueRouteID = v5->_uniqueRouteID;
    v5->_uniqueRouteID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsResponseID"));
    v10 = objc_claimAutoreleasedReturnValue();
    directionsResponseID = v5->_directionsResponseID;
    v5->_directionsResponseID = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etauResponseID"));
    v12 = objc_claimAutoreleasedReturnValue();
    etauResponseID = v5->_etauResponseID;
    v5->_etauResponseID = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayedTrafficBanners"));
    v14 = objc_claimAutoreleasedReturnValue();
    displayedTrafficBanners = v5->_displayedTrafficBanners;
    v5->_displayedTrafficBanners = (NSMutableDictionary *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *sessionState;
  id v5;

  sessionState = self->_sessionState;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionState, CFSTR("_sessionState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueRouteID, CFSTR("_uniqueRouteID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_directionsResponseID, CFSTR("_directionsResponseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_etauResponseID, CFSTR("_etauResponseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayedTrafficBanners, CFSTR("_displayedTrafficBanners"));

}

- (id)description
{
  void *v3;
  NSData *sessionState;
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

  v3 = (void *)objc_opt_new();
  sessionState = self->_sessionState;
  if (sessionState)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session state: %d bytes"), -[NSData length](sessionState, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("Session state: (null)"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Route: %@"), self->_uniqueRouteID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (self->_directionsResponseID)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_directionsResponseID, 4);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "uppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("DirectionsResponse: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  if (self->_etauResponseID)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_etauResponseID, 4);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "uppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("ETAUResponse: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)sessionState
{
  return self->_sessionState;
}

- (NSUUID)uniqueRouteID
{
  return self->_uniqueRouteID;
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (NSData)etauResponseID
{
  return self->_etauResponseID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedTrafficBanners, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_uniqueRouteID, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
}

@end
