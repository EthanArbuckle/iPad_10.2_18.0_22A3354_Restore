@implementation FBKContentItem

+ (id)unreadInboxPredicateWithTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_predicateForSurveysWithTeam:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  +[FBKContentItem needsActionPredicate](FBKContentItem, "needsActionPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v21);
  objc_msgSend(a1, "_predicateForAnnouncementsWithTeam:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  +[FBKContentItem needsActionPredicate](FBKContentItem, "needsActionPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v10);
  objc_msgSend(a1, "_predicateForFeedbackInInboxWithTeam:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  +[FBKContentItem needsActionPredicate](FBKContentItem, "needsActionPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(v4, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "assignedPredicateForUser:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v16);
  v22[0] = v7;
  v22[1] = v11;
  v22[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 2, v18);

  return v19;
}

+ (id)inboxPredicateWithTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_predicateForSurveysWithTeam:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForFeedbackInInboxWithTeam:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(a1, "_predicateForAnnouncementsWithTeam:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 2, v8);
  return v9;
}

+ (id)draftsPredicateWithTeam:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN teams AND type == %@"), a3, &unk_24E18CB00);
}

+ (id)submittedPredicateWithTeam:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "_predicateForFeedbackWithTeam:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v5 = (void *)MEMORY[0x24BDD14C0];
  +[FBKContentItem needsActionPredicate](FBKContentItem, "needsActionPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notPredicateWithSubpredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)outboxPredicateWithTeam:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN teams AND type == %@ AND formResponse.uploadTask.localSubmissionStage IN %@"), a3, &unk_24E18CB18, &unk_24E18D628);
}

+ (id)_predicateForAnnouncementsWithTeam:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN teams AND type == %@"), a3, &unk_24E18CB30);
}

+ (id)_predicateForSurveysWithTeam:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("teams CONTAINS %@ AND type == %@"), a3, &unk_24E18CBA8);
}

+ (id)_predicateForFeedbackInInboxWithTeam:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "_predicateForFeedbackWithTeam:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  +[FBKContentItem needsActionPredicate](FBKContentItem, "needsActionPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_predicateForFeedbackWithTeam:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN teams"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type IN %@"), &unk_24E18D640, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)teamForItemPreferringTeam:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKContentItem teams](self, "teams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[FBKContentItem teams](self, "teams", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v13, "teamType"))
          {
            v14 = v13;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[FBKContentItem teams](self, "teams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v7 = v14;

  }
  return v7;
}

+ (id)entityName
{
  return CFSTR("ContentItem");
}

- (BOOL)isClosedFeedback
{
  int v3;

  v3 = -[FBKContentItem supportsClosing](self, "supportsClosing");
  if (v3)
    LOBYTE(v3) = -[FBKContentItem closed](self, "closed");
  return v3;
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;

  v4 = a3;
  v52 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("type"), &v52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v52;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", FBKContentItemTypeFromString(v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setType:](self, "setType:", v7);

  }
  v51 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("title"), &v51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v51;

  if (v8)
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setTitle:](self, "setTitle:", v10);

  }
  v50 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("subtitle"), &v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v50;

  if (v11)
    -[FBKContentItem setSubtitle:](self, "setSubtitle:", v12);
  v49 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("modified_at"), &v49);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v49;

  if (v13)
  {
    FBKDateFromServerString(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setModifiedAt:](self, "setModifiedAt:", v15);

  }
  v48 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("created_at"), &v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v48;

  if (v16)
  {
    FBKDateFromServerString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setCreatedAt:](self, "setCreatedAt:", v18);

  }
  v47 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("updated_at"), &v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v47;

  if (v19)
  {
    FBKDateFromServerString(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setUpdatedAt:](self, "setUpdatedAt:", v21);

  }
  v46 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("owner"), &v46);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v46;

  if (v22)
  {
    v45 = v17;
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uppercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "isEqualToString:", CFSTR("TEAM")))
    {
      v40 = v12;
      v41 = v9;
      v43 = v6;
      -[FBKContentItem managedObjectContext](self, "managedObjectContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKTeam entityName](FBKTeam, "entityName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("id"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", v27, v28, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v29);
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[FBKLog appHandle](FBKLog, "appHandle");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[FBKContentItem setPropertiesFromJSONObject:].cold.1(self, v23);

        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      v38 = (void *)v30;
      -[FBKContentItem setTeams:](self, "setTeams:", v30);

      v6 = v43;
      v12 = v40;

      v9 = v41;
    }
    else if (objc_msgSend(v25, "isEqualToString:", CFSTR("PARTICIPANT")))
    {
      -[FBKContentItem user](self, "user");
      v42 = v9;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKContentItem managedObjectContext](self, "managedObjectContext");
      v44 = v6;
      v32 = v14;
      v33 = v12;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v31, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v33;
      v14 = v32;
      v6 = v44;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKContentItem setTeams:](self, "setTeams:", v36);

      v9 = v42;
    }

    v17 = v45;
  }
  -[FBKContentItem setAttributesFromJSONObject:](self, "setAttributesFromJSONObject:", v4);
  -[FBKContentItem generateSearchText](self, "generateSearchText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKContentItem setSearchText:](self, "setSearchText:", v39);

}

- (void)setAttributesFromJSONObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v50 = 0;
  v41 = a3;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("form"), &v50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v50;

  if (v4)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FBKNilIfNSNull(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setFormID:](self, "setFormID:", v7);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FBKNilIfNSNull(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setFormTat:](self, "setFormTat:", v9);

  }
  v40 = v5;
  v49 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("originator"), &v49);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v49;

  if (v10)
  {
    -[FBKContentItem managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKParticipant, "importFromJSONObject:intoContext:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setOriginator:](self, "setOriginator:", v13);

  }
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("attributes"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("assignee"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v16)
    {
      -[FBKContentItem setAssignee:](self, "setAssignee:", 0);
    }
    else
    {
      -[FBKContentItem managedObjectContext](self, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKParticipant, "importFromJSONObject:intoContext:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKContentItem setAssignee:](self, "setAssignee:", v18);

    }
  }
  v48 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("unread"), &v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v48;

  if (v19)
    -[FBKContentItem setUnread:](self, "setUnread:", objc_msgSend(v20, "BOOLValue"));
  v47 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("orphan"), &v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v47;

  if (v21)
    -[FBKContentItem setIsOrphaned:](self, "setIsOrphaned:", objc_msgSend(v22, "BOOLValue"));
  v46 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("pending_info"), &v46);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v46;

  if (v23)
    -[FBKContentItem setPendingInfo:](self, "setPendingInfo:", objc_msgSend(v24, "BOOLValue"));
  v45 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("closed"), &v45);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v45;

  if (v25)
    -[FBKContentItem setClosed:](self, "setClosed:", objc_msgSend(v26, "BOOLValue"));
  v44 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("draft_type"), &v44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v44;

  if (v27)
  {
    v29 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v28, "uppercaseString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("ISSUE")) & 1) != 0)
    {
      v31 = 1;
    }
    else if (objc_msgSend(v30, "isEqualToString:", CFSTR("SURVEY")))
    {
      v31 = 2;
    }
    else
    {
      v31 = 0;
    }

    objc_msgSend(v29, "numberWithUnsignedInteger:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setDraftTypeEnum:](self, "setDraftTypeEnum:", v32);

  }
  v43 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("area"), &v43);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v43;

  if (v33)
  {
    FBKNilIfNSNull(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setArea:](self, "setArea:", v35);

  }
  v42 = 0;
  FBKContentItemAssignAttributeObjectForKey(v41, CFSTR("source"), &v42);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v42;

  if (v36)
  {
    FBKNilIfNSNull(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem setSource:](self, "setSource:", v38);

  }
}

- (id)keyPathsForValuesAffectingItemType
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("type"));
}

- (unint64_t)itemType
{
  void *v3;
  unint64_t v4;

  -[FBKContentItem willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("itemType"));
  -[FBKContentItem type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[FBKContentItem didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("itemType"));
  return v4;
}

- (unint64_t)draftType
{
  void *v3;
  unint64_t v4;

  -[FBKContentItem willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("draftType"));
  -[FBKContentItem draftTypeEnum](self, "draftTypeEnum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  -[FBKContentItem didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("draftType"));
  return v4;
}

- (void)markAsRead
{
  -[FBKContentItem setUnread:](self, "setUnread:", 0);
}

- (id)keyPathsForValuesAffectingHasFollowupPending
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("pendingInfo"));
}

- (BOOL)hasFollowupPending
{
  char v3;

  -[FBKContentItem willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("hasFollowupPending"));
  v3 = -[FBKContentItem pendingInfo](self, "pendingInfo");
  -[FBKContentItem didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("hasFollowupPending"));
  return v3;
}

- (id)keyPathsForValuesAffectingNeedsAction
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("unread"), CFSTR("hasFollowupPending"), 0);
}

- (BOOL)needsAction
{
  _BOOL4 v3;

  -[FBKContentItem willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("needsAction"));
  if ((-[FBKContentItem unread](self, "unread") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if (-[FBKContentItem hasFollowupPending](self, "hasFollowupPending"))
  {
    v3 = !-[FBKContentItem isClosedFeedback](self, "isClosedFeedback");
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  -[FBKContentItem didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("needsAction"));
  return v3;
}

+ (id)keyPathsForValuesAffectingNeedsActionFromMe
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("needsAction"), CFSTR("teams"), CFSTR("assignee"), CFSTR("user"), 0);
}

- (BOOL)needsActionFromMe
{
  unint64_t v3;
  _BOOL4 v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[FBKContentItem itemType](self, "itemType");
  v4 = -[FBKContentItem needsAction](self, "needsAction");
  v5 = v3 != 4 && v4;
  if (v3 == 4 && v4)
  {
    -[FBKContentItem singleTeam](self, "singleTeam");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "teamType"))
    {
      -[FBKContentItem assignee](self, "assignee");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKContentItem user](self, "user");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "isEqualToNumber:", v10);

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

+ (NSPredicate)needsActionPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("unread == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("pendingInfo == YES AND closed == NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

- (id)detailedItem
{
  void *v3;
  NSObject *v4;

  switch(-[FBKContentItem itemType](self, "itemType"))
  {
    case 1uLL:
      -[FBKContentItem formResponseStub](self, "formResponseStub");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[FBKContentItem announcement](self, "announcement");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[FBKContentItem surveyBugForm](self, "surveyBugForm");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
    case 5uLL:
      -[FBKContentItem feedback](self, "feedback");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      +[FBKLog appHandle](FBKLog, "appHandle");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[FBKContentItem detailedItem].cold.1(self);

      v3 = 0;
      break;
  }
  return v3;
}

+ (id)contentItemsWithFormIDs:(id)a3 fromContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__5;
    v17 = __Block_byref_object_dispose__5;
    v18 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke;
    v9[3] = &unk_24E159B80;
    v10 = v5;
    v11 = v6;
    v12 = &v13;
    objc_msgSend(v11, "performBlockAndWait:", v9);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = (id)objc_opt_new();
  }

  return v7;
}

void __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  +[FBKContentItem fetchRequest](FBKContentItem, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("formID in %@"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setPropertiesToFetch:", &unk_24E18D718);
  v4 = (void *)a1[5];
  v13 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_opt_new();
  }
  v8 = v7;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);

  if (v6)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke_cold_1((uint64_t)v6, v9);

    v10 = objc_opt_new();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (BOOL)canCloseFeedback
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  if (-[FBKContentItem supportsClosing](self, "supportsClosing"))
  {
    -[FBKContentItem singleTeam](self, "singleTeam");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "permissions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "canClose") & 1) != 0
      || -[FBKContentItem currentUserIsStakeholder](self, "currentUserIsStakeholder"))
    {
      v5 = !-[FBKContentItem isClosedFeedback](self, "isClosedFeedback");
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)allowUnsolicitedFollowup
{
  return -[FBKContentItem itemType](self, "itemType") == 4
      && !-[FBKContentItem isClosedFeedback](self, "isClosedFeedback")
      && -[FBKContentItem canRespondToFollowup](self, "canRespondToFollowup");
}

- (BOOL)canRespondToFollowup
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "canRespond") & 1) != 0
    || -[FBKContentItem currentUserIsStakeholder](self, "currentUserIsStakeholder");

  return v5;
}

- (id)shortDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[FBKContentItem itemType](self, "itemType") - 1;
  if (v4 > 4)
    v5 = CFSTR("UNKNOWN");
  else
    v5 = off_24E15AF18[v4];
  -[FBKManagedFeedbackObject ID](self, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ContentItem: type:%@ ID:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)keyPathsForValuesAffectingIsSurveyAvailable
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("type"), CFSTR("closed"), 0);
}

- (BOOL)isSurveyAvailable
{
  if (-[FBKContentItem itemType](self, "itemType") == 3)
    return -[FBKContentItem closed](self, "closed") ^ 1;
  else
    return 0;
}

+ (NSPredicate)isSurveyAvailablePredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type == %lu"), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("closed == NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

- (BOOL)isSurveyDraft
{
  return -[FBKContentItem draftType](self, "draftType") == 2;
}

- (BOOL)supportsClosing
{
  return -[FBKContentItem itemType](self, "itemType") == 4;
}

- (BOOL)canDownloadFiles
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 0;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "canDownload") & 1) != 0
    || -[FBKContentItem currentUserIsStakeholder](self, "currentUserIsStakeholder");

  return v5;
}

- (BOOL)canDeleteFiles
{
  void *v3;
  void *v4;
  char v5;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 0;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canDelete");

  return v5;
}

- (BOOL)canPromoteFeedback
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 0;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKContentItem user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasManagedTeams"))
    v5 = objc_msgSend(v3, "teamType") == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)canDemoteFeedback
{
  void *v3;
  void *v4;
  char v5;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 0;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canDemote");

  return v5;
}

- (BOOL)canReassignFeedback
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 0;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "teamType"))
  {
    objc_msgSend(v3, "permissions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v4, "canAssign") & 1) != 0
      || -[FBKContentItem currentUserIsStakeholder](self, "currentUserIsStakeholder");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowAssigneeLabel
{
  void *v3;
  BOOL v4;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 0;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "teamType") != 0;

  return v4;
}

- (BOOL)isTargetedSurvey
{
  void *v3;
  char v4;

  if (-[FBKContentItem itemType](self, "itemType") != 3)
    return 0;
  -[FBKContentItem source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("targeted"));

  return v4;
}

- (id)singleTeam
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[FBKContentItem teams](self, "teams");
  v3 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSObject count](v3, "count") <= 1)
  {
LABEL_5:

    goto LABEL_6;
  }
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRefreshingContent");

  if ((v5 & 1) == 0)
  {
    +[FBKLog model](FBKLog, "model");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[FBKManagedFeedbackObject ID](self, "ID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");
      -[FBKContentItem teams](self, "teams");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218240;
      v13 = v7;
      v14 = 2048;
      v15 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Content item [%ld] belongs to [%lu] teams, expected to be 1.", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_5;
  }
LABEL_6:
  -[FBKContentItem teams](self, "teams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)currentUserIsStakeholder
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;

  if (-[FBKContentItem itemType](self, "itemType") == 4)
  {
    -[FBKContentItem singleTeam](self, "singleTeam");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stakeholders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKContentItem user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "containsObject:", CFSTR("ORIGINATOR"));
    if (v8)
    {
      -[FBKContentItem originator](self, "originator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ID");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v2, "isEqualToNumber:", v7) & 1) != 0)
      {
        v9 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "containsObject:", CFSTR("ASSIGNEE")) & 1) == 0)
      {
        v9 = 0;
        goto LABEL_12;
      }
    }
    else if (!objc_msgSend(v5, "containsObject:", CFSTR("ASSIGNEE")))
    {
      v9 = 0;
LABEL_13:

      return v9;
    }
    -[FBKContentItem assignee](self, "assignee");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isEqualToNumber:", v7);

    if (!v8)
      goto LABEL_13;
    goto LABEL_12;
  }
  return 0;
}

- (id)generateSearchText
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;

  v28 = (void *)MEMORY[0x24BDD17C8];
  -[FBKContentItem displayTitle](self, "displayTitle");
  v3 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_24E15EAF8;
  v27 = v4;
  -[FBKContentItem subtitle](self, "subtitle");
  v5 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_24E15EAF8;
  v26 = v6;
  -[FBKManagedFeedbackObject ID](self, "ID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKContentItem feedbackIDString](self, "feedbackIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24E15EAF8;
  v24 = v9;
  -[FBKContentItem contentInfoString](self, "contentInfoString");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_24E15EAF8;
  -[FBKContentItem searchableFeedbackClosedStatus](self, "searchableFeedbackClosedStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKContentItem assignee](self, "assignee");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "givenName");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_24E15EAF8;
  -[FBKContentItem assignee](self, "assignee");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "familyName");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_24E15EAF8;
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@"), v27, v26, v25, v24, v12, v13, v17, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)keyPathsForValuesAffectingMailboxKind
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("type"));
}

- (NSString)mailboxKind
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FBKContentItem type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)keyPathsForValuesAffectingItemTitle
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("title"));
}

- (id)keyPathsForValuesAffectingItemSubtitle
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("subtitle"));
}

- (id)keyPathsForValuesAffectingFeedbackIDString
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("ID"));
}

- (NSString)feedbackIDString
{
  void *v3;
  void *v4;
  __CFString *v5;

  if (-[FBKContentItem itemType](self, "itemType") == 4)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[FBKManagedFeedbackObject ID](self, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("FB%@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_24E15EAF8;
  }
  return (NSString *)v5;
}

- (id)keyPathsForValuesAffectingFeedbackIDAndTitleString
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("ID"), CFSTR("displayTitle"), 0);
}

- (NSString)feedbackIDAndTitleString
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (-[FBKContentItem itemType](self, "itemType") == 4)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[FBKContentItem feedbackIDString](self, "feedbackIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem displayTitle](self, "displayTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24E15EAF8;
  }
  return (NSString *)v6;
}

- (id)keyPathsAffectingContentInfoString
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("itemType"), CFSTR("ID"), 0);
}

- (NSString)contentInfoString
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *result;

  switch(-[FBKContentItem itemType](self, "itemType"))
  {
    case 1uLL:
      v6 = -[FBKContentItem isSurveyDraft](self, "isSurveyDraft");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v6)
        v5 = CFSTR("SURVEY_DRAFT");
      else
        v5 = CFSTR("FEEDBACK_DRAFT");
      goto LABEL_10;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ANNOUNCEMENT");
      goto LABEL_10;
    case 3uLL:
    case 5uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("SURVEY");
LABEL_10:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24E15EAF8, CFSTR("CommonStrings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FEEDBACK"), &stru_24E15EAF8, CFSTR("CommonStrings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKContentItem feedbackIDString](self, "feedbackIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ · %@"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      result = v10;
      break;
    default:
      result = &stru_24E15EAF8;
      break;
  }
  return result;
}

- (id)keyPathsAffectingClosedOrOpenString
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("closed"), 0);
}

- (NSString)visibleFeedbackClosedStatus
{
  void *v3;
  void *v4;
  __CFString *v5;

  if (-[FBKContentItem supportsClosing](self, "supportsClosing")
    && -[FBKContentItem isClosedFeedback](self, "isClosedFeedback"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CLOSED_FEEDBACK_TAG"), &stru_24E15EAF8, CFSTR("CommonStrings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uppercaseString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_24E15EAF8;
  }
  return (NSString *)v5;
}

- (id)searchableFeedbackClosedStatus
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  if (-[FBKContentItem supportsClosing](self, "supportsClosing"))
  {
    v3 = -[FBKContentItem isClosedFeedback](self, "isClosedFeedback");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = CFSTR("CLOSED_FEEDBACK_TAG");
    else
      v6 = CFSTR("OPEN_FEEDBACK_TAG");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24E15EAF8, CFSTR("CommonStrings"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_24E15EAF8;
  }
  return v7;
}

- (id)keyPathsForValuesAffectingMailboxSortDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("modifiedAt"));
}

- (id)keyPathsForValuesAffectingItemTitleColor
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("type"), CFSTR("closed"), 0);
}

- (id)keyPathsForValuesAffectingSecondaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("closed"), 0);
}

- (id)keyPathsForValuesAffectingDisplayTitle
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("title"), CFSTR("draftTypeEnum"), 0);
}

- (NSString)displayTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  const __CFString *v12;

  -[FBKContentItem title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FBKContentItem title](self, "title"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    -[FBKContentItem title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = -[FBKContentItem isSurveyDraft](self, "isSurveyDraft");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v10)
      v12 = CFSTR("UNFINISHED_SURVEY");
    else
      v12 = CFSTR("UNTITLED_FEEDBACK");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24E15EAF8, CFSTR("CommonStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (id)assigneeName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FBKContentItem assignee](self, "assignee");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNASSIGNED"), &stru_24E15EAF8, CFSTR("CommonStrings"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)assigneeNameAndTeamName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  if (-[FBKContentItem itemType](self, "itemType") == 4)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[FBKContentItem assigneeName](self, "assigneeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem singleTeam](self, "singleTeam");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_24E15EAF8;
  }
  return v7;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  -[FBKManagedFeedbackObject ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  objc_msgSend(v4, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "intValue"))
  {
    v8 = -[FBKContentItem itemType](self, "itemType");
    v9 = v8 == objc_msgSend(v4, "itemType");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)unreadContentItemsPredicateForUser:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1758];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("unread == YES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("pendingInfo == YES"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("closed == NO"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(a1, "assignedPredicateForUser:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD14C0];
  v17[0] = v12;
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)assignedPredicateForUser:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD14C0];
  v4 = (void *)MEMORY[0x24BDD1758];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("ANY teams.teamTypeEnum == %ld"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v5, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateWithFormat:", CFSTR("assignee.remoteID == %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)formattedCreationDate
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;

  -[FBKContentItem createdAt](self, "createdAt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (FBKHeaderDateFormatter_onceToken != -1)
      dispatch_once(&FBKHeaderDateFormatter_onceToken, &__block_literal_global_47);
    v4 = (id)FBKHeaderDateFormatter_fmt;
    -[FBKContentItem createdAt](self, "createdAt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24E15EAF8;
  }
  return (NSString *)v6;
}

- (NSString)formattedMailboxSortDate
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[FBKContentItem mailboxSortDate](self, "mailboxSortDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKContentItem mailboxSortDateFormatter](self, "mailboxSortDateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKContentItem mailboxSortDate](self, "mailboxSortDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24E15EAF8;
  }
  return (NSString *)v6;
}

- (NSDateFormatter)mailboxSortDateFormatter
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t *v8;

  -[FBKContentItem mailboxSortDate](self, "mailboxSortDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKContentItem mailboxSortDate](self, "mailboxSortDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDateInToday:", v6);

  if (v7)
  {
    if (FBKContentItemDisplayDateTodayFormatter_onceToken != -1)
      dispatch_once(&FBKContentItemDisplayDateTodayFormatter_onceToken, &__block_literal_global_363);
    v8 = &FBKContentItemDisplayDateTodayFormatter_f;
  }
  else
  {
LABEL_6:
    if (FBKContentItemDisplayDateFormatter_onceToken != -1)
      dispatch_once(&FBKContentItemDisplayDateFormatter_onceToken, &__block_literal_global_364);
    v8 = &FBKContentItemDisplayDateFormatter_f;
  }
  return (NSDateFormatter *)(id)*v8;
}

- (BOOL)canResolveNeedsAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  if (-[FBKContentItem itemType](self, "itemType") != 4)
    return 1;
  -[FBKContentItem singleTeam](self, "singleTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "teamType");
  -[FBKContentItem assignee](self, "assignee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKContentItem user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToNumber:", v8);

  if (v4)
    v10 = v9;
  else
    v10 = 1;
  if (-[FBKContentItem isOrphaned](self, "isOrphaned") && objc_msgSend(v3, "role") == 2)
    v10 = 1;

  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ContentItem"));
}

- (void)setPropertiesFromJSONObject:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  OUTLINED_FUNCTION_5_1(&dword_21D9A9000, v5, v6, "Server says [%ld] belongs to team [%ld], but FBK is unaware of that team. Removing all team associations.", v7, v8, v9, v10, 0);

}

- (void)detailedItem
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1(&dword_21D9A9000, v1, v2, "%s for %@ not IMPLEMENTED", v3, v4, v5, v6, 2u);

}

void __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch Summary Items with error %@", (uint8_t *)&v2, 0xCu);
}

@end
