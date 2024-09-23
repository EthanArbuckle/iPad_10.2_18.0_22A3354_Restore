@implementation HDPendingNotificationInstruction

- (HDPendingNotificationInstruction)initWithMessageIdentifier:(id)a3 categoryIdentifier:(id)a4 sendingDeviceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDPendingNotificationInstruction *v11;
  uint64_t v12;
  NSString *messageIdentifier;
  uint64_t v14;
  NSString *categoryIdentifier;
  uint64_t v16;
  NSString *sendingDeviceName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDPendingNotificationInstruction;
  v11 = -[HDPendingNotificationInstruction init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    messageIdentifier = v11->_messageIdentifier;
    v11->_messageIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    categoryIdentifier = v11->_categoryIdentifier;
    v11->_categoryIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    sendingDeviceName = v11->_sendingDeviceName;
    v11->_sendingDeviceName = (NSString *)v16;

  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@, c:%@ from:%@>"), objc_opt_class(), self->_messageIdentifier, self->_categoryIdentifier, self->_sendingDeviceName);
}

- (BOOL)isEqual:(id)a3
{
  HDPendingNotificationInstruction *v4;
  HDPendingNotificationInstruction *v5;
  NSString *messageIdentifier;
  NSString *v7;
  NSString *categoryIdentifier;
  NSString *v9;
  NSString *sendingDeviceName;
  NSString *v11;
  char v12;

  v4 = (HDPendingNotificationInstruction *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      messageIdentifier = self->_messageIdentifier;
      v7 = v5->_messageIdentifier;
      if (messageIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](messageIdentifier, "isEqualToString:")))
        goto LABEL_14;
      categoryIdentifier = self->_categoryIdentifier;
      v9 = v5->_categoryIdentifier;
      if (categoryIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:")))
        goto LABEL_14;
      sendingDeviceName = self->_sendingDeviceName;
      v11 = v5->_sendingDeviceName;
      if (sendingDeviceName == v11)
      {
        v12 = 1;
        goto LABEL_15;
      }
      if (v11)
        v12 = -[NSString isEqualToString:](sendingDeviceName, "isEqualToString:");
      else
LABEL_14:
        v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_messageIdentifier, "hash");
  v4 = -[NSString hash](self->_categoryIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sendingDeviceName, "hash");
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)sendingDeviceName
{
  return self->_sendingDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingDeviceName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end
