@implementation CKMetric

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  id v124;

  v124 = a3;
  objc_msgSend_startDate(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v124, v8, (uint64_t)v7, (uint64_t)CFSTR("StartDate"));

  objc_msgSend_duration(self, v9, v10, v11);
  objc_msgSend_encodeDouble_forKey_(v124, v12, (uint64_t)CFSTR("Duration"), v13);
  objc_msgSend_queueing(self, v14, v15, v16);
  objc_msgSend_encodeDouble_forKey_(v124, v17, (uint64_t)CFSTR("Queuing"), v18);
  objc_msgSend_executing(self, v19, v20, v21);
  objc_msgSend_encodeDouble_forKey_(v124, v22, (uint64_t)CFSTR("Executing"), v23);
  v27 = objc_msgSend_bytesUploaded(self, v24, v25, v26);
  objc_msgSend_encodeInteger_forKey_(v124, v28, v27, (uint64_t)CFSTR("BytesUploaded"));
  v32 = objc_msgSend_bytesDownloaded(self, v29, v30, v31);
  objc_msgSend_encodeInteger_forKey_(v124, v33, v32, (uint64_t)CFSTR("BytesDownloaded"));
  v37 = objc_msgSend_connections(self, v34, v35, v36);
  objc_msgSend_encodeInteger_forKey_(v124, v38, v37, (uint64_t)CFSTR("Connections"));
  v42 = objc_msgSend_connectionsCreated(self, v39, v40, v41);
  objc_msgSend_encodeInteger_forKey_(v124, v43, v42, (uint64_t)CFSTR("ConnectionsCreated"));
  v47 = objc_msgSend_bytesFulfilledByPeers(self, v44, v45, v46);
  objc_msgSend_encodeInt64_forKey_(v124, v48, v47, (uint64_t)CFSTR("BytesFulfilledByPeers"));
  v52 = objc_msgSend_bytesFulfilledLocally(self, v49, v50, v51);
  objc_msgSend_encodeInt64_forKey_(v124, v53, v52, (uint64_t)CFSTR("BytesFulfilledLocally"));
  v57 = objc_msgSend_bytesResumed(self, v54, v55, v56);
  objc_msgSend_encodeInt64_forKey_(v124, v58, v57, (uint64_t)CFSTR("BytesResumed"));
  objc_msgSend_totalBytesByChunkProfile(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v124, v63, (uint64_t)v62, (uint64_t)CFSTR("TotalBytesByChunkProfile"));

  objc_msgSend_chunkCountByChunkProfile(self, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v124, v68, (uint64_t)v67, (uint64_t)CFSTR("ChunkCountByChunkProfile"));

  objc_msgSend_fileCountByChunkProfile(self, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v124, v73, (uint64_t)v72, (uint64_t)CFSTR("FileCountByChunkProfile"));

  v77 = objc_msgSend_zoneishKeysRolled(self, v74, v75, v76);
  objc_msgSend_encodeInt64_forKey_(v124, v78, v77, (uint64_t)CFSTR("ZoneishKeysRolled"));
  v82 = objc_msgSend_perRecordKeysRolled(self, v79, v80, v81);
  objc_msgSend_encodeInt64_forKey_(v124, v83, v82, (uint64_t)CFSTR("PerRecordKeysRolled"));
  v87 = objc_msgSend_zoneKeysRolled(self, v84, v85, v86);
  objc_msgSend_encodeInt64_forKey_(v124, v88, v87, (uint64_t)CFSTR("ZoneKeysRolled"));
  v92 = objc_msgSend_shareKeysRolled(self, v89, v90, v91);
  objc_msgSend_encodeInt64_forKey_(v124, v93, v92, (uint64_t)CFSTR("ShareKeysRolled"));
  v97 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v94, v95, v96);
  objc_msgSend_encodeInt64_forKey_(v124, v98, v97, (uint64_t)CFSTR("KeyRollsSkippedBySizeCheck"));
  v102 = objc_msgSend_zoneKeysRemoved(self, v99, v100, v101);
  objc_msgSend_encodeInt64_forKey_(v124, v103, v102, (uint64_t)CFSTR("ZoneKeysRemoved"));
  v107 = objc_msgSend_zoneishKeysRemoved(self, v104, v105, v106);
  objc_msgSend_encodeInt64_forKey_(v124, v108, v107, (uint64_t)CFSTR("ZoneishKeysRemoved"));
  v112 = objc_msgSend_recordKeysRemoved(self, v109, v110, v111);
  objc_msgSend_encodeInt64_forKey_(v124, v113, v112, (uint64_t)CFSTR("RecordKeysRemoved"));
  v117 = objc_msgSend_keysNotRemoved(self, v114, v115, v116);
  objc_msgSend_encodeInt64_forKey_(v124, v118, v117, (uint64_t)CFSTR("KeysNotRemoved"));
  v122 = objc_msgSend_walrusEnabled(self, v119, v120, v121);
  objc_msgSend_encodeBool_forKey_(v124, v123, v122, (uint64_t)CFSTR("WalrusEnabled"));

}

- (CKMetric)initWithCoder:(id)a3
{
  id v4;
  CKMetric *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSDate *startDate;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSDictionary *totalBytesByChunkProfile;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSDictionary *chunkCountByChunkProfile;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSDictionary *fileCountByChunkProfile;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  objc_super v96;

  v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)CKMetric;
  v5 = -[CKMetric init](&v96, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("StartDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend_decodeDoubleForKey_(v4, v10, (uint64_t)CFSTR("Duration"), v11);
    v5->_duration = v12;
    objc_msgSend_decodeDoubleForKey_(v4, v13, (uint64_t)CFSTR("Queuing"), v14);
    v5->_queueing = v15;
    objc_msgSend_decodeDoubleForKey_(v4, v16, (uint64_t)CFSTR("Executing"), v17);
    v5->_executing = v18;
    v5->_bytesUploaded = objc_msgSend_decodeIntegerForKey_(v4, v19, (uint64_t)CFSTR("BytesUploaded"), v20);
    v5->_bytesDownloaded = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)CFSTR("BytesDownloaded"), v22);
    v5->_connections = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("Connections"), v24);
    v5->_connectionsCreated = objc_msgSend_decodeIntegerForKey_(v4, v25, (uint64_t)CFSTR("ConnectionsCreated"), v26);
    v5->_bytesFulfilledByPeers = objc_msgSend_decodeInt64ForKey_(v4, v27, (uint64_t)CFSTR("BytesFulfilledByPeers"), v28);
    v5->_bytesFulfilledLocally = objc_msgSend_decodeInt64ForKey_(v4, v29, (uint64_t)CFSTR("BytesFulfilledLocally"), v30);
    v5->_bytesResumed = objc_msgSend_decodeInt64ForKey_(v4, v31, (uint64_t)CFSTR("BytesResumed"), v32);
    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend_setWithObjects_(v33, v37, v34, v38, v35, v36, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v39, (uint64_t)CFSTR("TotalBytesByChunkProfile"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_mutableCopy(v41, v42, v43, v44);
    totalBytesByChunkProfile = v5->_totalBytesByChunkProfile;
    v5->_totalBytesByChunkProfile = (NSDictionary *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    objc_msgSend_setWithObjects_(v47, v51, v48, v52, v49, v50, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v53, (uint64_t)CFSTR("ChunkCountByChunkProfile"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_mutableCopy(v55, v56, v57, v58);
    chunkCountByChunkProfile = v5->_chunkCountByChunkProfile;
    v5->_chunkCountByChunkProfile = (NSDictionary *)v59;

    v61 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    objc_msgSend_setWithObjects_(v61, v65, v62, v66, v63, v64, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v67, (uint64_t)CFSTR("FileCountByChunkProfile"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_mutableCopy(v69, v70, v71, v72);
    fileCountByChunkProfile = v5->_fileCountByChunkProfile;
    v5->_fileCountByChunkProfile = (NSDictionary *)v73;

    v5->_zoneishKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v75, (uint64_t)CFSTR("ZoneishKeysRolled"), v76);
    v5->_perRecordKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v77, (uint64_t)CFSTR("PerRecordKeysRolled"), v78);
    v5->_zoneKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v79, (uint64_t)CFSTR("ZoneKeysRolled"), v80);
    v5->_shareKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v81, (uint64_t)CFSTR("ShareKeysRolled"), v82);
    v5->_keyRollsSkippedBySizeCheck = objc_msgSend_decodeInt64ForKey_(v4, v83, (uint64_t)CFSTR("KeyRollsSkippedBySizeCheck"), v84);
    v5->_zoneKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v85, (uint64_t)CFSTR("ZoneKeysRemoved"), v86);
    v5->_zoneishKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v87, (uint64_t)CFSTR("ZoneishKeysRemoved"), v88);
    v5->_recordKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v89, (uint64_t)CFSTR("RecordKeysRemoved"), v90);
    v5->_keysNotRemoved = objc_msgSend_decodeInt64ForKey_(v4, v91, (uint64_t)CFSTR("KeysNotRemoved"), v92);
    v5->_walrusEnabled = objc_msgSend_decodeBoolForKey_(v4, v93, (uint64_t)CFSTR("WalrusEnabled"), v94);
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  void *v56;

  v56 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_startDate(self, a2, v2, v3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v5, v6, v7);
  v9 = v8;
  objc_msgSend_queueing(self, v10, v11, v12);
  v14 = v13;
  objc_msgSend_executing(self, v15, v16, v17);
  v19 = v18;
  v23 = objc_msgSend_bytesUploaded(self, v20, v21, v22);
  v27 = objc_msgSend_bytesDownloaded(self, v24, v25, v26);
  v31 = objc_msgSend_connections(self, v28, v29, v30);
  v35 = objc_msgSend_connectionsCreated(self, v32, v33, v34);
  objc_msgSend_totalBytesByChunkProfile(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5E56A4(self, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_chunkCountByChunkProfile(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5E56A4(self, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileCountByChunkProfile(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5E56A4(self, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v56, v51, (uint64_t)CFSTR("startDate=%@, duration=%0.3f, queueing=%0.3f, executing=%0.3f, bytesUploaded=%lu, bytesDownloaded=%lu, connections=%lu, connectionsCreated=%lu, totalBytesByChunkProfile=%@, chunkCountByChunkProfile=%@, fileCountByChunkProfile=%@"), v52, v55, v9, v14, v19, v23, v27, v31, v35, v40, v45, v50);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (unint64_t)zoneishKeysRolled
{
  return self->_zoneishKeysRolled;
}

- (unint64_t)zoneKeysRolled
{
  return self->_zoneKeysRolled;
}

- (BOOL)walrusEnabled
{
  return self->_walrusEnabled;
}

- (NSDictionary)totalBytesByChunkProfile
{
  return self->_totalBytesByChunkProfile;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)shareKeysRolled
{
  return self->_shareKeysRolled;
}

- (double)queueing
{
  return self->_queueing;
}

- (unint64_t)perRecordKeysRolled
{
  return self->_perRecordKeysRolled;
}

- (NSDictionary)fileCountByChunkProfile
{
  return self->_fileCountByChunkProfile;
}

- (double)executing
{
  return self->_executing;
}

- (double)duration
{
  return self->_duration;
}

- (id)description
{
  return (id)((uint64_t (*)(CKMetric *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (unint64_t)connections
{
  return self->_connections;
}

- (unint64_t)connectionsCreated
{
  return self->_connectionsCreated;
}

- (NSDictionary)chunkCountByChunkProfile
{
  return self->_chunkCountByChunkProfile;
}

- (unint64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (unint64_t)bytesResumed
{
  return self->_bytesResumed;
}

- (unint64_t)bytesFulfilledLocally
{
  return self->_bytesFulfilledLocally;
}

- (unint64_t)bytesFulfilledByPeers
{
  return self->_bytesFulfilledByPeers;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMetric)initWithStartDate:(id)a3 duration:(double)a4 queueing:(double)a5 executing:(double)a6 bytesUploaded:(unint64_t)a7 bytesDownloaded:(unint64_t)a8 connections:(unint64_t)a9 connectionsCreated:(unint64_t)a10 bytesFulfilledByPeers:(unint64_t)a11 bytesFulfilledLocally:(unint64_t)a12 bytesResumed:(unint64_t)a13 totalBytesByChunkProfile:(id)a14 chunkCountByChunkProfile:(id)a15 fileCountByChunkProfile:(id)a16 walrusEnabled:(BOOL)a17 zoneishKeysRolled:(unint64_t)a18 perRecordKeysRolled:(unint64_t)a19 zoneKeysRolled:(unint64_t)a20 shareKeysRolled:(unint64_t)a21 keyRollsSkippedBySizeCheck:(unint64_t)a22 zoneKeysRemoved:(unint64_t)a23 zoneishKeysRemoved:(unint64_t)a24 recordKeysRemoved:(unint64_t)a25 keysNotRemoved:(unint64_t)a26
{
  id v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  CKMetric *v41;
  uint64_t v42;
  NSDate *startDate;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSDictionary *totalBytesByChunkProfile;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSDictionary *chunkCountByChunkProfile;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSDictionary *fileCountByChunkProfile;
  id v60;
  objc_super v61;

  v60 = a3;
  v35 = a14;
  v36 = a15;
  v37 = a16;
  v61.receiver = self;
  v61.super_class = (Class)CKMetric;
  v41 = -[CKMetric init](&v61, sel_init);
  if (v41)
  {
    v42 = objc_msgSend_copy(v60, v38, v39, v40);
    startDate = v41->_startDate;
    v41->_startDate = (NSDate *)v42;

    v41->_duration = a4;
    v41->_queueing = a5;
    v41->_executing = a6;
    v41->_bytesUploaded = a7;
    v41->_bytesDownloaded = a8;
    v41->_connections = a9;
    v41->_connectionsCreated = a10;
    v41->_bytesFulfilledByPeers = a11;
    v41->_bytesFulfilledLocally = a12;
    v41->_bytesResumed = a13;
    v47 = objc_msgSend_copy(v35, v44, v45, v46);
    totalBytesByChunkProfile = v41->_totalBytesByChunkProfile;
    v41->_totalBytesByChunkProfile = (NSDictionary *)v47;

    v52 = objc_msgSend_copy(v36, v49, v50, v51);
    chunkCountByChunkProfile = v41->_chunkCountByChunkProfile;
    v41->_chunkCountByChunkProfile = (NSDictionary *)v52;

    v57 = objc_msgSend_copy(v37, v54, v55, v56);
    fileCountByChunkProfile = v41->_fileCountByChunkProfile;
    v41->_fileCountByChunkProfile = (NSDictionary *)v57;

    v41->_walrusEnabled = a17;
    v41->_zoneishKeysRolled = a18;
    v41->_perRecordKeysRolled = a19;
    v41->_zoneKeysRolled = a20;
    v41->_shareKeysRolled = a21;
    v41->_keyRollsSkippedBySizeCheck = a22;
    v41->_zoneKeysRemoved = a23;
    v41->_zoneishKeysRemoved = a24;
    v41->_recordKeysRemoved = a25;
    v41->_keysNotRemoved = a26;
  }

  return v41;
}

- (unint64_t)keyRollsSkippedBySizeCheck
{
  return self->_keyRollsSkippedBySizeCheck;
}

- (unint64_t)zoneKeysRemoved
{
  return self->_zoneKeysRemoved;
}

- (unint64_t)zoneishKeysRemoved
{
  return self->_zoneishKeysRemoved;
}

- (unint64_t)recordKeysRemoved
{
  return self->_recordKeysRemoved;
}

- (unint64_t)keysNotRemoved
{
  return self->_keysNotRemoved;
}

@end
