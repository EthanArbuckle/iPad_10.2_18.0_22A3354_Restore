@implementation CKMessagePartChatItem

- (NSArray)messageAcknowledgments
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CKMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "addObject:", v8);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (int64_t)selectedType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CKMessagePartChatItem messageAcknowledgments](self, "messageAcknowledgments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v8, "acknowledgments", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              if ((objc_msgSend(v14, "isFromMe") & 1) != 0 || v6 < 0)
              {
                objc_msgSend(v14, "tapback");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v6 = objc_msgSend(v15, "associatedMessageType");

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v11);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v6 <= 2000)
    return 2000;
  else
    return v6;
}

- (id)votingCounts
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[6];
  _QWORD v38[6];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CKMessagePartChatItem messageAcknowledgments](self, "messageAcknowledgments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v24)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v23 = *(_QWORD *)v34;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v25 = v5;
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v5);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v6, "acknowledgments");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v30 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "tapback");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "associatedMessageType");

              switch(v13)
              {
                case 2000:
                  ++v4;
                  break;
                case 2001:
                  ++v2;
                  break;
                case 2002:
                  ++v26;
                  break;
                case 2003:
                  ++v3;
                  break;
                case 2004:
                  ++v27;
                  break;
                case 2005:
                  ++v28;
                  break;
                default:
                  continue;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          }
          while (v9);
        }

        v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v24);
  }
  else
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v2 = 0;
    v3 = 0;
    v4 = 0;
  }

  v37[0] = &unk_1E2870BE8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  v37[1] = &unk_1E2870C00;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  v37[2] = &unk_1E2870C18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v16;
  v37[3] = &unk_1E2870C30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  v37[4] = &unk_1E2870C48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v18;
  v37[5] = &unk_1E2870C60;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)aggregateAcknowledgmentChatItem
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CKMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKMessagePartChatItem;
  -[CKBalloonChatItem description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKMessagePartChatItem color](self, "color");
  -[CKMessagePartChatItem messageHighlightChatItem](self, "messageHighlightChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ color:%d, messageHighlightChatItem: %@, visible associated message items: [%@]]"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CKMessagePartChatItem)init
{
  CKMessagePartChatItem *v2;
  CKMessagePartChatItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessagePartChatItem;
  v2 = -[CKMessagePartChatItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKMessagePartChatItem setCachedColor:](v2, "setCachedColor:", 4294967294);
  return v3;
}

- (BOOL)canCopy
{
  return 1;
}

- (BOOL)canForward
{
  return 1;
}

- (BOOL)canSendAsTextMessage
{
  void *v3;
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isScheduledMessagesCoreEnabled"))
  {
    v4 = -[CKMessagePartChatItem scheduleType](self, "scheduleType");

    if (v4 == 2)
      return 0;
  }
  else
  {

  }
  v6 = (void *)MEMORY[0x1E0D35910];
  -[CKMessagePartChatItem serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsCapability:", *MEMORY[0x1E0D38E98]);

  return v9;
}

- (BOOL)canSendAsTextMessageOverSatellite
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isScheduledMessagesCoreEnabled"))
    v4 = -[CKMessagePartChatItem scheduleType](self, "scheduleType") != 2;
  else
    v4 = 1;

  return v4;
}

- (BOOL)canInlineReply
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canReply");

  return v3;
}

- (BOOL)canAttachStickers
{
  void *v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesCoreEnabled");

  v5 = -[CKChatItem isEditedMessageHistory](self, "isEditedMessageHistory");
  if (v4)
  {
    if (v5)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[CKMessagePartChatItem messageItem](self, "messageItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "scheduleType") == 2)
      {
        v8 = objc_msgSend(v7, "scheduleState");
        if (v8 <= 5)
          v6 = (9u >> v8) & 1;
        else
          LOBYTE(v6) = 1;
      }
      else
      {
        LOBYTE(v6) = 1;
      }

    }
  }
  else
  {
    LOBYTE(v6) = !v5;
  }
  return v6;
}

- (BOOL)stickersSnapToPoint
{
  return 1;
}

- (BOOL)isFromMe
{
  void *v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  if (CKIsRunningForDevelopmentOnSimulator()
    || CKIsRunningUITests()
    || CKIsRunningForDevelopmentOnSimulator()
    || (-[CKMessagePartChatItem message](self, "message"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMessagePartChatItem message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "isFromMe");

  return v7;
}

- (BOOL)failed
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = -[CKMessagePartChatItem isFromMe](self, "isFromMe");
  if (v3)
  {
    -[CKMessagePartChatItem message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_3;
    -[CKMessagePartChatItem messageItem](self, "messageItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "scheduleType");

    if (v7 != 2)
      goto LABEL_6;
    -[CKMessagePartChatItem messageItem](self, "messageItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "scheduleState");

    if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4)
LABEL_3:
      LOBYTE(v3) = 1;
    else
LABEL_6:
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)time
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKChatItem notification](self, "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (CKIsRunningForDevelopmentOnSimulator()
      || CKIsRunningUITests()
      || CKIsRunningForDevelopmentOnSimulator())
    {
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKMessagePartChatItem message](self, "message");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v6;
    objc_msgSend(v6, "time");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;

  return v7;
}

- (id)sender
{
  void *v3;
  void *v4;
  void *v5;

  if (CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMessagePartChatItem message](self, "message");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)serviceName
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)configureBalloonView:(id)a3
{
  objc_msgSend(a3, "configureForMessagePart:", self);
}

- (BOOL)_isSURFRelatedMessage
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CKMessagePartChatItem message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D37620];
  if ((objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D37620]) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[CKMessagePartChatItem message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D37628];
    if ((objc_msgSend(v8, "containsString:", *MEMORY[0x1E0D37628]) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[CKMessagePartChatItem message](self, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "associatedBalloonBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "containsString:", v5) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        -[CKMessagePartChatItem message](self, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "associatedBalloonBundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v13, "containsString:", v9);

      }
    }

  }
  return v6;
}

- (IMMessage)message
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (IMMessageItem)messageItem
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessageItem *)v3;
}

- (int64_t)index
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "index");

  return v3;
}

- (char)balloonStyle
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  char result;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  int v13;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDashedBalloonsEnabled");

  if (v4)
  {
    -[CKMessagePartChatItem messageItem](self, "messageItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPendingSatelliteSend");

    if ((v6 & 1) != 0)
      return 4;
  }
  -[CKMessagePartChatItem messageItem](self, "messageItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "scheduleType");

  if (v9 != 2)
    return 0;
  -[CKMessagePartChatItem messageItem](self, "messageItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "scheduleState");

  result = 0;
  if (v11 <= 5 && ((1 << v11) & 0x36) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDashedBalloonsEnabled");

    if (v13)
      return 4;
    else
      return 2;
  }
  return result;
}

- (CKColor_t)strokeColor
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CKColor_t result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDashedBalloonsEnabled");

  if (v8)
  {
    -[CKMessagePartChatItem messageItem](self, "messageItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPendingSatelliteSend");

    if (v10)
      goto LABEL_8;
  }
  -[CKMessagePartChatItem messageItem](self, "messageItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "scheduleType");

  if (v12 < 2)
  {
LABEL_4:
    v2 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
    goto LABEL_9;
  }
  if (v12 == 2)
  {
    -[CKMessagePartChatItem messageItem](self, "messageItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "scheduleState");

    if (v14 <= 5)
    {
      if (((1 << v14) & 0x36) == 0)
        goto LABEL_4;
LABEL_8:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "theme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unfilledBalloonColorForColorType:", 15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ckColor");
      v2 = v18;
      v3 = v19;
      v4 = v20;
      v5 = v21;

    }
  }
LABEL_9:
  v22 = v2;
  v23 = v3;
  v24 = v4;
  v25 = v5;
  result.alpha = v25;
  result.blue = v24;
  result.green = v23;
  result.red = v22;
  return result;
}

- (char)color
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;

  if (+[CKApplicationState isResizing](CKApplicationState, "isResizing")
    && -[CKMessagePartChatItem cachedColor](self, "cachedColor") != -2)
  {
    return -[CKMessagePartChatItem cachedColor](self, "cachedColor");
  }
  if (-[CKMessagePartChatItem _isSURFRelatedMessage](self, "_isSURFRelatedMessage"))
  {
    LOBYTE(v3) = 5;
    -[CKMessagePartChatItem setCachedColor:](self, "setCachedColor:", 5);
  }
  else if (-[CKMessagePartChatItem isFromMe](self, "isFromMe"))
  {
    -[CKMessagePartChatItem message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isScheduledMessagesCoreEnabled");

    if (v7
      && objc_msgSend(v5, "scheduleType") == 2
      && (v8 = objc_msgSend(v5, "scheduleState") - 1, v8 < 5)
      && ((0x1Bu >> v8) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isDashedBalloonsEnabled"),
          v9,
          v10)
      && (objc_msgSend(v4, "isPendingSatelliteSend") & 1) != 0)
    {
      v3 = 15;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRunningInStoreDemoMode");

      if ((v13 & 1) != 0)
      {
        v3 = 1;
      }
      else if ((objc_msgSend(v5, "isStewie") & 1) != 0)
      {
        v3 = 12;
      }
      else if ((objc_msgSend(v5, "isBusiness") & 1) != 0)
      {
        v3 = 6;
      }
      else if ((objc_msgSend(v4, "wasDowngraded") & 1) != 0)
      {
        v3 = 0;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0D35910];
        -[CKMessagePartChatItem serviceName](self, "serviceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "serviceWithName:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v16, "__ck_displayColor");

      }
    }
    -[CKMessagePartChatItem setCachedColor:](self, "setCachedColor:", v3);

  }
  else
  {
    -[CKMessagePartChatItem setCachedColor:](self, "setCachedColor:", 0xFFFFFFFFLL);
    LOBYTE(v3) = -1;
  }
  return v3;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  return 0;
}

- (NSArray)pasteboardItemProviders
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[CKMessagePartChatItem dragItemProvider](self, "dragItemProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSItemProvider)dragItemProvider
{
  return 0;
}

- (id)fileURLForAttachment
{
  return 0;
}

- (CKMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  CKMessagePartChatItem *v5;
  CKMessagePartChatItem *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  CKMessagePartHighlightChatItem *v20;
  void *v21;
  uint64_t v22;
  CKMessagePartHighlightChatItem *messageHighlightChatItem;
  uint64_t v24;
  NSArray *suggestedActionsList;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)CKMessagePartChatItem;
  v5 = -[CKChatItem initWithIMChatItem:maxWidth:](&v31, sel_initWithIMChatItem_maxWidth_, a3);
  v6 = v5;
  if (v5)
  {
    -[CKChatItem IMChatItem](v5, "IMChatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKChatItem IMChatItem](v6, "IMChatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visibleAssociatedMessageChatItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "__ck_chatItemClass", (_QWORD)v27)), "initWithIMChatItem:maxWidth:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), a4);
              if (v18)
                objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v15);
        }

      }
      else
      {
        v12 = 0;
      }
      objc_storeStrong((id *)&v6->_visibleAssociatedMessageChatItems, v12);
      objc_msgSend(v9, "messageHighlightChatItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = [CKMessagePartHighlightChatItem alloc];
        objc_msgSend(v9, "messageHighlightChatItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[CKMessagePartHighlightChatItem initWithIMChatItem:maxWidth:](v20, "initWithIMChatItem:maxWidth:", v21, a4);
        messageHighlightChatItem = v6->_messageHighlightChatItem;
        v6->_messageHighlightChatItem = (CKMessagePartHighlightChatItem *)v22;

      }
      objc_msgSend(v9, "suggestedActionsList", (_QWORD)v27);
      v24 = objc_claimAutoreleasedReturnValue();
      suggestedActionsList = v6->_suggestedActionsList;
      v6->_suggestedActionsList = (NSArray *)v24;

    }
    -[CKMessagePartChatItem setCachedColor:](v6, "setCachedColor:", 4294967294);
  }
  return v6;
}

- (id)tapbackActionButtonImageName
{
  void *v3;
  const __CFString *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;

  if (-[CKMessagePartChatItem hasMessageAcknowledgment](self, "hasMessageAcknowledgment"))
  {
    -[NSArray lastObject](self->_visibleAssociatedMessageChatItems, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = &stru_1E276D870;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      if (objc_msgSend(v5, "includesMultiple"))
        v6 = CFSTR(".2");
      else
        v6 = &stru_1E276D870;
      v7 = objc_msgSend(v5, "latestAcknowledgmentType");
      if (objc_msgSend(v5, "fromMeAcknowledgmentType"))
      {
        v7 = objc_msgSend(v5, "fromMeAcknowledgmentType");
        v4 = CFSTR(".fill");
      }
      if ((unint64_t)(v7 - 2000) > 5)
        v8 = CFSTR("plus");
      else
        v8 = off_1E27585B0[v7 - 2000];

    }
    else
    {
      v8 = CFSTR("plus");
      v6 = &stru_1E276D870;
    }

  }
  else
  {
    v6 = &stru_1E276D870;
    v8 = CFSTR("plus");
    v4 = &stru_1E276D870;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@%@%@"), v8, CFSTR("bubble.tapback"), v6, v4);
}

- (CKAggregateAcknowledgmentChatItem)tapbacksChatItem
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CKMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (CKAggregateAcknowledgmentChatItem *)v3;
}

- (BOOL)canSendTapbacks
{
  unsigned int v3;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;

  if (-[CKChatItem isEditedMessageHistory](self, "isEditedMessageHistory")
    || -[CKChatItem itemIsReplyContextPreview](self, "itemIsReplyContextPreview"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isScheduledMessagesCoreEnabled");

    if (v6)
    {
      -[CKMessagePartChatItem messageItem](self, "messageItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "scheduleType") == 2)
      {
        v8 = objc_msgSend(v7, "scheduleState");
        if (v8 <= 5)
          v3 = (9u >> v8) & 1;
        else
          LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = 1;
      }

    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (_NSRange)messagePartRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "messagePartRange");
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)originalMessagePartRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "originalMessagePartRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)hasMessageAcknowledgment
{
  void *v2;
  BOOL v3;

  -[CKMessagePartChatItem tapbacksChatItem](self, "tapbacksChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasStickers
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_visibleAssociatedMessageChatItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isCorrupt
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCorrupt");

  return v3;
}

- (int64_t)stewieConversationID
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stewieConversationID");

  return v3;
}

- (BOOL)isBlackholed
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL result;

  -[CKMessagePartChatItem message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  result = -[CKMessagePartChatItem isFromMe](self, "isFromMe");
  if (v5 != 43)
    return 0;
  return result;
}

- (BOOL)isReply
{
  void *v3;
  _BOOL4 v4;

  -[CKMessagePartChatItem threadIdentifier](self, "threadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = !-[CKChatItem wantsOverlayLayout](self, "wantsOverlayLayout");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)isReplyContextPreview
{
  return 0;
}

- (NSString)threadIdentifier
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IMMessageItem)threadOriginator
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadOriginator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessageItem *)v3;
}

- (unint64_t)scheduleType
{
  void *v2;
  unint64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleType");

  return v3;
}

- (unint64_t)scheduleState
{
  void *v2;
  unint64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleState");

  return v3;
}

- (double)timeIntervalSinceMessageSent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CKMessagePartChatItem time](self, "time");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v2);
  v5 = v4;

  return v5;
}

- (void)_setVisibleAssociatedMessageChatItems:(id)a3
{
  NSArray *v5;
  NSArray **p_visibleAssociatedMessageChatItems;
  BOOL v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  p_visibleAssociatedMessageChatItems = &self->_visibleAssociatedMessageChatItems;
  if (*p_visibleAssociatedMessageChatItems != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqualToArray:](*p_visibleAssociatedMessageChatItems, "isEqualToArray:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)p_visibleAssociatedMessageChatItems, a3);
      v5 = v8;
    }
  }

}

- (BOOL)hasVisibleAssociatedMessageItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CKMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  return self->_visibleAssociatedMessageChatItems;
}

- (NSArray)suggestedActionsList
{
  return self->_suggestedActionsList;
}

- (CKMessagePartHighlightChatItem)messageHighlightChatItem
{
  return self->_messageHighlightChatItem;
}

- (char)cachedColor
{
  return self->_cachedColor;
}

- (void)setCachedColor:(char)a3
{
  self->_cachedColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHighlightChatItem, 0);
  objc_storeStrong((id *)&self->_suggestedActionsList, 0);
  objc_storeStrong((id *)&self->_visibleAssociatedMessageChatItems, 0);
}

- (id)compositionWithContext:(id)a3
{
  return 0;
}

@end
