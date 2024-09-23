@implementation APSIncomingMessage

- (NSData)tracingUUID
{
  return (NSData *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageTracingUUID"));
}

- (BOOL)isTracingEnabled
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageTracingEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDate)timestamp
{
  return (NSDate *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageTimestamp"));
}

- (void)setTimestamp:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSIncomingMessageTimestamp"));
}

- (NSDate)expirationDate
{
  return (NSDate *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageExpirationDateKey"));
}

- (void)setExpirationDate:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSIncomingMessageExpirationDateKey"));
}

- (NSData)token
{
  return (NSData *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageToken"));
}

- (void)setToken:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSIncomingMessageToken"));
}

- (NSData)perAppToken
{
  return (NSData *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessagePerAppToken"));
}

- (void)setPerAppToken:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSIncomingMessagePerAppToken"));
}

- (BOOL)wasFromStorage
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageFromStorage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setFromStorage:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSIncomingMessageFromStorage"));

}

- (BOOL)wasLastMessageFromStorage
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageLastMessageFromStorage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setLastMessageFromStorage:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSIncomingMessageLastMessageFromStorage"));

}

- (void)setPriority:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSProtocolMessagePriority"));

}

- (int64_t)priority
{
  void *v2;
  void *v3;
  int64_t v4;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSProtocolMessagePriority"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "integerValue") <= 9)
  {
    if (objc_msgSend(v3, "integerValue") < 5)
      v4 = 1;
    else
      v4 = 5;
  }
  else
  {
    v4 = 10;
  }

  return v4;
}

- (void)setTracingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSIncomingMessageTracingEnabled"));

}

- (void)setTracingUUID:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSIncomingMessageTracingUUID"));
}

- (unint64_t)pushType
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessagePushType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  return v3;
}

- (void)setPushType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSIncomingMessagePushType"));

}

- (void)setPushFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSIncomingMessagePushFlags"));

}

- (unsigned)pushFlags
{
  void *v2;
  unsigned int v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessagePushFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setChannelID:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSIncomingMessageChannelID"));
}

- (NSString)channelID
{
  return (NSString *)-[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageChannelID"));
}

- (void)setIncomingInterface:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSIncomingMessageIncomingInterfaceKey"));

}

- (int64_t)incomingInterface
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = (void *)xpc_copy_entitlements_for_self();
  v4 = v3;
  if (v3 && xpc_dictionary_get_BOOL(v3, "com.apple.aps.incoming-message-interface"))
  {
    -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSIncomingMessageIncomingInterfaceKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
