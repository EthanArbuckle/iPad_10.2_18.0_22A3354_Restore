@implementation CalDAVReplyToSharedCalendarInvitationTaskGroup

- (CalDAVReplyToSharedCalendarInvitationTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Initializing this class instance with an inherited initializer not allowed."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (CalDAVReplyToSharedCalendarInvitationTaskGroup)initWithInvitation:(id)a3 acceptInvitation:(BOOL)a4 atCalendarHomeURL:(id)a5 accountInfoProvider:(id)a6 taskManager:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  CalDAVReplyToSharedCalendarInvitationTaskGroup *v14;
  CalDAVReplyToSharedCalendarInvitationTaskGroup *v15;
  objc_super v17;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CalDAVReplyToSharedCalendarInvitationTaskGroup;
  v14 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v17, sel_initWithAccountInfoProvider_taskManager_, a6, a7);
  v15 = v14;
  if (v14)
  {
    -[CalDAVReplyToSharedCalendarInvitationTaskGroup setInvitation:](v14, "setInvitation:", v12);
    -[CalDAVReplyToSharedCalendarInvitationTaskGroup setAcceptInvitation:](v15, "setAcceptInvitation:", v10);
    -[CalDAVReplyToSharedCalendarInvitationTaskGroup setCalendarHomeURL:](v15, "setCalendarHomeURL:", v13);
  }

  return v15;
}

- (void)startTaskGroup
{
  CalDAVPostWithSharedAsResponse *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CalDAVPostWithSharedAsResponse *v8;

  v3 = [CalDAVPostWithSharedAsResponse alloc];
  -[CalDAVReplyToSharedCalendarInvitationTaskGroup generateReply](self, "generateReply");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVReplyToSharedCalendarInvitationTaskGroup calendarHomeURL](self, "calendarHomeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CoreDAVPostTask initWithDataPayload:dataContentType:atURL:previousETag:](v3, "initWithDataPayload:dataContentType:atURL:previousETag:", v4, CFSTR("text/xml"), v5, 0);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostWithSharedAsResponse setAccountInfoProvider:](v8, "setAccountInfoProvider:", v6);

  -[CalDAVPostWithSharedAsResponse setDelegate:](v8, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitQueuedCoreDAVTask:", v8);

}

- (id)generateReply
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __CFString **v11;
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

  v3 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
  v4 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:");
  v5 = *MEMORY[0x24BE1AE70];
  v6 = *MEMORY[0x24BE1AE30];
  -[CalDAVReplyToSharedCalendarInvitationTaskGroup invitation](self, "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "href");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadAsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v5, v6, v9, 0);

  v10 = -[CalDAVReplyToSharedCalendarInvitationTaskGroup acceptInvitation](self, "acceptInvitation");
  v11 = cdXMLCalendarServerInviteAccepted;
  if (!v10)
    v11 = cdXMLCalendarServerInviteDeclined;
  objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", *v11, v4, 0, 0);
  objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("hosturl"), v4, 0);
  -[CalDAVReplyToSharedCalendarInvitationTaskGroup invitation](self, "invitation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hostURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "href");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "payloadAsString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v5, v6, v15, 0);

  objc_msgSend(v3, "endElement:inNamespace:", CFSTR("hosturl"), v4);
  -[CalDAVReplyToSharedCalendarInvitationTaskGroup invitation](self, "invitation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "payloadAsString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("in-reply-to"), v4, v18, 0);

  -[CalDAVReplyToSharedCalendarInvitationTaskGroup invitation](self, "invitation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "summary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CalDAVReplyToSharedCalendarInvitationTaskGroup invitation](self, "invitation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "summary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "payloadAsString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("summary"), v4, v23, 0);

  }
  objc_msgSend(v3, "endElement:inNamespace:", CFSTR("invite-reply"), v4);
  objc_msgSend(v3, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "responseBodyParser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "rootElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "rootElement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "href");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "payloadAsFullURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVReplyToSharedCalendarInvitationTaskGroup setSharedAs:](self, "setSharedAs:", v11);

      }
    }
  }
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v12, 0);

}

- (NSURL)sharedAs
{
  return self->_sharedAs;
}

- (void)setSharedAs:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAs, a3);
}

- (CalDAVCalendarServerInviteNotificationItem)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (BOOL)acceptInvitation
{
  return self->_acceptInvitation;
}

- (void)setAcceptInvitation:(BOOL)a3
{
  self->_acceptInvitation = a3;
}

- (NSURL)calendarHomeURL
{
  return self->_calendarHomeURL;
}

- (void)setCalendarHomeURL:(id)a3
{
  objc_storeStrong((id *)&self->_calendarHomeURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarHomeURL, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_sharedAs, 0);
}

@end
