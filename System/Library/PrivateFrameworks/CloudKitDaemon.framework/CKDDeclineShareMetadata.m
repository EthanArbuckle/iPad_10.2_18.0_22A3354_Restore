@implementation CKDDeclineShareMetadata

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  objc_msgSend_shareURL(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("shareURL"));

  objc_msgSend_participantID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("participantID"));

  objc_msgSend_shareRecordID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, CFSTR("shareRecordID"));

  objc_msgSend_properties(v3, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v18;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_shareRecordID, a3);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_participantID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
