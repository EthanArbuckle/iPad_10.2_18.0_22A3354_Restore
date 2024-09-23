@implementation IDSCloudKitGroupServer

- (IDSCloudKitGroupServer)initWithDatabase:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  IDSCloudKitGroupServer *v9;
  IDSCloudKitGroupServer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitGroupServer;
  v9 = -[IDSCloudKitGroupServer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_database, a3);
  }

  return v10;
}

- (void)saveGroup:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  IDSCKRecordID *v27;
  const char *v28;
  double v29;
  void *v30;
  IDSCKRecord *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  id v61;
  id v62;
  id v63;
  const char *v64;
  double v65;
  _QWORD v66[4];
  id v67;
  IDSCloudKitGroupServer *v68;
  id v69;
  id v70;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D1F458];
  v11 = a4;
  objc_msgSend_groupContext(v10, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_INFO, "Save to group server", buf, 2u);
  }

  objc_msgSend_groupID(v8, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentation(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v23, v24, 0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [IDSCKRecordID alloc];
  v30 = (void *)objc_msgSend_initWithRecordName_(v27, v28, (uint64_t)v26, v29);
  v31 = [IDSCKRecord alloc];
  v34 = (void *)objc_msgSend_initWithRecordType_recordID_(v31, v32, (uint64_t)CFSTR("Group"), v33, v30);
  objc_msgSend_groupID(v8, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentation(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v42, v43, 0, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v34, v46, (uint64_t)v45, v47, CFSTR("groupID"));

  objc_msgSend_destinations(v8, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v55, v56, (uint64_t)CFSTR(", "), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKey_(v34, v59, (uint64_t)v58, v60, CFSTR("destinations"));
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = sub_19BABBD08;
  v66[3] = &unk_1E3C22000;
  v67 = v34;
  v68 = self;
  v69 = v8;
  v70 = v9;
  v61 = v8;
  v62 = v9;
  v63 = v34;
  objc_msgSend__publicDataRepresentationForGroup_completion_(v11, v64, (uint64_t)v61, v65, v66);

}

- (void)fetchGroupWithID:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  IDSCKRecordID *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  const char *v27;
  double v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v8 = a4;
  v9 = a5;
  objc_msgSend_dataRepresentation(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v13, v14, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [IDSCKRecordID alloc];
  v20 = (void *)objc_msgSend_initWithRecordName_(v17, v18, (uint64_t)v16, v19);
  objc_msgSend_database(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_19BABC0D0;
  v29[3] = &unk_1E3C22078;
  v29[4] = self;
  v30 = v8;
  v31 = v9;
  v25 = v9;
  v26 = v8;
  objc_msgSend_fetchRecordWithID_completionHandler_(v24, v27, (uint64_t)v20, v28, v29);

}

- (void)fetchGroupsWithStableGroupID:(id)a3 inContext:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  double v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0D1F428];
  v8 = a5;
  objc_msgSend_errorWithDomain_code_userInfo_(v6, v9, v7, v10, -1000, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v8, 0, v11);

}

- (void)q_groupFromRecord:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = a4;
  objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("payload"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19BABC3D4;
  v15[3] = &unk_1E3C22028;
  v16 = v7;
  v12 = v7;
  objc_msgSend__groupFromPublicDataRepresentation_completion_(v8, v13, (uint64_t)v11, v14, v15);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSCKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
