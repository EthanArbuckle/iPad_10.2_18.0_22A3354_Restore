@implementation MUUserInteractionAction

- (int)userInteractionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_userInteractionType;
  else
    return 0;
}

- (void)setUserInteractionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userInteractionType = a3;
}

- (void)setHasUserInteractionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserInteractionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)userInteractionTypeAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E2E03980[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserInteractionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_GUIDE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_GUIDES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_RATING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_SUGGESTIONS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAPS_IN_REVIEW")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPORT_AN_ISSUE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALL")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEBSITE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACTION_GROUP")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_DOWNLOAD")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_PHOTOS")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_GUIDES")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasArpSuggestionArgument
{
  return self->_arpSuggestionArgument != 0;
}

- (BOOL)hasExploreGuidesArgument
{
  return self->_exploreGuidesArgument != 0;
}

- (BOOL)hasUserGuideArgument
{
  return self->_userGuideArgument != 0;
}

- (BOOL)hasArpRatingArgument
{
  return self->_arpRatingArgument != 0;
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
  v8.super_class = (Class)MUUserInteractionAction;
  -[MUUserInteractionAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUUserInteractionAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t userInteractionType;
  __CFString *v5;
  MUUserInteractionARPSuggestion *arpSuggestionArgument;
  void *v7;
  MUUserInteractionExploreGuide *exploreGuidesArgument;
  void *v9;
  MUUserInteractionUserGuide *userGuideArgument;
  void *v11;
  MUUserInteractionARPRating *arpRatingArgument;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    userInteractionType = self->_userInteractionType;
    if (userInteractionType >= 0x12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userInteractionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2E03980[userInteractionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_interaction_type"));

  }
  arpSuggestionArgument = self->_arpSuggestionArgument;
  if (arpSuggestionArgument)
  {
    -[MUUserInteractionARPSuggestion dictionaryRepresentation](arpSuggestionArgument, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("arp_suggestion_argument"));

  }
  exploreGuidesArgument = self->_exploreGuidesArgument;
  if (exploreGuidesArgument)
  {
    -[MUUserInteractionExploreGuide dictionaryRepresentation](exploreGuidesArgument, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("explore_guides_argument"));

  }
  userGuideArgument = self->_userGuideArgument;
  if (userGuideArgument)
  {
    -[MUUserInteractionUserGuide dictionaryRepresentation](userGuideArgument, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("user_guide_argument"));

  }
  arpRatingArgument = self->_arpRatingArgument;
  if (arpRatingArgument)
  {
    -[MUUserInteractionARPRating dictionaryRepresentation](arpRatingArgument, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("arp_rating_argument"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_arpSuggestionArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_exploreGuidesArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userGuideArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_arpRatingArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_userInteractionType;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v5 = v4;
  if (self->_arpSuggestionArgument)
  {
    objc_msgSend(v4, "setArpSuggestionArgument:");
    v4 = v5;
  }
  if (self->_exploreGuidesArgument)
  {
    objc_msgSend(v5, "setExploreGuidesArgument:");
    v4 = v5;
  }
  if (self->_userGuideArgument)
  {
    objc_msgSend(v5, "setUserGuideArgument:");
    v4 = v5;
  }
  if (self->_arpRatingArgument)
  {
    objc_msgSend(v5, "setArpRatingArgument:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_userInteractionType;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[MUUserInteractionARPSuggestion copyWithZone:](self->_arpSuggestionArgument, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[MUUserInteractionExploreGuide copyWithZone:](self->_exploreGuidesArgument, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[MUUserInteractionUserGuide copyWithZone:](self->_userGuideArgument, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  v13 = -[MUUserInteractionARPRating copyWithZone:](self->_arpRatingArgument, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MUUserInteractionARPSuggestion *arpSuggestionArgument;
  MUUserInteractionExploreGuide *exploreGuidesArgument;
  MUUserInteractionUserGuide *userGuideArgument;
  MUUserInteractionARPRating *arpRatingArgument;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_userInteractionType != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  arpSuggestionArgument = self->_arpSuggestionArgument;
  if ((unint64_t)arpSuggestionArgument | *((_QWORD *)v4 + 2)
    && !-[MUUserInteractionARPSuggestion isEqual:](arpSuggestionArgument, "isEqual:"))
  {
    goto LABEL_15;
  }
  exploreGuidesArgument = self->_exploreGuidesArgument;
  if ((unint64_t)exploreGuidesArgument | *((_QWORD *)v4 + 3))
  {
    if (!-[MUUserInteractionExploreGuide isEqual:](exploreGuidesArgument, "isEqual:"))
      goto LABEL_15;
  }
  userGuideArgument = self->_userGuideArgument;
  if ((unint64_t)userGuideArgument | *((_QWORD *)v4 + 4))
  {
    if (!-[MUUserInteractionUserGuide isEqual:](userGuideArgument, "isEqual:"))
      goto LABEL_15;
  }
  arpRatingArgument = self->_arpRatingArgument;
  if ((unint64_t)arpRatingArgument | *((_QWORD *)v4 + 1))
    v9 = -[MUUserInteractionARPRating isEqual:](arpRatingArgument, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_userInteractionType;
  else
    v3 = 0;
  v4 = -[MUUserInteractionARPSuggestion hash](self->_arpSuggestionArgument, "hash") ^ v3;
  v5 = -[MUUserInteractionExploreGuide hash](self->_exploreGuidesArgument, "hash");
  v6 = v4 ^ v5 ^ -[MUUserInteractionUserGuide hash](self->_userGuideArgument, "hash");
  return v6 ^ -[MUUserInteractionARPRating hash](self->_arpRatingArgument, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  MUUserInteractionARPSuggestion *arpSuggestionArgument;
  uint64_t v7;
  MUUserInteractionExploreGuide *exploreGuidesArgument;
  uint64_t v9;
  MUUserInteractionUserGuide *userGuideArgument;
  uint64_t v11;
  MUUserInteractionARPRating *arpRatingArgument;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_userInteractionType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  arpSuggestionArgument = self->_arpSuggestionArgument;
  v7 = v5[2];
  v14 = v5;
  if (arpSuggestionArgument)
  {
    if (!v7)
      goto LABEL_9;
    -[MUUserInteractionARPSuggestion mergeFrom:](arpSuggestionArgument, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[MUUserInteractionAction setArpSuggestionArgument:](self, "setArpSuggestionArgument:");
  }
  v5 = v14;
LABEL_9:
  exploreGuidesArgument = self->_exploreGuidesArgument;
  v9 = v5[3];
  if (exploreGuidesArgument)
  {
    if (!v9)
      goto LABEL_15;
    -[MUUserInteractionExploreGuide mergeFrom:](exploreGuidesArgument, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[MUUserInteractionAction setExploreGuidesArgument:](self, "setExploreGuidesArgument:");
  }
  v5 = v14;
LABEL_15:
  userGuideArgument = self->_userGuideArgument;
  v11 = v5[4];
  if (userGuideArgument)
  {
    if (!v11)
      goto LABEL_21;
    -[MUUserInteractionUserGuide mergeFrom:](userGuideArgument, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[MUUserInteractionAction setUserGuideArgument:](self, "setUserGuideArgument:");
  }
  v5 = v14;
LABEL_21:
  arpRatingArgument = self->_arpRatingArgument;
  v13 = v5[1];
  if (arpRatingArgument)
  {
    if (v13)
    {
      -[MUUserInteractionARPRating mergeFrom:](arpRatingArgument, "mergeFrom:");
LABEL_26:
      v5 = v14;
    }
  }
  else if (v13)
  {
    -[MUUserInteractionAction setArpRatingArgument:](self, "setArpRatingArgument:");
    goto LABEL_26;
  }

}

- (MUUserInteractionARPSuggestion)arpSuggestionArgument
{
  return self->_arpSuggestionArgument;
}

- (void)setArpSuggestionArgument:(id)a3
{
  objc_storeStrong((id *)&self->_arpSuggestionArgument, a3);
}

- (MUUserInteractionExploreGuide)exploreGuidesArgument
{
  return self->_exploreGuidesArgument;
}

- (void)setExploreGuidesArgument:(id)a3
{
  objc_storeStrong((id *)&self->_exploreGuidesArgument, a3);
}

- (MUUserInteractionUserGuide)userGuideArgument
{
  return self->_userGuideArgument;
}

- (void)setUserGuideArgument:(id)a3
{
  objc_storeStrong((id *)&self->_userGuideArgument, a3);
}

- (MUUserInteractionARPRating)arpRatingArgument
{
  return self->_arpRatingArgument;
}

- (void)setArpRatingArgument:(id)a3
{
  objc_storeStrong((id *)&self->_arpRatingArgument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userGuideArgument, 0);
  objc_storeStrong((id *)&self->_exploreGuidesArgument, 0);
  objc_storeStrong((id *)&self->_arpSuggestionArgument, 0);
  objc_storeStrong((id *)&self->_arpRatingArgument, 0);
}

@end
