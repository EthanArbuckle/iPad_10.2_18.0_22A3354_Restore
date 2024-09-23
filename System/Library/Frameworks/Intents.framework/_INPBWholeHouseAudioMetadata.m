@implementation _INPBWholeHouseAudioMetadata

- (void)setHasExcept:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasExcept = a3;
}

- (BOOL)hasHasExcept
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHasExcept:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIntentDestinationSpeakers:(id)a3
{
  NSArray *v4;
  NSArray *intentDestinationSpeakers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentDestinationSpeakers = self->_intentDestinationSpeakers;
  self->_intentDestinationSpeakers = v4;

}

- (void)clearIntentDestinationSpeakers
{
  -[NSArray removeAllObjects](self->_intentDestinationSpeakers, "removeAllObjects");
}

- (void)addIntentDestinationSpeakers:(id)a3
{
  id v4;
  NSArray *intentDestinationSpeakers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentDestinationSpeakers = self->_intentDestinationSpeakers;
  v8 = v4;
  if (!intentDestinationSpeakers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentDestinationSpeakers;
    self->_intentDestinationSpeakers = v6;

    v4 = v8;
    intentDestinationSpeakers = self->_intentDestinationSpeakers;
  }
  -[NSArray addObject:](intentDestinationSpeakers, "addObject:", v4);

}

- (unint64_t)intentDestinationSpeakersCount
{
  return -[NSArray count](self->_intentDestinationSpeakers, "count");
}

- (id)intentDestinationSpeakersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentDestinationSpeakers, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentPermanentNames:(id)a3
{
  NSArray *v4;
  NSArray *intentPermanentNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentPermanentNames = self->_intentPermanentNames;
  self->_intentPermanentNames = v4;

}

- (void)clearIntentPermanentNames
{
  -[NSArray removeAllObjects](self->_intentPermanentNames, "removeAllObjects");
}

- (void)addIntentPermanentNames:(id)a3
{
  id v4;
  NSArray *intentPermanentNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentPermanentNames = self->_intentPermanentNames;
  v8 = v4;
  if (!intentPermanentNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentPermanentNames;
    self->_intentPermanentNames = v6;

    v4 = v8;
    intentPermanentNames = self->_intentPermanentNames;
  }
  -[NSArray addObject:](intentPermanentNames, "addObject:", v4);

}

- (unint64_t)intentPermanentNamesCount
{
  return -[NSArray count](self->_intentPermanentNames, "count");
}

- (id)intentPermanentNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentPermanentNames, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentSpeakerNames:(id)a3
{
  NSArray *v4;
  NSArray *intentSpeakerNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentSpeakerNames = self->_intentSpeakerNames;
  self->_intentSpeakerNames = v4;

}

- (void)clearIntentSpeakerNames
{
  -[NSArray removeAllObjects](self->_intentSpeakerNames, "removeAllObjects");
}

- (void)addIntentSpeakerNames:(id)a3
{
  id v4;
  NSArray *intentSpeakerNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentSpeakerNames = self->_intentSpeakerNames;
  v8 = v4;
  if (!intentSpeakerNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentSpeakerNames;
    self->_intentSpeakerNames = v6;

    v4 = v8;
    intentSpeakerNames = self->_intentSpeakerNames;
  }
  -[NSArray addObject:](intentSpeakerNames, "addObject:", v4);

}

- (unint64_t)intentSpeakerNamesCount
{
  return -[NSArray count](self->_intentSpeakerNames, "count");
}

- (id)intentSpeakerNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentSpeakerNames, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentSpeakerRooms:(id)a3
{
  NSArray *v4;
  NSArray *intentSpeakerRooms;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentSpeakerRooms = self->_intentSpeakerRooms;
  self->_intentSpeakerRooms = v4;

}

- (void)clearIntentSpeakerRooms
{
  -[NSArray removeAllObjects](self->_intentSpeakerRooms, "removeAllObjects");
}

- (void)addIntentSpeakerRooms:(id)a3
{
  id v4;
  NSArray *intentSpeakerRooms;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentSpeakerRooms = self->_intentSpeakerRooms;
  v8 = v4;
  if (!intentSpeakerRooms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentSpeakerRooms;
    self->_intentSpeakerRooms = v6;

    v4 = v8;
    intentSpeakerRooms = self->_intentSpeakerRooms;
  }
  -[NSArray addObject:](intentSpeakerRooms, "addObject:", v4);

}

- (unint64_t)intentSpeakerRoomsCount
{
  return -[NSArray count](self->_intentSpeakerRooms, "count");
}

- (id)intentSpeakerRoomsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentSpeakerRooms, "objectAtIndexedSubscript:", a3);
}

- (void)setIsAllSpeakers:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAllSpeakers = a3;
}

- (BOOL)hasIsAllSpeakers
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsAllSpeakers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setIsInHere:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isInHere = a3;
}

- (BOOL)hasIsInHere
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsInHere:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setIsParticipatingSpeaker:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isParticipatingSpeaker = a3;
}

- (BOOL)hasIsParticipatingSpeaker
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsParticipatingSpeaker:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setIsPauseOrStop:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isPauseOrStop = a3;
}

- (BOOL)hasIsPauseOrStop
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsPauseOrStop:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setIsWholeHouseAudioCommand:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isWholeHouseAudioCommand = a3;
}

- (BOOL)hasIsWholeHouseAudioCommand
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsWholeHouseAudioCommand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)setNumberOfHomeAutomationWords:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numberOfHomeAutomationWords = a3;
}

- (BOOL)hasNumberOfHomeAutomationWords
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasNumberOfHomeAutomationWords:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)setPermanentNames:(id)a3
{
  NSArray *v4;
  NSArray *permanentNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  permanentNames = self->_permanentNames;
  self->_permanentNames = v4;

}

- (void)clearPermanentNames
{
  -[NSArray removeAllObjects](self->_permanentNames, "removeAllObjects");
}

- (void)addPermanentNames:(id)a3
{
  id v4;
  NSArray *permanentNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  permanentNames = self->_permanentNames;
  v8 = v4;
  if (!permanentNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_permanentNames;
    self->_permanentNames = v6;

    v4 = v8;
    permanentNames = self->_permanentNames;
  }
  -[NSArray addObject:](permanentNames, "addObject:", v4);

}

- (unint64_t)permanentNamesCount
{
  return -[NSArray count](self->_permanentNames, "count");
}

- (id)permanentNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_permanentNames, "objectAtIndexedSubscript:", a3);
}

- (void)setSpeakerNames:(id)a3
{
  NSArray *v4;
  NSArray *speakerNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  speakerNames = self->_speakerNames;
  self->_speakerNames = v4;

}

- (void)clearSpeakerNames
{
  -[NSArray removeAllObjects](self->_speakerNames, "removeAllObjects");
}

- (void)addSpeakerNames:(id)a3
{
  id v4;
  NSArray *speakerNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  speakerNames = self->_speakerNames;
  v8 = v4;
  if (!speakerNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_speakerNames;
    self->_speakerNames = v6;

    v4 = v8;
    speakerNames = self->_speakerNames;
  }
  -[NSArray addObject:](speakerNames, "addObject:", v4);

}

- (unint64_t)speakerNamesCount
{
  return -[NSArray count](self->_speakerNames, "count");
}

- (id)speakerNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_speakerNames, "objectAtIndexedSubscript:", a3);
}

- (void)setSpeakerRooms:(id)a3
{
  NSArray *v4;
  NSArray *speakerRooms;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  speakerRooms = self->_speakerRooms;
  self->_speakerRooms = v4;

}

- (void)clearSpeakerRooms
{
  -[NSArray removeAllObjects](self->_speakerRooms, "removeAllObjects");
}

- (void)addSpeakerRooms:(id)a3
{
  id v4;
  NSArray *speakerRooms;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  speakerRooms = self->_speakerRooms;
  v8 = v4;
  if (!speakerRooms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_speakerRooms;
    self->_speakerRooms = v6;

    v4 = v8;
    speakerRooms = self->_speakerRooms;
  }
  -[NSArray addObject:](speakerRooms, "addObject:", v4);

}

- (unint64_t)speakerRoomsCount
{
  return -[NSArray count](self->_speakerRooms, "count");
}

- (id)speakerRoomsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_speakerRooms, "objectAtIndexedSubscript:", a3);
}

- (void)setSpokenEntityNames:(id)a3
{
  NSArray *v4;
  NSArray *spokenEntityNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  spokenEntityNames = self->_spokenEntityNames;
  self->_spokenEntityNames = v4;

}

- (void)clearSpokenEntityNames
{
  -[NSArray removeAllObjects](self->_spokenEntityNames, "removeAllObjects");
}

- (void)addSpokenEntityName:(id)a3
{
  id v4;
  NSArray *spokenEntityNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  spokenEntityNames = self->_spokenEntityNames;
  v8 = v4;
  if (!spokenEntityNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_spokenEntityNames;
    self->_spokenEntityNames = v6;

    v4 = v8;
    spokenEntityNames = self->_spokenEntityNames;
  }
  -[NSArray addObject:](spokenEntityNames, "addObject:", v4);

}

- (unint64_t)spokenEntityNamesCount
{
  return -[NSArray count](self->_spokenEntityNames, "count");
}

- (id)spokenEntityNameAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_spokenEntityNames, "objectAtIndexedSubscript:", a3);
}

- (void)setSpokenEntityTypes:(id)a3
{
  NSArray *v4;
  NSArray *spokenEntityTypes;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  spokenEntityTypes = self->_spokenEntityTypes;
  self->_spokenEntityTypes = v4;

}

- (void)clearSpokenEntityTypes
{
  -[NSArray removeAllObjects](self->_spokenEntityTypes, "removeAllObjects");
}

- (void)addSpokenEntityType:(id)a3
{
  id v4;
  NSArray *spokenEntityTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  spokenEntityTypes = self->_spokenEntityTypes;
  v8 = v4;
  if (!spokenEntityTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_spokenEntityTypes;
    self->_spokenEntityTypes = v6;

    v4 = v8;
    spokenEntityTypes = self->_spokenEntityTypes;
  }
  -[NSArray addObject:](spokenEntityTypes, "addObject:", v4);

}

- (unint64_t)spokenEntityTypesCount
{
  return -[NSArray count](self->_spokenEntityTypes, "count");
}

- (id)spokenEntityTypeAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_spokenEntityTypes, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWholeHouseAudioMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBWholeHouseAudioMetadata hasHasExcept](self, "hasHasExcept"))
    PBDataWriterWriteBOOLField();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v5 = self->_intentDestinationSpeakers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v83;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v83 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    }
    while (v7);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = self->_intentPermanentNames;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v79;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v79 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
    }
    while (v12);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v15 = self->_intentSpeakerNames;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v75;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v75 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    }
    while (v17);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v20 = self->_intentSpeakerRooms;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v71;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v71 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
    }
    while (v22);
  }

  if (-[_INPBWholeHouseAudioMetadata hasIsAllSpeakers](self, "hasIsAllSpeakers"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBWholeHouseAudioMetadata hasIsInHere](self, "hasIsInHere"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBWholeHouseAudioMetadata hasIsParticipatingSpeaker](self, "hasIsParticipatingSpeaker"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBWholeHouseAudioMetadata hasIsPauseOrStop](self, "hasIsPauseOrStop"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBWholeHouseAudioMetadata hasIsWholeHouseAudioCommand](self, "hasIsWholeHouseAudioCommand"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBWholeHouseAudioMetadata hasNumberOfHomeAutomationWords](self, "hasNumberOfHomeAutomationWords"))
    PBDataWriterWriteInt32Field();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v25 = self->_permanentNames;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v67;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
    }
    while (v27);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v30 = self->_speakerNames;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v63;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
    }
    while (v32);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v35 = self->_speakerRooms;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
    }
    while (v37);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = self->_spokenEntityNames;
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v54, v87, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v55;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v55 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v54, v87, 16);
    }
    while (v42);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = self->_spokenEntityTypes;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v50, v86, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v51;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v51 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v50, v86, 16);
    }
    while (v47);
  }

}

- (_INPBWholeHouseAudioMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWholeHouseAudioMetadata *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWholeHouseAudioMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWholeHouseAudioMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWholeHouseAudioMetadata initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBWholeHouseAudioMetadata data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWholeHouseAudioMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = -[_INPBWholeHouseAudioMetadata init](+[_INPBWholeHouseAudioMetadata allocWithZone:](_INPBWholeHouseAudioMetadata, "allocWithZone:"), "init");
  if (-[_INPBWholeHouseAudioMetadata hasHasExcept](self, "hasHasExcept"))
    -[_INPBWholeHouseAudioMetadata setHasExcept:](v5, "setHasExcept:", -[_INPBWholeHouseAudioMetadata hasExcept](self, "hasExcept"));
  v6 = (void *)-[NSArray copyWithZone:](self->_intentDestinationSpeakers, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setIntentDestinationSpeakers:](v5, "setIntentDestinationSpeakers:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_intentPermanentNames, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setIntentPermanentNames:](v5, "setIntentPermanentNames:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_intentSpeakerNames, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setIntentSpeakerNames:](v5, "setIntentSpeakerNames:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_intentSpeakerRooms, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setIntentSpeakerRooms:](v5, "setIntentSpeakerRooms:", v9);

  if (-[_INPBWholeHouseAudioMetadata hasIsAllSpeakers](self, "hasIsAllSpeakers"))
    -[_INPBWholeHouseAudioMetadata setIsAllSpeakers:](v5, "setIsAllSpeakers:", -[_INPBWholeHouseAudioMetadata isAllSpeakers](self, "isAllSpeakers"));
  if (-[_INPBWholeHouseAudioMetadata hasIsInHere](self, "hasIsInHere"))
    -[_INPBWholeHouseAudioMetadata setIsInHere:](v5, "setIsInHere:", -[_INPBWholeHouseAudioMetadata isInHere](self, "isInHere"));
  if (-[_INPBWholeHouseAudioMetadata hasIsParticipatingSpeaker](self, "hasIsParticipatingSpeaker"))
    -[_INPBWholeHouseAudioMetadata setIsParticipatingSpeaker:](v5, "setIsParticipatingSpeaker:", -[_INPBWholeHouseAudioMetadata isParticipatingSpeaker](self, "isParticipatingSpeaker"));
  if (-[_INPBWholeHouseAudioMetadata hasIsPauseOrStop](self, "hasIsPauseOrStop"))
    -[_INPBWholeHouseAudioMetadata setIsPauseOrStop:](v5, "setIsPauseOrStop:", -[_INPBWholeHouseAudioMetadata isPauseOrStop](self, "isPauseOrStop"));
  if (-[_INPBWholeHouseAudioMetadata hasIsWholeHouseAudioCommand](self, "hasIsWholeHouseAudioCommand"))
    -[_INPBWholeHouseAudioMetadata setIsWholeHouseAudioCommand:](v5, "setIsWholeHouseAudioCommand:", -[_INPBWholeHouseAudioMetadata isWholeHouseAudioCommand](self, "isWholeHouseAudioCommand"));
  if (-[_INPBWholeHouseAudioMetadata hasNumberOfHomeAutomationWords](self, "hasNumberOfHomeAutomationWords"))
    -[_INPBWholeHouseAudioMetadata setNumberOfHomeAutomationWords:](v5, "setNumberOfHomeAutomationWords:", -[_INPBWholeHouseAudioMetadata numberOfHomeAutomationWords](self, "numberOfHomeAutomationWords"));
  v10 = (void *)-[NSArray copyWithZone:](self->_permanentNames, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setPermanentNames:](v5, "setPermanentNames:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_speakerNames, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setSpeakerNames:](v5, "setSpeakerNames:", v11);

  v12 = (void *)-[NSArray copyWithZone:](self->_speakerRooms, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setSpeakerRooms:](v5, "setSpeakerRooms:", v12);

  v13 = (void *)-[NSArray copyWithZone:](self->_spokenEntityNames, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setSpokenEntityNames:](v5, "setSpokenEntityNames:", v13);

  v14 = (void *)-[NSArray copyWithZone:](self->_spokenEntityTypes, "copyWithZone:", a3);
  -[_INPBWholeHouseAudioMetadata setSpokenEntityTypes:](v5, "setSpokenEntityTypes:", v14);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int hasExcept;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int isAllSpeakers;
  int v31;
  int isInHere;
  int v33;
  int isParticipatingSpeaker;
  int v35;
  int isPauseOrStop;
  int v37;
  int isWholeHouseAudioCommand;
  int v39;
  int numberOfHomeAutomationWords;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  BOOL v66;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_75;
  v5 = -[_INPBWholeHouseAudioMetadata hasHasExcept](self, "hasHasExcept");
  if (v5 != objc_msgSend(v4, "hasHasExcept"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasHasExcept](self, "hasHasExcept"))
  {
    if (objc_msgSend(v4, "hasHasExcept"))
    {
      hasExcept = self->_hasExcept;
      if (hasExcept != objc_msgSend(v4, "hasExcept"))
        goto LABEL_75;
    }
  }
  -[_INPBWholeHouseAudioMetadata intentDestinationSpeakers](self, "intentDestinationSpeakers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentDestinationSpeakers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata intentDestinationSpeakers](self, "intentDestinationSpeakers");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBWholeHouseAudioMetadata intentDestinationSpeakers](self, "intentDestinationSpeakers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentDestinationSpeakers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata intentPermanentNames](self, "intentPermanentNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentPermanentNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata intentPermanentNames](self, "intentPermanentNames");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBWholeHouseAudioMetadata intentPermanentNames](self, "intentPermanentNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentPermanentNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata intentSpeakerNames](self, "intentSpeakerNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentSpeakerNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata intentSpeakerNames](self, "intentSpeakerNames");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBWholeHouseAudioMetadata intentSpeakerNames](self, "intentSpeakerNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentSpeakerNames");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata intentSpeakerRooms](self, "intentSpeakerRooms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentSpeakerRooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata intentSpeakerRooms](self, "intentSpeakerRooms");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBWholeHouseAudioMetadata intentSpeakerRooms](self, "intentSpeakerRooms");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentSpeakerRooms");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_75;
  }
  else
  {

  }
  v29 = -[_INPBWholeHouseAudioMetadata hasIsAllSpeakers](self, "hasIsAllSpeakers");
  if (v29 != objc_msgSend(v4, "hasIsAllSpeakers"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasIsAllSpeakers](self, "hasIsAllSpeakers"))
  {
    if (objc_msgSend(v4, "hasIsAllSpeakers"))
    {
      isAllSpeakers = self->_isAllSpeakers;
      if (isAllSpeakers != objc_msgSend(v4, "isAllSpeakers"))
        goto LABEL_75;
    }
  }
  v31 = -[_INPBWholeHouseAudioMetadata hasIsInHere](self, "hasIsInHere");
  if (v31 != objc_msgSend(v4, "hasIsInHere"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasIsInHere](self, "hasIsInHere"))
  {
    if (objc_msgSend(v4, "hasIsInHere"))
    {
      isInHere = self->_isInHere;
      if (isInHere != objc_msgSend(v4, "isInHere"))
        goto LABEL_75;
    }
  }
  v33 = -[_INPBWholeHouseAudioMetadata hasIsParticipatingSpeaker](self, "hasIsParticipatingSpeaker");
  if (v33 != objc_msgSend(v4, "hasIsParticipatingSpeaker"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasIsParticipatingSpeaker](self, "hasIsParticipatingSpeaker"))
  {
    if (objc_msgSend(v4, "hasIsParticipatingSpeaker"))
    {
      isParticipatingSpeaker = self->_isParticipatingSpeaker;
      if (isParticipatingSpeaker != objc_msgSend(v4, "isParticipatingSpeaker"))
        goto LABEL_75;
    }
  }
  v35 = -[_INPBWholeHouseAudioMetadata hasIsPauseOrStop](self, "hasIsPauseOrStop");
  if (v35 != objc_msgSend(v4, "hasIsPauseOrStop"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasIsPauseOrStop](self, "hasIsPauseOrStop"))
  {
    if (objc_msgSend(v4, "hasIsPauseOrStop"))
    {
      isPauseOrStop = self->_isPauseOrStop;
      if (isPauseOrStop != objc_msgSend(v4, "isPauseOrStop"))
        goto LABEL_75;
    }
  }
  v37 = -[_INPBWholeHouseAudioMetadata hasIsWholeHouseAudioCommand](self, "hasIsWholeHouseAudioCommand");
  if (v37 != objc_msgSend(v4, "hasIsWholeHouseAudioCommand"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasIsWholeHouseAudioCommand](self, "hasIsWholeHouseAudioCommand"))
  {
    if (objc_msgSend(v4, "hasIsWholeHouseAudioCommand"))
    {
      isWholeHouseAudioCommand = self->_isWholeHouseAudioCommand;
      if (isWholeHouseAudioCommand != objc_msgSend(v4, "isWholeHouseAudioCommand"))
        goto LABEL_75;
    }
  }
  v39 = -[_INPBWholeHouseAudioMetadata hasNumberOfHomeAutomationWords](self, "hasNumberOfHomeAutomationWords");
  if (v39 != objc_msgSend(v4, "hasNumberOfHomeAutomationWords"))
    goto LABEL_75;
  if (-[_INPBWholeHouseAudioMetadata hasNumberOfHomeAutomationWords](self, "hasNumberOfHomeAutomationWords"))
  {
    if (objc_msgSend(v4, "hasNumberOfHomeAutomationWords"))
    {
      numberOfHomeAutomationWords = self->_numberOfHomeAutomationWords;
      if (numberOfHomeAutomationWords != objc_msgSend(v4, "numberOfHomeAutomationWords"))
        goto LABEL_75;
    }
  }
  -[_INPBWholeHouseAudioMetadata permanentNames](self, "permanentNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "permanentNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata permanentNames](self, "permanentNames");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBWholeHouseAudioMetadata permanentNames](self, "permanentNames");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "permanentNames");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata speakerNames](self, "speakerNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakerNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata speakerNames](self, "speakerNames");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_INPBWholeHouseAudioMetadata speakerNames](self, "speakerNames");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakerNames");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata speakerRooms](self, "speakerRooms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakerRooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata speakerRooms](self, "speakerRooms");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_INPBWholeHouseAudioMetadata speakerRooms](self, "speakerRooms");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakerRooms");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata spokenEntityNames](self, "spokenEntityNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spokenEntityNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_74;
  -[_INPBWholeHouseAudioMetadata spokenEntityNames](self, "spokenEntityNames");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_INPBWholeHouseAudioMetadata spokenEntityNames](self, "spokenEntityNames");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spokenEntityNames");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_75;
  }
  else
  {

  }
  -[_INPBWholeHouseAudioMetadata spokenEntityTypes](self, "spokenEntityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spokenEntityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBWholeHouseAudioMetadata spokenEntityTypes](self, "spokenEntityTypes");
    v61 = objc_claimAutoreleasedReturnValue();
    if (!v61)
    {

LABEL_78:
      v66 = 1;
      goto LABEL_76;
    }
    v62 = (void *)v61;
    -[_INPBWholeHouseAudioMetadata spokenEntityTypes](self, "spokenEntityTypes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spokenEntityTypes");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if ((v65 & 1) != 0)
      goto LABEL_78;
  }
  else
  {
LABEL_74:

  }
LABEL_75:
  v66 = 0;
LABEL_76:

  return v66;
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
  uint64_t v18;
  uint64_t v19;

  if (-[_INPBWholeHouseAudioMetadata hasHasExcept](self, "hasHasExcept"))
    v19 = 2654435761 * self->_hasExcept;
  else
    v19 = 0;
  v18 = -[NSArray hash](self->_intentDestinationSpeakers, "hash");
  v3 = -[NSArray hash](self->_intentPermanentNames, "hash");
  v4 = -[NSArray hash](self->_intentSpeakerNames, "hash");
  v5 = -[NSArray hash](self->_intentSpeakerRooms, "hash");
  if (-[_INPBWholeHouseAudioMetadata hasIsAllSpeakers](self, "hasIsAllSpeakers"))
    v6 = 2654435761 * self->_isAllSpeakers;
  else
    v6 = 0;
  if (-[_INPBWholeHouseAudioMetadata hasIsInHere](self, "hasIsInHere"))
    v7 = 2654435761 * self->_isInHere;
  else
    v7 = 0;
  if (-[_INPBWholeHouseAudioMetadata hasIsParticipatingSpeaker](self, "hasIsParticipatingSpeaker"))
    v8 = 2654435761 * self->_isParticipatingSpeaker;
  else
    v8 = 0;
  if (-[_INPBWholeHouseAudioMetadata hasIsPauseOrStop](self, "hasIsPauseOrStop"))
    v9 = 2654435761 * self->_isPauseOrStop;
  else
    v9 = 0;
  if (-[_INPBWholeHouseAudioMetadata hasIsWholeHouseAudioCommand](self, "hasIsWholeHouseAudioCommand"))
    v10 = 2654435761 * self->_isWholeHouseAudioCommand;
  else
    v10 = 0;
  if (-[_INPBWholeHouseAudioMetadata hasNumberOfHomeAutomationWords](self, "hasNumberOfHomeAutomationWords"))
    v11 = 2654435761 * self->_numberOfHomeAutomationWords;
  else
    v11 = 0;
  v12 = v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7;
  v13 = v8 ^ v9 ^ v10 ^ v11 ^ -[NSArray hash](self->_permanentNames, "hash");
  v14 = v13 ^ -[NSArray hash](self->_speakerNames, "hash");
  v15 = v12 ^ v14 ^ -[NSArray hash](self->_speakerRooms, "hash");
  v16 = -[NSArray hash](self->_spokenEntityNames, "hash");
  return v15 ^ v16 ^ -[NSArray hash](self->_spokenEntityTypes, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBWholeHouseAudioMetadata hasHasExcept](self, "hasHasExcept"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBWholeHouseAudioMetadata hasExcept](self, "hasExcept"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hasExcept"));

  }
  if (-[NSArray count](self->_intentDestinationSpeakers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v6 = self->_intentDestinationSpeakers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v108;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v108 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v10), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentDestinationSpeakers"));
  }
  if (-[NSArray count](self->_intentPermanentNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v13 = self->_intentPermanentNames;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v104;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v104 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("intentPermanentNames"));
  }
  if (-[NSArray count](self->_intentSpeakerNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v20 = self->_intentSpeakerNames;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v100;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v100 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v24), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("intentSpeakerNames"));
  }
  if (-[NSArray count](self->_intentSpeakerRooms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v27 = self->_intentSpeakerRooms;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v96;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v96 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v31), "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("intentSpeakerRooms"));
  }
  if (-[_INPBWholeHouseAudioMetadata hasIsAllSpeakers](self, "hasIsAllSpeakers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBWholeHouseAudioMetadata isAllSpeakers](self, "isAllSpeakers"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isAllSpeakers"));

  }
  if (-[_INPBWholeHouseAudioMetadata hasIsInHere](self, "hasIsInHere"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBWholeHouseAudioMetadata isInHere](self, "isInHere"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isInHere"));

  }
  if (-[_INPBWholeHouseAudioMetadata hasIsParticipatingSpeaker](self, "hasIsParticipatingSpeaker"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBWholeHouseAudioMetadata isParticipatingSpeaker](self, "isParticipatingSpeaker"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isParticipatingSpeaker"));

  }
  if (-[_INPBWholeHouseAudioMetadata hasIsPauseOrStop](self, "hasIsPauseOrStop"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBWholeHouseAudioMetadata isPauseOrStop](self, "isPauseOrStop"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isPauseOrStop"));

  }
  if (-[_INPBWholeHouseAudioMetadata hasIsWholeHouseAudioCommand](self, "hasIsWholeHouseAudioCommand"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBWholeHouseAudioMetadata isWholeHouseAudioCommand](self, "isWholeHouseAudioCommand"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isWholeHouseAudioCommand"));

  }
  if (-[_INPBWholeHouseAudioMetadata hasNumberOfHomeAutomationWords](self, "hasNumberOfHomeAutomationWords"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBWholeHouseAudioMetadata numberOfHomeAutomationWords](self, "numberOfHomeAutomationWords"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("numberOfHomeAutomationWords"));

  }
  if (-[NSArray count](self->_permanentNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v40 = self->_permanentNames;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v92;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v92 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v44), "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

          ++v44;
        }
        while (v42 != v44);
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("permanentNames"));
  }
  if (-[NSArray count](self->_speakerNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v47 = self->_speakerNames;
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v87, v114, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v88;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v88 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v51), "dictionaryRepresentation");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v52);

          ++v51;
        }
        while (v49 != v51);
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v87, v114, 16);
      }
      while (v49);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("speakerNames"));
  }
  if (-[NSArray count](self->_speakerRooms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v54 = self->_speakerRooms;
    v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v83, v113, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v84;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v84 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v58), "dictionaryRepresentation");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v59);

          ++v58;
        }
        while (v56 != v58);
        v56 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v83, v113, 16);
      }
      while (v56);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("speakerRooms"));
  }
  if (-[NSArray count](self->_spokenEntityNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v61 = self->_spokenEntityNames;
    v62 = -[NSArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v79, v112, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v80;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v80 != v64)
            objc_enumerationMutation(v61);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v65), "dictionaryRepresentation");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v66);

          ++v65;
        }
        while (v63 != v65);
        v63 = -[NSArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v79, v112, 16);
      }
      while (v63);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("spokenEntityName"));
  }
  if (-[NSArray count](self->_spokenEntityTypes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v68 = self->_spokenEntityTypes;
    v69 = -[NSArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v75, v111, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v76;
      do
      {
        v72 = 0;
        do
        {
          if (*(_QWORD *)v76 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v72), "dictionaryRepresentation", (_QWORD)v75);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v73);

          ++v72;
        }
        while (v70 != v72);
        v70 = -[NSArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v75, v111, 16);
      }
      while (v70);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("spokenEntityType"));
  }
  return v3;
}

- (BOOL)hasExcept
{
  return self->_hasExcept;
}

- (NSArray)intentDestinationSpeakers
{
  return self->_intentDestinationSpeakers;
}

- (NSArray)intentPermanentNames
{
  return self->_intentPermanentNames;
}

- (NSArray)intentSpeakerNames
{
  return self->_intentSpeakerNames;
}

- (NSArray)intentSpeakerRooms
{
  return self->_intentSpeakerRooms;
}

- (BOOL)isAllSpeakers
{
  return self->_isAllSpeakers;
}

- (BOOL)isInHere
{
  return self->_isInHere;
}

- (BOOL)isParticipatingSpeaker
{
  return self->_isParticipatingSpeaker;
}

- (BOOL)isPauseOrStop
{
  return self->_isPauseOrStop;
}

- (BOOL)isWholeHouseAudioCommand
{
  return self->_isWholeHouseAudioCommand;
}

- (int)numberOfHomeAutomationWords
{
  return self->_numberOfHomeAutomationWords;
}

- (NSArray)permanentNames
{
  return self->_permanentNames;
}

- (NSArray)speakerNames
{
  return self->_speakerNames;
}

- (NSArray)speakerRooms
{
  return self->_speakerRooms;
}

- (NSArray)spokenEntityNames
{
  return self->_spokenEntityNames;
}

- (NSArray)spokenEntityTypes
{
  return self->_spokenEntityTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenEntityTypes, 0);
  objc_storeStrong((id *)&self->_spokenEntityNames, 0);
  objc_storeStrong((id *)&self->_speakerRooms, 0);
  objc_storeStrong((id *)&self->_speakerNames, 0);
  objc_storeStrong((id *)&self->_permanentNames, 0);
  objc_storeStrong((id *)&self->_intentSpeakerRooms, 0);
  objc_storeStrong((id *)&self->_intentSpeakerNames, 0);
  objc_storeStrong((id *)&self->_intentPermanentNames, 0);
  objc_storeStrong((id *)&self->_intentDestinationSpeakers, 0);
}

+ (Class)intentDestinationSpeakersType
{
  return (Class)objc_opt_class();
}

+ (Class)intentPermanentNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentSpeakerNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentSpeakerRoomsType
{
  return (Class)objc_opt_class();
}

+ (Class)permanentNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)speakerNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)speakerRoomsType
{
  return (Class)objc_opt_class();
}

+ (Class)spokenEntityNameType
{
  return (Class)objc_opt_class();
}

+ (Class)spokenEntityTypeType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
