@implementation INWholeHouseAudioMetadata

- (INWholeHouseAudioMetadata)initWithSpeakerNames:(id)a3 speakerRooms:(id)a4 permanentNames:(id)a5 intentSpeakerNames:(id)a6 intentSpeakerRooms:(id)a7 intentDestinationSpeakers:(id)a8 intentPermanentNames:(id)a9 spokenEntityTypes:(id)a10 spokenEntityNames:(id)a11 numberOfHomeAutomationWords:(id)a12 isAllSpeakers:(id)a13 isPauseOrStop:(id)a14 isWholeHouseAudioCommand:(id)a15 isInHere:(id)a16 hasExcept:(id)a17 isParticipatingSpeaker:(id)a18
{
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  INWholeHouseAudioMetadata *v34;
  uint64_t v35;
  NSArray *speakerNames;
  uint64_t v37;
  NSArray *speakerRooms;
  uint64_t v39;
  NSArray *permanentNames;
  uint64_t v41;
  NSArray *intentSpeakerNames;
  uint64_t v43;
  NSArray *intentSpeakerRooms;
  uint64_t v45;
  NSArray *intentDestinationSpeakers;
  uint64_t v47;
  NSArray *intentPermanentNames;
  uint64_t v49;
  NSArray *spokenEntityTypes;
  uint64_t v51;
  NSArray *spokenEntityNames;
  uint64_t v53;
  NSNumber *numberOfHomeAutomationWords;
  uint64_t v55;
  NSNumber *isAllSpeakers;
  uint64_t v57;
  NSNumber *isPauseOrStop;
  uint64_t v59;
  NSNumber *isWholeHouseAudioCommand;
  uint64_t v61;
  NSNumber *isInHere;
  uint64_t v63;
  NSNumber *hasExcept;
  uint64_t v65;
  NSNumber *isParticipatingSpeaker;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  objc_super v76;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v75 = a6;
  v74 = a7;
  v73 = a8;
  v72 = a9;
  v26 = v25;
  v71 = a10;
  v27 = v24;
  v70 = a11;
  v69 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v32 = a17;
  v33 = a18;
  v76.receiver = self;
  v76.super_class = (Class)INWholeHouseAudioMetadata;
  v34 = -[INWholeHouseAudioMetadata init](&v76, sel_init);
  if (v34)
  {
    v35 = objc_msgSend(v23, "copy");
    speakerNames = v34->_speakerNames;
    v34->_speakerNames = (NSArray *)v35;

    v37 = objc_msgSend(v27, "copy");
    speakerRooms = v34->_speakerRooms;
    v34->_speakerRooms = (NSArray *)v37;

    v39 = objc_msgSend(v26, "copy");
    permanentNames = v34->_permanentNames;
    v34->_permanentNames = (NSArray *)v39;

    v41 = objc_msgSend(v75, "copy");
    intentSpeakerNames = v34->_intentSpeakerNames;
    v34->_intentSpeakerNames = (NSArray *)v41;

    v43 = objc_msgSend(v74, "copy");
    intentSpeakerRooms = v34->_intentSpeakerRooms;
    v34->_intentSpeakerRooms = (NSArray *)v43;

    v45 = objc_msgSend(v73, "copy");
    intentDestinationSpeakers = v34->_intentDestinationSpeakers;
    v34->_intentDestinationSpeakers = (NSArray *)v45;

    v47 = objc_msgSend(v72, "copy");
    intentPermanentNames = v34->_intentPermanentNames;
    v34->_intentPermanentNames = (NSArray *)v47;

    v49 = objc_msgSend(v71, "copy");
    spokenEntityTypes = v34->_spokenEntityTypes;
    v34->_spokenEntityTypes = (NSArray *)v49;

    v51 = objc_msgSend(v70, "copy");
    spokenEntityNames = v34->_spokenEntityNames;
    v34->_spokenEntityNames = (NSArray *)v51;

    v53 = objc_msgSend(v69, "copy");
    numberOfHomeAutomationWords = v34->_numberOfHomeAutomationWords;
    v34->_numberOfHomeAutomationWords = (NSNumber *)v53;

    v55 = objc_msgSend(v28, "copy");
    isAllSpeakers = v34->_isAllSpeakers;
    v34->_isAllSpeakers = (NSNumber *)v55;

    v57 = objc_msgSend(v29, "copy");
    isPauseOrStop = v34->_isPauseOrStop;
    v34->_isPauseOrStop = (NSNumber *)v57;

    v59 = objc_msgSend(v30, "copy");
    isWholeHouseAudioCommand = v34->_isWholeHouseAudioCommand;
    v34->_isWholeHouseAudioCommand = (NSNumber *)v59;

    v61 = objc_msgSend(v31, "copy");
    isInHere = v34->_isInHere;
    v34->_isInHere = (NSNumber *)v61;

    v63 = objc_msgSend(v32, "copy");
    hasExcept = v34->_hasExcept;
    v34->_hasExcept = (NSNumber *)v63;

    v65 = objc_msgSend(v33, "copy");
    isParticipatingSpeaker = v34->_isParticipatingSpeaker;
    v34->_isParticipatingSpeaker = (NSNumber *)v65;

  }
  return v34;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = -[NSArray hash](self->_speakerNames, "hash");
  v4 = -[NSArray hash](self->_speakerRooms, "hash") ^ v3;
  v5 = -[NSArray hash](self->_permanentNames, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_intentSpeakerNames, "hash");
  v7 = -[NSArray hash](self->_intentSpeakerRooms, "hash");
  v8 = v7 ^ -[NSArray hash](self->_intentDestinationSpeakers, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_intentPermanentNames, "hash");
  v10 = -[NSArray hash](self->_spokenEntityTypes, "hash");
  v11 = v10 ^ -[NSArray hash](self->_spokenEntityNames, "hash");
  v12 = v11 ^ -[NSNumber hash](self->_numberOfHomeAutomationWords, "hash");
  v13 = v9 ^ v12 ^ -[NSNumber hash](self->_isAllSpeakers, "hash");
  v14 = -[NSNumber hash](self->_isPauseOrStop, "hash");
  v15 = v14 ^ -[NSNumber hash](self->_isWholeHouseAudioCommand, "hash");
  v16 = v15 ^ -[NSNumber hash](self->_isInHere, "hash");
  v17 = v16 ^ -[NSNumber hash](self->_hasExcept, "hash");
  return v13 ^ v17 ^ -[NSNumber hash](self->_isParticipatingSpeaker, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INWholeHouseAudioMetadata *v4;
  INWholeHouseAudioMetadata *v5;
  NSArray *speakerNames;
  NSArray *speakerRooms;
  NSArray *permanentNames;
  NSArray *intentSpeakerNames;
  NSArray *intentSpeakerRooms;
  NSArray *intentDestinationSpeakers;
  NSArray *intentPermanentNames;
  NSArray *spokenEntityTypes;
  NSArray *spokenEntityNames;
  NSNumber *numberOfHomeAutomationWords;
  NSNumber *isAllSpeakers;
  NSNumber *isPauseOrStop;
  NSNumber *isWholeHouseAudioCommand;
  NSNumber *isInHere;
  NSNumber *hasExcept;
  NSNumber *isParticipatingSpeaker;
  BOOL v22;

  v4 = (INWholeHouseAudioMetadata *)a3;
  if (v4 == self)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      speakerNames = self->_speakerNames;
      if (speakerNames != v5->_speakerNames && !-[NSArray isEqual:](speakerNames, "isEqual:"))
        goto LABEL_38;
      speakerRooms = self->_speakerRooms;
      if (speakerRooms != v5->_speakerRooms && !-[NSArray isEqual:](speakerRooms, "isEqual:"))
        goto LABEL_38;
      permanentNames = self->_permanentNames;
      if (permanentNames != v5->_permanentNames && !-[NSArray isEqual:](permanentNames, "isEqual:"))
        goto LABEL_38;
      intentSpeakerNames = self->_intentSpeakerNames;
      if (intentSpeakerNames != v5->_intentSpeakerNames
        && !-[NSArray isEqual:](intentSpeakerNames, "isEqual:"))
      {
        goto LABEL_38;
      }
      intentSpeakerRooms = self->_intentSpeakerRooms;
      if (intentSpeakerRooms != v5->_intentSpeakerRooms
        && !-[NSArray isEqual:](intentSpeakerRooms, "isEqual:"))
      {
        goto LABEL_38;
      }
      intentDestinationSpeakers = self->_intentDestinationSpeakers;
      if (intentDestinationSpeakers != v5->_intentDestinationSpeakers
        && !-[NSArray isEqual:](intentDestinationSpeakers, "isEqual:"))
      {
        goto LABEL_38;
      }
      intentPermanentNames = self->_intentPermanentNames;
      if (intentPermanentNames != v5->_intentPermanentNames
        && !-[NSArray isEqual:](intentPermanentNames, "isEqual:"))
      {
        goto LABEL_38;
      }
      spokenEntityTypes = self->_spokenEntityTypes;
      if (spokenEntityTypes != v5->_spokenEntityTypes
        && !-[NSArray isEqual:](spokenEntityTypes, "isEqual:"))
      {
        goto LABEL_38;
      }
      spokenEntityNames = self->_spokenEntityNames;
      if (spokenEntityNames != v5->_spokenEntityNames
        && !-[NSArray isEqual:](spokenEntityNames, "isEqual:"))
      {
        goto LABEL_38;
      }
      if (((numberOfHomeAutomationWords = self->_numberOfHomeAutomationWords,
             numberOfHomeAutomationWords == v5->_numberOfHomeAutomationWords)
         || -[NSNumber isEqual:](numberOfHomeAutomationWords, "isEqual:"))
        && ((isAllSpeakers = self->_isAllSpeakers, isAllSpeakers == v5->_isAllSpeakers)
         || -[NSNumber isEqual:](isAllSpeakers, "isEqual:"))
        && ((isPauseOrStop = self->_isPauseOrStop, isPauseOrStop == v5->_isPauseOrStop)
         || -[NSNumber isEqual:](isPauseOrStop, "isEqual:"))
        && ((isWholeHouseAudioCommand = self->_isWholeHouseAudioCommand,
             isWholeHouseAudioCommand == v5->_isWholeHouseAudioCommand)
         || -[NSNumber isEqual:](isWholeHouseAudioCommand, "isEqual:"))
        && ((isInHere = self->_isInHere, isInHere == v5->_isInHere)
         || -[NSNumber isEqual:](isInHere, "isEqual:"))
        && ((hasExcept = self->_hasExcept, hasExcept == v5->_hasExcept)
         || -[NSNumber isEqual:](hasExcept, "isEqual:"))
        && ((isParticipatingSpeaker = self->_isParticipatingSpeaker,
             isParticipatingSpeaker == v5->_isParticipatingSpeaker)
         || -[NSNumber isEqual:](isParticipatingSpeaker, "isEqual:")))
      {
        v22 = 1;
      }
      else
      {
LABEL_38:
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (INWholeHouseAudioMetadata)initWithCoder:(id)a3
{
  void *v3;
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  INWholeHouseAudioMetadata *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("speakerNames"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("speakerRooms"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("permanentNames"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("intentSpeakerNames"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("intentSpeakerRooms"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("intentDestinationSpeakers"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("intentPermanentNames"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0C99E60];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("spokenEntityTypes"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99E60];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("spokenEntityNames"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfHomeAutomationWords"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAllSpeakers"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPauseOrStop"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isWholeHouseAudioCommand"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInHere"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasExcept"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isParticipatingSpeaker"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = -[INWholeHouseAudioMetadata initWithSpeakerNames:speakerRooms:permanentNames:intentSpeakerNames:intentSpeakerRooms:intentDestinationSpeakers:intentPermanentNames:spokenEntityTypes:spokenEntityNames:numberOfHomeAutomationWords:isAllSpeakers:isPauseOrStop:isWholeHouseAudioCommand:isInHere:hasExcept:isParticipatingSpeaker:](self, "initWithSpeakerNames:speakerRooms:permanentNames:intentSpeakerNames:intentSpeakerRooms:intentDestinationSpeakers:intentPermanentNames:spokenEntityTypes:spokenEntityNames:numberOfHomeAutomationWords:isAllSpeakers:isPauseOrStop:isWholeHouseAudioCommand:isInHere:hasExcept:isParticipatingSpeaker:", v49, v48, v47, v46, v45, v44, v41, v28, v40, v39, v38, v37, v32, v33, v34,
          v35);

  return v43;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *speakerNames;
  id v5;

  speakerNames = self->_speakerNames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", speakerNames, CFSTR("speakerNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speakerRooms, CFSTR("speakerRooms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_permanentNames, CFSTR("permanentNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentSpeakerNames, CFSTR("intentSpeakerNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentSpeakerRooms, CFSTR("intentSpeakerRooms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentDestinationSpeakers, CFSTR("intentDestinationSpeakers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentPermanentNames, CFSTR("intentPermanentNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spokenEntityTypes, CFSTR("spokenEntityTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spokenEntityNames, CFSTR("spokenEntityNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfHomeAutomationWords, CFSTR("numberOfHomeAutomationWords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isAllSpeakers, CFSTR("isAllSpeakers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isPauseOrStop, CFSTR("isPauseOrStop"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isWholeHouseAudioCommand, CFSTR("isWholeHouseAudioCommand"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isInHere, CFSTR("isInHere"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasExcept, CFSTR("hasExcept"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isParticipatingSpeaker, CFSTR("isParticipatingSpeaker"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_speakerNames);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("speakerNames"));

  objc_msgSend(v6, "encodeObject:", self->_speakerRooms);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("speakerRooms"));

  objc_msgSend(v6, "encodeObject:", self->_permanentNames);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("permanentNames"));

  objc_msgSend(v6, "encodeObject:", self->_intentSpeakerNames);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("intentSpeakerNames"));

  objc_msgSend(v6, "encodeObject:", self->_intentSpeakerRooms);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("intentSpeakerRooms"));

  objc_msgSend(v6, "encodeObject:", self->_intentDestinationSpeakers);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("intentDestinationSpeakers"));

  objc_msgSend(v6, "encodeObject:", self->_intentPermanentNames);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("intentPermanentNames"));

  objc_msgSend(v6, "encodeObject:", self->_spokenEntityTypes);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("spokenEntityTypes"));

  objc_msgSend(v6, "encodeObject:", self->_spokenEntityNames);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("spokenEntityNames"));

  objc_msgSend(v6, "encodeObject:", self->_numberOfHomeAutomationWords);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("numberOfHomeAutomationWords"));

  objc_msgSend(v6, "encodeObject:", self->_isAllSpeakers);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("isAllSpeakers"));

  objc_msgSend(v6, "encodeObject:", self->_isPauseOrStop);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("isPauseOrStop"));

  objc_msgSend(v6, "encodeObject:", self->_isWholeHouseAudioCommand);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, CFSTR("isWholeHouseAudioCommand"));

  objc_msgSend(v6, "encodeObject:", self->_isInHere);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, CFSTR("isInHere"));

  objc_msgSend(v6, "encodeObject:", self->_hasExcept);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, CFSTR("hasExcept"));

  objc_msgSend(v6, "encodeObject:", self->_isParticipatingSpeaker);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("isParticipatingSpeaker"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INWholeHouseAudioMetadata descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INWholeHouseAudioMetadata;
  -[INWholeHouseAudioMetadata description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INWholeHouseAudioMetadata _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  uint64_t speakerRooms;
  uint64_t permanentNames;
  uint64_t intentSpeakerNames;
  uint64_t intentSpeakerRooms;
  uint64_t intentDestinationSpeakers;
  uint64_t intentPermanentNames;
  uint64_t spokenEntityTypes;
  uint64_t spokenEntityNames;
  uint64_t numberOfHomeAutomationWords;
  NSNumber *isAllSpeakers;
  uint64_t v14;
  NSNumber *isPauseOrStop;
  uint64_t v16;
  NSNumber *isWholeHouseAudioCommand;
  uint64_t v18;
  NSNumber *isInHere;
  void *v20;
  void *v21;
  NSNumber *hasExcept;
  void *v23;
  NSNumber *isParticipatingSpeaker;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSArray *speakerNames;
  _QWORD v50[16];
  _QWORD v51[18];

  v51[16] = *MEMORY[0x1E0C80C00];
  speakerNames = self->_speakerNames;
  v3 = (uint64_t)speakerNames;
  v50[0] = CFSTR("speakerNames");
  if (!speakerNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v51[0] = v3;
  v50[1] = CFSTR("speakerRooms");
  speakerRooms = (uint64_t)self->_speakerRooms;
  v47 = speakerRooms;
  if (!speakerRooms)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    speakerRooms = objc_claimAutoreleasedReturnValue();
  }
  v51[1] = speakerRooms;
  v50[2] = CFSTR("permanentNames");
  permanentNames = (uint64_t)self->_permanentNames;
  v45 = permanentNames;
  if (!permanentNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    permanentNames = objc_claimAutoreleasedReturnValue();
  }
  v51[2] = permanentNames;
  v50[3] = CFSTR("intentSpeakerNames");
  intentSpeakerNames = (uint64_t)self->_intentSpeakerNames;
  v43 = intentSpeakerNames;
  if (!intentSpeakerNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    intentSpeakerNames = objc_claimAutoreleasedReturnValue();
  }
  v51[3] = intentSpeakerNames;
  v50[4] = CFSTR("intentSpeakerRooms");
  intentSpeakerRooms = (uint64_t)self->_intentSpeakerRooms;
  v41 = intentSpeakerRooms;
  if (!intentSpeakerRooms)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    intentSpeakerRooms = objc_claimAutoreleasedReturnValue();
  }
  v51[4] = intentSpeakerRooms;
  v50[5] = CFSTR("intentDestinationSpeakers");
  intentDestinationSpeakers = (uint64_t)self->_intentDestinationSpeakers;
  v39 = intentDestinationSpeakers;
  if (!intentDestinationSpeakers)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    intentDestinationSpeakers = objc_claimAutoreleasedReturnValue();
  }
  v51[5] = intentDestinationSpeakers;
  v50[6] = CFSTR("intentPermanentNames");
  intentPermanentNames = (uint64_t)self->_intentPermanentNames;
  v37 = intentPermanentNames;
  if (!intentPermanentNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    intentPermanentNames = objc_claimAutoreleasedReturnValue();
  }
  v51[6] = intentPermanentNames;
  v50[7] = CFSTR("spokenEntityTypes");
  spokenEntityTypes = (uint64_t)self->_spokenEntityTypes;
  v36 = spokenEntityTypes;
  if (!spokenEntityTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    spokenEntityTypes = objc_claimAutoreleasedReturnValue();
  }
  v51[7] = spokenEntityTypes;
  v50[8] = CFSTR("spokenEntityNames");
  spokenEntityNames = (uint64_t)self->_spokenEntityNames;
  v34 = spokenEntityNames;
  if (!spokenEntityNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    spokenEntityNames = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)speakerRooms;
  v51[8] = spokenEntityNames;
  v50[9] = CFSTR("numberOfHomeAutomationWords");
  numberOfHomeAutomationWords = (uint64_t)self->_numberOfHomeAutomationWords;
  v32 = numberOfHomeAutomationWords;
  if (!numberOfHomeAutomationWords)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    numberOfHomeAutomationWords = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)permanentNames;
  v30 = (void *)numberOfHomeAutomationWords;
  v51[9] = numberOfHomeAutomationWords;
  v50[10] = CFSTR("isAllSpeakers");
  isAllSpeakers = self->_isAllSpeakers;
  v14 = (uint64_t)isAllSpeakers;
  if (!isAllSpeakers)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)intentSpeakerNames;
  v48 = (void *)v3;
  v29 = (void *)v14;
  v51[10] = v14;
  v50[11] = CFSTR("isPauseOrStop");
  isPauseOrStop = self->_isPauseOrStop;
  v16 = (uint64_t)isPauseOrStop;
  if (!isPauseOrStop)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)spokenEntityTypes;
  v40 = (void *)intentSpeakerRooms;
  v28 = (void *)v16;
  v51[11] = v16;
  v50[12] = CFSTR("isWholeHouseAudioCommand");
  isWholeHouseAudioCommand = self->_isWholeHouseAudioCommand;
  v18 = (uint64_t)isWholeHouseAudioCommand;
  if (!isWholeHouseAudioCommand)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)spokenEntityNames;
  v38 = (void *)intentDestinationSpeakers;
  v27 = (void *)v18;
  v51[12] = v18;
  v50[13] = CFSTR("isInHere");
  isInHere = self->_isInHere;
  v20 = isInHere;
  if (!isInHere)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)intentPermanentNames;
  v51[13] = v20;
  v50[14] = CFSTR("hasExcept");
  hasExcept = self->_hasExcept;
  v23 = hasExcept;
  if (!hasExcept)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51[14] = v23;
  v50[15] = CFSTR("isParticipatingSpeaker");
  isParticipatingSpeaker = self->_isParticipatingSpeaker;
  v25 = isParticipatingSpeaker;
  if (!isParticipatingSpeaker)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51[15] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 16);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (isParticipatingSpeaker)
  {
    if (hasExcept)
      goto LABEL_35;
  }
  else
  {

    if (hasExcept)
      goto LABEL_35;
  }

LABEL_35:
  if (!isInHere)

  if (!isWholeHouseAudioCommand)
  if (!isPauseOrStop)

  if (!isAllSpeakers)
  if (!v32)

  if (!v34)
  if (!v36)

  if (!v37)
  if (!v39)

  if (!v41)
  if (!v43)

  if (!v45)
  if (!v47)

  if (!speakerNames)
  return v31;
}

- (NSArray)speakerNames
{
  return self->_speakerNames;
}

- (NSArray)speakerRooms
{
  return self->_speakerRooms;
}

- (NSArray)permanentNames
{
  return self->_permanentNames;
}

- (NSArray)intentSpeakerNames
{
  return self->_intentSpeakerNames;
}

- (NSArray)intentSpeakerRooms
{
  return self->_intentSpeakerRooms;
}

- (NSArray)intentDestinationSpeakers
{
  return self->_intentDestinationSpeakers;
}

- (NSArray)intentPermanentNames
{
  return self->_intentPermanentNames;
}

- (NSArray)spokenEntityTypes
{
  return self->_spokenEntityTypes;
}

- (NSArray)spokenEntityNames
{
  return self->_spokenEntityNames;
}

- (NSNumber)numberOfHomeAutomationWords
{
  return self->_numberOfHomeAutomationWords;
}

- (NSNumber)isAllSpeakers
{
  return self->_isAllSpeakers;
}

- (NSNumber)isPauseOrStop
{
  return self->_isPauseOrStop;
}

- (NSNumber)isWholeHouseAudioCommand
{
  return self->_isWholeHouseAudioCommand;
}

- (NSNumber)isInHere
{
  return self->_isInHere;
}

- (NSNumber)hasExcept
{
  return self->_hasExcept;
}

- (NSNumber)isParticipatingSpeaker
{
  return self->_isParticipatingSpeaker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isParticipatingSpeaker, 0);
  objc_storeStrong((id *)&self->_hasExcept, 0);
  objc_storeStrong((id *)&self->_isInHere, 0);
  objc_storeStrong((id *)&self->_isWholeHouseAudioCommand, 0);
  objc_storeStrong((id *)&self->_isPauseOrStop, 0);
  objc_storeStrong((id *)&self->_isAllSpeakers, 0);
  objc_storeStrong((id *)&self->_numberOfHomeAutomationWords, 0);
  objc_storeStrong((id *)&self->_spokenEntityNames, 0);
  objc_storeStrong((id *)&self->_spokenEntityTypes, 0);
  objc_storeStrong((id *)&self->_intentPermanentNames, 0);
  objc_storeStrong((id *)&self->_intentDestinationSpeakers, 0);
  objc_storeStrong((id *)&self->_intentSpeakerRooms, 0);
  objc_storeStrong((id *)&self->_intentSpeakerNames, 0);
  objc_storeStrong((id *)&self->_permanentNames, 0);
  objc_storeStrong((id *)&self->_speakerRooms, 0);
  objc_storeStrong((id *)&self->_speakerNames, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("speakerNames"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v9, v10);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("speakerRooms"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v11, v12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("permanentNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v13, v14);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentSpeakerNames"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v15, v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentSpeakerRooms"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v17, v18);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentDestinationSpeakers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v19, v20);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentPermanentNames"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v21, v22);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("spokenEntityTypes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v23, v24);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("spokenEntityNames"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v25, v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfHomeAutomationWords"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAllSpeakers"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isPauseOrStop"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isWholeHouseAudioCommand"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isInHere"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasExcept"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isParticipatingSpeaker"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend([v41 alloc], "initWithSpeakerNames:speakerRooms:permanentNames:intentSpeakerNames:intentSpeakerRooms:intentDestinationSpeakers:intentPermanentNames:spokenEntityTypes:spokenEntityNames:numberOfHomeAutomationWords:isAllSpeakers:isPauseOrStop:isWholeHouseAudioCommand:isInHere:hasExcept:isParticipatingSpeaker:", v44, v45, v40, v39, v38, v37, v43, v42, v36, v35, v34, v33, v27, v28, v29,
                    v30);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

@end
