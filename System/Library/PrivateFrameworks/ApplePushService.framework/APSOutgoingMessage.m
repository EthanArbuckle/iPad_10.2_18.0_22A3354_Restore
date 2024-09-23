@implementation APSOutgoingMessage

- (unint64_t)messageID
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSMessageID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setMessageID:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSMessageID"));

}

- (id)timestamp
{
  return -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSTimestamp"));
}

- (void)setTimestamp:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSTimestamp"));
}

- (unint64_t)timeout
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setTimeout:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSTimeout"));

}

- (id)sendTimeoutTime
{
  void *v3;
  void *v4;

  -[APSOutgoingMessage timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[APSOutgoingMessage timeout](self, "timeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)eagernessTimeoutTime
{
  double v3;
  void *v4;
  void *v5;

  if (-[APSOutgoingMessage priority](self, "priority") == 1)
    v3 = 60.0;
  else
    v3 = 120.0;
  -[APSOutgoingMessage timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rawTimeoutTime
{
  void *v3;
  void *v4;

  -[APSOutgoingMessage timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[APSOutgoingMessage timeout](self, "timeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEager
{
  void *v2;
  void *v3;
  BOOL v4;

  -[APSOutgoingMessage eagernessTimeoutTime](self, "eagernessTimeoutTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v2) == -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isCritical
{
  void *v3;
  BOOL v4;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSCritical"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = -[APSOutgoingMessage isEager](self, "isEager");
  else
    v4 = 0;

  return v4;
}

- (void)setCritical:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSCritical"));

}

- (BOOL)wasSent
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSSent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSent:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSSent"));

}

- (id)sendInterfaceIdentifier
{
  return -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSOutgoingMessageSendInterfaceIdentifier"));
}

- (void)setSendInterfaceIdentifier:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSOutgoingMessageSendInterfaceIdentifier"));
}

- (BOOL)wasCancelled
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSCancelled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCancelled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSCancelled"));

}

- (BOOL)hasTimedOut
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSTimedOut"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setTimedOut:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSTimedOut"));

}

- (unint64_t)payloadFormat
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSPayloadFormat"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setPayloadFormat:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSPayloadFormat"));

}

- (unint64_t)payloadLength
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSOutgoingMessagePayloadLength"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setPayloadLength:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSOutgoingMessagePayloadLength"));

}

- (int64_t)priority
{
  void *v2;
  int64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSOutgoingMessagePriority"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPriority:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSOutgoingMessagePriority"));

}

- (unint64_t)pushType
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSOutgoingMessagePushType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPushType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSOutgoingMessagePushType"));

}

- (void)setOriginator:(id)a3
{
  -[APSMessage setInstanceObject:forKey:](self, "setInstanceObject:forKey:", a3, CFSTR("APSOriginator"));
}

- (id)originator
{
  return -[APSMessage instanceObjectForKey:](self, "instanceObjectForKey:", CFSTR("APSOriginator"));
}

- (void)setSentTimestamp:(id)a3
{
  -[APSMessage setInstanceObject:forKey:](self, "setInstanceObject:forKey:", a3, CFSTR("APSSentTimestamp"));
}

- (id)sentTimestamp
{
  return -[APSMessage instanceObjectForKey:](self, "instanceObjectForKey:", CFSTR("APSSentTimestamp"));
}

- (void)setSendRetried:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSSendRetried"));

}

- (BOOL)sendRetried
{
  void *v2;
  char v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSSendRetried"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAckTimestamp:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSAckTimestamp"));

}

- (unint64_t)ackTimestamp
{
  void *v2;
  unint64_t v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSAckTimestamp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unsigned)pushFlags
{
  void *v2;
  unsigned int v3;

  -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSOutgoingMessagePushFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setPushFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("APSOutgoingMessagePushFlags"));

}

- (id)channelID
{
  return -[APSMessage objectForKey:](self, "objectForKey:", CFSTR("APSOutgoingMessageChannelIDKey"));
}

- (void)setChannelID:(id)a3
{
  -[APSMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("APSOutgoingMessageChannelIDKey"));
}

- (BOOL)ackReceived
{
  return self->_ackReceived;
}

- (void)setAckReceived:(BOOL)a3
{
  self->_ackReceived = a3;
}

@end
