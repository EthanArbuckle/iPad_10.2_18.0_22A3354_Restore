@implementation CKMessageContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_chatContext, 0);
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKMessageContext.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[cls isSubclassOfClass:[CKMessageContext class]]"));

  }
  v8 = -[objc_class init](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "init");
  -[CKMessageContext chatContext](self, "chatContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a4);
  v11 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v10;

  -[CKMessageContext serviceName](self, "serviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a4);
  v14 = (void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = v13;

  *((_BYTE *)v8 + 24) = -[CKMessageContext isFromMe](self, "isFromMe");
  *((_BYTE *)v8 + 25) = -[CKMessageContext isSpam](self, "isSpam");
  *((_BYTE *)v8 + 26) = -[CKMessageContext isSenderUnknown](self, "isSenderUnknown");
  *((_BYTE *)v8 + 27) = -[CKMessageContext isSenderUnauthenticated](self, "isSenderUnauthenticated");
  *((_BYTE *)v8 + 28) = -[CKMessageContext isAudioMessage](self, "isAudioMessage");
  return v8;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)isSpam
{
  return self->_spam;
}

- (BOOL)isSenderUnknown
{
  return self->_senderUnknown;
}

- (BOOL)isSenderUnauthenticated
{
  return self->_senderUnauthenticated;
}

- (BOOL)isAudioMessage
{
  return self->_audioMessage;
}

- (IMChatContext)chatContext
{
  return self->_chatContext;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CKMessageContext _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

+ (id)selfContext
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[24] = 1;
  *((_WORD *)v2 + 13) = 0;
  v2[28] = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CKMessageContext _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;

  v13 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[CKMessageContext chatContext](self, "chatContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageContext serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessageContext isFromMe](self, "isFromMe"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[CKMessageContext isSpam](self, "isSpam"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[CKMessageContext isSenderUnknown](self, "isSenderUnknown"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[CKMessageContext isSenderUnauthenticated](self, "isSenderUnauthenticated"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[CKMessageContext isAudioMessage](self, "isAudioMessage"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@, chatContext: %@, serviceName: %@, fromMe: %@, spam: %@, senderUnknown: %@, senderUnauthenticated: %@, audioMessage: %@>"), v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
