@implementation _GEOTransitIncident

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitIncident)initWithIncident:(id)a3
{
  id v5;
  _GEOTransitIncident *v6;
  _GEOTransitIncident *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GEOTransitIncident;
  v6 = -[_GEOTransitIncident init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_incident, a3);

  return v7;
}

- (_GEOTransitIncident)initWithCoder:(id)a3
{
  id v4;
  _GEOTransitIncident *v5;
  uint64_t v6;
  GEOPBTransitIncident *incident;
  _GEOTransitIncident *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOTransitIncident;
  v5 = -[_GEOTransitIncident init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("incident"));
    v6 = objc_claimAutoreleasedReturnValue();
    incident = v5->_incident;
    v5->_incident = (GEOPBTransitIncident *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  if (incident)
    objc_msgSend(a3, "encodeObject:forKey:", incident, CFSTR("incident"));
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_GEOTransitIncident muid](self, "muid");
  -[_GEOTransitIncident title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOTransitIncident summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOTransitIncident fullDescription](self, "fullDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %llu, %@, %@, %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)muid
{
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  if (incident)
    return incident->_incidentMuid;
  else
    return 0;
}

- (NSString)title
{
  return -[GEOPBTransitIncident titleString]((id *)&self->_incident->super.super.isa);
}

- (NSString)summary
{
  return -[GEOPBTransitIncident shortDescriptionString]((id *)&self->_incident->super.super.isa);
}

- (NSString)fullDescription
{
  return -[GEOPBTransitIncident longDescriptionString]((id *)&self->_incident->super.super.isa);
}

- (NSString)messageForRoutePlanning
{
  return -[GEOPBTransitIncident messageString]((id *)&self->_incident->super.super.isa);
}

- (NSString)messageForRouteStepping
{
  return -[GEOPBTransitIncident messageForIncidentType]((id *)&self->_incident->super.super.isa);
}

- (NSString)messageForNonRoutable
{
  return -[GEOPBTransitIncident messageForAllBlocking]((id *)&self->_incident->super.super.isa);
}

- (NSDate)startDate
{
  unint64_t v2;
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  if (!incident || (*(_BYTE *)&incident->_flags & 0x20) == 0)
    return (NSDate *)0;
  LODWORD(v2) = incident->_startDatetime;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v2);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)endDate
{
  unint64_t v2;
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  if (!incident || (*(_BYTE *)&incident->_flags & 4) == 0)
    return (NSDate *)0;
  LODWORD(v2) = incident->_endDatetime;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v2);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)iconType
{
  GEOPBTransitIncident *incident;
  unsigned int v3;

  incident = self->_incident;
  if (incident)
  {
    if ((*(_BYTE *)&incident->_flags & 8) != 0)
    {
      v3 = -[GEOPBTransitIncident iconEnum]((os_unfair_lock_s *)incident);
      if (v3 == 1)
        LODWORD(incident) = 2;
      else
        LODWORD(incident) = v3 == 0;
    }
    else
    {
      LODWORD(incident) = 0;
    }
  }
  return (int)incident;
}

- (NSDate)creationDate
{
  unint64_t v2;
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  if (!incident || (*(_BYTE *)&incident->_flags & 2) == 0)
    return (NSDate *)0;
  LODWORD(v2) = incident->_creationDatetime;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v2);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)lastUpdated
{
  unint64_t v2;
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  if (!incident || (*(_BYTE *)&incident->_flags & 0x40) == 0)
    return (NSDate *)0;
  LODWORD(v2) = incident->_updatedDatetime;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v2);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isBlockingIncident
{
  GEOPBTransitIncident *incident;

  incident = self->_incident;
  return incident && incident->_blocking;
}

- (NSArray)affectedEntities
{
  return (NSArray *)-[GEOPBTransitIncident affectedEntitys]((id *)&self->_incident->super.super.isa);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  int v58;
  void *v59;
  void *v60;
  int v61;

  v8 = a3;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EDFF9DC0))
  {
    v9 = v8;
    v10 = -[_GEOTransitIncident isBlockingIncident](self, "isBlockingIncident");
    if (v10 != objc_msgSend(v9, "isBlockingIncident")
      || (v11 = -[_GEOTransitIncident iconType](self, "iconType"), v11 != objc_msgSend(v9, "iconType")))
    {
      v13 = 0;
LABEL_80:

      goto LABEL_81;
    }
    -[_GEOTransitIncident title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v9, "title"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident title](self, "title");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqualToString:", v4))
      {
        v13 = 0;
        goto LABEL_76;
      }
      v61 = 1;
    }
    else
    {
      v61 = 0;
    }
    -[_GEOTransitIncident summary](self, "summary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v9, "summary"), (v54 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident summary](self, "summary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "summary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v15;
      if (!objc_msgSend(v15, "isEqualToString:", v6))
      {
        v13 = 0;
        goto LABEL_73;
      }
      v59 = v5;
      v58 = 1;
    }
    else
    {
      v59 = v5;
      v54 = 0;
      v58 = 0;
    }
    -[_GEOTransitIncident fullDescription](self, "fullDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || (objc_msgSend(v9, "fullDescription"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident fullDescription](self, "fullDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fullDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v17;
      if (!objc_msgSend(v17, "isEqualToString:", v55))
      {
        v13 = 0;
LABEL_68:

LABEL_69:
        if (!v16)

        if (!v58)
        {
          v5 = v59;
          if (v14)
          {
LABEL_75:

            if (!v61)
            {
LABEL_77:
              if (!v12)

              goto LABEL_80;
            }
LABEL_76:

            goto LABEL_77;
          }
LABEL_74:

          goto LABEL_75;
        }
        v5 = v59;
LABEL_73:

        if (v14)
          goto LABEL_75;
        goto LABEL_74;
      }
      v53 = 1;
    }
    else
    {
      v50 = 0;
      v53 = 0;
    }
    -[_GEOTransitIncident startDate](self, "startDate");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57 || (objc_msgSend(v9, "startDate"), (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident startDate](self, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startDate");
      v52 = v18;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "isEqualToDate:", v51))
      {
        v13 = 0;
        goto LABEL_64;
      }
      v48 = 1;
    }
    else
    {
      v45 = 0;
      v48 = 0;
    }
    -[_GEOTransitIncident endDate](self, "endDate");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49 || (objc_msgSend(v9, "endDate"), (v40 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident endDate](self, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v19;
      if (!objc_msgSend(v19, "isEqualToDate:", v46))
      {
        v13 = 0;
        goto LABEL_60;
      }
      v43 = 1;
    }
    else
    {
      v40 = 0;
      v43 = 0;
    }
    -[_GEOTransitIncident creationDate](self, "creationDate");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44 || (objc_msgSend(v9, "creationDate"), (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident creationDate](self, "creationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "creationDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v20;
      if (!objc_msgSend(v20, "isEqualToDate:", v41))
      {
        v13 = 0;
        goto LABEL_56;
      }
      v38 = 1;
    }
    else
    {
      v35 = 0;
      v38 = 0;
    }
    -[_GEOTransitIncident lastUpdated](self, "lastUpdated");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39 || (objc_msgSend(v9, "lastUpdated"), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident lastUpdated](self, "lastUpdated");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastUpdated");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v21;
      if (!objc_msgSend(v21, "isEqualToDate:", v36))
      {
        v13 = 0;
        goto LABEL_52;
      }
      v34 = 1;
    }
    else
    {
      v31 = 0;
      v34 = 0;
    }
    -[_GEOTransitIncident affectedEntities](self, "affectedEntities");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22 || (objc_msgSend(v9, "affectedEntities"), (v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_GEOTransitIncident affectedEntities](self, "affectedEntities");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "affectedEntities");
      v33 = (void *)v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v32, "isEqualToArray:");

      if (v33)
      {

        if (!v34)
          goto LABEL_53;
        goto LABEL_52;
      }
      v29 = (void *)v30;
    }
    else
    {
      v29 = 0;
      v13 = 1;
    }

    if ((v34 & 1) == 0)
    {
LABEL_53:
      v24 = (void *)v39;
      if (!v39)
      {

        v24 = 0;
      }

      if (!v38)
      {
LABEL_57:
        v25 = (void *)v44;
        if (!v44)
        {

          v25 = 0;
        }

        if (!v43)
        {
LABEL_61:
          v26 = (void *)v49;
          if (!v49)
          {

            v26 = 0;
          }

          if (!v48)
          {
LABEL_65:
            v27 = (void *)v57;
            if (!v57)
            {

              v27 = 0;
            }

            if (!v53)
              goto LABEL_69;
            goto LABEL_68;
          }
LABEL_64:

          goto LABEL_65;
        }
LABEL_60:

        goto LABEL_61;
      }
LABEL_56:

      goto LABEL_57;
    }
LABEL_52:

    goto LABEL_53;
  }
  v13 = 0;
LABEL_81:

  return v13;
}

- (GEOTransitIconDataSource)artworkDataSource
{
  void *v2;
  void *v3;

  -[GEOPBTransitIncident incidentTypeArtwork]((id *)&self->_incident->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitIconDataSource *)v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;

  if (-[_GEOTransitIncident isBlockingIncident](self, "isBlockingIncident"))
    v3 = 2654435761;
  else
    v3 = 0;
  v4 = 2654435761 * -[_GEOTransitIncident iconType](self, "iconType");
  -[_GEOTransitIncident title](self, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v23, "hash");
  -[_GEOTransitIncident summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[_GEOTransitIncident fullDescription](self, "fullDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[_GEOTransitIncident startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4 ^ v9 ^ objc_msgSend(v10, "hash");
  -[_GEOTransitIncident endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[_GEOTransitIncident creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[_GEOTransitIncident lastUpdated](self, "lastUpdated");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[_GEOTransitIncident affectedEntities](self, "affectedEntities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[_GEOTransitIncident artworkDataSource](self, "artworkDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v11 ^ v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incident, 0);
}

@end
