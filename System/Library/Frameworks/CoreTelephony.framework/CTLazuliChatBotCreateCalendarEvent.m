@implementation CTLazuliChatBotCreateCalendarEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCreateCalendarEvent startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", startTime = %@"), v4);

  -[CTLazuliChatBotCreateCalendarEvent endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", endTime = %@"), v5);

  -[CTLazuliChatBotCreateCalendarEvent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", title = %@"), v6);

  -[CTLazuliChatBotCreateCalendarEvent calDescription](self, "calDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", calDescription = %@"), v7);

  -[CTLazuliChatBotCreateCalendarEvent fallbackUrl](self, "fallbackUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fallbackUrl = %@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCreateCalendarEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[CTLazuliChatBotCreateCalendarEvent startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliChatBotCreateCalendarEvent endTime](self, "endTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      v10 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[CTLazuliChatBotCreateCalendarEvent title](self, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "isEqualToString:", v9))
    {
      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[CTLazuliChatBotCreateCalendarEvent calDescription](self, "calDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 || (objc_msgSend(v4, "calDescription"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCreateCalendarEvent calDescription](self, "calDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "calDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "isEqualToString:"))
      {
        v10 = 0;
        goto LABEL_17;
      }
      v18 = 1;
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    -[CTLazuliChatBotCreateCalendarEvent fallbackUrl](self, "fallbackUrl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v4, "fallbackUrl"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCreateCalendarEvent fallbackUrl](self, "fallbackUrl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fallbackUrl");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v11)
      {

        if (!v18)
        {
LABEL_18:
          if (!v20)

          goto LABEL_21;
        }
LABEL_17:

        goto LABEL_18;
      }
      v15 = (void *)v16;
    }
    else
    {
      v15 = 0;
      v10 = 1;
    }

    if ((v18 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_23:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCreateCalendarEvent *v4;
  CTLazuliChatBotCreateCalendarEvent *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCreateCalendarEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCreateCalendarEvent isEqualToCTLazuliChatBotCreateCalendarEvent:](self, "isEqualToCTLazuliChatBotCreateCalendarEvent:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCreateCalendarEvent *v4;

  v4 = +[CTLazuliChatBotCreateCalendarEvent allocWithZone:](CTLazuliChatBotCreateCalendarEvent, "allocWithZone:", a3);
  -[CTLazuliChatBotCreateCalendarEvent setStartTime:](v4, "setStartTime:", self->_startTime);
  -[CTLazuliChatBotCreateCalendarEvent setEndTime:](v4, "setEndTime:", self->_endTime);
  -[CTLazuliChatBotCreateCalendarEvent setTitle:](v4, "setTitle:", self->_title);
  -[CTLazuliChatBotCreateCalendarEvent setCalDescription:](v4, "setCalDescription:", self->_calDescription);
  -[CTLazuliChatBotCreateCalendarEvent setFallbackUrl:](v4, "setFallbackUrl:", self->_fallbackUrl);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_startTime, CFSTR("kStartTimeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endTime, CFSTR("kEndTimeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("kTitleKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_calDescription, CFSTR("kCalDescriptionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackUrl, CFSTR("kFallbackUrlKey"));

}

- (CTLazuliChatBotCreateCalendarEvent)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCreateCalendarEvent *v5;
  uint64_t v6;
  NSString *startTime;
  uint64_t v8;
  NSString *endTime;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *calDescription;
  uint64_t v14;
  NSString *fallbackUrl;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatBotCreateCalendarEvent;
  v5 = -[CTLazuliChatBotCreateCalendarEvent init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStartTimeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kEndTimeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCalDescriptionKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    calDescription = v5->_calDescription;
    v5->_calDescription = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFallbackUrlKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v14;

  }
  return v5;
}

- (CTLazuliChatBotCreateCalendarEvent)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCreateCalendarEvent *v4;
  const void *v5;
  uint64_t v6;
  NSString *startTime;
  char *v8;
  uint64_t v9;
  NSString *endTime;
  char *v11;
  uint64_t v12;
  NSString *title;
  char *v14;
  uint64_t v15;
  NSString *calDescription;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  NSString *fallbackUrl;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CTLazuliChatBotCreateCalendarEvent;
  v4 = -[CTLazuliChatBotCreateCalendarEvent init](&v24, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    startTime = v4->_startTime;
    v4->_startTime = (NSString *)v6;

    if (*((char *)a3 + 47) >= 0)
      v8 = (char *)a3 + 24;
    else
      v8 = (char *)*((_QWORD *)a3 + 3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    endTime = v4->_endTime;
    v4->_endTime = (NSString *)v9;

    if (*((char *)a3 + 71) >= 0)
      v11 = (char *)a3 + 48;
    else
      v11 = (char *)*((_QWORD *)a3 + 6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    title = v4->_title;
    v4->_title = (NSString *)v12;

    if (*((_BYTE *)a3 + 96))
    {
      if (*((char *)a3 + 95) >= 0)
        v14 = (char *)a3 + 72;
      else
        v14 = (char *)*((_QWORD *)a3 + 9);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      calDescription = v4->_calDescription;
      v4->_calDescription = (NSString *)v15;
    }
    else
    {
      calDescription = v4->_calDescription;
      v4->_calDescription = 0;
    }

    if (*((_BYTE *)a3 + 128))
    {
      v19 = (char *)*((_QWORD *)a3 + 13);
      v18 = (char *)a3 + 104;
      v17 = v19;
      if (v18[23] >= 0)
        v20 = v18;
      else
        v20 = v17;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = (NSString *)v21;
    }
    else
    {
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = 0;
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSString)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)calDescription
{
  return self->_calDescription;
}

- (void)setCalDescription:(id)a3
{
  objc_storeStrong((id *)&self->_calDescription, a3);
}

- (NSString)fallbackUrl
{
  return self->_fallbackUrl;
}

- (void)setFallbackUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_calDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
