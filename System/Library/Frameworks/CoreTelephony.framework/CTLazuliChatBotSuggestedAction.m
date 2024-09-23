@implementation CTLazuliChatBotSuggestedAction

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliChatBotSuggestedAction type](self, "type");
  v7 = -[CTLazuliChatBotSuggestedAction type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliSuggestedActionType(&v7));
  -[CTLazuliChatBotSuggestedAction suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", suggestion = %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", action {%@} = %@"), objc_opt_class(), self->_action);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestedAction:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v4 = a3;
  v5 = -[CTLazuliChatBotSuggestedAction type](self, "type");
  if (v5 == objc_msgSend(v4, "type")
    && (-[CTLazuliChatBotSuggestedAction suggestion](self, "suggestion"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "suggestion"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqualToCTLazuliChatBotSuggestion:", v7),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    switch(self->_type)
    {
      case 0:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionOpenUrlInWebView:", v10);
        goto LABEL_19;
      case 1:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionOpenUrlInApplication:", v10);
        goto LABEL_19;
      case 2:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionComposeText:", v10);
        goto LABEL_19;
      case 3:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionComposeAudioRecording:", v10);
        goto LABEL_19;
      case 4:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionComposeVideoRecording:", v10);
        goto LABEL_19;
      case 5:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionShowLocation:", v10);
        goto LABEL_19;
      case 6:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionRequestLocationPush:", v10);
        goto LABEL_19;
      case 7:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionCalendar:", v10);
        goto LABEL_19;
      case 8:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionDialVideoCall:", v10);
        goto LABEL_19;
      case 9:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionDialEnrichedCall:", v10);
        goto LABEL_19;
      case 0xALL:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionDialPhoneNumber:", v10);
        goto LABEL_19;
      case 0xBLL:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionDevice:", v10);
        goto LABEL_19;
      case 0xCLL:
        -[CTLazuliChatBotSuggestedAction action](self, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToCTLazuliSuggestedActionSettings:", v10);
LABEL_19:
        v12 = v11;

        break;
      default:
        v12 = 1;
        break;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotSuggestedAction *v4;
  CTLazuliChatBotSuggestedAction *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotSuggestedAction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotSuggestedAction isEqualToCTLazuliChatBotSuggestedAction:](self, "isEqualToCTLazuliChatBotSuggestedAction:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotSuggestedAction *v4;

  v4 = +[CTLazuliChatBotSuggestedAction allocWithZone:](CTLazuliChatBotSuggestedAction, "allocWithZone:", a3);
  -[CTLazuliChatBotSuggestedAction setType:](v4, "setType:", self->_type);
  -[CTLazuliChatBotSuggestedAction setSuggestion:](v4, "setSuggestion:", self->_suggestion);
  -[CTLazuliChatBotSuggestedAction setAction:](v4, "setAction:", self->_action);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kTypeKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestion, CFSTR("kSuggestionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("kActionKey"));

}

- (CTLazuliChatBotSuggestedAction)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotSuggestedAction *v5;
  void *v6;
  uint64_t v7;
  CTLazuliChatBotSuggestion *suggestion;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id action;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CTLazuliChatBotSuggestedAction;
  v5 = -[CTLazuliChatBotSuggestedAction init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSuggestionKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    suggestion = v5->_suggestion;
    v5->_suggestion = (CTLazuliChatBotSuggestion *)v7;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v23 = objc_opt_class();
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v25, v24, v23, v22, v21, v20, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kActionKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (id)v17;

  }
  return v5;
}

- (CTLazuliChatBotSuggestedAction)initWithReflection:(const void *)a3
{
  CTLazuliChatBotSuggestedAction *v4;
  CTLazuliChatBotSuggestion *v5;
  CTLazuliChatBotSuggestion *suggestion;
  CTLazuliSuggestedActionShowLocation *v7;
  id v8;
  CTLazuliSuggestedActionRequestLocationPush *v9;
  CTLazuliSuggestedActionCalendar *v10;
  id v11;
  CTLazuliSuggestedActionDialVideoCall *v12;
  id v13;
  CTLazuliSuggestedActionDialEnrichedCall *v14;
  id v15;
  CTLazuliSuggestedActionDialPhoneNumber *v16;
  id v17;
  id v18;
  CTLazuliSuggestedActionOpenUrlInApplication *v19;
  id v20;
  void *size;
  CTLazuliSuggestedActionComposeText *v22;
  id v23;
  CTLazuliSuggestedActionOpenUrlInWebView *v24;
  id action;
  std::string __p[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CTLazuliChatBotSuggestedAction;
  v4 = -[CTLazuliChatBotSuggestedAction init](&v34, sel_init);
  if (v4)
  {
    v4->_type = encode_CTLazuliSuggestedActionType((unsigned int *)a3);
    v5 = -[CTLazuliChatBotSuggestion initWithReflection:]([CTLazuliChatBotSuggestion alloc], "initWithReflection:", (char *)a3 + 8);
    suggestion = v4->_suggestion;
    v4->_suggestion = v5;

    switch(*((_DWORD *)a3 + 52))
    {
      case 0:
        *(_QWORD *)&v28 = 0;
        memset(__p, 0, sizeof(__p));
        LODWORD(__p[0].__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 18);
        if (*((char *)a3 + 103) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&__p[0].__r_.__value_.__r.__words[1], *((const std::string::value_type **)a3 + 10), *((_QWORD *)a3 + 11));
        }
        else
        {
          *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = *((_OWORD *)a3 + 5);
          __p[1].__r_.__value_.__r.__words[0] = *((_QWORD *)a3 + 12);
        }
        if (*((char *)a3 + 127) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&__p[1].__r_.__value_.__r.__words[1], *((const std::string::value_type **)a3 + 13), *((_QWORD *)a3 + 14));
        }
        else
        {
          *(_OWORD *)&__p[1].__r_.__value_.__r.__words[1] = *(_OWORD *)((char *)a3 + 104);
          *(_QWORD *)&v28 = *((_QWORD *)a3 + 15);
        }
        v24 = -[CTLazuliSuggestedActionOpenUrlInWebView initWithReflection:]([CTLazuliSuggestedActionOpenUrlInWebView alloc], "initWithReflection:", __p);
        action = v4->_action;
        v4->_action = v24;

        if (SBYTE7(v28) < 0)
          operator delete((void *)__p[1].__r_.__value_.__l.__size_);
        if (__p[1].__r_.__value_.__s.__data_[7] < 0)
        {
          size = (void *)__p[0].__r_.__value_.__l.__size_;
          goto LABEL_37;
        }
        return v4;
      case 1:
        memset(__p, 0, 24);
        if (*((char *)a3 + 95) < 0)
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((_QWORD *)a3 + 10));
        else
          __p[0] = *(std::string *)((_BYTE *)a3 + 3);
        v19 = -[CTLazuliSuggestedActionOpenUrlInApplication initWithReflection:]([CTLazuliSuggestedActionOpenUrlInApplication alloc], "initWithReflection:", __p);
        goto LABEL_34;
      case 2:
        memset(__p, 0, sizeof(__p));
        if (*((char *)a3 + 95) < 0)
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((_QWORD *)a3 + 10));
        else
          __p[0] = *(std::string *)((_BYTE *)a3 + 3);
        if (*((char *)a3 + 119) < 0)
          std::string::__init_copy_ctor_external(&__p[1], *((const std::string::value_type **)a3 + 12), *((_QWORD *)a3 + 13));
        else
          __p[1] = *(std::string *)((_BYTE *)a3 + 4);
        v22 = -[CTLazuliSuggestedActionComposeText initWithReflection:]([CTLazuliSuggestedActionComposeText alloc], "initWithReflection:", __p);
        v23 = v4->_action;
        v4->_action = v22;

        if (SHIBYTE(__p[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p[1].__r_.__value_.__l.__data_);
        goto LABEL_35;
      case 3:
        memset(__p, 0, 24);
        if (*((char *)a3 + 95) < 0)
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((_QWORD *)a3 + 10));
        else
          __p[0] = *(std::string *)((_BYTE *)a3 + 3);
        v19 = -[CTLazuliSuggestedActionComposeAudioRecording initWithReflection:]([CTLazuliSuggestedActionComposeAudioRecording alloc], "initWithReflection:", __p);
        goto LABEL_34;
      case 4:
        memset(__p, 0, 24);
        if (*((char *)a3 + 95) < 0)
          std::string::__init_copy_ctor_external(__p, *((const std::string::value_type **)a3 + 9), *((_QWORD *)a3 + 10));
        else
          __p[0] = *(std::string *)((_BYTE *)a3 + 3);
        v19 = -[CTLazuliSuggestedActionComposeVideoRecording initWithReflection:]([CTLazuliSuggestedActionComposeVideoRecording alloc], "initWithReflection:", __p);
LABEL_34:
        v20 = v4->_action;
        v4->_action = v19;

LABEL_35:
        if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        {
          size = (void *)__p[0].__r_.__value_.__r.__words[0];
LABEL_37:
          operator delete(size);
        }
        return v4;
      case 5:
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = 0u;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionShowLocation::SuggestedActionShowLocation((Lazuli::SuggestedActionShowLocation *)__p, (const Lazuli::SuggestedActionShowLocation *)((char *)a3 + 72));
        v7 = -[CTLazuliSuggestedActionShowLocation initWithReflection:]([CTLazuliSuggestedActionShowLocation alloc], "initWithReflection:", __p);
        v8 = v4->_action;
        v4->_action = v7;

        Lazuli::SuggestedActionShowLocation::~SuggestedActionShowLocation((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 6:
        __p[0].__r_.__value_.__s.__data_[0] = *((_BYTE *)a3 + 72);
        v9 = -[CTLazuliSuggestedActionRequestLocationPush initWithReflection:]([CTLazuliSuggestedActionRequestLocationPush alloc], "initWithReflection:", __p);
        goto LABEL_21;
      case 7:
        v33 = 0;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = 0u;
        memset(__p, 0, sizeof(__p));
        Lazuli::ChatBotCreateCalendarEvent::ChatBotCreateCalendarEvent(__p, (__int128 *)((char *)a3 + 72));
        v10 = -[CTLazuliSuggestedActionCalendar initWithReflection:]([CTLazuliSuggestedActionCalendar alloc], "initWithReflection:", __p);
        v11 = v4->_action;
        v4->_action = v10;

        Lazuli::SuggestedActionCalendar::~SuggestedActionCalendar((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 8:
        *(_QWORD *)&v28 = 0;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionDialVideoCall::SuggestedActionDialVideoCall(__p, (const Lazuli::SuggestedActionDialVideoCall *)((char *)a3 + 72));
        v12 = -[CTLazuliSuggestedActionDialVideoCall initWithReflection:]([CTLazuliSuggestedActionDialVideoCall alloc], "initWithReflection:", __p);
        v13 = v4->_action;
        v4->_action = v12;

        Lazuli::SuggestedActionDialVideoCall::~SuggestedActionDialVideoCall((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 9:
        *(_QWORD *)&v30 = 0;
        v28 = 0u;
        v29 = 0u;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionDialEnrichedCall::SuggestedActionDialEnrichedCall(__p, (const Lazuli::SuggestedActionDialEnrichedCall *)((char *)a3 + 72));
        v14 = -[CTLazuliSuggestedActionDialEnrichedCall initWithReflection:]([CTLazuliSuggestedActionDialEnrichedCall alloc], "initWithReflection:", __p);
        v15 = v4->_action;
        v4->_action = v14;

        Lazuli::SuggestedActionDialEnrichedCall::~SuggestedActionDialEnrichedCall((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 0xA:
        *(_QWORD *)&v28 = 0;
        memset(__p, 0, sizeof(__p));
        Lazuli::SuggestedActionDialPhoneNumber::SuggestedActionDialPhoneNumber(__p, (__int128 *)((char *)a3 + 72));
        v16 = -[CTLazuliSuggestedActionDialPhoneNumber initWithReflection:]([CTLazuliSuggestedActionDialPhoneNumber alloc], "initWithReflection:", __p);
        v17 = v4->_action;
        v4->_action = v16;

        Lazuli::SuggestedActionDialVideoCall::~SuggestedActionDialVideoCall((void **)&__p[0].__r_.__value_.__l.__data_);
        return v4;
      case 0xB:
        LODWORD(__p[0].__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 18);
        v9 = -[CTLazuliSuggestedActionDevice initWithReflection:]([CTLazuliSuggestedActionDevice alloc], "initWithReflection:", __p);
        goto LABEL_21;
      case 0xC:
        LODWORD(__p[0].__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 18);
        v9 = -[CTLazuliSuggestedActionSettings initWithReflection:]([CTLazuliSuggestedActionSettings alloc], "initWithReflection:", __p);
LABEL_21:
        v18 = v4->_action;
        v4->_action = v9;

        break;
      default:
        return v4;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CTLazuliChatBotSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong(&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
