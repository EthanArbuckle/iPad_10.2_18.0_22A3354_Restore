@implementation MFMessageLibrary

- (MFMessageLibrary)initWithPath:(id)a3
{
  MFMessageLibrary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMessageLibrary;
  v4 = -[MFMessageLibrary init](&v6, sel_init);
  if (v4)
    v4->_path = (NSString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageLibrary;
  -[MFMessageLibrary dealloc](&v3, sel_dealloc);
}

- (id)duplicateMessages:(id)a3 newRemoteIDs:(id)a4 forMailbox:(id)a5 setFlags:(unint64_t)a6 clearFlags:(unint64_t)a7 messageFlagsForMessages:(id)a8 createNewCacheFiles:(BOOL)a9
{
  void *v16;
  uint64_t v18;

  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  LOWORD(v18) = a9;
  -[MFMessageLibrary addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:](self, "addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:", a3, a5, 0, v16, a4, a6, a7, a8, v18, 0);
  return v16;
}

- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4
{
  return 0;
}

- (id)serverSearchResultMessagesForMailbox:(id)a3
{
  return 0;
}

- (id)messagesNeedingSyncConfirmationForMailbox:(id)a3
{
  return 0;
}

- (id)dateOfOldestNonSearchResultMessageInMailbox:(id)a3
{
  return 0;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessageInMailbox:(id)a3
{
  return 0;
}

- (id)dateOfNewestNonSearchResultMessageInMailbox:(id)a3
{
  return 0;
}

- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4
{
  return 0;
}

- (id)messagesWithoutSummariesForMailbox:(id)a3
{
  return 0;
}

- (id)messagesWithSummariesForMailbox:(id)a3 fromRowID:(unsigned int)a4 limit:(unsigned int)a5
{
  return 0;
}

- (id)messagesWithoutSummariesForMailbox:(id)a3 fromRowID:(unsigned int)a4 limit:(unsigned int)a5
{
  return 0;
}

- (id)orderedBatchOfMessagesEndingAtRowId:(unsigned int)a3 limit:(unsigned int)a4 success:(BOOL *)a5
{
  return 0;
}

- (unsigned)unreadCountForMailbox:(id)a3
{
  return 0;
}

- (unsigned)unreadCountForMailbox:(id)a3 matchingCriterion:(id)a4
{
  return 0;
}

- (unsigned)unreadCountForAggregatedMailboxes:(id)a3
{
  return 0;
}

- (unsigned)unreadCountForAggregatedMailboxes:(id)a3 matchingCriterion:(id)a4
{
  return 0;
}

- (unsigned)attachmentCountForMailboxes:(id)a3
{
  return 0;
}

- (unsigned)deletedCountForMailbox:(id)a3
{
  return 0;
}

- (unsigned)allNonDeleteCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  return 0;
}

- (unsigned)nonDeletedCountForAggregatedMailboxes:(id)a3
{
  return 0;
}

- (unsigned)nonDeletedCountForAggregatedMailboxes:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  return 0;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3
{
  return 0;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  return 0;
}

- (unsigned)totalCountForMailbox:(id)a3
{
  return 0;
}

- (unint64_t)serverUnreadOnlyOnServerCountForMailbox:(id)a3
{
  return 0;
}

- (int64_t)statusCountDeltaForMailbox:(id)a3
{
  return 0;
}

- (unint64_t)mostRecentStatusCountForMailbox:(id)a3
{
  return 0;
}

- (id)oldestMessageInMailbox:(id)a3
{
  return 0;
}

- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4
{
  return 0;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inRemoteMailbox:(id)a5
{
  return 0;
}

- (unsigned)maximumRemoteIDForMailbox:(id)a3
{
  return 0;
}

- (unsigned)minimumRemoteIDForMailbox:(id)a3
{
  return 0;
}

- (BOOL)canProvideMinimumRemoteID
{
  return 0;
}

- (id)sequenceIdentifierForMailbox:(id)a3
{
  return 0;
}

- (id)sequenceIdentifierForMessagesWithRemoteIDs:(id)a3 inMailbox:(id)a4
{
  return 0;
}

- (id)getDetailsForMessagesWithRemoteIDInRange:(_NSRange)a3 fromMailbox:(id)a4
{
  return 0;
}

- (id)getDetailsForAllMessagesFromMailbox:(id)a3
{
  return 0;
}

- (id)getDetailsForMessages:(unint64_t)a3 absoluteBottom:(unint64_t)a4 topOfDesiredRange:(unint64_t)a5 range:(_NSRange *)a6 fromMailbox:(id)a7
{
  if (a6)
  {
    a6->location = a4;
    a6->length = a5 - a4;
  }
  return 0;
}

- (id)messageWithMessageID:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  return 0;
}

- (id)messagesWithMessageIDHeader:(id)a3
{
  return 0;
}

- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  return 0;
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)compactMessages:(id)a3
{
  -[MFMessageLibrary compactMessages:permanently:](self, "compactMessages:permanently:", a3, 1);
}

- (BOOL)renameMailboxes:(id)a3 to:(id)a4
{
  return 0;
}

- (id)messageWithMessageID:(id)a3 inMailbox:(id)a4
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4 incomplete:(BOOL)a5
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3 isPartial:(BOOL)a4
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3
{
  return 0;
}

- (id)metadataForMessage:(id)a3 ofClass:(Class)a4 key:(id)a5
{
  return 0;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingDataForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  return 0;
}

- (id)headerDataForMessage:(id)a3
{
  return 0;
}

- (id)bodyDataForMessage:(id)a3
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 success:(BOOL *)a5
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5 success:(BOOL *)a6
{
  return 0;
}

- (BOOL)libraryExists
{
  return 0;
}

- (BOOL)isBusy
{
  return 0;
}

- (id)UIDsToDeleteInMailbox:(id)a3
{
  return 0;
}

- (id)deletedUIDsInMailbox:(id)a3
{
  return 0;
}

- (id)allUIDsInMailbox:(id)a3
{
  return 0;
}

- (id)hiddenPOPUIDsInMailbox:(id)a3
{
  return 0;
}

- (id)filterContiguousMessages:(id)a3 forCriterion:(id)a4 options:(unsigned int)a5
{
  return 0;
}

- (int64_t)createLibraryIDForAccount:(id)a3
{
  return -1;
}

- (int64_t)libraryIDForAccount:(id)a3
{
  return -1;
}

- (id)offlineCacheOperationsForAccount:(int64_t)a3 lastTemporaryID:(unsigned int *)a4
{
  return 0;
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  return 0;
}

- (id)urlForMailboxID:(unsigned int)a3
{
  return 0;
}

- (BOOL)isMessageContentsLocallyAvailable:(id)a3
{
  return 0;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13
{
  return 0;
}

- (id)dataPathForMessage:(id)a3
{
  return 0;
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  return 0;
}

- (id)mailboxUidForMessage:(id)a3
{
  return 0;
}

- (id)dataForMimePart:(id)a3 isComplete:(BOOL *)a4
{
  return 0;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  return 0;
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5
{
  return 0;
}

- (id)remoteStoreForMessage:(id)a3
{
  return 0;
}

- (unsigned)mailboxIDForURLString:(id)a3
{
  return 0;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6
{
  uint64_t v7;

  LOWORD(v7) = 1;
  return -[MFMessageLibrary addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:](self, "addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:", a3, a4, a5, a6, 0, 0, 0, 0, v7, 0);
}

- (void)setFlagsForMessages:(id)a3
{
  -[MFMessageLibrary setFlagsForMessages:mask:](self, "setFlagsForMessages:mask:", a3, 0x1BFDDF7FFFFLL);
}

- (void)postFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v9;

  if (objc_msgSend(a3, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKey:", a3, CFSTR("messages"));
    if (a5)
      objc_msgSend(v9, "setObject:forKey:", a5, CFSTR("oldFlagsByMessage"));
    if (a4)
      objc_msgSend(v9, "setObject:forKey:", a4, CFSTR("flags"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessageFlagsChanged"), self, v9);

  }
}

- (void)postOldFlags:(unint64_t)a3 newFlags:(unint64_t)a4 forMessage:(id)a5
{
  id v8;
  id v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (a3 == a4)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = v10;
    if ((a3 & 1) != (a4 & 1))
    {
      if ((a4 & 1) != 0)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("MessageIsRead"));
    }
    v12 = a4 ^ a3;
    if ((a4 ^ a3) >= 2)
    {
      if (((a3 >> 1) & 1) != ((a4 >> 1) & 1))
      {
        if ((a4 & 2) != 0)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("MessageIsDeleted"));
      }
      if (v12 >= 4)
      {
        if (((a3 >> 2) & 1) != ((a4 >> 2) & 1))
        {
          if ((a4 & 4) != 0)
            v14 = CFSTR("YES");
          else
            v14 = CFSTR("NO");
          objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("MessageWasRepliedTo"));
        }
        if (v12 >= 8)
        {
          if (((a3 >> 3) & 1) != ((a4 >> 3) & 1))
          {
            if ((a4 & 8) != 0)
              v15 = CFSTR("YES");
            else
              v15 = CFSTR("NO");
            objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("MessageIsEncrypted"));
          }
          if (v12 >= 0x10)
          {
            if (((a3 >> 23) & 1) != ((a4 >> 23) & 1))
            {
              if ((a4 & 0x800000) != 0)
                v16 = CFSTR("YES");
              else
                v16 = CFSTR("NO");
              objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("MessageIsSigned"));
            }
            if ((v12 & 0xFFFFFFFFFF7FFFF0) != 0)
            {
              if (((a3 >> 24) & 1) != ((a4 >> 24) & 1))
              {
                if ((a4 & 0x1000000) != 0)
                  v17 = CFSTR("YES");
                else
                  v17 = CFSTR("NO");
                objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("MessageSenderIsVIP"));
              }
              if ((v12 & 0xFFFFFFFFFE7FFFF0) != 0)
              {
                if (((a3 >> 8) & 1) != ((a4 >> 8) & 1))
                {
                  if ((a4 & 0x100) != 0)
                    v18 = CFSTR("YES");
                  else
                    v18 = CFSTR("NO");
                  objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("MessageWasForwarded"));
                }
                if ((v12 & 0xFFFFFFFFFE7FFEF0) != 0)
                {
                  if (((a3 >> 9) & 1) != ((a4 >> 9) & 1))
                  {
                    if ((a4 & 0x200) != 0)
                      v19 = CFSTR("YES");
                    else
                      v19 = CFSTR("NO");
                    objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("MessageWasRedirected"));
                  }
                  if ((v12 & 0xFFFFFFFFFE7FFCF0) != 0)
                  {
                    if (((a3 >> 4) & 1) != ((a4 >> 4) & 1))
                    {
                      if ((a4 & 0x10) != 0)
                        v20 = CFSTR("YES");
                      else
                        v20 = CFSTR("NO");
                      objc_msgSend(v8, "setObject:forKey:", v20, CFSTR("MessageIsFlagged"));
                    }
                    if ((v12 & 0xFFFFFFFFFE7FFCE0) != 0)
                    {
                      if (((a3 >> 30) & 1) != ((a4 >> 30) & 1))
                      {
                        if ((a4 & 0x40000000) != 0)
                          v21 = CFSTR("YES");
                        else
                          v21 = CFSTR("NO");
                        objc_msgSend(v8, "setObject:forKey:", v21, CFSTR("MessageHighlightTextInTOC"));
                      }
                      if ((v12 & 0xFFFFFFFFBE7FFCE0) != 0)
                      {
                        if ((WORD1(a3) & 7) != (WORD1(a4) & 7))
                          objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("MessagePriorityLevel"));
                        if ((v12 & 0xFFFFFFFFBE78FCE0) != 0)
                        {
                          v22 = ((a3 >> 26) & 7) - 1;
                          v23 = v22 > 6 ? 0 : dword_1C88A3730[v22];
                          v24 = ((a4 >> 26) & 7) - 1;
                          v25 = v24 > 6 ? 0 : dword_1C88A3730[v24];
                          if (v23 != v25)
                            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("MessageFontSizeDelta"));
                          if ((v12 & 0xFFFFFFFFA278FCE0) != 0)
                          {

                            v8 = 0;
LABEL_78:
                            v29[0] = a5;
                            v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
                            v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3, a5);
                            -[MFMessageLibrary postFlagsChangedForMessages:flags:oldFlagsByMessage:](self, "postFlagsChangedForMessages:flags:oldFlagsByMessage:", v26, v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
                            goto LABEL_79;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (!v8 || objc_msgSend(v8, "count"))
    goto LABEL_78;
LABEL_79:

}

- (id)accountForMessage:(id)a3
{
  return (id)objc_msgSend(-[MFMessageLibrary mailboxUidForMessage:](self, "mailboxUidForMessage:", a3), "account");
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  return -[MFMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:](self, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:", a3, a4, 0);
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  return 0;
}

- (id)storedIntegerPropertyWithName:(id)a3
{
  return 0;
}

- (id)dataProvider
{
  id result;

  result = self->_attachmentDataProvider;
  if (!result)
  {
    result = -[MFAttachmentLibraryDataProvider initWithLibrary:]([MFAttachmentLibraryDataProvider alloc], "initWithLibrary:", self);
    self->_attachmentDataProvider = (MFAttachmentLibraryDataProvider *)result;
  }
  return result;
}

@end
