@implementation MPRTTTranscriptionMessage

- (MPRTTTranscriptionMessage)initWithCallUUID:(id)a3
{
  id v4;
  MPRTTTranscriptionMessage *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *rttConversationsQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPRTTTranscriptionMessage;
  v5 = -[MPRTTTranscriptionMessage init](&v11, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.mobilephone.rttConversations", v7);
    rttConversationsQueue = v5->_rttConversationsQueue;
    v5->_rttConversationsQueue = (OS_dispatch_queue *)v8;

    -[MPRTTTranscriptionMessage fetchRTTConversationForCallUUID:](v5, "fetchRTTConversationForCallUUID:", v4);
  }

  return v5;
}

- (void)fetchRTTConversationForCallUUID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *rttConversationsQueue;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  id buf[2];

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting fetchRTTConversationForCallUUID", (uint8_t *)buf, 2u);
  }

  v7 = RTTUIUtilitiesClass();
  if (v7)
  {
    v8 = v7;
    objc_initWeak(buf, self);
    rttConversationsQueue = self->_rttConversationsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A9E8;
    block[3] = &unk_10007D9F0;
    objc_copyWeak(v14, buf);
    v14[1] = v8;
    v13 = v4;
    dispatch_async(rttConversationsQueue, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(buf);
  }
  else
  {
    v10 = PHDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because we could not find RTTUIUtilities", (uint8_t *)buf, 2u);
    }

  }
}

- (id)makeTranscriptMessage
{
  __CFString *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (self->_conversation)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RTTConversation utterances](self->_conversation, "utterances"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "isMe") & 1) == 0)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
            if (objc_msgSend(v9, "isTranscription"))
            {
              v11 = ttyLocString(CFSTR("RTTTranscriptionPrefix"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, &stru_10007F010));

              v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v13, &stru_10007F010));
              v10 = (void *)v14;
            }
            if (-[__CFString length](v3, "length"))
              -[__CFString appendString:](v3, "appendString:", CFSTR(" "));
            -[__CFString appendString:](v3, "appendString:", v10);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = &stru_10007F010;
  }
  return v3;
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_rttConversationsQueue, 0);
}

- (NSAttributedString)attributedText
{
  MPRTTTranscriptionMessage *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSString v7;
  id v8;

  v2 = self;
  v3 = -[MPRTTTranscriptionMessage text](v2, "text");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = objc_allocWithZone((Class)NSAttributedString);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v8 = objc_msgSend(v6, "initWithString:", v7);

  return (NSAttributedString *)v8;
}

- (NSString)text
{
  MPRTTTranscriptionMessage *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = -[MPRTTTranscriptionMessage makeTranscriptMessage](v2, "makeTranscriptMessage");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (unint64_t)confidenceRating
{
  return 0;
}

- (double)confidence
{
  return 1.0;
}

@end
