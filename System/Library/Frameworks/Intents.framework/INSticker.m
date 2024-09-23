@implementation INSticker

- (INSticker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSticker;
  return -[INSticker init](&v3, sel_init);
}

- (INSticker)initWithType:(int64_t)a3 emoji:(id)a4
{
  id v6;
  INSticker *v7;
  INSticker *v8;
  uint64_t v9;
  NSString *emoji;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INSticker;
  v7 = -[INSticker init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    emoji = v8->_emoji;
    v8->_emoji = (NSString *)v9;

  }
  return v8;
}

- (INSticker)initWithType:(int64_t)a3 avatarDescriptor:(id)a4 appBundleID:(id)a5 stickerDescription:(id)a6 emoji:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  INSticker *v16;
  INSticker *v17;
  uint64_t v18;
  NSString *avatarDescriptor;
  uint64_t v20;
  NSString *appBundleID;
  uint64_t v22;
  NSString *stickerDescription;
  uint64_t v24;
  NSString *emoji;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)INSticker;
  v16 = -[INSticker init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v18 = objc_msgSend(v12, "copy");
    avatarDescriptor = v17->_avatarDescriptor;
    v17->_avatarDescriptor = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    appBundleID = v17->_appBundleID;
    v17->_appBundleID = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    stickerDescription = v17->_stickerDescription;
    v17->_stickerDescription = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    emoji = v17->_emoji;
    v17->_emoji = (NSString *)v24;

  }
  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_avatarDescriptor, "hash");
  v6 = v5 ^ -[NSString hash](self->_appBundleID, "hash");
  v7 = v6 ^ -[NSString hash](self->_stickerDescription, "hash") ^ v4;
  v8 = v7 ^ -[NSString hash](self->_emoji, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  INSticker *v4;
  INSticker *v5;
  NSString *avatarDescriptor;
  NSString *appBundleID;
  NSString *stickerDescription;
  NSString *emoji;
  BOOL v10;

  v4 = (INSticker *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v10 = 0;
      if (self->_type == v5->_type)
      {
        avatarDescriptor = self->_avatarDescriptor;
        if (avatarDescriptor == v5->_avatarDescriptor
          || -[NSString isEqual:](avatarDescriptor, "isEqual:"))
        {
          appBundleID = self->_appBundleID;
          if (appBundleID == v5->_appBundleID || -[NSString isEqual:](appBundleID, "isEqual:"))
          {
            stickerDescription = self->_stickerDescription;
            if (stickerDescription == v5->_stickerDescription
              || -[NSString isEqual:](stickerDescription, "isEqual:"))
            {
              emoji = self->_emoji;
              if (emoji == v5->_emoji || -[NSString isEqual:](emoji, "isEqual:"))
                v10 = 1;
            }
          }
        }
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (INSticker)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  INSticker *v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("avatarDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("appBundleID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("stickerDescription"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("emoji"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[INSticker initWithType:avatarDescriptor:appBundleID:stickerDescription:emoji:](self, "initWithType:avatarDescriptor:appBundleID:stickerDescription:emoji:", v5, v9, v13, v17, v21);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avatarDescriptor, CFSTR("avatarDescriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleID, CFSTR("appBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stickerDescription, CFSTR("stickerDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emoji, CFSTR("emoji"));

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

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INStickerTypeGetName(self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:", self->_avatarDescriptor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("avatarDescriptor"));

  objc_msgSend(v6, "encodeObject:", self->_appBundleID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("appBundleID"));

  objc_msgSend(v6, "encodeObject:", self->_stickerDescription);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("stickerDescription"));

  objc_msgSend(v6, "encodeObject:", self->_emoji);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("emoji"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSticker descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INSticker;
  -[INSticker description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSticker _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *avatarDescriptor;
  void *v5;
  NSString *appBundleID;
  void *v7;
  NSString *stickerDescription;
  void *v9;
  NSString *emoji;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("avatarDescriptor");
  avatarDescriptor = self->_avatarDescriptor;
  v5 = avatarDescriptor;
  if (!avatarDescriptor)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v5;
  v14[2] = CFSTR("appBundleID");
  appBundleID = self->_appBundleID;
  v7 = appBundleID;
  if (!appBundleID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v7;
  v14[3] = CFSTR("stickerDescription");
  stickerDescription = self->_stickerDescription;
  v9 = stickerDescription;
  if (!stickerDescription)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v9;
  v14[4] = CFSTR("emoji");
  emoji = self->_emoji;
  v11 = emoji;
  if (!emoji)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (emoji)
  {
    if (stickerDescription)
      goto LABEL_11;
  }
  else
  {

    if (stickerDescription)
    {
LABEL_11:
      if (appBundleID)
        goto LABEL_12;
LABEL_16:

      if (avatarDescriptor)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!appBundleID)
    goto LABEL_16;
LABEL_12:
  if (!avatarDescriptor)
    goto LABEL_17;
LABEL_13:

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (NSString)avatarDescriptor
{
  return self->_avatarDescriptor;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)stickerDescription
{
  return self->_stickerDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerDescription, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_avatarDescriptor, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = INStickerTypeWithString(v7);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("avatarDescriptor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appBundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stickerDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emoji"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:avatarDescriptor:appBundleID:stickerDescription:emoji:", v8, v9, v10, v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
