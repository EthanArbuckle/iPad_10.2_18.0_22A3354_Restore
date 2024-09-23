@implementation IUISessionChange

- (id)initBeginSession:(BOOL)a3 withID:(id)a4 documentTraits:(id)a5 documentState:(id)a6 andEndSessionWithID:(id)a7 options:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  IUISessionChange *v19;
  IUISessionChange *v20;
  NSUUID *v21;
  NSUUID *beginSessionID;
  RTIDocumentTraits *v23;
  RTIDocumentTraits *beginSessionDocumentTraits;
  RTIDocumentState *v25;
  RTIDocumentState *beginSessionDocumentState;
  NSUUID *v27;
  NSUUID *endSessionID;
  RTISessionOptions *v29;
  RTISessionOptions *options;
  objc_super v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)IUISessionChange;
  v19 = -[IUISessionChange init](&v32, "init");
  v20 = v19;
  if (v19)
  {
    v19->_isBeginningSession = a3;
    v21 = (NSUUID *)objc_msgSend(v14, "copy");
    beginSessionID = v20->_beginSessionID;
    v20->_beginSessionID = v21;

    v23 = (RTIDocumentTraits *)objc_msgSend(v15, "copy");
    beginSessionDocumentTraits = v20->_beginSessionDocumentTraits;
    v20->_beginSessionDocumentTraits = v23;

    v25 = (RTIDocumentState *)objc_msgSend(v16, "copy");
    beginSessionDocumentState = v20->_beginSessionDocumentState;
    v20->_beginSessionDocumentState = v25;

    v27 = (NSUUID *)objc_msgSend(v17, "copy");
    endSessionID = v20->_endSessionID;
    v20->_endSessionID = v27;

    v29 = (RTISessionOptions *)objc_msgSend(v18, "copy");
    options = v20->_options;
    v20->_options = v29;

  }
  return v20;
}

- (id)initBeginSessionWithID:(id)a3 documentTraits:(id)a4 documentState:(id)a5 options:(id)a6
{
  return -[IUISessionChange initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:](self, "initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:", 1, a3, a4, a5, 0, a6);
}

- (id)initEndSessionWithID:(id)a3 options:(id)a4
{
  return -[IUISessionChange initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:](self, "initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:", 0, 0, 0, 0, a3, a4);
}

- (id)initEndSessionWithID:(id)a3 andBeginPlaceholderSessionWithID:(id)a4 documentTraits:(id)a5 documentState:(id)a6 options:(id)a7
{
  return -[IUISessionChange initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:](self, "initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:", 1, a4, a5, a6, a3, a7);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (self->_isBeginningSession)
    v7 = "yes";
  else
    v7 = "no";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; begin:%s; beginID:%@; endID:%@>"),
                   v5,
                   self,
                   v7,
                   self->_beginSessionID,
                   self->_endSessionID));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isBeginningSession;
  id v5;

  isBeginningSession = self->_isBeginningSession;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isBeginningSession, CFSTR("isBeginningSession"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beginSessionID, CFSTR("beginSessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beginSessionDocumentTraits, CFSTR("documentTraits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beginSessionDocumentState, CFSTR("documentState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endSessionID, CFSTR("endSessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));

}

- (IUISessionChange)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  IUISessionChange *v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBeginningSession"));
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v6), CFSTR("beginSessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTIDocumentTraits, v9), CFSTR("documentTraits"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTIDocumentState, v12), CFSTR("documentState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v15), CFSTR("endSessionID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTISessionOptions, v18), CFSTR("options"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = -[IUISessionChange initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:](self, "initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:", v5, v8, v11, v14, v17, v20);
  return v21;
}

- (BOOL)isEndingSession
{
  return self->_endSessionID != 0;
}

- (BOOL)isBeginningSession
{
  return self->_isBeginningSession;
}

- (NSUUID)endSessionID
{
  return self->_endSessionID;
}

- (NSUUID)beginSessionID
{
  return self->_beginSessionID;
}

- (RTIDocumentTraits)beginSessionDocumentTraits
{
  return self->_beginSessionDocumentTraits;
}

- (RTIDocumentState)beginSessionDocumentState
{
  return self->_beginSessionDocumentState;
}

- (RTISessionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_beginSessionDocumentState, 0);
  objc_storeStrong((id *)&self->_beginSessionDocumentTraits, 0);
  objc_storeStrong((id *)&self->_beginSessionID, 0);
  objc_storeStrong((id *)&self->_endSessionID, 0);
}

@end
