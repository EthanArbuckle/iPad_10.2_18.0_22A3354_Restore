@implementation EDAMNoteAttributes

+ (id)structName
{
  return CFSTR("NoteAttributes");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[24];

  v30[22] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1289;
  if (!structFields_structFields_1289)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("subjectDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v29;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 4, 1, CFSTR("latitude"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v28;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 4, 1, CFSTR("longitude"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v27;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 4, 1, CFSTR("altitude"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 11, 1, CFSTR("author"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 11, 1, CFSTR("source"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[5] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 15, 11, 1, CFSTR("sourceURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[6] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 11, 1, CFSTR("sourceApplication"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[7] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 17, 10, 1, CFSTR("shareDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[8] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 18, 10, 1, CFSTR("reminderOrder"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[9] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 19, 10, 1, CFSTR("reminderDoneTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[10] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 10, 1, CFSTR("reminderTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[11] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 11, 1, CFSTR("placeName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[12] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 22, 11, 1, CFSTR("contentClass"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[13] = v16;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 23, 12, 1, CFSTR("applicationData"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v30[14] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 24, 11, 1, CFSTR("lastEditedBy"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[15] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 26, 13, 1, CFSTR("classifications"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[16] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 27, 8, 1, CFSTR("creatorId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[17] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 28, 8, 1, CFSTR("lastEditorId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[18] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 29, 2, 1, CFSTR("sharedWithBusiness"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[19] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 30, 11, 1, CFSTR("conflictSourceNoteGuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[20] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 31, 8, 1, CFSTR("noteTitleQuality"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[21] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 22);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_1289;
    structFields_structFields_1289 = v13;

    v2 = (void *)structFields_structFields_1289;
  }
  return v2;
}

- (NSNumber)subjectDate
{
  return self->_subjectDate;
}

- (void)setSubjectDate:(id)a3
{
  objc_storeStrong((id *)&self->_subjectDate, a3);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(id)a3
{
  objc_storeStrong((id *)&self->_altitude, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (void)setSourceApplication:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplication, a3);
}

- (NSNumber)shareDate
{
  return self->_shareDate;
}

- (void)setShareDate:(id)a3
{
  objc_storeStrong((id *)&self->_shareDate, a3);
}

- (NSNumber)reminderOrder
{
  return self->_reminderOrder;
}

- (void)setReminderOrder:(id)a3
{
  objc_storeStrong((id *)&self->_reminderOrder, a3);
}

- (NSNumber)reminderDoneTime
{
  return self->_reminderDoneTime;
}

- (void)setReminderDoneTime:(id)a3
{
  objc_storeStrong((id *)&self->_reminderDoneTime, a3);
}

- (NSNumber)reminderTime
{
  return self->_reminderTime;
}

- (void)setReminderTime:(id)a3
{
  objc_storeStrong((id *)&self->_reminderTime, a3);
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (NSString)contentClass
{
  return self->_contentClass;
}

- (void)setContentClass:(id)a3
{
  objc_storeStrong((id *)&self->_contentClass, a3);
}

- (EDAMLazyMap)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationData, a3);
}

- (NSString)lastEditedBy
{
  return self->_lastEditedBy;
}

- (void)setLastEditedBy:(id)a3
{
  objc_storeStrong((id *)&self->_lastEditedBy, a3);
}

- (NSDictionary)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_classifications, a3);
}

- (NSNumber)creatorId
{
  return self->_creatorId;
}

- (void)setCreatorId:(id)a3
{
  objc_storeStrong((id *)&self->_creatorId, a3);
}

- (NSNumber)lastEditorId
{
  return self->_lastEditorId;
}

- (void)setLastEditorId:(id)a3
{
  objc_storeStrong((id *)&self->_lastEditorId, a3);
}

- (NSNumber)sharedWithBusiness
{
  return self->_sharedWithBusiness;
}

- (void)setSharedWithBusiness:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWithBusiness, a3);
}

- (NSString)conflictSourceNoteGuid
{
  return self->_conflictSourceNoteGuid;
}

- (void)setConflictSourceNoteGuid:(id)a3
{
  objc_storeStrong((id *)&self->_conflictSourceNoteGuid, a3);
}

- (NSNumber)noteTitleQuality
{
  return self->_noteTitleQuality;
}

- (void)setNoteTitleQuality:(id)a3
{
  objc_storeStrong((id *)&self->_noteTitleQuality, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteTitleQuality, 0);
  objc_storeStrong((id *)&self->_conflictSourceNoteGuid, 0);
  objc_storeStrong((id *)&self->_sharedWithBusiness, 0);
  objc_storeStrong((id *)&self->_lastEditorId, 0);
  objc_storeStrong((id *)&self->_creatorId, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_lastEditedBy, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_contentClass, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_reminderTime, 0);
  objc_storeStrong((id *)&self->_reminderDoneTime, 0);
  objc_storeStrong((id *)&self->_reminderOrder, 0);
  objc_storeStrong((id *)&self->_shareDate, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_subjectDate, 0);
}

@end
