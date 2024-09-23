@implementation SGQuickResponsesStore

- (SGQuickResponsesStore)init
{
  return (SGQuickResponsesStore *)-[SGQuickResponsesStore initInDirectory:inMemory:withMigration:forTools:](self, "initInDirectory:inMemory:withMigration:forTools:", 0, 0, 0, 1);
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5
{
  return -[SGQuickResponsesStore initInDirectory:inMemory:withMigration:forTools:](self, "initInDirectory:inMemory:withMigration:forTools:", a3, a4, a5, 0);
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5 forTools:(BOOL)a6
{
  id v10;
  SGQuickResponsesStore *v11;
  id v12;
  SGLazyInit *v13;
  SGLazyInit *v14;
  uint64_t v15;
  _PASLock *readerWriter;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  objc_super v26;

  v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SGQuickResponsesStore;
  v11 = -[SGQuickResponsesStore init](&v26, sel_init);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BE7A610]);
    v13 = [SGLazyInit alloc];
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __73__SGQuickResponsesStore_initInDirectory_inMemory_withMigration_forTools___block_invoke;
    v21 = &unk_24DDC46F0;
    v22 = v10;
    v23 = a4;
    v24 = a5;
    v25 = a6;
    v14 = -[SGLazyInit initWithInitializer:destructor:](v13, "initWithInitializer:destructor:", &v18, &__block_literal_global_14);
    v15 = objc_msgSend(v12, "initWithGuardedData:", v14, v18, v19, v20, v21);
    readerWriter = v11->_readerWriter;
    v11->_readerWriter = (_PASLock *)v15;

  }
  return v11;
}

- (BOOL)frailReadTransaction:(id)a3
{
  id v4;
  void *v5;
  _PASLock *readerWriter;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)MEMORY[0x220753E80]();
  readerWriter = self->_readerWriter;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SGQuickResponsesStore_frailReadTransaction___block_invoke;
  v9[3] = &unk_24DDC47A8;
  v11 = &v12;
  v7 = v4;
  v10 = v7;
  -[_PASLock runWithLockAcquired:](readerWriter, "runWithLockAcquired:", v9);

  objc_autoreleasePoolPop(v5);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

- (BOOL)frailWriteTransaction:(id)a3
{
  id v4;
  void *v5;
  _PASLock *readerWriter;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)MEMORY[0x220753E80]();
  readerWriter = self->_readerWriter;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke;
  v9[3] = &unk_24DDC47A8;
  v11 = &v12;
  v7 = v4;
  v10 = v7;
  -[_PASLock runWithLockAcquired:](readerWriter, "runWithLockAcquired:", v9);

  objc_autoreleasePoolPop(v5);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

- (id)recordsForResponses:(id)a3 language:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesStore _recordsForResponses:language:](self, "_recordsForResponses:language:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)recordsForResponsesInternal:(id)a3 language:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesStore _recordsForResponses:language:](self, "_recordsForResponses:language:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_recordsForResponses:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  SGQuickResponsesRecords *v12;
  SGQuickResponsesRecords *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  __CFString *v18;
  id v19;
  __CFString *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke;
  v15[3] = &unk_24DDC48A8;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v18 = CFSTR("SELECT * FROM responses WHERE lang_response=$lang_response");
  v11 = v8;
  v21 = &v42;
  v22 = &v38;
  v23 = &v34;
  v24 = &v30;
  v25 = &v26;
  v19 = v11;
  v20 = CFSTR("SELECT * FROM responses_totals WHERE language=$language");
  if (-[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v15))
  {
    v12 = [SGQuickResponsesRecords alloc];
    v13 = -[SGQuickResponsesRecords initWithReplyRecords:totalOpportunities:totalDisplayed:totalSelected:totalMatched:totalUnmatched:](v12, "initWithReplyRecords:totalOpportunities:totalDisplayed:totalSelected:totalMatched:totalUnmatched:", v11, (double)v43[3], (double)v39[3], (double)v35[3], (double)v31[3], (double)v27[3]);
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v13;
}

- (void)addDisplayedToResponses:(id)a3 language:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;

  v6 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_2;
  v10[3] = &unk_24DDC4918;
  v11 = v7;
  v12 = v6;
  v13 = CFSTR("INSERT INTO responses (lang_response, displayed) VALUES($lang_response,1) ON CONFLICT(lang_response) DO UPDATE SET displayed=displayed+1");
  v14 = CFSTR("INSERT INTO responses_totals (language, opportunities, displayed) VALUES ($language,1,$count) ON CONFLICT(language) DO UPDATE SET opportunities=opportunities+1, displayed=displayed+$count");
  v8 = v6;
  v9 = v7;
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v10);

}

- (void)addSelectedToResponse:(id)a3 language:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;

  v6 = a4;
  +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke;
  v10[3] = &unk_24DDC4918;
  v11 = v6;
  v12 = v7;
  v13 = CFSTR("INSERT INTO responses (lang_response, selected) VALUES($lang_response,1) ON CONFLICT(lang_response) DO UPDATE SET selected=selected+1");
  v14 = CFSTR("INSERT INTO responses_totals (language, selected) VALUES ($language,1) ON CONFLICT(language) DO UPDATE SET selected=selected+1");
  v8 = v7;
  v9 = v6;
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v10);

}

- (void)addWrittenToResponse:(id)a3 language:(id)a4 isMatch:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  BOOL v18;

  v8 = a4;
  +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke;
  v12[3] = &unk_24DDC4940;
  v18 = a5;
  v13 = v8;
  v14 = v9;
  v15 = CFSTR("INSERT INTO responses (lang_response, matched) VALUES($lang_response,1) ON CONFLICT(lang_response) DO UPDATE SET matched=matched+1");
  v16 = CFSTR("INSERT INTO responses_totals (language, matched) VALUES ($language,1) ON CONFLICT(language) DO UPDATE SET matched=matched+1");
  v17 = CFSTR("INSERT INTO responses_totals (language, unmatched) VALUES ($language,1) ON CONFLICT(language) DO UPDATE SET unmatched=unmatched+1");
  v10 = v9;
  v11 = v8;
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v12);

}

- (void)_addCustomResponseToDb:(id)a3 reply:(id)a4 language:(id)a5 embedding:(id)a6 sentAt:(double)a7 recipient:(id)a8 messagesRowId:(int64_t)a9 onError:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  double v39;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke;
  v35[3] = &unk_24DDC4968;
  v21 = v16;
  v36 = v21;
  v22 = v17;
  v37 = v22;
  v38 = v18;
  v39 = a7;
  v29 = v18;
  v23 = a10;
  v24 = a3;
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO custom_responses (reply,  language,  prompt_embedding, decayed_times_used,  first_seen,  last_seen)                       VALUES($reply, $language, $prompt_embedding,                  1,    $sent_at,   $sent_at)"), v35, 0, v23);
  v25 = perRecipientCountUpsertQuery;
  v31[0] = v20;
  v31[1] = 3221225472;
  v31[2] = __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2;
  v31[3] = &unk_24DDC4990;
  v32 = v21;
  v33 = v22;
  v34 = v19;
  v26 = v19;
  v27 = v22;
  v28 = v21;
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", v25, v31, 0, v23);
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3;
  v30[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v30[4] = a9;
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", markFilteredQuery, v30, 0, v23);

}

- (void)_incrementCustomResponseInDb:(id)a3 reply:(id)a4 language:(id)a5 embedding:(id)a6 sentAt:(double)a7 recipient:(id)a8 messagesRowId:(int64_t)a9 onError:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  double v39;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke;
  v35[3] = &unk_24DDC4968;
  v21 = v16;
  v36 = v21;
  v22 = v17;
  v37 = v22;
  v38 = v18;
  v39 = a7;
  v29 = v18;
  v23 = a10;
  v24 = a3;
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE custom_responses SET prompt_embedding = $prompt_embedding,     decayed_times_used = decayed_times_used + 1,     first_seen = MIN($sent_at, first_seen),     last_seen = MAX($sent_at, last_seen) WHERE language = $language AND reply = $reply"), v35, 0, v23);
  v25 = perRecipientCountUpsertQuery;
  v31[0] = v20;
  v31[1] = 3221225472;
  v31[2] = __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2;
  v31[3] = &unk_24DDC4990;
  v32 = v21;
  v33 = v22;
  v34 = v19;
  v26 = v19;
  v27 = v22;
  v28 = v21;
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", v25, v31, 0, v23);
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3;
  v30[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v30[4] = a9;
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", markFilteredQuery, v30, 0, v23);

}

- (BOOL)addingMessageExceedsBatchLimit:(unint64_t)a3 tableLimit:(unint64_t)a4 message:(id)a5 language:(id)a6 prompt:(id)a7 recipientHandle:(id)a8 sentAt:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v32;
  _QWORD v34[4];
  __CFString *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  __CFString *v42;
  unint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  __CFString *v49;
  uint64_t v50;
  _QWORD v51[4];

  v51[2] = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  if (!objc_msgSend(v13, "length"))
    goto LABEL_9;
  if ((unint64_t)objc_msgSend(v15, "length") >= 0x119)
  {
    objc_msgSend(v15, "substringToIndex:", 140);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v15, "length") - 140);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _PASRepairString();
    v21 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v21;
  }
  if (objc_msgSend(v15, "length", a3))
  {
    -[SGQuickResponsesStore getProfanityLocale](self, "getProfanityLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v51[0] = v14;
    v51[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[SGQuickResponsesStore isProfane:inLocales:](SGQuickResponsesStore, "isProfane:inLocales:", v13, v24);

    if (v25)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v28 = v27;
      v29 = MEMORY[0x24BDAC760];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke;
      v44[3] = &unk_24DDC4A00;
      v45 = v13;
      v46 = v14;
      v47 = v15;
      v50 = v28;
      v48 = v16;
      v49 = CFSTR("INSERT INTO messages (reply, language, prompt, recipient, sent_at, filtering, filtered) VALUES($reply, $language, $prompt, $recipient, $sent_at, false, false)");
      -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v44);
      v41[0] = v29;
      v41[1] = 3221225472;
      v41[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_3;
      v41[3] = &unk_24DDC4A28;
      v42 = CFSTR("DELETE FROM messages ORDER BY sent_at DESC LIMIT -1 OFFSET $table_limit");
      v43 = a4;
      -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v41);
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v34[0] = v29;
      v34[1] = 3221225472;
      v34[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_5;
      v34[3] = &unk_24DDC4A50;
      v35 = CFSTR("SELECT COUNT(ROWID) as c from messages where NOT filtered");
      v36 = &v37;
      -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v34);
      v26 = v38[3] > v32;

      _Block_object_dispose(&v37, 8);
    }

  }
  else
  {
LABEL_9:
    v26 = 0;
  }

  return v26;
}

- (id)embeddingForPrompt:(id)a3 language:(id)a4 embedder:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, id);
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, id))a5;
  v10 = (void *)MEMORY[0x220753E80]();
  v9[2](v9, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79AB8]), "initWithNumbers:", v11);
  else
    v12 = 0;

  objc_autoreleasePoolPop(v10);
  return v12;
}

- (void)recordKnownCustomResponsesInBatchWithEmbedder:(id)a3 compatibilityVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  __CFString *v11;
  id v12;

  v6 = a3;
  if (!-[SGQuickResponsesStore resetDbIfNeededCompareWithCompatibilityVersion:](self, "resetDbIfNeededCompareWithCompatibilityVersion:", a4))
  {
    v7 = (void *)objc_opt_new();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke;
    v9[3] = &unk_24DDC4A78;
    v9[4] = self;
    v10 = v7;
    v11 = CFSTR("SELECT m.rowid, m.filtering, m.filtered, m.recipient, m.prompt, m.language, m.reply, m.sent_at, cr.prompt_embedding FROM messages as m, (SELECT reply, language, prompt_embedding from custom_responses) as cr WHERE m.filtering AND NOT m.filtered AND m.reply = cr.reply AND m.language = cr.language");
    v12 = v6;
    v8 = v7;
    -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v9);

  }
}

- (unint64_t)designateFilteringBatch:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[4];
  __CFString *v6;
  __CFString *v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke;
  v5[3] = &unk_24DDC4AA0;
  v8 = &v10;
  v9 = a3;
  v6 = CFSTR("UPDATE messages SET filtering = true WHERE NOT filtered ORDER BY sent_at LIMIT $limit");
  v7 = CFSTR("SELECT changes();");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v5);
  v3 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v3;
}

- (void)filterBatchWithMinimumDistinctRecipients:(unint64_t)a3 minimumReplyOccurences:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  __CFString *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  __CFString *v31;
  unint64_t v32;
  unint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke;
  v30[3] = &unk_24DDC4AE8;
  v32 = a3;
  v33 = a4;
  v31 = CFSTR("UPDATE messages SET filtering = false, filtered = true WHERE filtering AND reply IN (SELECT reply FROM messages GROUP BY reply HAVING COUNT(DISTINCT(recipient)) < $recipients OR COUNT(reply) < $replies)");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v30);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__590;
  v28 = __Block_byref_object_dispose__591;
  v29 = 0;
  v29 = (id)objc_opt_new();
  -[SGQuickResponsesStore getProfanityLocale](self, "getProfanityLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_3;
  v20[3] = &unk_24DDC4B38;
  v8 = v6;
  v23 = &v24;
  v21 = v8;
  v22 = CFSTR("SELECT rowid, reply FROM messages WHERE filtering");
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)v25[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v14[0] = v5;
        v14[1] = 3221225472;
        v14[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_107;
        v14[3] = &unk_24DDC4B60;
        v14[4] = v13;
        v15 = CFSTR("UPDATE messages SET filtering = false, filtered = true WHERE rowid = $row_id");
        -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v24, 8);
}

- (id)getProfanityLocale
{
  id v2;
  _QWORD v4[4];
  __CFString *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__590;
  v11 = __Block_byref_object_dispose__591;
  v12 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SGQuickResponsesStore_getProfanityLocale__block_invoke;
  v4[3] = &unk_24DDC4A50;
  v5 = CFSTR("SELECT profanity_locale FROM custom_responses_version");
  v6 = &v7;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v4);
  v2 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v2;
}

- (id)getModelVersion
{
  id v2;
  _QWORD v4[4];
  __CFString *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__590;
  v11 = __Block_byref_object_dispose__591;
  v12 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SGQuickResponsesStore_getModelVersion__block_invoke;
  v4[3] = &unk_24DDC4A50;
  v5 = CFSTR("SELECT current_version FROM custom_responses_version");
  v6 = &v7;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v4);
  v2 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v2;
}

- (void)setProfanityLocale:(id)a3 andModelVersion:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __CFString *v11;
  int64_t v12;
  _QWORD v13[4];
  __CFString *v14;

  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke;
  v13[3] = &unk_24DDC4B88;
  v14 = CFSTR("DELETE FROM custom_responses_version");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v13);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_2;
  v9[3] = &unk_24DDC4BD8;
  v10 = v6;
  v11 = CFSTR("INSERT INTO custom_responses_version (current_version, profanity_locale) VALUES($current_version, $profanity_locale)");
  v12 = a4;
  v8 = v6;
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v9);

}

- (BOOL)resetDbIfNeededCompareWithCompatibilityVersion:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  _QWORD v17[4];
  __CFString *v18;
  _QWORD v19[4];
  __CFString *v20;

  -[SGQuickResponsesStore getModelVersion](self, "getModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue") != a3;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    || (-[SGQuickResponsesStore getProfanityLocale](self, "getProfanityLocale"),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v11 = v10, v12 = objc_msgSend(v10, "isEqualToString:", v9), v11, (v12 & 1) == 0))
  {
    v15 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke;
    v19[3] = &unk_24DDC4B88;
    v20 = CFSTR("DELETE FROM custom_responses");
    -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v19);
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke_2;
    v17[3] = &unk_24DDC4B88;
    v18 = CFSTR("UPDATE messages SET filtering = false, filtered = false");
    -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v17);

    v13 = 1;
LABEL_10:
    -[SGQuickResponsesStore setProfanityLocale:andModelVersion:](self, "setProfanityLocale:andModelVersion:", v9, a3);
    v14 = v13;
    goto LABEL_11;
  }
  v13 = 0;
  v14 = 0;
  if (!v6)
    goto LABEL_10;
LABEL_11:

  return v14;
}

- (void)resetCustomResponsesAndResetMessages:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *, uint64_t);
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  const __CFString *v16;
  _QWORD v17[4];
  __CFString *v18;
  _QWORD v19[4];
  __CFString *v20;

  v3 = a3;
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke;
  v19[3] = &unk_24DDC4B88;
  v20 = CFSTR("DELETE FROM custom_responses");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v19);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_2;
  v17[3] = &unk_24DDC4B88;
  v18 = CFSTR("DELETE FROM custom_responses_version");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v17);
  if (v3)
  {
    v12 = v5;
    v13 = 3221225472;
    v14 = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_3;
    v15 = &unk_24DDC4B88;
    v16 = CFSTR("DELETE FROM messages");
    v6 = &v12;
  }
  else
  {
    v7 = v5;
    v8 = 3221225472;
    v9 = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_4;
    v10 = &unk_24DDC4B88;
    v11 = CFSTR("UPDATE messages SET filtering = false, filtered = false");
    v6 = &v7;
  }
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);

}

- (void)resetCustomResponsesForEval:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  _QWORD v8[4];
  __CFString *v9;
  uint64_t v10;
  _QWORD v11[4];
  __CFString *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[SGQuickResponsesStore resetCustomResponsesAndResetMessages:](self, "resetCustomResponsesAndResetMessages:", 0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke;
  v11[3] = &unk_24DDC4A50;
  v12 = CFSTR("SELECT COUNT(*) as n FROM messages");
  v13 = &v14;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v11);
  v6 = v15[3];
  objc_msgSend(v4, "doubleValue");
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_3;
  v8[3] = &unk_24DDC4A28;
  v9 = CFSTR("UPDATE messages SET filtered = true ORDER BY sent_at DESC LIMIT $evalCount");
  v10 = (uint64_t)(v7 * (double)v6);
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v8);

  _Block_object_dispose(&v14, 8);
}

- (id)messagesForEval:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v9;
  __CFString *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[4];
  __CFString *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke;
  v17[3] = &unk_24DDC4A50;
  v18 = CFSTR("SELECT COUNT(*) as n FROM messages");
  v19 = &v20;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v17);
  v7 = v21[3];
  objc_msgSend(v4, "doubleValue");
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_3;
  v13[3] = &unk_24DDC4BD8;
  v16 = (uint64_t)(v8 * (double)v7);
  v9 = v5;
  v14 = v9;
  v15 = CFSTR("SELECT prompt, reply FROM messages ORDER BY sent_at DESC LIMIT $evalCount");
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v13);
  v10 = (__CFString *)v15;
  v11 = v9;

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void)recordMessagesInBatchAsCustomResponsesWithEmbedder:(id)a3 compatibilityVersion:(unint64_t)a4
{
  id v6;
  _QWORD v7[4];
  __CFString *v8;
  SGQuickResponsesStore *v9;
  __CFString *v10;
  id v11;

  v6 = a3;
  if (!-[SGQuickResponsesStore resetDbIfNeededCompareWithCompatibilityVersion:](self, "resetDbIfNeededCompareWithCompatibilityVersion:", a4))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke;
    v7[3] = &unk_24DDC4A78;
    v8 = CFSTR("SELECT rowid, reply, language, prompt, sent_at, recipient FROM messages WHERE filtering AND NOT filtered");
    v9 = self;
    v10 = CFSTR("SELECT prompt_embedding FROM custom_responses WHERE reply=$reply AND language=$language");
    v11 = v6;
    -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v7);

  }
}

- (void)calculateUsageSpreads
{
  _QWORD v2[4];
  __CFString *v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__SGQuickResponsesStore_calculateUsageSpreads__block_invoke;
  v2[3] = &unk_24DDC4B88;
  v3 = CFSTR("UPDATE custom_responses SET usage_spread = (SELECT CAST(u AS FLOAT)/c FROM    (SELECT count(distinct(recipient)) AS u FROM messages WHERE messages.reply=custom_responses.reply AND messages.language=custom_responses.language),    (SELECT count(distinct(recipient)) AS c FROM messages))");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v2);

}

- (void)prunePerRecipientTableWithMaxRows:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t j;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  SEL v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v48;
  _QWORD v49[5];
  __CFString *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  __CFString *v62;
  _QWORD v63[4];
  __CFString *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke;
  v63[3] = &unk_24DDC4A50;
  v64 = CFSTR("SELECT COUNT(ROWID) as n FROM cr_per_recipient_counts");
  v65 = &v66;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v63);
  if (v67[3] > a3)
  {
    v42 = a2;
    v5 = (void *)objc_opt_new();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_3;
    v60[3] = &unk_24DDC4B60;
    v6 = v5;
    v61 = v6;
    v62 = CFSTR("SELECT reply, language, COUNT(ROWID) as n FROM cr_per_recipient_counts GROUP BY reply, language");
    -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v60);
    v46 = (void *)objc_msgSend(v6, "mutableCopy");
    v48 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v57 = 0u;
    v56 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v57 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x24BE7A648];
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "tupleWithFirst:second:", v11, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "addObject:", v14);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
      }
      while (v8);
    }

    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("second"), 0);
    v71 = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "sortUsingDescriptors:", v15);

    v16 = v67[3];
    v44 = objc_msgSend(v48, "count");
    v17 = v16 - a3;
    if (v16 != a3)
    {
      for (j = v44; ; j = v44)
      {
        if (j < 2)
        {
          v20 = 0;
        }
        else
        {
          v19 = 1;
          do
          {
            v20 = v19 - 1;
            objc_msgSend(v48, "objectAtIndexedSubscript:", v19 - 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "first");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", v45);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "integerValue");
            objc_msgSend(v48, "objectAtIndexedSubscript:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "first");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v23) = v23 == objc_msgSend(v26, "integerValue");

            if ((v23 & 1) == 0)
              goto LABEL_17;
            ++v19;
          }
          while (v44 != v19);
          v20 = v44 - 1;
        }
LABEL_17:
        while ((v20 & 0x80000000) == 0)
        {
          objc_msgSend(v48, "objectAtIndexedSubscript:", v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "first");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v42, self, CFSTR("SGQuickResponsesStore.m"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("k"));

          }
          v29 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v46, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "integerValue") - 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v31, v28);

          --v20;
          if (!--v17)
            goto LABEL_23;
        }
      }
    }
LABEL_23:
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v33 = v46;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v33);
          v37 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
          objc_msgSend(v7, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "integerValue");
          objc_msgSend(v33, "objectForKeyedSubscript:", v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "integerValue");

          if (v39 - v41 >= 1)
          {
            v49[0] = MEMORY[0x24BDAC760];
            v49[1] = 3221225472;
            v49[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_5;
            v49[3] = &unk_24DDC4BD8;
            v51 = v39 - v41;
            v49[4] = v37;
            v50 = CFSTR("DELETE FROM cr_per_recipient_counts WHERE reply=$reply AND language=$language ORDER BY decayed_times_used ASC LIMIT $n_rows ");
            -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v49);

          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
      }
      while (v34);
    }

  }
  _Block_object_dispose(&v66, 8);
}

- (id)nearestCustomResponsesAndScoresToPromptEmbedding:(id)a3 recipient:(id)a4 limit:(unint64_t)a5 withinRadius:(float)a6 responseCountExponent:(float)a7 minimumDecayedCount:(float)a8 compatibilityVersion:(unint64_t)a9 language:(id)a10 locale:(id)a11 allowProfanity:(BOOL)a12 minimumTimeInterval:(double)a13 usageSpreadExponent:(float)a14
{
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  NSObject *v61;
  NSObject *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  BOOL v71;
  NSObject *v72;
  NSObject *v73;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  unint64_t v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  SGQuickResponsesStore *v92;
  id v93;
  __CFString *v94;
  double v95;
  float v96;
  float v97;
  float v98;
  float v99;
  uint8_t buf[8];
  id v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v26 = a4;
  v27 = a10;
  v83 = a11;
  -[SGQuickResponsesStore getModelVersion](self, "getModelVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "integerValue");

  v81 = v27;
  if (v29 == a9)
  {
    v82 = a5;
    v80 = v26;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79AB8]), "initWithNumbers:", v25);
    v31 = (void *)objc_opt_new();
    sgLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_signpost_id_generate(v32);

    sgLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SelectCustomResponseRows", (const char *)&unk_21AC29AE5, buf, 2u);
    }

    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke;
    v88[3] = &unk_24DDC4CA0;
    v89 = v27;
    v96 = a8;
    v95 = a13;
    v36 = v30;
    v90 = v36;
    v91 = v26;
    v92 = self;
    v97 = a14;
    v98 = a7;
    v99 = a6;
    v79 = v31;
    v93 = v79;
    v94 = CFSTR("SELECT reply, prompt_embedding, decayed_times_used, usage_spread FROM custom_responses WHERE language = $language   AND decayed_times_used >= $minimum_decayed_count   AND last_seen - first_seen >= $minimum_time_interval");
    -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v88);
    sgLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v38, OS_SIGNPOST_INTERVAL_END, v33, "SelectCustomResponseRows", (const char *)&unk_21AC29AE5, buf, 2u);
    }

    sgLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_signpost_id_generate(v39);

    sgLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "SortCustomResponses", (const char *)&unk_21AC29AE5, buf, 2u);
    }
    v77 = v36;

    v43 = v79;
    objc_msgSend(v79, "sortUsingComparator:", &__block_literal_global_161);
    sgLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v45, OS_SIGNPOST_INTERVAL_END, v40, "SortCustomResponses", (const char *)&unk_21AC29AE5, buf, 2u);
    }

    sgLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_signpost_id_generate(v46);

    sgLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "DedupeCustomResponses", (const char *)&unk_21AC29AE5, buf, 2u);
    }

    +[SGDeduperML bucketerWithMapping:](SGDeduperML, "bucketerWithMapping:", &__block_literal_global_165);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDeduperML dedupe:bucketer:resolver:](SGDeduperML, "dedupe:bucketer:resolver:", v79, v50, &__block_literal_global_169);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v52, OS_SIGNPOST_INTERVAL_END, v47, "DedupeCustomResponses", (const char *)&unk_21AC29AE5, buf, 2u);
    }

    -[SGQuickResponsesStore getProfanityLocale](self, "getProfanityLocale");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (!v83 || a12 || (objc_msgSend(v53, "isEqualToString:", v83) & 1) != 0)
    {
      v55 = v78;
      v56 = v77;
      if (objc_msgSend(v78, "count") <= v82)
      {
        v57 = v78;
      }
      else
      {
        objc_msgSend(v78, "subarrayWithRange:", 0, v82);
        v57 = (id)objc_claimAutoreleasedReturnValue();
      }
      v58 = v57;
    }
    else
    {
      v75 = v54;
      v76 = v25;
      sgLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = os_signpost_id_generate(v59);

      sgLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABF4000, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "RemoveProfaneCustomResponses", (const char *)&unk_21AC29AE5, buf, 2u);
      }

      v58 = (void *)objc_opt_new();
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v63 = v78;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v85;
LABEL_33:
        v67 = 0;
        while (1)
        {
          if (*(_QWORD *)v85 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v67);
          objc_msgSend(v68, "first");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v83;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = +[SGQuickResponsesStore isProfane:inLocales:](SGQuickResponsesStore, "isProfane:inLocales:", v69, v70);

          if (!v71)
          {
            objc_msgSend(v58, "addObject:", v68);
            if (objc_msgSend(v58, "count") == v82)
              break;
          }
          if (v65 == ++v67)
          {
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
            if (v65)
              goto LABEL_33;
            break;
          }
        }
      }

      sgLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABF4000, v73, OS_SIGNPOST_INTERVAL_END, v60, "RemoveProfaneCustomResponses", (const char *)&unk_21AC29AE5, buf, 2u);
      }

      v25 = v76;
      v56 = v77;
      v43 = v79;
      v26 = v80;
      v55 = v78;
      v54 = v75;
    }

  }
  else
  {
    v58 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v58;
}

- (id)nearestCustomResponsesToPromptEmbedding:(id)a3 recipient:(id)a4 limit:(unint64_t)a5 withinRadius:(float)a6 responseCountExponent:(float)a7 minimumDecayedCount:(float)a8 compatibilityVersion:(unint64_t)a9 language:(id)a10 locale:(id)a11 allowProfanity:(BOOL)a12 minimumTimeInterval:(double)a13 usageSpreadExponent:(float)a14
{
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v23) = a12;
  -[SGQuickResponsesStore nearestCustomResponsesAndScoresToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:](self, "nearestCustomResponsesAndScoresToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:", a3, a4, a5, a9, a10, a11, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "first");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  return v15;
}

- (void)decayAllCustomResponsesWithDecayFactor:(double)a3 filteringBatchSize:(unint64_t)a4
{
  long double v5;
  uint64_t v6;
  _QWORD v7[4];
  __CFString *v8;
  long double v9;
  _QWORD v10[4];
  __CFString *v11;
  __CFString *v12;
  long double v13;

  v5 = pow(a3, (double)a4);
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke;
  v10[3] = &unk_24DDC4BD8;
  v13 = v5;
  v11 = CFSTR("UPDATE custom_responses SET prompt_embedding = $prompt_embedding, decayed_times_used = decayed_times_used * $decay_factor WHERE rowid = $rowid");
  v12 = CFSTR("SELECT rowid, prompt_embedding from custom_responses");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v10);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_4;
  v7[3] = &unk_24DDC4A28;
  v9 = v5;
  v8 = CFSTR("UPDATE cr_per_recipient_counts SET decayed_times_used = decayed_times_used * $decay_factor");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v7);

}

- (unint64_t)countCustomResponsesAfterPruningWithMinimumCountThreshold:(double)a3
{
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[4];
  __CFString *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  __CFString *v15;
  double v16;

  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke;
  v14[3] = &unk_24DDC4A28;
  v16 = a3;
  v15 = CFSTR("DELETE FROM custom_responses WHERE decayed_times_used < $threshold");
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v14);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_3;
  v7[3] = &unk_24DDC4A50;
  v8 = CFSTR("SELECT COUNT(ROWID) as c from custom_responses");
  v9 = &v10;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (unint64_t)countCustomResponsesAfterTruncatingTable:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[4];
  __CFString *v9;
  uint64_t *v10;
  _QWORD v11[4];
  __CFString *v12;
  unint64_t v13;
  _QWORD v14[4];
  __CFString *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke;
  v14[3] = &unk_24DDC4A50;
  v15 = CFSTR("SELECT COUNT(ROWID) as c from custom_responses");
  v16 = &v17;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v14);
  v6 = v18[3];
  if (v6 > a3)
  {
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_3;
    v11[3] = &unk_24DDC4A28;
    v12 = CFSTR("DELETE FROM custom_responses ORDER BY decayed_times_used ASC LIMIT $table_limit");
    v13 = v6 - a3;
    if (-[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v11))
    {
      v18[3] = a3;
    }
    else
    {
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_5;
      v8[3] = &unk_24DDC4A50;
      v9 = CFSTR("SELECT COUNT(ROWID) as c from custom_responses");
      v10 = &v17;
      -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v8);

    }
    v6 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (BOOL)deltaForResponsesOnRow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke;
  v11[3] = &unk_24DDC4E00;
  v16 = v6;
  v17 = v7;
  v12 = CFSTR("SELECT t1.lang_response AS lang_response        ,CASE            WHEN t2.displayed IS NULL THEN t1.displayed            ELSE t1.displayed - t2.displayed         END AS displayed        ,CASE            WHEN t2.selected IS NULL THEN t1.selected            ELSE t1.selected - t2.selected         END AS selected        ,CASE            WHEN t2.matched IS NULL THEN t1.matched            ELSE t1.matched - t2.matched         END AS matched FROM responses t1 LEFT JOIN responses_snapshot t2     ON t1.lang_response = t2.lang_response ORDER BY RANDOM() ");
  v13 = CFSTR("DROP TABLE responses_snapshot");
  v14 = CFSTR("CREATE TABLE responses_snapshot AS     SELECT *     FROM responses ");
  v15 = CFSTR("CREATE INDEX idx_responses_snapshot_lang_response ON responses_snapshot (lang_response)");
  v8 = v7;
  v9 = v6;
  LOBYTE(self) = -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v11);

  return (char)self;
}

- (void)destroyInstanceInMemory
{
  _PASLock *readerWriter;
  _QWORD v3[6];

  readerWriter = self->_readerWriter;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SGQuickResponsesStore_destroyInstanceInMemory__block_invoke;
  v3[3] = &unk_24DDC4E28;
  v3[4] = self;
  v3[5] = a2;
  -[_PASLock runWithLockAcquired:](readerWriter, "runWithLockAcquired:", v3);
}

- (double)getPerRecipientCountForReply:(id)a3 language:(id)a4 recipient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  __CFString *v20;
  uint64_t *v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke;
  v16[3] = &unk_24DDC4E50;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = CFSTR("SELECT decayed_times_used FROM cr_per_recipient_counts WHERE reply=$reply AND language=$language AND recipient=$recipient");
  v21 = &v22;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v16);
  v14 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (double)getUsageSpreadForReply:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  _QWORD v12[4];
  id v13;
  id v14;
  __CFString *v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  unint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0xBFF0000000000000;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke;
  v12[3] = &unk_24DDC4E78;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = CFSTR("SELECT usage_spread FROM custom_responses WHERE reply=$reply AND language=$language");
  v16 = &v17;
  -[SGQuickResponsesStore frailReadTransaction:](self, "frailReadTransaction:", v12);
  v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerWriter, 0);
}

void __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = MEMORY[0x24BDAC760];
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_2;
  v9[3] = &unk_24DDC48F0;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_3;
  v8[3] = &unk_24DDC4858;
  v8[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v7, v9, v8, a3);

}

void __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 40));

}

uint64_t __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumnAlias:", "usage_spread");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x24BE7A6B0];
}

void __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = MEMORY[0x24BDAC760];
  v7 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_2;
  v9[3] = &unk_24DDC4990;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_3;
  v8[3] = &unk_24DDC4858;
  v8[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v7, v9, v8, a3);

}

void __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$recipient", a1[6]);

}

uint64_t __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumnAlias:", "decayed_times_used");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x24BE7A6B0];
}

void __48__SGQuickResponsesStore_destroyInstanceInMemory__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "getObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInMemory");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGQuickResponsesStore.m"), 1237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flakyDatabaseHandle.getObject.db.isInMemory"));

  }
  objc_msgSend(v3, "destroyCachedObject");
  objc_msgSend(v3, "peekAtCachedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGQuickResponsesStore.m"), 1239, CFSTR("SGQuickResponsesStore failed to destroy instance in memory."));

  }
}

void __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a2;
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__590;
  v22 = __Block_byref_object_dispose__591;
  v23 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke_2;
  v15 = &unk_24DDC4DD8;
  v16 = *(id *)(a1 + 64);
  v17 = &v18;
  LOBYTE(v7) = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, &v12, v6);

  if ((v7 & 1) != 0)
  {
    if (v19[5])
    {
      v6[2](v6);
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 72);
      if (v10
        && ((*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 16))(v10, 0, v8, v9),
            (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        ((void (*)(void (**)(_QWORD), void *))v6[2])(v6, v11);

      }
      else if (objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 40), 0, 0, v6, v12, v13, v14, v15)&& objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 48), 0, 0, v6))
      {
        objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 56), 0, 0, v6);
      }
    }
  }
  _Block_object_dispose(&v18, 8);

}

uint64_t __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  SGQuickResponsesEngagementDeltas *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id obj;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getNSStringForColumnAlias:", "lang_response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "getInt64ForColumnAlias:", "displayed");
    if (v6 != (int)v6)
    {
      sgLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v6;
        _os_log_fault_impl(&dword_21ABF4000, v7, OS_LOG_TYPE_FAULT, "SGQuickResponsesEngagementDeltas displayed value %lld is out of range for int32_t, casting to boundary value", buf, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        goto LABEL_27;
      v6 = (v6 >> 63) ^ 0x7FFFFFFF;
    }
    v8 = objc_msgSend(v4, "getInt64ForColumnAlias:", "selected");
    if (v8 != (int)v8)
    {
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v8;
        _os_log_fault_impl(&dword_21ABF4000, v9, OS_LOG_TYPE_FAULT, "SGQuickResponsesEngagementDeltas selected value %lld is out of range for int32_t, casting to boundary value", buf, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        goto LABEL_27;
      v8 = (v8 >> 63) ^ 0x7FFFFFFF;
    }
    v10 = objc_msgSend(v4, "getInt64ForColumnAlias:", "matched");
    if (v10 == (int)v10)
    {
LABEL_17:
      if (v5)
      {
        v12 = -[SGQuickResponsesEngagementDeltas initWithLangResponse:displayed:selected:matched:]([SGQuickResponsesEngagementDeltas alloc], "initWithLangResponse:displayed:selected:matched:", v5, v6, v8, v10);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        obj = *(id *)(v13 + 40);
        v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        objc_storeStrong((id *)(v13 + 40), obj);

      }
      else
      {
        sgLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_21ABF4000, v16, OS_LOG_TYPE_ERROR, "Language in deltaForResponsesOnRow was null, continuing to iterate as best effort", buf, 2u);
        }

        v14 = *MEMORY[0x24BE7A6A8];
      }

      goto LABEL_26;
    }
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v10;
      _os_log_fault_impl(&dword_21ABF4000, v11, OS_LOG_TYPE_FAULT, "SGQuickResponsesEngagementDeltas matched value %lld is out of range for int32_t, casting to boundary value", buf, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v10 = (v10 >> 63) ^ 0x7FFFFFFF;
      goto LABEL_17;
    }
LABEL_27:
    abort();
  }
  sgLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21ABF4000, v15, OS_LOG_TYPE_ERROR, "Row returned in deltaForResponsesOnRow was null, continuing to iterate as best effort", buf, 2u);
  }

  v14 = *MEMORY[0x24BE7A6A8];
LABEL_26:

  return v14;
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_2;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_4;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_6;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_6(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumnAlias:", "c");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$table_limit", *(_QWORD *)(a1 + 32));
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumnAlias:", "c");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_4;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_4(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumnAlias:", "c");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", "$threshold", *(double *)(a1 + 32));
}

void __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_2;
  v10[3] = &unk_24DDC4DB0;
  v14 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, v10, v8);

}

uint64_t __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_5;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

uint64_t __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", "$decay_factor", *(double *)(a1 + 32));
}

uint64_t __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unsigned __int8 *v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnAlias:", "rowid");
  v5 = objc_alloc(MEMORY[0x24BE79AD8]);
  objc_msgSend(v3, "getNSDataForColumnAlias:", "prompt_embedding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = (void *)objc_msgSend(v5, "initWithData:", v7);

  v9 = *(double *)(a1 + 56);
  *(float *)&v9 = v9;
  objc_msgSend(v8, "scaleInPlaceWithFactor:", v9);
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_3;
  v16[3] = &unk_24DDC4D88;
  v18 = *(_QWORD *)(a1 + 56);
  v17 = v8;
  v19 = v4;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v11, v16, 0, v12);
  v14 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];

  return *v14;
}

void __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  id v5;

  v3 = *(double *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toDouble:", "$decay_factor", v3);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSData:", "$prompt_embedding", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", "$rowid", *(_QWORD *)(a1 + 48));
}

void __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  int v21;

  v6 = MEMORY[0x24BDAC760];
  v7 = *(_QWORD *)(a1 + 72);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_2;
  v18[3] = &unk_24DDC4C50;
  v19 = *(id *)(a1 + 32);
  v21 = *(_DWORD *)(a1 + 88);
  v20 = *(_QWORD *)(a1 + 80);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_3;
  v10[3] = &unk_24DDC4C78;
  v11 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v16 = *(_DWORD *)(a1 + 92);
  v9 = *(_QWORD *)(a1 + 56);
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 96);
  v15 = *(id *)(a1 + 64);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v7, v18, v10, a3);

}

id __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_2_167(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_163(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "first");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesInference normalizeStringForDeduping:](SGQuickResponsesInference, "normalizeStringForDeduping:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", "$minimum_decayed_count", *(float *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toDouble:", "$minimum_time_interval", *(double *)(a1 + 40));

}

uint64_t __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  long double v25;
  double v26;
  NSObject *v27;
  const char *v28;
  float v29;
  float v30;
  NSObject *v31;
  NSObject *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v43) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SingleCustomResponseRow", (const char *)&unk_21AC29AE5, (uint8_t *)&v43, 2u);
  }

  objc_msgSend(v3, "getNSStringForColumnAlias:", "reply");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    LOWORD(v43) = 0;
    v28 = "SGQuickResponsesStore: Unexpected null value for custom_responses.reply";
    goto LABEL_33;
  }
  objc_msgSend(v3, "getDoubleForColumnAlias:", "decayed_times_used");
  v10 = v9;
  objc_msgSend(v3, "getNSDataForColumnAlias:", "prompt_embedding");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    LOWORD(v43) = 0;
    v28 = "SGQuickResponsesStore: Unexpected null value for custom_responses.prompt_embedding";
LABEL_33:
    _os_log_fault_impl(&dword_21ABF4000, v27, OS_LOG_TYPE_FAULT, v28, (uint8_t *)&v43, 2u);
LABEL_16:

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v13 = 0;
      v12 = 0;
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  v12 = (void *)v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79AD8]), "initWithData:", v11);
  *(float *)&v14 = v10;
  objc_msgSend(v13, "scaleInPlaceWithInversedFactor:", v14);
  v15 = objc_msgSend(v13, "count");
  v16 = objc_msgSend(*(id *)(a1 + 32), "count");
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15 == v16)
  {
    v19 = os_signpost_id_generate(v17);

    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v43) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ComputeCustomResponseDistance", (const char *)&unk_21AC29AE5, (uint8_t *)&v43, 2u);
    }

    v22 = 0.0;
    if (*(_QWORD *)(a1 + 40))
    {
      v23 = 1.0;
      if (*(float *)(a1 + 72) > 0.0)
      {
        objc_msgSend(v3, "getDoubleForColumnAlias:", "usage_spread");
        v25 = v24;
        objc_msgSend(*(id *)(a1 + 48), "getPerRecipientCountForReply:language:recipient:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
        v22 = v26;
        v23 = pow(v25, *(float *)(a1 + 72));
      }
    }
    else
    {
      v23 = 1.0;
    }
    objc_msgSend(v13, "cosineDistanceFrom:", *(_QWORD *)(a1 + 32));
    v30 = v29 / pow(v22 * (1.0 - v23) + v23 * v10, *(float *)(a1 + 76));
    sgLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(v43) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v32, OS_SIGNPOST_INTERVAL_END, v19, "ComputeCustomResponseDistance", (const char *)&unk_21AC29AE5, (uint8_t *)&v43, 2u);
    }

    if (*(float *)(a1 + 80) > v30)
    {
      v34 = *(void **)(a1 + 64);
      v35 = (void *)MEMORY[0x24BE7A648];
      *(float *)&v33 = v30;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "tupleWithFirst:second:", v8, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v37);

    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    v41 = objc_msgSend(v13, "count");
    v42 = objc_msgSend(*(id *)(a1 + 32), "count");
    v43 = 134218240;
    v44 = v41;
    v45 = 2048;
    v46 = v42;
    _os_log_fault_impl(&dword_21ABF4000, v18, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: mis-matched dimensions (a possible plist error) between embedding and densePromptEmbedding in store: %tu v,s. %tu", (uint8_t *)&v43, 0x16u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
LABEL_21:
    abort();
LABEL_28:
  sgLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    LOWORD(v43) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v39, OS_SIGNPOST_INTERVAL_END, v5, "SingleCustomResponseRow", (const char *)&unk_21AC29AE5, (uint8_t *)&v43, 2u);
  }

  return *MEMORY[0x24BE7A6A8];
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_2;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

void __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_4;
  v6[3] = &unk_24DDC4C00;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, v6, a3);

}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_5(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_6;
  v7[3] = &unk_24DDC4BB0;
  v4 = a1[5];
  v5 = a1[6];
  v7[4] = a1[4];
  v7[5] = v5;
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v7, 0, a3);
}

void __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", "$reply", v4);

  objc_msgSend(*(id *)(a1 + 32), "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", "$language", v5);

  objc_msgSend(v6, "bindNamedParam:toInt64:", "$n_rows", *(_QWORD *)(a1 + 40));
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "reply");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "getInt64ForColumnAlias:", "n");

  objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  v9 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];
  return *v9;
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "n");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __46__SGQuickResponsesStore_calculateUsageSpreads__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

void __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_2;
  v11[3] = &unk_24DDC4C28;
  v14 = *(id *)(a1 + 56);
  v8 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, v11, v9);

}

uint64_t __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnAlias:", "rowid");
  objc_msgSend(v3, "getNSStringForColumnAlias:", "reply");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "prompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnAlias:", "sent_at");
  if (v7 && v6 && *(_QWORD *)(a1 + 56) && v5)
  {
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "embeddingForPrompt:language:embedder:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__590;
      v29 = __Block_byref_object_dispose__591;
      v30 = 0;
      v12 = *(_QWORD *)(a1 + 48);
      v20 = *(void **)(a1 + 40);
      v13 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_3;
      v22[3] = &unk_24DDC48F0;
      v19 = v5;
      v23 = v19;
      v18 = v6;
      v24 = v18;
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_4;
      v21[3] = &unk_24DDC4858;
      v21[4] = &v25;
      objc_msgSend(v20, "prepAndRunQuery:onPrep:onRow:onError:", v12, v22, v21, *(_QWORD *)(a1 + 64));
      if (v26[5])
      {
        v14 = objc_alloc(MEMORY[0x24BE79AD8]);
        v15 = (void *)objc_msgSend(v14, "initWithData:", v26[5]);
        objc_msgSend(v15, "sumInPlaceWithVector:", v11);
        objc_msgSend(*(id *)(a1 + 32), "_incrementCustomResponseInDb:reply:language:embedding:sentAt:recipient:messagesRowId:onError:", *(_QWORD *)(a1 + 40), v19, v18, v15, v8, v4, v10, *(_QWORD *)(a1 + 64));

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_addCustomResponseToDb:reply:language:embedding:sentAt:recipient:messagesRowId:onError:", *(_QWORD *)(a1 + 40), v19, v18, v11, v8, v4, v10, *(_QWORD *)(a1 + 64));
      }
      v16 = *MEMORY[0x24BE7A6A8];

      _Block_object_dispose(&v25, 8);
    }
    else
    {
      v16 = *MEMORY[0x24BE7A6B0];
    }

  }
  else
  {
    v16 = *MEMORY[0x24BE7A6A8];
  }

  return v16;
}

void __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 40));

}

uint64_t __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumnAlias:", "prompt_embedding");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x24BE7A6A8];
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_2;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

void __41__SGQuickResponsesStore_messagesForEval___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_4;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v5 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_5;
  v6[3] = &unk_24DDC4C00;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v5, v8, v6, a3);

}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$evalCount", *(_QWORD *)(a1 + 32));
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "reply");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  v8 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];
  return *v8;
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "n");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_2;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_4;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$evalCount", *(_QWORD *)(a1 + 32));
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "n");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

uint64_t __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

uint64_t __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

uint64_t __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, a3);
}

void __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_3;
  v6[3] = &unk_24DDC4BB0;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v5, v6, 0, a3);

}

void __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", "$current_version", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$profanity_locale", *(_QWORD *)(a1 + 32));

}

uint64_t __40__SGQuickResponsesStore_getModelVersion__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SGQuickResponsesStore_getModelVersion__block_invoke_2;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __40__SGQuickResponsesStore_getModelVersion__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumnAlias:", "current_version"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __43__SGQuickResponsesStore_getProfanityLocale__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SGQuickResponsesStore_getProfanityLocale__block_invoke_2;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __43__SGQuickResponsesStore_getProfanityLocale__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "profanity_locale");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2;
  v6[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v7 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

void __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_4;
  v9[3] = &unk_24DDC4B10;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v6, 0, v9, a3);

}

uint64_t __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_107(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2_108;
  v6[3] = &unk_24DDC4830;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

void __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2_108(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", "$row_id", objc_msgSend(v2, "integerValue"));

}

uint64_t __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "reply");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_21ABF4000, v5, OS_LOG_TYPE_FAULT, "SGQuickreponsesStore: Unexpected null value for custom_responses.reply", v12, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  v6 = objc_msgSend(v3, "getInt64ForColumnAlias:", "rowid");
  v13[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SGQuickResponsesStore isProfane:inLocales:](SGQuickResponsesStore, "isProfane:inLocales:", v4, v7);

  if (v8)
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  return *MEMORY[0x24BE7A6A8];
}

void __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", "$recipients", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", "$replies", *(_QWORD *)(a1 + 40));

}

void __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v9 = a2;
  v5 = a3;
  v6 = a1[4];
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_2;
  v11[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v11[4] = a1[7];
  if (objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v6, v11, 0, v5))
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_3;
    v10[3] = &unk_24DDC4858;
    v8 = a1[5];
    v10[4] = a1[6];
    objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, v10, v5);
  }

}

uint64_t __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$limit", *(_QWORD *)(a1 + 32));
}

uint64_t __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x24BE7A6B0];
}

void __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke_2;
  v10[3] = &unk_24DDC4C28;
  v10[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, v10, v8);

}

uint64_t __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  uint64_t v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "getNSStringForColumnAlias:", "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "getNSStringForColumnAlias:", "reply");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "getNSStringForColumnAlias:", "prompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "getInt64ForColumnAlias:", "rowid");
      objc_msgSend(v3, "getDoubleForColumnAlias:", "sent_at");
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 32), "embeddingForPrompt:language:embedder:", v7, v4, *(_QWORD *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v16 = *MEMORY[0x24BE7A6B0];
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v6, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_7;
      v21 = v8;
      objc_msgSend(v3, "getNSDataForColumnAlias:", "prompt_embedding");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79AD8]), "initWithData:", v14);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v12);

        v8 = v21;
LABEL_7:
        objc_msgSend(v13, "sumInPlaceWithVector:", v11);
        objc_msgSend(*(id *)(a1 + 32), "_incrementCustomResponseInDb:reply:language:embedding:sentAt:recipient:messagesRowId:onError:", *(_QWORD *)(a1 + 48), v6, v4, v13, v5, v8, v10, *(_QWORD *)(a1 + 64));
        v16 = *MEMORY[0x24BE7A6A8];

LABEL_8:
LABEL_18:

        goto LABEL_19;
      }
      sgLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_fault_impl(&dword_21ABF4000, v20, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: Unexpected null value for custom_responses.prompt_embedding", v22, 2u);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v16 = *MEMORY[0x24BE7A6A8];
        goto LABEL_8;
      }
    }
    else
    {
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_fault_impl(&dword_21ABF4000, v18, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: Unexpected null value for custom_responses.recipient", v23, 2u);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v16 = *MEMORY[0x24BE7A6A8];
LABEL_19:

        goto LABEL_20;
      }
    }
LABEL_25:
    abort();
  }
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_21ABF4000, v17, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: Unexpected null value for custom_responses.language", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_25;
  v16 = *MEMORY[0x24BE7A6A8];
LABEL_20:

  return v16;
}

void __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_2;
  v7[3] = &unk_24DDC49D8;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 72);
  objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v6, v7, 0, a3);

}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_4;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v6, 0, a3);
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_6;
  v6[3] = &unk_24DDC4858;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, a3);
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_6(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "c");
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$table_limit", *(_QWORD *)(a1 + 32));
}

void __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$prompt", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$recipient", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "bindNamedParam:toDouble:", "$sent_at", *(double *)(a1 + 64));

}

void __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSData:", "$prompt_embedding", v4);

  objc_msgSend(v5, "bindNamedParam:toDouble:", "$sent_at", *(double *)(a1 + 56));
}

void __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$recipient", a1[6]);

}

uint64_t __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$row_id", *(_QWORD *)(a1 + 32));
}

void __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v5, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSData:", "$prompt_embedding", v4);

  objc_msgSend(v5, "bindNamedParam:toDouble:", "$sent_at", *(double *)(a1 + 56));
}

void __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$reply", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", a1[5]);
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$recipient", a1[6]);

}

uint64_t __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", "$row_id", *(_QWORD *)(a1 + 32));
}

void __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a2;
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_5;
  +[SGQuickResponsesStore keyWithLanguage:andResponse:](SGQuickResponsesStore, "keyWithLanguage:andResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_2;
  v15[3] = &unk_24DDC4830;
  v16 = v7;
  v9 = v7;
  LODWORD(v8) = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v8, v15, 0, v5);

  if ((_DWORD)v8)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v10 = (uint64_t *)(a1 + 56);
LABEL_6:
      v11 = *v10;
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_3;
      v13[3] = &unk_24DDC4830;
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v11, v13, 0, v5);

      goto LABEL_7;
    }
LABEL_5:
    v10 = (uint64_t *)(a1 + 64);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$lang_response", *(_QWORD *)(a1 + 32));
}

uint64_t __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 32));
}

void __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v11 = a2;
  v5 = a3;
  +[SGQuickResponsesStore keyWithLanguage:andResponse:](SGQuickResponsesStore, "keyWithLanguage:andResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_2;
  v14[3] = &unk_24DDC4830;
  v9 = v6;
  v15 = v9;
  LODWORD(v7) = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", v7, v14, 0, v5);

  if ((_DWORD)v7)
  {
    v10 = *(_QWORD *)(a1 + 56);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_3;
    v12[3] = &unk_24DDC4830;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", v10, v12, 0, v5);

  }
}

uint64_t __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$lang_response", *(_QWORD *)(a1 + 32));
}

uint64_t __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 32));
}

void __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v7);
      +[SGQuickResponsesStore keyWithLanguage:andResponse:](SGQuickResponsesStore, "keyWithLanguage:andResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_3;
      v19[3] = &unk_24DDC4830;
      v20 = v12;
      v14 = v12;
      LODWORD(v13) = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v13, v19, 0, v6);

      if (!(_DWORD)v13)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v15 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_4;
    v16[3] = &unk_24DDC48F0;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v15, v16, 0, v6);

    v7 = v17;
  }

}

uint64_t __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$lang_response", *(_QWORD *)(a1 + 32));
}

void __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", "$language", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", "$count", objc_msgSend(*(id *)(a1 + 40), "count"));

}

id __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", a2);
}

void __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  SGQuickResponsesReplyRecord *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  id obj;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = *(_QWORD *)v38;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10);
        v31 = 0;
        v32 = &v31;
        v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__590;
        v35 = __Block_byref_object_dispose__591;
        v36 = 0;
        +[SGQuickResponsesStore keyWithLanguage:andResponse:](SGQuickResponsesStore, "keyWithLanguage:andResponse:", *(_QWORD *)(a1 + 40), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 48);
        v29[0] = v8;
        v29[1] = 3221225472;
        v29[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_26;
        v29[3] = &unk_24DDC4830;
        v14 = v12;
        v30 = v14;
        v28[0] = v8;
        v28[1] = 3221225472;
        v28[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_2;
        v28[3] = &unk_24DDC4858;
        v28[4] = &v31;
        LOBYTE(v13) = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v13, v29, v28, v6);

        if ((v13 & 1) == 0)
        {

          _Block_object_dispose(&v31, 8);
          v20 = obj;
          goto LABEL_13;
        }
        v15 = v32[5];
        if (!v15)
        {
          v16 = -[SGQuickResponsesReplyRecord initWithDisplayed:selected:matched:]([SGQuickResponsesReplyRecord alloc], "initWithDisplayed:selected:matched:", 0.0, 0.0, 0.0);
          v17 = (void *)v32[5];
          v32[5] = (uint64_t)v16;

          v15 = v32[5];
        }
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);

        _Block_object_dispose(&v31, 8);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v7)
        continue;
      break;
    }
  }

  v18 = *(_QWORD *)(a1 + 64);
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_3;
  v26[3] = &unk_24DDC4830;
  v27 = *(id *)(a1 + 40);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_4;
  v22[3] = &unk_24DDC4880;
  v19 = *(_OWORD *)(a1 + 88);
  v23 = *(_OWORD *)(a1 + 72);
  v24 = v19;
  v25 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v18, v26, v22, v6);
  v20 = v27;
LABEL_13:

}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_26(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$lang_response", *(_QWORD *)(a1 + 32));
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SGQuickResponsesReplyRecord *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "displayed", 0);
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "selected", 0);
  v6 = objc_msgSend(v3, "getInt64ForColumnName:table:", "matched", 0);

  v7 = -[SGQuickResponsesReplyRecord initWithDisplayed:selected:matched:]([SGQuickResponsesReplyRecord alloc], "initWithDisplayed:selected:matched:", (double)v4, (double)v5, (double)v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", "$language", *(_QWORD *)(a1 + 32));
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumnName:table:", "opportunities", 0);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumnName:table:", "displayed", 0);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumnName:table:", "selected", 0);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumnName:table:", "matched", 0);
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "unmatched", 0);

  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
  return *MEMORY[0x24BE7A6B0];
}

id __62__SGQuickResponsesStore_recordsForResponsesInternal_language___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyTextInternal:](SGQuickResponsesReplies, "normalizeReplyTextInternal:", a2);
}

id __54__SGQuickResponsesStore_recordsForResponses_language___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", a2);
}

void __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v8 = a2;
  objc_msgSend(v8, "getObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_2;
    v9[3] = &unk_24DDC4780;
    v11 = *(id *)(a1 + 32);
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = v6;
    v12 = v7;
    objc_msgSend(v6, "frailWriteTransaction:", v9);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(v8, "destroyCachedObject");

  }
}

uint64_t __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, void *);
  void *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_3;
  v7 = &unk_24DDC4758;
  v8 = *(_QWORD *)(a1 + 48);
  (*(void (**)(void))(v2 + 16))();
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(a2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesStore write error: %@", (uint8_t *)&v6, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x24BE7A6B0];
}

void __46__SGQuickResponsesStore_frailReadTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v8 = a2;
  objc_msgSend(v8, "getObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_2;
    v9[3] = &unk_24DDC4780;
    v11 = *(id *)(a1 + 32);
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = v6;
    v12 = v7;
    objc_msgSend(v6, "frailReadTransaction:", v9);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(v8, "destroyCachedObject");

  }
}

uint64_t __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, void *);
  void *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_3;
  v7 = &unk_24DDC4758;
  v8 = *(_QWORD *)(a1 + 48);
  (*(void (**)(void))(v2 + 16))();
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(a2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesStore read error: %@", (uint8_t *)&v6, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x24BE7A6B0];
}

id __73__SGQuickResponsesStore_initInDirectory_inMemory_withMigration_forTools___block_invoke(uint64_t a1)
{
  return -[SGQuickResponsesDatabase initInDirectory:inMemory:withMigration:forTools:]([SGQuickResponsesDatabase alloc], "initInDirectory:inMemory:withMigration:forTools:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42));
}

void __73__SGQuickResponsesStore_initInDirectory_inMemory_withMigration_forTools___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closePermanently");

}

+ (void)warmup
{
  uint64_t v4;
  void *v5;
  id v6;

  +[SGQuickResponsesStore sharedInstance](SGQuickResponsesStore, "sharedInstance");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesStore.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

    v4 = 0;
  }
  objc_msgSend(*(id *)(v4 + 8), "runWithLockAcquired:", &__block_literal_global_754);

}

+ (SGQuickResponsesStore)sharedInstance
{
  if (sharedInstance__pasOnceToken3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_8);
  return (SGQuickResponsesStore *)(id)sharedInstance__pasExprOnceResult_752;
}

+ (id)instanceInMemory
{
  return -[SGQuickResponsesStore initInDirectory:inMemory:withMigration:]([SGQuickResponsesStore alloc], "initInDirectory:inMemory:withMigration:", 0, 1, 1);
}

+ (BOOL)isProfane:(id)a3 inLocales:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SGTokenizerML tokenize:](SGTokenizerML, "tokenize:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if (+[SGLexiconML profanityInTokens:forLocaleIdentifier:](SGLexiconML, "profanityInTokens:forLocaleIdentifier:", v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)keyWithLanguage:(id)a3 andResponse:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(CFSTR("|"), "length");
  v9 = v8 + v7 + objc_msgSend(v5, "length");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", v9);
  objc_msgSend(v10, "appendString:", v6);

  objc_msgSend(v10, "appendString:", CFSTR("|"));
  objc_msgSend(v10, "appendString:", v5);

  return v10;
}

void __39__SGQuickResponsesStore_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = -[SGQuickResponsesStore initInDirectory:inMemory:withMigration:]([SGQuickResponsesStore alloc], "initInDirectory:inMemory:withMigration:", 0, 0, 1);
  v2 = (void *)sharedInstance__pasExprOnceResult_752;
  sharedInstance__pasExprOnceResult_752 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __31__SGQuickResponsesStore_warmup__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend(a2, "getObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Quick Responses: failed to initialize database while warming up store", v4, 2u);
  }

}

@end
