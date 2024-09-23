@implementation MPCPlayerResponseParticipant

- (MPCPlayerResponseParticipant)initWithIdentifier:(id)a3 identifierType:(int64_t)a4 participantIdentifier:(id)a5 displayName:(id)a6 response:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPCPlayerResponseParticipant *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *participantIdentifier;
  uint64_t v21;
  NSString *displayName;
  objc_super v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MPCPlayerResponseParticipant;
  v16 = -[MPCPlayerResponseParticipant init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v16->_identifierType = a4;
    v19 = objc_msgSend(v13, "copy");
    participantIdentifier = v16->_participantIdentifier;
    v16->_participantIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v21;

    objc_storeWeak((id *)&v16->_response, v15);
  }

  return v16;
}

- (NSString)description
{
  int64_t identifierType;
  const __CFString *v3;
  const __CFString *v4;

  identifierType = self->_identifierType;
  v3 = CFSTR("unknown");
  if (identifierType == 1)
    v3 = CFSTR("resolvable");
  if (identifierType)
    v4 = v3;
  else
    v4 = CFSTR("basic");
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p %@ id[%@]=%@ displayName=\"%@\">"), objc_opt_class(), self, self->_identifier, v4, self->_participantIdentifier, self->_displayName);
}

- (id)_stateDumpObject
{
  void *v2;
  const __CFString *identifier;
  MPModelSharedListeningParticipant *modelObject;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCED8];
  identifier = (const __CFString *)self->_identifier;
  v8[0] = CFSTR("identifier");
  v8[1] = CFSTR("modelObject");
  modelObject = (MPModelSharedListeningParticipant *)CFSTR("@");
  if (!identifier)
    identifier = CFSTR("@");
  if (self->_modelObject)
    modelObject = self->_modelObject;
  v9[0] = identifier;
  v9[1] = modelObject;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_loadWeakRetained((id *)&self->_response);
}

- (MPModelSharedListeningParticipant)modelObject
{
  return self->_modelObject;
}

- (int64_t)identifierType
{
  return self->_identifierType;
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_destroyWeak((id *)&self->_response);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
