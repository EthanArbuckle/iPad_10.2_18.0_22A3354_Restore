@implementation _GEOTransitRoutingIncidentMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitRoutingIncidentMessage)initWithIncidentMessageIndex:(unint64_t)a3 decoderData:(id)a4
{
  id v6;
  void *v7;
  _GEOTransitRoutingIncidentMessage *v8;

  v6 = a4;
  if (objc_msgSend(v6, "transitIncidentMessagesCount") <= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "transitIncidentMessageAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[_GEOTransitRoutingIncidentMessage initWithIncidentMessage:decoderData:](self, "initWithIncidentMessage:decoderData:", v7, v6);

    v8 = self;
  }

  return v8;
}

- (_GEOTransitRoutingIncidentMessage)initWithIncidentMessage:(id)a3 decoderData:(id)a4
{
  id v7;
  id v8;
  _GEOTransitRoutingIncidentMessage *v9;
  _GEOTransitRoutingIncidentMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitRoutingIncidentMessage;
  v9 = -[_GEOTransitRoutingIncidentMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_routingIncidentMessage, a3);
    -[_GEOTransitRoutingIncidentMessage _populateTransitIncidentsWithDecoderData:](v10, "_populateTransitIncidentsWithDecoderData:", v8);
  }

  return v10;
}

- (id)initFakeLineIncidentMessageInLine:(id)a3
{
  id v4;
  id v5;
  GEOPBTransitRoutingIncidentMessage *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitRoutingIncidentMessage;
  v5 = -[_GEOTransitRoutingIncidentMessage init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(GEOPBTransitRoutingIncidentMessage);
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    -[GEOPBTransitRoutingIncidentMessage setRoutingMessage:](*((_QWORD *)v5 + 1), CFSTR("Fake Line Incident"));
    objc_msgSend(v5, "_fakeTransitLineIncidentInLine:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v8, 0);
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

  }
  return v5;
}

- (_GEOTransitRoutingIncidentMessage)initWithCoder:(id)a3
{
  id v4;
  _GEOTransitRoutingIncidentMessage *v5;
  uint64_t v6;
  GEOPBTransitRoutingIncidentMessage *routingIncidentMessage;
  uint64_t v8;
  NSArray *transitIncidents;
  _GEOTransitRoutingIncidentMessage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitRoutingIncidentMessage;
  v5 = -[_GEOTransitRoutingIncidentMessage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routingIncidentMessage"));
    v6 = objc_claimAutoreleasedReturnValue();
    routingIncidentMessage = v5->_routingIncidentMessage;
    v5->_routingIncidentMessage = (GEOPBTransitRoutingIncidentMessage *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_transitIncidents"));
    v8 = objc_claimAutoreleasedReturnValue();
    transitIncidents = v5->_transitIncidents;
    v5->_transitIncidents = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOPBTransitRoutingIncidentMessage *routingIncidentMessage;
  id v5;

  routingIncidentMessage = self->_routingIncidentMessage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", routingIncidentMessage, CFSTR("_routingIncidentMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transitIncidents, CFSTR("_transitIncidents"));

}

- (void)_populateTransitIncidentsWithDecoderData:(id)a3
{
  void *v4;
  unint64_t i;
  GEOPBTransitRoutingIncidentMessage *routingIncidentMessage;
  unint64_t count;
  void *v8;
  _GEOTransitIncident *v9;
  NSArray *v10;
  NSArray *transitIncidents;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    routingIncidentMessage = self->_routingIncidentMessage;
    if (routingIncidentMessage)
    {
      -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs]((uint64_t)self->_routingIncidentMessage);
      count = routingIncidentMessage->_transitIncidentIndexs.count;
    }
    else
    {
      count = 0;
    }
    if (i >= count)
      break;
    objc_msgSend(v12, "transitIncidentAtIndex:", -[GEOPBTransitRoutingIncidentMessage transitIncidentIndexAtIndex:]((uint64_t)self->_routingIncidentMessage, i));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_GEOTransitIncident initWithIncident:]([_GEOTransitIncident alloc], "initWithIncident:", v8);
    objc_msgSend(v4, "addObject:", v9);

  }
  v10 = (NSArray *)objc_msgSend(v4, "copy");
  transitIncidents = self->_transitIncidents;
  self->_transitIncidents = v10;

}

- (id)_fakeTransitLineIncidentInLine:(id)a3
{
  id v3;
  GEOPBTransitIncident *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  GEOPBTransitIncidentEntity *v9;
  uint64_t v10;
  void *v11;
  _GEOTransitIncident *v12;

  v3 = a3;
  v4 = objc_alloc_init(GEOPBTransitIncident);
  -[GEOPBTransitIncident setTitleString:]((uint64_t)v4, CFSTR("Worker Strike (Fake)"));
  -[GEOPBTransitIncident setShortDescriptionString:]((uint64_t)v4, CFSTR("Possible delays due to strike"));
  -[GEOPBTransitIncident setLongDescriptionString:]((uint64_t)v4, CFSTR("Only one train out of three is working due to national strike of public transit workers."));
  if (v4)
  {
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 0x80u;
    v4->_blocking = 0;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 8u;
    v4->_iconEnum = 0;
    v5 = time(0);
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 0x20u;
    v4->_startDatetime = v5 - 978307680;
    v6 = v4->_startDatetime + 1934;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 2u;
    v4->_creationDatetime = v6;
    v7 = v4->_startDatetime + 3158;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 0x40u;
    v4->_updatedDatetime = v7;
    v8 = v4->_startDatetime + 5163;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 4u;
    v4->_endDatetime = v8;
  }
  else
  {
    time(0);
  }
  v9 = objc_alloc_init(GEOPBTransitIncidentEntity);
  v10 = objc_msgSend(v3, "muid");

  if (v9)
  {
    *(_BYTE *)&v9->_flags |= 1u;
    v9->_affectedMuid = v10;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
  -[GEOPBTransitIncident setAffectedEntitys:]((uint64_t)v4, v11);

  v12 = -[_GEOTransitIncident initWithIncident:]([_GEOTransitIncident alloc], "initWithIncident:", v4);
  return v12;
}

- (NSString)routingMessage
{
  return -[GEOPBTransitRoutingIncidentMessage routingMessage]((id *)&self->_routingIncidentMessage->super.super.isa);
}

- (NSArray)transitIncidents
{
  return self->_transitIncidents;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = a3;
  if (!objc_msgSend(v6, "conformsToProtocol:", &unk_1EDFFA128))
  {
    v10 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  -[_GEOTransitRoutingIncidentMessage routingMessage](self, "routingMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "routingMessage"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_GEOTransitRoutingIncidentMessage routingMessage](self, "routingMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routingMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v4))
    {
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v9 = 1;
  }
  else
  {
    v17 = 0;
    v9 = 0;
  }
  -[_GEOTransitRoutingIncidentMessage transitIncidents](self, "transitIncidents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v7, "transitIncidents"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_GEOTransitRoutingIncidentMessage transitIncidents](self, "transitIncidents", v15, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitIncidents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqualToArray:", v13);

    if (v11)
      goto LABEL_15;
  }
  else
  {
    v16 = 0;
    v10 = 1;
  }

LABEL_15:
  if (v9)
    goto LABEL_16;
LABEL_17:
  if (!v8)

LABEL_20:
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_GEOTransitRoutingIncidentMessage routingMessage](self, "routingMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_GEOTransitRoutingIncidentMessage transitIncidents](self, "transitIncidents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_routingIncidentMessage, 0);
}

@end
