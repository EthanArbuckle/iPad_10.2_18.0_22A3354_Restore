@implementation MFMimeBody

+ (id)versionString
{
  if (versionString_onceToken != -1)
    dispatch_once(&versionString_onceToken, &__block_literal_global_5);
  return (id)versionString_mime_version;
}

void __27__MFMimeBody_versionString__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1AF433BF4]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("1.0 (%@)"), CFSTR("1.0"));
  v2 = (void *)versionString_mime_version;
  versionString_mime_version = v1;

  objc_autoreleasePoolPop(v0);
}

+ (id)copyNewMimeBoundary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Apple-Mail-%@"), v4);

  return v5;
}

- (MFMimeBody)init
{
  MFMimeBody *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMimeBody;
  result = -[MFMimeBody init](&v3, sel_init);
  if (result)
    *((_WORD *)result + 16) = -1;
  return result;
}

- (MFMimePart)topLevelPart
{
  return self->_topLevelPart;
}

- (void)setTopLevelPart:(id)a3
{
  MFMimePart *v5;
  MFMimePart *v6;

  v5 = (MFMimePart *)a3;
  if (self->_topLevelPart != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_topLevelPart, a3);
    v5 = v6;
    *((_WORD *)self + 17) = -1;
  }

}

- (NSString)mimeType
{
  void *v2;
  void *v3;

  -[MFMimeBody preferredBodyPart](self, "preferredBodyPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)mimeSubtype
{
  void *v2;
  void *v3;

  -[MFMimeBody preferredBodyPart](self, "preferredBodyPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtype");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)partWithNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMimeBody topLevelPart](self, "topLevelPart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childPartWithNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasEncryptedDescendantPart
{
  int64_t encryptedDescendantState;
  MFMimeBody *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  void *i;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _QWORD v21[2];
  void (*v22)(uint64_t, void *, char *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  char v30;

  encryptedDescendantState = self->_encryptedDescendantState;
  if (!encryptedDescendantState)
  {
    v4 = self;
    -[MFMimeBody topLevelPart](v4, "topLevelPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeIfNecessary");
    objc_msgSend(v5, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    objc_msgSend(v9, "topLevelPart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v22 = __computeHasEncryptedDescendant_block_invoke;
    v23 = &unk_1E5AA1848;
    v11 = v5;
    v24 = v11;
    v25 = &v26;
    v12 = v10;
    v13 = v21;
    v30 = 0;
    v14 = v12;
    v15 = v14;
    if (v14)
    {
      for (i = v14; ; i = (void *)v17)
      {
        v22((uint64_t)v13, i, &v30);
        if (v30)
          break;
        objc_msgSend(i, "firstChildPart");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          while (1)
          {
            objc_msgSend(i, "nextSiblingPart");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
              break;
            objc_msgSend(i, "parentPart");
            v18 = objc_claimAutoreleasedReturnValue();

            i = (void *)v18;
            if (!v18)
              goto LABEL_13;
          }
        }

      }
LABEL_13:

    }
    v19 = *((unsigned __int8 *)v27 + 24);

    _Block_object_dispose(&v26, 8);
    encryptedDescendantState = 1;
    if (!v19)
      encryptedDescendantState = 2;
    self->_encryptedDescendantState = encryptedDescendantState;
  }
  return encryptedDescendantState == 1;
}

- (unsigned)numberOfAttachmentsSigned:(BOOL *)a3 encrypted:(BOOL *)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v10;

  v10 = 0;
  -[MFMimeBody topLevelPart](self, "topLevelPart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "decodeIfNecessary");
    objc_msgSend(v7, "getNumberOfAttachments:isSigned:isEncrypted:", &v10, a3, a4);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attachments
{
  void *v2;
  void *v3;

  -[MFMimeBody topLevelPart](self, "topLevelPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decodeIfNecessary");
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentURLs
{
  void *v2;
  void *v3;

  -[MFMimeBody topLevelPart](self, "topLevelPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decodeIfNecessary");
  objc_msgSend(v2, "attachmentURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isHTML
{
  void *v3;
  char v4;
  void *v5;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "isHTML");
  }
  else
  {
    -[MFMimeBody preferredBodyPart](self, "preferredBodyPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isHTML");

  }
  return v4;
}

- (BOOL)isRich
{
  void *v3;
  char v4;
  void *v5;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "isRich");
  }
  else
  {
    -[MFMimePart startPart](self->_topLevelPart, "startPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isRich");

  }
  return v4;
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5 isComplete:(BOOL *)a6
{
  _BOOL8 v7;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v7 = a5;
  -[MFMimePart startPart](self->_topLevelPart, "startPart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, 1, v7, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = -[MFMimeBody numberOfAlternatives](self, "numberOfAlternatives");
    v14 = -[MFMimeBody preferredAlternative](self, "preferredAlternative");
    if (v13 >= 1 && v14)
    {
      if (v14 == -1)
        v14 = -[MFMimeBody numberOfAlternatives](self, "numberOfAlternatives") - 1;
      -[MFMimeBody setPreferredAlternative:](self, "setPreferredAlternative:", v14 - 1);
      -[MFMimeBody contentToOffset:resultOffset:asHTML:isComplete:](self, "contentToOffset:resultOffset:asHTML:isComplete:", a3, a4, v7, a6);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MFMessageBody rawData](self, "rawData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (!v17)
      {
        v12 = 0;
        return v12;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4294967254);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v15;
  }
  return v12;
}

- (unint64_t)totalTextSize
{
  return -[MFMimePart totalTextSize](self->_topLevelPart, "totalTextSize");
}

- (int64_t)numberOfAlternatives
{
  void *v3;
  int64_t v4;
  int v5;
  MFMimePart *topLevelPart;
  void *v7;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "numberOfAlternatives");
  }
  else
  {
    v5 = *((__int16 *)self + 17);
    if (v5 < 0)
    {
      topLevelPart = self->_topLevelPart;
      if (topLevelPart)
      {
        -[MFMimePart startPart](topLevelPart, "startPart");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *((_WORD *)self + 17) = objc_msgSend(v7, "numberOfAlternatives");

        LOWORD(v5) = *((_WORD *)self + 17);
      }
    }
    v4 = (__int16)v5;
  }

  return v4;
}

- (void)setPreferredAlternative:(int64_t)a3
{
  id v5;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "setPreferredAlternative:", a3);
  }
  else if (-[MFMimeBody numberOfAlternatives](self, "numberOfAlternatives") >= 2)
  {
    *((_WORD *)self + 16) = a3;
  }

}

- (int64_t)preferredAlternative
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = *((__int16 *)self + 16);
    if (v4 != -1)
      goto LABEL_20;
    -[MFMessageBody message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMimeBody topLevelPart](self, "topLevelPart");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultAlternativeInPart:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MFMimePart subparts](self->_topLevelPart, "subparts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      if (v9)
      {
        v10 = 1;
        do
        {
          v4 = v10 - 1;
          objc_msgSend(v8, "objectAtIndex:", v10 - 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 != v7)
            v4 = 0x7FFFFFFFFFFFFFFFLL;

        }
        while (v4 == 0x7FFFFFFFFFFFFFFFLL && v10++ < v9);

        if (v4 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_19;
      }
      else
      {

      }
    }
    v4 = -1;
LABEL_19:

    goto LABEL_20;
  }
  v4 = objc_msgSend(v3, "preferredAlternative");
LABEL_20:

  return v4;
}

- (id)preferredBodyPart
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "preferredBodyPart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MFMimePart startPart](self->_topLevelPart, "startPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alternativeAtIndex:", -[MFMimeBody preferredAlternative](self, "preferredAlternative"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)textHtmlPart
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3
     || (-[MFMimePart decodeIfNecessary](self->_topLevelPart, "decodeIfNecessary"),
         -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self->_topLevelPart, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "textHtmlPart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MFMimeBody preferredBodyPart](self, "preferredBodyPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textHtmlPart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (NSArray)signers
{
  return self->_signers;
}

- (void)setSigners:(id)a3
{
  objc_storeStrong((id *)&self->_signers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signers, 0);
  objc_storeStrong((id *)&self->_topLevelPart, 0);
}

@end
