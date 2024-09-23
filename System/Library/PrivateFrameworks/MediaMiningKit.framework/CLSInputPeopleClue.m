@implementation CLSInputPeopleClue

- (id)name
{
  CLSPersonIdentity *person;

  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  person = self->_person;
  if (person)
    -[CLSPersonIdentity fullName](person, "fullName");
  else
    -[CLSClue value](self, "value");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CLSPersonIdentity)person
{
  -[CLSInputClue prepareIfNeeded](self, "prepareIfNeeded");
  return self->_person;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)CLSInputPeopleClue;
  -[CLSClue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSInputPeopleClue name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tname:[%@]"), v6);

  return v5;
}

- (void)_prepareWithProgressBlock:(id)a3
{
  CLSPersonIdentity **p_person;
  void *v5;
  char isKindOfClass;
  CLSServiceManager *serviceManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  float v18;
  void *v19;
  char v20;
  uint64_t v21;
  CLSPersonIdentity *v22;
  CLSPersonIdentity *v23;

  p_person = &self->_person;
  if (!self->_person)
  {
    -[CLSClue value](self, "value", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      serviceManager = self->_serviceManager;
      -[CLSClue value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSInputPeopleClue photoLibrary](self, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSServiceManager personResultForName:inPhotoLibrary:](serviceManager, "personResultForName:inPhotoLibrary:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "person");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isMe"))
      {
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          -[CLSServiceManager mePerson](self->_serviceManager, "mePerson");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (!v16)
          {
            objc_msgSend(v11, "localIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setLocalIdentifier:", v17);

          }
        }
      }
      if (v10)
      {
        objc_storeStrong((id *)p_person, v11);
        objc_msgSend(v10, "confidence");
        -[CLSClue setConfidence:](self, "setConfidence:", v18);
      }
      else
      {
        v23 = *p_person;
        *p_person = 0;

      }
      goto LABEL_15;
    }
    -[CLSClue value](self, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) != 0)
    {
      -[CLSClue value](self, "value");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *p_person;
      *p_person = (CLSPersonIdentity *)v21;

      if (-[CLSPersonIdentity isMe](*p_person, "isMe"))
      {
        -[CLSServiceManager mePerson](self->_serviceManager, "mePerson");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSPersonIdentity mergeWithPerson:](*p_person, "mergeWithPerson:", v10);
LABEL_15:

      }
    }
  }
  self->super._needsPreparation = 0;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_photoLibrary, a3);
}

- (unint64_t)numberOfFaces
{
  return self->_numberOfFaces;
}

- (void)setNumberOfFaces:(unint64_t)a3
{
  self->_numberOfFaces = a3;
}

- (BOOL)includeMergeCandidates
{
  return self->_includeMergeCandidates;
}

- (void)setIncludeMergeCandidates:(BOOL)a3
{
  self->_includeMergeCandidates = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

+ (id)clueWithPeople:(id)a3 serviceManager:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a4;
  +[CLSClue _clueWithValue:forKey:](CLSInputPeopleClue, "_clueWithValue:forKey:", a3, CFSTR("Global People"));
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[14];
  v6[14] = v5;

  return v6;
}

+ (id)cluesWithPeoples:(id)a3 serviceManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_opt_class(), "clueWithPeople:serviceManager:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)clueWithPersonLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  +[CLSClue _clueWithValue:forKey:](CLSInputPeopleClue, "_clueWithValue:forKey:", a3, CFSTR("Global People"));
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPhotoLibrary:", v8);

  v10 = (void *)v9[14];
  v9[14] = v7;

  return v9;
}

+ (id)clueWithPersonContactIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  +[CLSClue _clueWithValue:forKey:](CLSInputPeopleClue, "_clueWithValue:forKey:", a3, CFSTR("Global People"));
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPhotoLibrary:", v8);

  v10 = (void *)v9[14];
  v9[14] = v7;

  return v9;
}

+ (id)clueWithConsolidatedPersonLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  void *v5;

  objc_msgSend(a1, "clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeMergeCandidates:", 1);
  return v5;
}

+ (id)cluesWithPersonLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend((id)objc_opt_class(), "clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v8, v9, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)cluesWithConsolidatedPersonLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend((id)objc_opt_class(), "clueWithConsolidatedPersonLocalIdentifier:inPhotoLibrary:serviceManager:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v8, v9, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

@end
