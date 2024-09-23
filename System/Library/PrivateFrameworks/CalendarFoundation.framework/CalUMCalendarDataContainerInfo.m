@implementation CalUMCalendarDataContainerInfo

- (CalUMCalendarDataContainerInfo)initWithAccount:(id)a3
{
  id v4;
  void *v5;
  CalUMCalendarDataContainerInfo *v6;
  uint64_t v7;
  NSString *accountID;

  v4 = a3;
  objc_msgSend(v4, "cal_personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CalUMCalendarDataContainerInfo initWithPersonaID:](self, "initWithPersonaID:", v5);
  if (v6)
  {
    objc_msgSend(v4, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    accountID = v6->_accountID;
    v6->_accountID = (NSString *)v7;

  }
  return v6;
}

- (CalUMCalendarDataContainerInfo)initWithPersonaID:(id)a3
{
  id v5;
  CalUMCalendarDataContainerInfo *v6;
  CalUMCalendarDataContainerInfo *v7;
  NSString *personaID;
  BOOL v9;
  CalUMCalendarDataContainerInfo *v10;
  uint64_t v11;
  NSURL *containerURL;
  _QWORD v14[4];
  CalUMCalendarDataContainerInfo *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CalUMCalendarDataContainerInfo;
  v6 = -[CalUMCalendarDataContainerInfo init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  objc_storeStrong((id *)&v6->_personaID, a3);
  personaID = v7->_personaID;
  if (!personaID)
  {
    v7->_usesDataSeparatedContainer = 0;
    +[CalUMCalendarDataContainerInfo _calendarGroupContainer](CalUMCalendarDataContainerInfo, "_calendarGroupContainer");
    v11 = objc_claimAutoreleasedReturnValue();
    containerURL = v7->_containerURL;
    v7->_containerURL = (NSURL *)v11;

    goto LABEL_6;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__CalUMCalendarDataContainerInfo_initWithPersonaID___block_invoke;
  v14[3] = &unk_1E2A85558;
  v15 = v7;
  v9 = +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:](CalPersonaUtils, "performBlockAsPersonaWithIdentifier:block:", personaID, v14);

  if (v9)
  {
LABEL_6:
    v10 = v7;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

void __52__CalUMCalendarDataContainerInfo_initWithPersonaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(a2, "isDataSeparatedPersona");
  +[CalUMCalendarDataContainerInfo _calendarGroupContainer](CalUMCalendarDataContainerInfo, "_calendarGroupContainer");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

}

+ (id)_calendarGroupContainer
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.calendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (BOOL)usesDataSeparatedContainer
{
  return self->_usesDataSeparatedContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
