@implementation MFOutgoingMessageDelivery

- (MFOutgoingMessageDelivery)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageDelivery;
  return -[MFOutgoingMessageDelivery init](&v3, sel_init);
}

- (MFOutgoingMessageDelivery)initWithMessage:(id)a3
{
  MFOutgoingMessageDelivery *v4;

  v4 = -[MFOutgoingMessageDelivery init](self, "init");
  if (v4)
    v4->_message = (MFMessage *)a3;
  return v4;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  MFOutgoingMessageDelivery *v8;

  v8 = -[MFOutgoingMessageDelivery init](self, "init");
  if (v8)
  {
    v8->_headers = (MFMutableMessageHeaders *)a3;
    v8->_mixedContent = (NSArray *)a4;
    v8->_textPartsAreHTML = a5;
  }
  return v8;
}

- (MFOutgoingMessageDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  MFOutgoingMessageDelivery *v12;

  v12 = -[MFOutgoingMessageDelivery init](self, "init");
  if (v12)
  {
    v12->_headers = (MFMutableMessageHeaders *)a3;
    v12->_htmlBody = (NSString *)a4;
    v12->_plainTextAlternative = (MFPlainTextDocument *)a5;
    v12->_otherHTMLAndAttachments = (NSArray *)a6;
    v12->_charsets = (NSArray *)a7;
  }
  return v12;
}

+ (id)newWithMessage:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", a3);
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHeaders:mixedContent:textPartsAreHTML:", a3, a4, a5);
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHeaders:HTML:plainTextAlternative:other:charsets:", a3, a4, a5, a6, a7);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageDelivery;
  -[MFOutgoingMessageDelivery dealloc](&v3, sel_dealloc);
}

- (id)_currentDeliveryObject
{
  id result;
  id v4;
  MFMessage *message;
  MFMailDelivery *v6;

  result = self->_currentDeliveryObject;
  if (!result)
  {
    v4 = -[MFOutgoingMessageDelivery account](self, "account");
    message = self->_message;
    if (v4)
    {
      if (message)
      {
        v6 = (MFMailDelivery *)objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "newDeliveryWithMessage:", self->_message);
      }
      else if (self->_mixedContent)
      {
        v6 = (MFMailDelivery *)objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "newDeliveryWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
      }
      else
      {
        if (!self->_htmlBody && !self->_plainTextAlternative)
          goto LABEL_18;
        v6 = (MFMailDelivery *)objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "newDeliveryWithHeaders:HTML:plainTextAlternative:other:charsets:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments, self->_charsets);
      }
    }
    else if (message)
    {
      v6 = -[MFMailDelivery initWithMessage:]([MFMailDelivery alloc], "initWithMessage:", self->_message);
    }
    else if (self->_mixedContent)
    {
      v6 = -[MFMailDelivery initWithHeaders:mixedContent:textPartsAreHTML:]([MFMailDelivery alloc], "initWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative)
        goto LABEL_18;
      v6 = -[MFMailDelivery initWithHeaders:HTML:plainTextAlternative:other:charsets:]([MFMailDelivery alloc], "initWithHeaders:HTML:plainTextAlternative:other:charsets:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments, self->_charsets);
    }
    self->_currentDeliveryObject = v6;
LABEL_18:
    -[MFMailDelivery setDelegate:](self->_currentDeliveryObject, "setDelegate:", self->_delegate);
    -[MFMailDelivery setCompositionSpecification:](self->_currentDeliveryObject, "setCompositionSpecification:", -[MFOutgoingMessageDelivery compositionSpecification](self, "compositionSpecification"));
    result = self->_currentDeliveryObject;
    if (self->_archiveAccount)
    {
      objc_msgSend(result, "setArchiveAccount:");
      return self->_currentDeliveryObject;
    }
  }
  return result;
}

- (void)setCompositionSpecification:(id)a3
{
  NSDictionary *compositionSpecification;

  compositionSpecification = self->_compositionSpecification;
  if (compositionSpecification != a3)
  {

    self->_compositionSpecification = (NSDictionary *)a3;
    -[MFMailDelivery setCompositionSpecification:](self->_currentDeliveryObject, "setCompositionSpecification:", a3);
  }
}

- (id)originalHeaders
{
  if (self->_headers)
    return self->_headers;
  else
    return (id)-[MFMessage headers](self->_message, "headers");
}

- (id)_deliverSynchronouslyWithCurrentSettings:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = a3;
  v5 = -[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject");
  if (v5)
  {
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "setCellDataOnly:", 1);
    objc_msgSend(v6, "setArchiveAccount:", self->_archiveAccount);
    objc_msgSend(v6, "setConversationFlags:", -[MFOutgoingMessageDelivery conversationFlags](self, "conversationFlags"));
    objc_msgSend(v6, "setIsUserRequested:", -[MFOutgoingMessageDelivery isUserRequested](self, "isUserRequested"));
    v7 = (void *)objc_msgSend(v6, "deliverSynchronously");
    if (objc_msgSend(v7, "status"))
    {
      if (v7)
        return v7;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CFA980], "sharedAggregateDictionary"), "pushValue:forKey:", CFSTR("com.apple.mobilemail.sentMessageSize"), (double)(unint64_t)objc_msgSend((id)objc_msgSend(v6, "message"), "messageSize"));
      if (v7)
        return v7;
    }
    v9 = 2;
  }
  else
  {
    v9 = 5;
  }
  return -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", v9);
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  MFDeliveryResult *v5;
  char v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[MailAccount isPrimaryDeliveryAccountDisabled](self->_archiveAccount, "isPrimaryDeliveryAccountDisabled")
    && -[MFOutgoingMessageDelivery account](self, "account")
    || objc_msgSend(-[MailAccount deliveryAccountAlternates](self->_archiveAccount, "deliveryAccountAlternates"), "count")|| -[MailAccount canUseCarrierDeliveryFallback](self->_archiveAccount, "canUseCarrierDeliveryFallback"))
  {
    v5 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 2);
    v7 = 0;
    if (objc_msgSend(-[MFOutgoingMessageDelivery account](self, "account"), "isActive"))
    {
      if (!-[MailAccount isPrimaryDeliveryAccountDisabled](self->_archiveAccount, "isPrimaryDeliveryAccountDisabled"))
      {
        v5 = -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](self, "_deliverSynchronouslyWithCurrentSettings:", 0);
        v6 = objc_msgSend((id)objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "account"), "supportsOutboxCopy");
        if (!-[MFDeliveryResult status](v5, "status")
          && ((v6 & 1) != 0 || !-[MailAccount archiveSentMessages](self->_archiveAccount, "archiveSentMessages")))
        {
          v7 = 1;
        }
      }
    }
    if (-[MFDeliveryResult status](v5, "status") == 5
      || -[MFDeliveryResult status](v5, "status") == 2
      || -[MFDeliveryResult status](v5, "status") == 1
      && (v16 = (void *)objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error")) != 0&& (v17 = v16, CFSTR("MFMessageErrorDomain") == (__CFString *)objc_msgSend(v16, "domain"))&& objc_msgSend(v17, "code") == 1047)
    {
      v8 = -[MailAccount deliveryAccountAlternates](self->_archiveAccount, "deliveryAccountAlternates");
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
LABEL_13:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setShouldCancel:", 0);
          if (-[MailAccount canUseDeliveryAccount:](self->_archiveAccount, "canUseDeliveryAccount:", v13))
          {
            -[MFOutgoingMessageDelivery setAccount:](self, "setAccount:", v13);
            v5 = -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](self, "_deliverSynchronouslyWithCurrentSettings:", 0);
          }
          if (-[MFDeliveryResult status](v5, "status") != 2 && -[MFDeliveryResult status](v5, "status") != 1)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v10)
              goto LABEL_13;
            break;
          }
        }
      }
      if (-[MFDeliveryResult status](v5, "status") == 2 || -[MFDeliveryResult status](v5, "status") == 1)
      {
        if (-[MailAccount canUseCarrierDeliveryFallback](self->_archiveAccount, "canUseCarrierDeliveryFallback"))
        {
          v14 = +[DeliveryAccount carrierDeliveryAccount](SMTPAccount, "carrierDeliveryAccount");
          if (v14)
          {
            v15 = v14;
            objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setShouldCancel:", 0);
            -[MFOutgoingMessageDelivery setAccount:](self, "setAccount:", v15);
            v5 = -[MFOutgoingMessageDelivery _deliverSynchronouslyWithCurrentSettings:](self, "_deliverSynchronouslyWithCurrentSettings:", 1);
          }
        }
      }
    }
    if (!-[MFDeliveryResult status](v5, "status") && (objc_opt_respondsToSelector() & 1) != 0)
      -[MFDeliveryDelegate notifyUserDeliverySucceeded:](self->_delegate, "notifyUserDeliverySucceeded:", self);
    if (a3)
      (*((void (**)(id, int64_t))a3 + 2))(a3, -[MFDeliveryResult status](v5, "status"));
    if (-[MFDeliveryResult status](v5, "status"))
      v18 = 1;
    else
      v18 = v7;
    if ((v18 & 1) == 0)
      objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "archive");
    return v5;
  }
  else
  {
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1051, 0));
    return -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 5);
  }
}

- (int64_t)deliveryStatus
{
  if (-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"))
    return objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "deliveryStatus");
  else
    return 5;
}

- (id)message
{
  MFMessage *v3;
  MFMessage *message;
  MFMailDelivery *v5;
  MFMailDelivery *v6;

  v3 = (MFMessage *)objc_msgSend(-[MFOutgoingMessageDelivery _currentDeliveryObject](self, "_currentDeliveryObject"), "message");
  if (!v3)
  {
    if (-[MFOutgoingMessageDelivery account](self, "account"))
      return 0;
    message = self->_message;
    if (message)
    {
      v3 = message;
LABEL_6:
      v5 = 0;
LABEL_13:

      return v3;
    }
    if (self->_mixedContent)
    {
      v6 = -[MFMailDelivery initWithHeaders:mixedContent:textPartsAreHTML:]([MFMailDelivery alloc], "initWithHeaders:mixedContent:textPartsAreHTML:", self->_headers, self->_mixedContent, self->_textPartsAreHTML);
    }
    else
    {
      if (!self->_htmlBody && !self->_plainTextAlternative)
      {
        v3 = 0;
        goto LABEL_6;
      }
      v6 = -[MFMailDelivery initWithHeaders:HTML:plainTextAlternative:other:charsets:]([MFMailDelivery alloc], "initWithHeaders:HTML:plainTextAlternative:other:charsets:", self->_headers, self->_htmlBody, self->_plainTextAlternative, self->_otherHTMLAndAttachments, self->_charsets);
    }
    v5 = v6;
    v3 = -[MFMailDelivery message](v6, "message");
    goto LABEL_13;
  }
  return v3;
}

- (id)_deliveryAccountForInitializers
{
  id v2;
  id result;

  if (self->_message)
  {
    v2 = +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:");
  }
  else
  {
    result = self->_headers;
    if (!result)
      return result;
    v2 = +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", objc_msgSend(result, "firstSenderAddress"));
  }
  return (id)objc_msgSend(v2, "deliveryAccount");
}

- (id)account
{
  id result;

  result = self->_deliveryAccount;
  if (!result)
  {
    result = -[MFOutgoingMessageDelivery _deliveryAccountForInitializers](self, "_deliveryAccountForInitializers");
    self->_deliveryAccount = (DeliveryAccount *)result;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MFDeliveryDelegate *)a3;
}

- (void)setArchiveAccount:(id)a3
{
  MailAccount *v3;
  MailAccount *archiveAccount;

  v3 = (MailAccount *)a3;
  archiveAccount = self->_archiveAccount;
  if (archiveAccount != a3)
  {

    v3 = v3;
    self->_archiveAccount = v3;
  }
  -[MFMailDelivery setArchiveAccount:](self->_currentDeliveryObject, "setArchiveAccount:", v3);
}

- (void)setAccount:(id)a3
{
  DeliveryAccount *deliveryAccount;
  DeliveryAccount *v6;
  char isKindOfClass;
  MFMailDelivery *currentDeliveryObject;

  deliveryAccount = self->_deliveryAccount;
  if (deliveryAccount != a3)
  {

    v6 = (DeliveryAccount *)a3;
    self->_deliveryAccount = v6;
    -[DeliveryAccount deliveryClass](v6, "deliveryClass");
    if (self->_currentDeliveryObject)
    {
      isKindOfClass = objc_opt_isKindOfClass();
      currentDeliveryObject = self->_currentDeliveryObject;
      if ((isKindOfClass & 1) != 0)
      {
        -[MFMailDelivery setAccount:](currentDeliveryObject, "setAccount:", self->_deliveryAccount);
      }
      else
      {

        self->_currentDeliveryObject = 0;
      }
    }
  }
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (MFAttachmentCompositionContext)attachmentContext
{
  return self->_attachmentContext;
}

- (void)setAttachmentContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (unint64_t)conversationFlags
{
  return self->_conversationFlags;
}

- (void)setConversationFlags:(unint64_t)a3
{
  self->_conversationFlags = a3;
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

@end
