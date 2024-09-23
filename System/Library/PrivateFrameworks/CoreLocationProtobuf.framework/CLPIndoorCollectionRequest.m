@implementation CLPIndoorCollectionRequest

- (void)clearIndoorWifis
{
  -[NSMutableArray removeAllObjects](self->_indoorWifis, "removeAllObjects");
}

- (void)addIndoorWifis:(id)a3
{
  id v4;
  NSMutableArray *indoorWifis;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  indoorWifis = self->_indoorWifis;
  v8 = v4;
  if (!indoorWifis)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_indoorWifis;
    self->_indoorWifis = v6;

    v4 = v8;
    indoorWifis = self->_indoorWifis;
  }
  -[NSMutableArray addObject:](indoorWifis, "addObject:", v4);

}

- (unint64_t)indoorWifisCount
{
  return -[NSMutableArray count](self->_indoorWifis, "count");
}

- (id)indoorWifisAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_indoorWifis, "objectAtIndex:", a3);
}

+ (Class)indoorWifisType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorLocations
{
  -[NSMutableArray removeAllObjects](self->_indoorLocations, "removeAllObjects");
}

- (void)addIndoorLocations:(id)a3
{
  id v4;
  NSMutableArray *indoorLocations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  indoorLocations = self->_indoorLocations;
  v8 = v4;
  if (!indoorLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_indoorLocations;
    self->_indoorLocations = v6;

    v4 = v8;
    indoorLocations = self->_indoorLocations;
  }
  -[NSMutableArray addObject:](indoorLocations, "addObject:", v4);

}

- (unint64_t)indoorLocationsCount
{
  return -[NSMutableArray count](self->_indoorLocations, "count");
}

- (id)indoorLocationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_indoorLocations, "objectAtIndex:", a3);
}

+ (Class)indoorLocationsType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorCMAttitudes
{
  -[NSMutableArray removeAllObjects](self->_indoorCMAttitudes, "removeAllObjects");
}

- (void)addIndoorCMAttitude:(id)a3
{
  id v4;
  NSMutableArray *indoorCMAttitudes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  indoorCMAttitudes = self->_indoorCMAttitudes;
  v8 = v4;
  if (!indoorCMAttitudes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_indoorCMAttitudes;
    self->_indoorCMAttitudes = v6;

    v4 = v8;
    indoorCMAttitudes = self->_indoorCMAttitudes;
  }
  -[NSMutableArray addObject:](indoorCMAttitudes, "addObject:", v4);

}

- (unint64_t)indoorCMAttitudesCount
{
  return -[NSMutableArray count](self->_indoorCMAttitudes, "count");
}

- (id)indoorCMAttitudeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_indoorCMAttitudes, "objectAtIndex:", a3);
}

+ (Class)indoorCMAttitudeType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorCMPedometers
{
  -[NSMutableArray removeAllObjects](self->_indoorCMPedometers, "removeAllObjects");
}

- (void)addIndoorCMPedometer:(id)a3
{
  id v4;
  NSMutableArray *indoorCMPedometers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  indoorCMPedometers = self->_indoorCMPedometers;
  v8 = v4;
  if (!indoorCMPedometers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_indoorCMPedometers;
    self->_indoorCMPedometers = v6;

    v4 = v8;
    indoorCMPedometers = self->_indoorCMPedometers;
  }
  -[NSMutableArray addObject:](indoorCMPedometers, "addObject:", v4);

}

- (unint64_t)indoorCMPedometersCount
{
  return -[NSMutableArray count](self->_indoorCMPedometers, "count");
}

- (id)indoorCMPedometerAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_indoorCMPedometers, "objectAtIndex:", a3);
}

+ (Class)indoorCMPedometerType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorMotionActivitys
{
  -[NSMutableArray removeAllObjects](self->_indoorMotionActivitys, "removeAllObjects");
}

- (void)addIndoorMotionActivity:(id)a3
{
  id v4;
  NSMutableArray *indoorMotionActivitys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  indoorMotionActivitys = self->_indoorMotionActivitys;
  v8 = v4;
  if (!indoorMotionActivitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_indoorMotionActivitys;
    self->_indoorMotionActivitys = v6;

    v4 = v8;
    indoorMotionActivitys = self->_indoorMotionActivitys;
  }
  -[NSMutableArray addObject:](indoorMotionActivitys, "addObject:", v4);

}

- (unint64_t)indoorMotionActivitysCount
{
  return -[NSMutableArray count](self->_indoorMotionActivitys, "count");
}

- (id)indoorMotionActivityAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_indoorMotionActivitys, "objectAtIndex:", a3);
}

+ (Class)indoorMotionActivityType
{
  return (Class)objc_opt_class();
}

- (void)clearIndoorPressures
{
  -[NSMutableArray removeAllObjects](self->_indoorPressures, "removeAllObjects");
}

- (void)addIndoorPressure:(id)a3
{
  id v4;
  NSMutableArray *indoorPressures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  indoorPressures = self->_indoorPressures;
  v8 = v4;
  if (!indoorPressures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_indoorPressures;
    self->_indoorPressures = v6;

    v4 = v8;
    indoorPressures = self->_indoorPressures;
  }
  -[NSMutableArray addObject:](indoorPressures, "addObject:", v4);

}

- (unint64_t)indoorPressuresCount
{
  return -[NSMutableArray count](self->_indoorPressures, "count");
}

- (id)indoorPressureAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_indoorPressures, "objectAtIndex:", a3);
}

+ (Class)indoorPressureType
{
  return (Class)objc_opt_class();
}

- (void)clearBundleIds
{
  -[NSMutableArray removeAllObjects](self->_bundleIds, "removeAllObjects");
}

- (void)addBundleId:(id)a3
{
  id v4;
  NSMutableArray *bundleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bundleIds = self->_bundleIds;
  v8 = v4;
  if (!bundleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_bundleIds;
    self->_bundleIds = v6;

    v4 = v8;
    bundleIds = self->_bundleIds;
  }
  -[NSMutableArray addObject:](bundleIds, "addObject:", v4);

}

- (unint64_t)bundleIdsCount
{
  return -[NSMutableArray count](self->_bundleIds, "count");
}

- (id)bundleIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bundleIds, "objectAtIndex:", a3);
}

+ (Class)bundleIdType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorCollectionRequest;
  -[CLPIndoorCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPIndoorCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPMeta *meta;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t jj;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  meta = self->_meta;
  if (meta)
  {
    -[CLPMeta dictionaryRepresentation](meta, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("meta"));

  }
  if (-[NSMutableArray count](self->_indoorWifis, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_indoorWifis, "count"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v7 = self->_indoorWifis;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v81 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("indoorWifis"));
  }
  if (-[NSMutableArray count](self->_indoorLocations, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_indoorLocations, "count"));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v14 = self->_indoorLocations;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v77 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("indoorLocations"));
  }
  if (-[NSMutableArray count](self->_indoorCMAttitudes, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_indoorCMAttitudes, "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v21 = self->_indoorCMAttitudes;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v73 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("indoorCMAttitude"));
  }
  if (-[NSMutableArray count](self->_indoorCMPedometers, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_indoorCMPedometers, "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v28 = self->_indoorCMPedometers;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v69 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * m), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("indoorCMPedometer"));
  }
  if (-[NSMutableArray count](self->_indoorMotionActivitys, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_indoorMotionActivitys, "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v35 = self->_indoorMotionActivitys;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v65;
      do
      {
        for (n = 0; n != v37; ++n)
        {
          if (*(_QWORD *)v65 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * n), "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
      }
      while (v37);
    }

    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("indoorMotionActivity"));
  }
  if (-[NSMutableArray count](self->_indoorPressures, "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_indoorPressures, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v42 = self->_indoorPressures;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v61;
      do
      {
        for (ii = 0; ii != v44; ++ii)
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * ii), "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
      }
      while (v44);
    }

    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("indoorPressure"));
  }
  if (-[NSMutableArray count](self->_bundleIds, "count"))
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_bundleIds, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v49 = self->_bundleIds;
    v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v56, v84, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v57;
      do
      {
        for (jj = 0; jj != v51; ++jj)
        {
          if (*(_QWORD *)v57 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * jj), "dictionaryRepresentation", (_QWORD)v56);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v54);

        }
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v56, v84, 16);
      }
      while (v51);
    }

    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("bundleId"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_meta)
    -[CLPIndoorCollectionRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v6 = self->_indoorWifis;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v66;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v66 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v8);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = self->_indoorLocations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v62;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v62 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v13);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v16 = self->_indoorCMAttitudes;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v58;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v58 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v18);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = self->_indoorCMPedometers;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v54;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    }
    while (v23);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v26 = self->_indoorMotionActivitys;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v50;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v50 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
    }
    while (v28);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v31 = self->_indoorPressures;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v46;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    }
    while (v33);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v36 = self->_bundleIds;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v42;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteSubmessage();
        ++v40;
      }
      while (v38 != v40);
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
    }
    while (v38);
  }

}

- (unsigned)requestTypeCode
{
  return 105;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t jj;
  void *v31;
  id v32;

  v32 = a3;
  objc_msgSend(v32, "setMeta:", self->_meta);
  if (-[CLPIndoorCollectionRequest indoorWifisCount](self, "indoorWifisCount"))
  {
    objc_msgSend(v32, "clearIndoorWifis");
    v4 = -[CLPIndoorCollectionRequest indoorWifisCount](self, "indoorWifisCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CLPIndoorCollectionRequest indoorWifisAtIndex:](self, "indoorWifisAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addIndoorWifis:", v7);

      }
    }
  }
  if (-[CLPIndoorCollectionRequest indoorLocationsCount](self, "indoorLocationsCount"))
  {
    objc_msgSend(v32, "clearIndoorLocations");
    v8 = -[CLPIndoorCollectionRequest indoorLocationsCount](self, "indoorLocationsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[CLPIndoorCollectionRequest indoorLocationsAtIndex:](self, "indoorLocationsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addIndoorLocations:", v11);

      }
    }
  }
  if (-[CLPIndoorCollectionRequest indoorCMAttitudesCount](self, "indoorCMAttitudesCount"))
  {
    objc_msgSend(v32, "clearIndoorCMAttitudes");
    v12 = -[CLPIndoorCollectionRequest indoorCMAttitudesCount](self, "indoorCMAttitudesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[CLPIndoorCollectionRequest indoorCMAttitudeAtIndex:](self, "indoorCMAttitudeAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addIndoorCMAttitude:", v15);

      }
    }
  }
  if (-[CLPIndoorCollectionRequest indoorCMPedometersCount](self, "indoorCMPedometersCount"))
  {
    objc_msgSend(v32, "clearIndoorCMPedometers");
    v16 = -[CLPIndoorCollectionRequest indoorCMPedometersCount](self, "indoorCMPedometersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[CLPIndoorCollectionRequest indoorCMPedometerAtIndex:](self, "indoorCMPedometerAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addIndoorCMPedometer:", v19);

      }
    }
  }
  if (-[CLPIndoorCollectionRequest indoorMotionActivitysCount](self, "indoorMotionActivitysCount"))
  {
    objc_msgSend(v32, "clearIndoorMotionActivitys");
    v20 = -[CLPIndoorCollectionRequest indoorMotionActivitysCount](self, "indoorMotionActivitysCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[CLPIndoorCollectionRequest indoorMotionActivityAtIndex:](self, "indoorMotionActivityAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addIndoorMotionActivity:", v23);

      }
    }
  }
  if (-[CLPIndoorCollectionRequest indoorPressuresCount](self, "indoorPressuresCount"))
  {
    objc_msgSend(v32, "clearIndoorPressures");
    v24 = -[CLPIndoorCollectionRequest indoorPressuresCount](self, "indoorPressuresCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[CLPIndoorCollectionRequest indoorPressureAtIndex:](self, "indoorPressureAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addIndoorPressure:", v27);

      }
    }
  }
  if (-[CLPIndoorCollectionRequest bundleIdsCount](self, "bundleIdsCount"))
  {
    objc_msgSend(v32, "clearBundleIds");
    v28 = -[CLPIndoorCollectionRequest bundleIdsCount](self, "bundleIdsCount");
    if (v28)
    {
      v29 = v28;
      for (jj = 0; jj != v29; ++jj)
      {
        -[CLPIndoorCollectionRequest bundleIdAtIndex:](self, "bundleIdAtIndex:", jj);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addBundleId:", v31);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v8 = self->_indoorWifis;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v76;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v76 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addIndoorWifis:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    }
    while (v10);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v14 = self->_indoorLocations;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v72;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v72 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend(v5, "addIndoorLocations:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    }
    while (v16);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v20 = self->_indoorCMAttitudes;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v68;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v68 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend(v5, "addIndoorCMAttitude:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v22);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v26 = self->_indoorCMPedometers;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v64;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v64 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v30), "copyWithZone:", a3);
        objc_msgSend(v5, "addIndoorCMPedometer:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    }
    while (v28);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v32 = self->_indoorMotionActivitys;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v60;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v60 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v36), "copyWithZone:", a3);
        objc_msgSend(v5, "addIndoorMotionActivity:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
    }
    while (v34);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v38 = self->_indoorPressures;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v56;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v56 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v42), "copyWithZone:", a3);
        objc_msgSend(v5, "addIndoorPressure:", v43);

        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
    }
    while (v40);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = self->_bundleIds;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v51, v79, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v52;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v52 != v47)
          objc_enumerationMutation(v44);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v48), "copyWithZone:", a3, (_QWORD)v51);
        objc_msgSend(v5, "addBundleId:", v49);

        ++v48;
      }
      while (v46 != v48);
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v51, v79, 16);
    }
    while (v46);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CLPMeta *meta;
  NSMutableArray *indoorWifis;
  NSMutableArray *indoorLocations;
  NSMutableArray *indoorCMAttitudes;
  NSMutableArray *indoorCMPedometers;
  NSMutableArray *indoorMotionActivitys;
  NSMutableArray *indoorPressures;
  NSMutableArray *bundleIds;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((meta = self->_meta, !((unint64_t)meta | v4[8])) || -[CLPMeta isEqual:](meta, "isEqual:"))
    && ((indoorWifis = self->_indoorWifis, !((unint64_t)indoorWifis | v4[7]))
     || -[NSMutableArray isEqual:](indoorWifis, "isEqual:"))
    && ((indoorLocations = self->_indoorLocations, !((unint64_t)indoorLocations | v4[4]))
     || -[NSMutableArray isEqual:](indoorLocations, "isEqual:"))
    && ((indoorCMAttitudes = self->_indoorCMAttitudes, !((unint64_t)indoorCMAttitudes | v4[2]))
     || -[NSMutableArray isEqual:](indoorCMAttitudes, "isEqual:"))
    && ((indoorCMPedometers = self->_indoorCMPedometers, !((unint64_t)indoorCMPedometers | v4[3]))
     || -[NSMutableArray isEqual:](indoorCMPedometers, "isEqual:"))
    && ((indoorMotionActivitys = self->_indoorMotionActivitys, !((unint64_t)indoorMotionActivitys | v4[5]))
     || -[NSMutableArray isEqual:](indoorMotionActivitys, "isEqual:"))
    && ((indoorPressures = self->_indoorPressures, !((unint64_t)indoorPressures | v4[6]))
     || -[NSMutableArray isEqual:](indoorPressures, "isEqual:")))
  {
    bundleIds = self->_bundleIds;
    if ((unint64_t)bundleIds | v4[1])
      v13 = -[NSMutableArray isEqual:](bundleIds, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[CLPMeta hash](self->_meta, "hash");
  v4 = -[NSMutableArray hash](self->_indoorWifis, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_indoorLocations, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_indoorCMAttitudes, "hash");
  v7 = -[NSMutableArray hash](self->_indoorCMPedometers, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_indoorMotionActivitys, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_indoorPressures, "hash");
  return v9 ^ -[NSMutableArray hash](self->_bundleIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPMeta *meta;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  meta = self->_meta;
  v6 = *((_QWORD *)v4 + 8);
  if (meta)
  {
    if (v6)
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
  }
  else if (v6)
  {
    -[CLPIndoorCollectionRequest setMeta:](self, "setMeta:");
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v67 != v10)
          objc_enumerationMutation(v7);
        -[CLPIndoorCollectionRequest addIndoorWifis:](self, "addIndoorWifis:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v9);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v12 = *((id *)v4 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(v12);
        -[CLPIndoorCollectionRequest addIndoorLocations:](self, "addIndoorLocations:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v14);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v17 = *((id *)v4 + 2);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v17);
        -[CLPIndoorCollectionRequest addIndoorCMAttitude:](self, "addIndoorCMAttitude:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v19);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = *((id *)v4 + 3);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        -[CLPIndoorCollectionRequest addIndoorCMPedometer:](self, "addIndoorCMPedometer:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    }
    while (v24);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v27 = *((id *)v4 + 5);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v51;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v27);
        -[CLPIndoorCollectionRequest addIndoorMotionActivity:](self, "addIndoorMotionActivity:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * n));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
    }
    while (v29);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v32 = *((id *)v4 + 6);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v47;
    do
    {
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(v32);
        -[CLPIndoorCollectionRequest addIndoorPressure:](self, "addIndoorPressure:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * ii));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
    }
    while (v34);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v37 = *((id *)v4 + 1);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v43;
    do
    {
      for (jj = 0; jj != v39; ++jj)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(v37);
        -[CLPIndoorCollectionRequest addBundleId:](self, "addBundleId:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * jj), (_QWORD)v42);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
    }
    while (v39);
  }

}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (NSMutableArray)indoorWifis
{
  return self->_indoorWifis;
}

- (void)setIndoorWifis:(id)a3
{
  objc_storeStrong((id *)&self->_indoorWifis, a3);
}

- (NSMutableArray)indoorLocations
{
  return self->_indoorLocations;
}

- (void)setIndoorLocations:(id)a3
{
  objc_storeStrong((id *)&self->_indoorLocations, a3);
}

- (NSMutableArray)indoorCMAttitudes
{
  return self->_indoorCMAttitudes;
}

- (void)setIndoorCMAttitudes:(id)a3
{
  objc_storeStrong((id *)&self->_indoorCMAttitudes, a3);
}

- (NSMutableArray)indoorCMPedometers
{
  return self->_indoorCMPedometers;
}

- (void)setIndoorCMPedometers:(id)a3
{
  objc_storeStrong((id *)&self->_indoorCMPedometers, a3);
}

- (NSMutableArray)indoorMotionActivitys
{
  return self->_indoorMotionActivitys;
}

- (void)setIndoorMotionActivitys:(id)a3
{
  objc_storeStrong((id *)&self->_indoorMotionActivitys, a3);
}

- (NSMutableArray)indoorPressures
{
  return self->_indoorPressures;
}

- (void)setIndoorPressures:(id)a3
{
  objc_storeStrong((id *)&self->_indoorPressures, a3);
}

- (NSMutableArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_indoorWifis, 0);
  objc_storeStrong((id *)&self->_indoorPressures, 0);
  objc_storeStrong((id *)&self->_indoorMotionActivitys, 0);
  objc_storeStrong((id *)&self->_indoorLocations, 0);
  objc_storeStrong((id *)&self->_indoorCMPedometers, 0);
  objc_storeStrong((id *)&self->_indoorCMAttitudes, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPIndoorCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 9490, "self->_meta != nil");
}

@end
