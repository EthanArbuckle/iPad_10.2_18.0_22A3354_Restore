@implementation MUBridgeMethodArgument

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("USER_INTERACTION_ARGUMENTS");
  if (a3 == 1)
  {
    v3 = CFSTR("UI_MENU_BUTTON_ARGUMENTS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_INTERACTION_ARGUMENTS")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("UI_MENU_BUTTON_ARGUMENTS"));

  return v4;
}

- (BOOL)hasIconArgument
{
  return self->_iconArgument != 0;
}

- (BOOL)hasAttributionArgument
{
  return self->_attributionArgument != 0;
}

- (BOOL)hasArtworkArgument
{
  return self->_artworkArgument != 0;
}

- (BOOL)hasUserInteractionAction
{
  return self->_userInteractionAction != 0;
}

- (BOOL)hasWebMenuButton
{
  return self->_webMenuButton != 0;
}

- (BOOL)hasPageResizedArgument
{
  return self->_pageResizedArgument != 0;
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
  v8.super_class = (Class)MUBridgeMethodArgument;
  -[MUBridgeMethodArgument description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBridgeMethodArgument dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int type;
  __CFString *v5;
  MUIconArgument *iconArgument;
  void *v7;
  MUAttributionArgument *attributionArgument;
  void *v9;
  MUAmpArtworkArgument *artworkArgument;
  void *v11;
  MUUserInteractionAction *userInteractionAction;
  void *v13;
  MUWebMenuButton *webMenuButton;
  void *v15;
  MUPageResizedArgument *pageResizedArgument;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v5 = CFSTR("UI_MENU_BUTTON_ARGUMENTS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("USER_INTERACTION_ARGUMENTS");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  iconArgument = self->_iconArgument;
  if (iconArgument)
  {
    -[MUIconArgument dictionaryRepresentation](iconArgument, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("icon_argument"));

  }
  attributionArgument = self->_attributionArgument;
  if (attributionArgument)
  {
    -[MUAttributionArgument dictionaryRepresentation](attributionArgument, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("attribution_argument"));

  }
  artworkArgument = self->_artworkArgument;
  if (artworkArgument)
  {
    -[MUAmpArtworkArgument dictionaryRepresentation](artworkArgument, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("artwork_argument"));

  }
  userInteractionAction = self->_userInteractionAction;
  if (userInteractionAction)
  {
    -[MUUserInteractionAction dictionaryRepresentation](userInteractionAction, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("user_interaction_action"));

  }
  webMenuButton = self->_webMenuButton;
  if (webMenuButton)
  {
    -[MUWebMenuButton dictionaryRepresentation](webMenuButton, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("web_menu_button"));

  }
  pageResizedArgument = self->_pageResizedArgument;
  if (pageResizedArgument)
  {
    -[MUPageResizedArgument dictionaryRepresentation](pageResizedArgument, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("page_resized_argument"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUBridgeMethodArgumentReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_iconArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_attributionArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_artworkArgument)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userInteractionAction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_webMenuButton)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pageResizedArgument)
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
    v4[10] = self->_type;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v5 = v4;
  if (self->_iconArgument)
  {
    objc_msgSend(v4, "setIconArgument:");
    v4 = v5;
  }
  if (self->_attributionArgument)
  {
    objc_msgSend(v5, "setAttributionArgument:");
    v4 = v5;
  }
  if (self->_artworkArgument)
  {
    objc_msgSend(v5, "setArtworkArgument:");
    v4 = v5;
  }
  if (self->_userInteractionAction)
  {
    objc_msgSend(v5, "setUserInteractionAction:");
    v4 = v5;
  }
  if (self->_webMenuButton)
  {
    objc_msgSend(v5, "setWebMenuButton:");
    v4 = v5;
  }
  if (self->_pageResizedArgument)
  {
    objc_msgSend(v5, "setPageResizedArgument:");
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
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v7 = -[MUIconArgument copyWithZone:](self->_iconArgument, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[MUAttributionArgument copyWithZone:](self->_attributionArgument, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[MUAmpArtworkArgument copyWithZone:](self->_artworkArgument, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[MUUserInteractionAction copyWithZone:](self->_userInteractionAction, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[MUWebMenuButton copyWithZone:](self->_webMenuButton, "copyWithZone:", a3);
  v16 = (void *)v6[7];
  v6[7] = v15;

  v17 = -[MUPageResizedArgument copyWithZone:](self->_pageResizedArgument, "copyWithZone:", a3);
  v18 = (void *)v6[4];
  v6[4] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MUIconArgument *iconArgument;
  MUAttributionArgument *attributionArgument;
  MUAmpArtworkArgument *artworkArgument;
  MUUserInteractionAction *userInteractionAction;
  MUWebMenuButton *webMenuButton;
  MUPageResizedArgument *pageResizedArgument;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  iconArgument = self->_iconArgument;
  if ((unint64_t)iconArgument | *((_QWORD *)v4 + 3) && !-[MUIconArgument isEqual:](iconArgument, "isEqual:"))
    goto LABEL_19;
  attributionArgument = self->_attributionArgument;
  if ((unint64_t)attributionArgument | *((_QWORD *)v4 + 2))
  {
    if (!-[MUAttributionArgument isEqual:](attributionArgument, "isEqual:"))
      goto LABEL_19;
  }
  artworkArgument = self->_artworkArgument;
  if ((unint64_t)artworkArgument | *((_QWORD *)v4 + 1))
  {
    if (!-[MUAmpArtworkArgument isEqual:](artworkArgument, "isEqual:"))
      goto LABEL_19;
  }
  userInteractionAction = self->_userInteractionAction;
  if ((unint64_t)userInteractionAction | *((_QWORD *)v4 + 6))
  {
    if (!-[MUUserInteractionAction isEqual:](userInteractionAction, "isEqual:"))
      goto LABEL_19;
  }
  webMenuButton = self->_webMenuButton;
  if ((unint64_t)webMenuButton | *((_QWORD *)v4 + 7))
  {
    if (!-[MUWebMenuButton isEqual:](webMenuButton, "isEqual:"))
      goto LABEL_19;
  }
  pageResizedArgument = self->_pageResizedArgument;
  if ((unint64_t)pageResizedArgument | *((_QWORD *)v4 + 4))
    v11 = -[MUPageResizedArgument isEqual:](pageResizedArgument, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[MUIconArgument hash](self->_iconArgument, "hash") ^ v3;
  v5 = -[MUAttributionArgument hash](self->_attributionArgument, "hash");
  v6 = v4 ^ v5 ^ -[MUAmpArtworkArgument hash](self->_artworkArgument, "hash");
  v7 = -[MUUserInteractionAction hash](self->_userInteractionAction, "hash");
  v8 = v7 ^ -[MUWebMenuButton hash](self->_webMenuButton, "hash");
  return v6 ^ v8 ^ -[MUPageResizedArgument hash](self->_pageResizedArgument, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  MUIconArgument *iconArgument;
  uint64_t v7;
  MUAttributionArgument *attributionArgument;
  uint64_t v9;
  MUAmpArtworkArgument *artworkArgument;
  uint64_t v11;
  MUUserInteractionAction *userInteractionAction;
  uint64_t v13;
  MUWebMenuButton *webMenuButton;
  uint64_t v15;
  MUPageResizedArgument *pageResizedArgument;
  uint64_t v17;
  _QWORD *v18;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  iconArgument = self->_iconArgument;
  v7 = v5[3];
  v18 = v5;
  if (iconArgument)
  {
    if (!v7)
      goto LABEL_9;
    -[MUIconArgument mergeFrom:](iconArgument, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[MUBridgeMethodArgument setIconArgument:](self, "setIconArgument:");
  }
  v5 = v18;
LABEL_9:
  attributionArgument = self->_attributionArgument;
  v9 = v5[2];
  if (attributionArgument)
  {
    if (!v9)
      goto LABEL_15;
    -[MUAttributionArgument mergeFrom:](attributionArgument, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[MUBridgeMethodArgument setAttributionArgument:](self, "setAttributionArgument:");
  }
  v5 = v18;
LABEL_15:
  artworkArgument = self->_artworkArgument;
  v11 = v5[1];
  if (artworkArgument)
  {
    if (!v11)
      goto LABEL_21;
    -[MUAmpArtworkArgument mergeFrom:](artworkArgument, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[MUBridgeMethodArgument setArtworkArgument:](self, "setArtworkArgument:");
  }
  v5 = v18;
LABEL_21:
  userInteractionAction = self->_userInteractionAction;
  v13 = v5[6];
  if (userInteractionAction)
  {
    if (!v13)
      goto LABEL_27;
    -[MUUserInteractionAction mergeFrom:](userInteractionAction, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[MUBridgeMethodArgument setUserInteractionAction:](self, "setUserInteractionAction:");
  }
  v5 = v18;
LABEL_27:
  webMenuButton = self->_webMenuButton;
  v15 = v5[7];
  if (webMenuButton)
  {
    if (!v15)
      goto LABEL_33;
    -[MUWebMenuButton mergeFrom:](webMenuButton, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[MUBridgeMethodArgument setWebMenuButton:](self, "setWebMenuButton:");
  }
  v5 = v18;
LABEL_33:
  pageResizedArgument = self->_pageResizedArgument;
  v17 = v5[4];
  if (pageResizedArgument)
  {
    if (v17)
    {
      -[MUPageResizedArgument mergeFrom:](pageResizedArgument, "mergeFrom:");
LABEL_38:
      v5 = v18;
    }
  }
  else if (v17)
  {
    -[MUBridgeMethodArgument setPageResizedArgument:](self, "setPageResizedArgument:");
    goto LABEL_38;
  }

}

- (MUIconArgument)iconArgument
{
  return self->_iconArgument;
}

- (void)setIconArgument:(id)a3
{
  objc_storeStrong((id *)&self->_iconArgument, a3);
}

- (MUAttributionArgument)attributionArgument
{
  return self->_attributionArgument;
}

- (void)setAttributionArgument:(id)a3
{
  objc_storeStrong((id *)&self->_attributionArgument, a3);
}

- (MUAmpArtworkArgument)artworkArgument
{
  return self->_artworkArgument;
}

- (void)setArtworkArgument:(id)a3
{
  objc_storeStrong((id *)&self->_artworkArgument, a3);
}

- (MUUserInteractionAction)userInteractionAction
{
  return self->_userInteractionAction;
}

- (void)setUserInteractionAction:(id)a3
{
  objc_storeStrong((id *)&self->_userInteractionAction, a3);
}

- (MUWebMenuButton)webMenuButton
{
  return self->_webMenuButton;
}

- (void)setWebMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_webMenuButton, a3);
}

- (MUPageResizedArgument)pageResizedArgument
{
  return self->_pageResizedArgument;
}

- (void)setPageResizedArgument:(id)a3
{
  objc_storeStrong((id *)&self->_pageResizedArgument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webMenuButton, 0);
  objc_storeStrong((id *)&self->_userInteractionAction, 0);
  objc_storeStrong((id *)&self->_pageResizedArgument, 0);
  objc_storeStrong((id *)&self->_iconArgument, 0);
  objc_storeStrong((id *)&self->_attributionArgument, 0);
  objc_storeStrong((id *)&self->_artworkArgument, 0);
}

@end
