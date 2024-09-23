@implementation MFOutgoingMessageDelivery

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MFOutgoingMessageDelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_24 != -1)
    dispatch_once(&log_onceToken_24, block);
  return (id)log_log_24;
}

void __32__MFOutgoingMessageDelivery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_24;
  log_log_24 = (uint64_t)v1;

}

- (MFOutgoingMessageDelivery)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageDelivery;
  return -[MFOutgoingMessageDelivery init](&v3, sel_init);
}

- (MFOutgoingMessageDelivery)initWithMessage:(id)a3
{
  id v5;
  MFOutgoingMessageDelivery *v6;
  MFOutgoingMessageDelivery *v7;

  v5 = a3;
  v6 = -[MFOutgoingMessageDelivery init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  id v9;
  id v10;
  MFOutgoingMessageDelivery *v11;
  MFOutgoingMessageDelivery *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[MFOutgoingMessageDelivery init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_headers, a3);
    objc_storeStrong((id *)&v12->_mixedContent, a4);
    v12->_textPartsAreHTML = a5;
  }

  return v12;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MFOutgoingMessageDelivery *v15;
  MFOutgoingMessageDelivery *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[MFOutgoingMessageDelivery init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_headers, a3);
    objc_storeStrong((id *)&v16->_htmlBody, a4);
    objc_storeStrong((id *)&v16->_plainTextAlternative, a5);
    objc_storeStrong((id *)&v16->_otherHTMLAndAttachments, a6);
  }

  return v16;
}

+ (id)newWithMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", v4);

  return v5;
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaders:mixedContent:textPartsAreHTML:", v8, v9, v5);

  return v10;
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaders:HTML:plainTextAlternative:other:", v10, v11, v12, v13);

  return v14;
}

- (id)_currentDeliveryObject
{
  MFMailDelivery *currentDeliveryObject;
  void *v4;
  MFMailMessage *message;
  void *v6;
  MFMailDelivery *v7;
  MFMailDelivery *v8;
  MFMailDelivery *v9;
  MFMailDelivery *v10;
  void *v11;
  MFMailDelivery *v12;
  MFMailDelivery *v13;
  MFMailDelivery *v14;
  MFMailDelivery *v15;
  id WeakRetained;
  void *v17;

  currentDeliveryObject = self->_currentDeliveryObject;
  if (currentDeliveryObject)
    return currentDeliveryObject;
  -[MFOutgoingMessageDelivery account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  message = self->_message;
  if (!v4)
  {
    if (message)
    {
      v9 = -[MFMailDelivery initWithMessage:]([MFMailDelivery alloc], "initWithMessage:", self->_message);
      v10 = self->_currentDeliveryObject;
      self->_currentDeliveryObject = v9;

      goto LABEL_19;
    }
    if (self->_mixedContent)
    {
      v13 = -[MFMailDelivery initWithHeaders:mixedContent:textPartsAreHTML:]([MFMailDelivery alloc], "initWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative)
        goto LABEL_19;
      v13 = -[MFMailDelivery initWithHeaders:HTML:plainTextAlternative:other:]([MFMailDelivery alloc], "initWithHeaders:HTML:plainTextAlternative:other:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments);
    }
    v15 = self->_currentDeliveryObject;
    self->_currentDeliveryObject = v13;

    self->_action = -[MFMailDelivery action](self->_currentDeliveryObject, "action");
    goto LABEL_19;
  }
  if (message)
  {
    -[MFOutgoingMessageDelivery account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (MFMailDelivery *)objc_msgSend(v6, "newDeliveryWithMessage:", self->_message);
    v8 = self->_currentDeliveryObject;
    self->_currentDeliveryObject = v7;

    goto LABEL_19;
  }
  if (self->_mixedContent)
  {
    -[MFOutgoingMessageDelivery account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (MFMailDelivery *)objc_msgSend(v11, "newDeliveryWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
LABEL_14:
    v14 = self->_currentDeliveryObject;
    self->_currentDeliveryObject = v12;

    self->_action = -[MFMailDelivery action](self->_currentDeliveryObject, "action");
    self->_shouldSign = -[MFMailDelivery shouldSign](self->_currentDeliveryObject, "shouldSign");
    self->_shouldEncrypt = -[MFMailDelivery shouldEncrypt](self->_currentDeliveryObject, "shouldEncrypt");
    self->_conversationFlags = -[MFMailDelivery conversationFlags](self->_currentDeliveryObject, "conversationFlags");
    goto LABEL_19;
  }
  if (self->_htmlBody || self->_plainTextAlternative)
  {
    -[MFOutgoingMessageDelivery account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (MFMailDelivery *)objc_msgSend(v11, "newDeliveryWithHeaders:HTML:plainTextAlternative:other:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments);
    goto LABEL_14;
  }
LABEL_19:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MFMailDelivery setDelegate:](self->_currentDeliveryObject, "setDelegate:", WeakRetained);

  -[MFOutgoingMessageDelivery compositionSpecification](self, "compositionSpecification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDelivery setCompositionSpecification:](self->_currentDeliveryObject, "setCompositionSpecification:", v17);

  currentDeliveryObject = self->_currentDeliveryObject;
  if (self->_archiveAccount)
  {
    -[MFMailDelivery setArchiveAccount:](currentDeliveryObject, "setArchiveAccount:");
    currentDeliveryObject = self->_currentDeliveryObject;
  }
  return currentDeliveryObject;
}

- (void)setCompositionSpecification:(id)a3
{
  NSDictionary *v5;

  v5 = (NSDictionary *)a3;
  if (self->_compositionSpecification != v5)
  {
    objc_storeStrong((id *)&self->_compositionSpecification, a3);
    -[MFMailDelivery setCompositionSpecification:](self->_currentDeliveryObject, "setCompositionSpecification:", v5);
  }

}

- (id)originalHeaders
{
  MFMutableMessageHeaders *v3;

  v3 = self->_headers;
  if (!v3)
  {
    -[MFMailMessage headers](self->_message, "headers");
    v3 = (MFMutableMessageHeaders *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_deliverSynchronouslyWithCurrentSettings:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MFDeliveryResult *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a3;
  -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[MFOutgoingMessageDelivery log](MFOutgoingMessageDelivery, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = 5;
    goto LABEL_12;
  }
  if (v3)
    objc_msgSend(v5, "setCellDataOnly:", 1);
  objc_msgSend(v6, "setArchiveAccount:", self->_archiveAccount);
  objc_msgSend(v6, "setConversationFlags:", -[MFOutgoingMessageDelivery conversationFlags](self, "conversationFlags"));
  objc_msgSend(v6, "setIsUserRequested:", -[MFOutgoingMessageDelivery isUserRequested](self, "isUserRequested"));
  objc_msgSend(v6, "setAction:", -[MFOutgoingMessageDelivery action](self, "action"));
  objc_msgSend(v6, "setShouldSign:", -[MFOutgoingMessageDelivery shouldSign](self, "shouldSign"));
  objc_msgSend(v6, "setShouldEncrypt:", -[MFOutgoingMessageDelivery shouldEncrypt](self, "shouldEncrypt"));
  -[MFOutgoingMessageDelivery originalMessageObjectID](self, "originalMessageObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginalMessageObjectID:", v7);

  -[MFOutgoingMessageDelivery originalMessage](self, "originalMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginalMessage:", v8);

  objc_msgSend(v6, "deliverSynchronously");
  v9 = (MFDeliveryResult *)objc_claimAutoreleasedReturnValue();
  if (-[MFDeliveryResult status](v9, "status"))
  {
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFA980], "sharedAggregateDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "message");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pushValue:forKey:", CFSTR("com.apple.mobilemail.sentMessageSize"), (double)(unint64_t)objc_msgSend(v20, "messageSize"));

    if (!v9)
    {
LABEL_11:
      v18 = 2;
LABEL_12:
      v9 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", v18);
    }
  }

  return v9;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  MFDeliveryResult *v6;
  void *v7;
  BOOL v8;
  MFDeliveryResult *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id WeakRetained;
  char v29;
  id v30;
  _BOOL4 v31;
  void *v32;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[16];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  if (!-[MailAccount isPrimaryDeliveryAccountDisabled](self->_archiveAccount, "isPrimaryDeliveryAccountDisabled")
    && (-[MFOutgoingMessageDelivery account](self, "account"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[MailAccount deliveryAccountAlternates](self->_archiveAccount, "deliveryAccountAlternates"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "count")))
  {

    goto LABEL_5;
  }
  v10 = -[MailAccount canUseCarrierDeliveryFallback](self->_archiveAccount, "canUseCarrierDeliveryFallback");

  if (v10)
  {
LABEL_5:
    v6 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 2);
    -[MFOutgoingMessageDelivery account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isActive"))
    {
      v8 = -[MailAccount isPrimaryDeliveryAccountDisabled](self->_archiveAccount, "isPrimaryDeliveryAccountDisabled");

      if (v8)
      {
        v39 = 1;
        v9 = v6;
LABEL_16:
        if (-[MFDeliveryResult status](v9, "status") == 5 || -[MFDeliveryResult status](v9, "status") == 2)
          goto LABEL_18;
        if (-[MFDeliveryResult status](v9, "status") == 1)
        {
          +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "error");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v35, "domain");
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (CFSTR("MFMessageErrorDomain") == v36)
            {
              v38 = objc_msgSend(v35, "code");

              if (v38 == 1047)
              {
LABEL_18:
                -[MailAccount deliveryAccountAlternates](self->_archiveAccount, "deliveryAccountAlternates");
                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                v18 = (id)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
                if (v19)
                {
                  v20 = *(_QWORD *)v41;
LABEL_20:
                  v21 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v41 != v20)
                      objc_enumerationMutation(v18);
                    v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21);
                    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "setShouldCancel:", 0);

                    if (-[MailAccount canUseDeliveryAccount:](self->_archiveAccount, "canUseDeliveryAccount:", v22))
                    {
                      -[MFOutgoingMessageDelivery setAccount:](self, "setAccount:", v22);
                      -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](self, "_deliverSynchronouslyWithCurrentSettings:", 0);
                      v24 = objc_claimAutoreleasedReturnValue();

                      v9 = (MFDeliveryResult *)v24;
                    }
                    if (-[MFDeliveryResult status](v9, "status") != 2 && -[MFDeliveryResult status](v9, "status") != 1)
                      break;
                    if (v19 == ++v21)
                    {
                      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
                      if (v19)
                        goto LABEL_20;
                      break;
                    }
                  }
                }

                if ((-[MFDeliveryResult status](v9, "status") == 2 || -[MFDeliveryResult status](v9, "status") == 1)
                  && -[MailAccount canUseCarrierDeliveryFallback](self->_archiveAccount, "canUseCarrierDeliveryFallback"))
                {
                  +[DeliveryAccount carrierDeliveryAccount](SMTPAccount, "carrierDeliveryAccount");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setShouldCancel:", 0);

                    -[MFOutgoingMessageDelivery setAccount:](self, "setAccount:", v25);
                    -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](self, "_deliverSynchronouslyWithCurrentSettings:", 1);
                    v27 = objc_claimAutoreleasedReturnValue();

                    v9 = (MFDeliveryResult *)v27;
                  }

                }
              }
            }
            else
            {

            }
          }
        }
        if (!-[MFDeliveryResult status](v9, "status"))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v29 = objc_opt_respondsToSelector();

          if ((v29 & 1) != 0)
          {
            v30 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v30, "notifyUserDeliverySucceeded:", self);

          }
        }
        if (-[MFDeliveryResult status](v9, "status"))
          v31 = 0;
        else
          v31 = v39;
        if (v31)
        {
          -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "archive");

        }
        if (v4)
          v4[2](v4, -[MFDeliveryResult status](v9, "status"));
        goto LABEL_46;
      }
      -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](self, "_deliverSynchronouslyWithCurrentSettings:", 0);
      v9 = (MFDeliveryResult *)objc_claimAutoreleasedReturnValue();

      -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "supportsOutboxCopy");

      if (-[MFDeliveryResult status](v9, "status")
        || (v17 & 1) == 0 && -[MailAccount mustArchiveSentMessages](self->_archiveAccount, "mustArchiveSentMessages"))
      {
        v39 = 1;
        goto LABEL_16;
      }
      if (!-[MailAccount canArchiveSentMessages](self->_archiveAccount, "canArchiveSentMessages"))
      {
        v39 = 0;
        goto LABEL_16;
      }
      -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "followUpWarning");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37 != 0;

    }
    else
    {
      v39 = 1;
      v9 = v6;
    }

    goto LABEL_16;
  }
  +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1051, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setError:", v11);

  +[MFOutgoingMessageDelivery log](MFOutgoingMessageDelivery, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v11, "ef_publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFOutgoingMessageDelivery deliverSynchronouslyWithCompletion:].cold.1(v14, buf, v13);
  }

  v9 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 5);
LABEL_46:

  return v9;
}

- (int64_t)deliveryStatus
{
  void *v3;
  void *v4;
  int64_t v5;

  -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deliveryStatus");

  }
  else
  {
    v5 = 5;
  }

  return v5;
}

- (id)message
{
  void *v3;
  MFMailMessage *v4;
  void *v5;
  MFMailMessage *message;
  MFMailDelivery *v7;
  uint64_t v8;

  -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = (MFMailMessage *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MFOutgoingMessageDelivery account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_3:
      v4 = 0;
      return v4;
    }
    message = self->_message;
    if (message)
    {
      v4 = message;
      return v4;
    }
    if (self->_mixedContent)
    {
      v7 = -[MFMailDelivery initWithHeaders:mixedContent:textPartsAreHTML:]([MFMailDelivery alloc], "initWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
      -[MFMailDelivery message](v7, "message");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative)
        goto LABEL_3;
      v7 = -[MFMailDelivery initWithHeaders:HTML:plainTextAlternative:other:]([MFMailDelivery alloc], "initWithHeaders:HTML:plainTextAlternative:other:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments);
      -[MFMailDelivery message](v7, "message");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (MFMailMessage *)v8;

  }
  return v4;
}

- (id)_deliveryAccountForInitializers
{
  void *v2;
  void *v3;
  MFMutableMessageHeaders *headers;
  void *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_message)
  {
    +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deliveryAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v3;
  }
  headers = self->_headers;
  if (headers)
  {
    -[MFMutableMessageHeaders firstSenderAddress](headers, "firstSenderAddress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deliveryAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  +[MFOutgoingMessageDelivery log](MFOutgoingMessageDelivery, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MFOutgoingMessageDelivery _deliveryAccountForInitializers].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  v3 = 0;
  return v3;
}

- (id)account
{
  DeliveryAccount *deliveryAccount;
  DeliveryAccount *v4;
  DeliveryAccount *v5;

  deliveryAccount = self->_deliveryAccount;
  if (!deliveryAccount)
  {
    -[MFOutgoingMessageDelivery _deliveryAccountForInitializers](self, "_deliveryAccountForInitializers");
    v4 = (DeliveryAccount *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deliveryAccount;
    self->_deliveryAccount = v4;

    deliveryAccount = self->_deliveryAccount;
  }
  return deliveryAccount;
}

- (void)setArchiveAccount:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_archiveAccount, a3);
  v5 = a3;
  -[MFMailDelivery setArchiveAccount:](self->_currentDeliveryObject, "setArchiveAccount:", self->_archiveAccount);

}

- (void)setAccount:(id)a3
{
  DeliveryAccount **p_deliveryAccount;
  char isKindOfClass;
  MFMailDelivery *currentDeliveryObject;
  DeliveryAccount *v8;

  p_deliveryAccount = &self->_deliveryAccount;
  v8 = (DeliveryAccount *)a3;
  if (*p_deliveryAccount != v8)
  {
    objc_storeStrong((id *)&self->_deliveryAccount, a3);
    -[DeliveryAccount deliveryClass](*p_deliveryAccount, "deliveryClass");
    if (self->_currentDeliveryObject)
    {
      isKindOfClass = objc_opt_isKindOfClass();
      currentDeliveryObject = self->_currentDeliveryObject;
      if ((isKindOfClass & 1) != 0)
      {
        -[MFMailDelivery setAccount:](currentDeliveryObject, "setAccount:", *p_deliveryAccount);
      }
      else
      {
        self->_currentDeliveryObject = 0;

      }
    }
  }

}

- (id)originalMessageObjectID
{
  return -[MFMailDelivery originalMessageObjectID](self->_currentDeliveryObject, "originalMessageObjectID");
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (MFDeliveryDelegate)delegate
{
  return (MFDeliveryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFAttachmentCompositionContext)attachmentContext
{
  return self->_attachmentContext;
}

- (void)setAttachmentContext:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentContext, a3);
}

- (unint64_t)conversationFlags
{
  return self->_conversationFlags;
}

- (void)setConversationFlags:(unint64_t)a3
{
  self->_conversationFlags = a3;
}

- (MFMailMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessage, a3);
}

- (int64_t)originalConversationId
{
  return self->_originalConversationId;
}

- (void)setOriginalConversationId:(int64_t)a3
{
  self->_originalConversationId = a3;
}

- (BOOL)isUserRequested
{
  return self->_isUserRequested;
}

- (void)setIsUserRequested:(BOOL)a3
{
  self->_isUserRequested = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_attachmentContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDeliveryObject, 0);
  objc_storeStrong((id *)&self->_compositionSpecification, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_archiveAccount, 0);
  objc_storeStrong((id *)&self->_otherHTMLAndAttachments, 0);
  objc_storeStrong((id *)&self->_plainTextAlternative, 0);
  objc_storeStrong((id *)&self->_htmlBody, 0);
  objc_storeStrong((id *)&self->_mixedContent, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)_deliverSynchronouslyWithCurrentSettings:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "Failed to find a valid delivery object", a5, a6, a7, a8, 0);
}

- (void)deliverSynchronouslyWithCompletion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Failed to deliver message due to error %{public}@", buf, 0xCu);

}

- (void)_deliveryAccountForInitializers
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "Failed to find an account to deliver message", a5, a6, a7, a8, 0);
}

@end
