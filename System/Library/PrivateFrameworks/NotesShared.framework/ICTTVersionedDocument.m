@implementation ICTTVersionedDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaID, 0);
}

- (void)dealloc
{
  void *documentArchive;
  objc_super v4;

  documentArchive = self->_documentArchive;
  if (documentArchive)
    (*(void (**)(void *, SEL))(*(_QWORD *)documentArchive + 8))(documentArchive, a2);
  v4.receiver = self;
  v4.super_class = (Class)ICTTVersionedDocument;
  -[ICTTVersionedDocument dealloc](&v4, sel_dealloc);
}

- (void)loadDocumentArchive:(void *)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  char *v9;
  int v10;
  int v11;
  const versioned_document::Version *v12;
  __int128 v14;
  unint64_t v15;
  const versioned_document::Version *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  ICTTVersionedDocument *v22;
  unint64_t v23;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  char *v42;
  _DWORD *v43;
  _BYTE v44[40];
  unsigned int v45;
  unsigned int v46;
  uint8_t buf[4];
  unsigned int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
  v6 = *((_DWORD *)a3 + 12);
  v43 = a3;
  if (!v6)
  {
    v11 = -1;
    goto LABEL_34;
  }
  v7 = v5;
  v8 = 0;
  v9 = (char *)a3 + 40;
  v10 = -1;
  v11 = -1;
  do
  {
    v12 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)v9, v8);
    versioned_document::Version::Version((versioned_document::Version *)v44, v12);
    if (v11 < 0 && v45 <= v7)
      v11 = v8;
    if (v45 < v7)
    {
      if (v10 < 0)
        v10 = v8;
      versioned_document::Version::~Version((versioned_document::Version *)v44);
      if ((v10 & 0x80000000) == 0)
        goto LABEL_18;
LABEL_34:
      v26 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ICTTVersionedDocument loadDocumentArchive:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

      goto LABEL_37;
    }
    if (v46 <= v7)
      v10 = v8;
    versioned_document::Version::~Version((versioned_document::Version *)v44);
    ++v8;
  }
  while (v6 != v8);
  if (v10 < 0)
    goto LABEL_34;
LABEL_18:
  if (v10 >= v6)
  {
LABEL_37:
    if (v11 < 0)
      return;
    goto LABEL_38;
  }
  v15 = 0x1E0C99000uLL;
  *(_QWORD *)&v14 = 67109632;
  v41 = v14;
  v42 = v9;
  while (1)
  {
    v16 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)v9, v10);
    versioned_document::Version::Version((versioned_document::Version *)v44, v16);
    objc_msgSend(*(id *)(v15 + 3408), "dataWithBytesNoCopy:length:freeWhenDone:", v41);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 < v7)
    {
      v18 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        v48 = v45;
        v49 = 1024;
        v50 = v7;
        v19 = v18;
        v20 = "Loading old version %d < %d";
        v21 = 14;
LABEL_27:
        _os_log_debug_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEBUG, v20, buf, v21);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (v45 != v7)
      break;
    v18 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v48 = v7;
      v19 = v18;
      v20 = "Loading current version %d";
      v21 = 8;
      goto LABEL_27;
    }
LABEL_32:

    -[ICTTVersionedDocument mergeVersion:fromData:](self, "mergeVersion:fromData:", v45, v17);
    versioned_document::Version::~Version((versioned_document::Version *)v44);
    if (v6 == ++v10)
      goto LABEL_37;
  }
  v22 = self;
  v23 = v15;
  v24 = v46;
  v25 = os_log_create("com.apple.notes", "Topotext");
  v18 = v25;
  if (v24 <= v7)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v41;
      v48 = v45;
      v49 = 1024;
      v50 = v7;
      v51 = 1024;
      v52 = v46;
      _os_log_debug_impl(&dword_1BD918000, v18, OS_LOG_TYPE_DEBUG, "Loading future version %d > %d where min-supported %d", buf, 0x14u);
    }
    v15 = v23;
    self = v22;
    v9 = v42;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[ICTTVersionedDocument loadDocumentArchive:].cold.2(v18, v34, v35, v36, v37, v38, v39, v40);

  versioned_document::Version::~Version((versioned_document::Version *)v44);
  if ((v11 & 0x80000000) == 0)
LABEL_38:
    google::protobuf::RepeatedPtrField<versioned_document::Version>::DeleteSubrange((google::protobuf::internal::RepeatedPtrFieldBase *)(v43 + 10), v11, v43[12] - v11);
}

- (NSUUID)replicaID
{
  return self->_replicaID;
}

- (ICTTVersionedDocument)initWithData:(id)a3 replicaID:(id)a4
{
  id v6;
  id v7;
  ICTTVersionedDocument *v8;
  ICTTVersionedDocument *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICTTVersionedDocument;
  v8 = -[ICTTVersionedDocument init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replicaID, a4);
    -[ICTTVersionedDocument loadData:](v9, "loadData:", v6);
  }

  return v9;
}

- (void)loadData:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __34__ICTTVersionedDocument_loadData___block_invoke;
  activity_block[3] = &unk_1E76CB268;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1BD918000, "Loading versioned document", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __34__ICTTVersionedDocument_loadData___block_invoke(uint64_t a1)
{
  versioned_document::Document *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  google::protobuf::MessageLite *v7;
  id v8;
  char *v9;
  int v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (versioned_document::Document *)operator new();
  v3 = versioned_document::Document::Document(v2);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v4, "ic_gzipInflate", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (v7 = *(google::protobuf::MessageLite **)(*(_QWORD *)(a1 + 32) + 16),
          v8 = objc_retainAutorelease(v5),
          v9 = (char *)objc_msgSend(v8, "bytes"),
          v10 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v8, "length")),
          google::protobuf::MessageLite::ParseFromArray(v7, v9, v10)))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      if ((*(_BYTE *)(v11 + 32) & 1) != 0)
      {
        v12 = *(_DWORD *)(v11 + 64);
        if (v12 == +[ICTTVersionedDocument versionedDocumentSerializationVersion](ICTTVersionedDocument, "versionedDocumentSerializationVersion"))
        {
          objc_msgSend(*(id *)(a1 + 32), "loadDocumentArchive:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
LABEL_13:

          return;
        }
      }
      v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __34__ICTTVersionedDocument_loadData___block_invoke_cold_2(v21, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64), +[ICTTVersionedDocument versionedDocumentSerializationVersion](ICTTVersionedDocument, "versionedDocumentSerializationVersion"), v13);

    }
    else
    {
      v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __34__ICTTVersionedDocument_loadData___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    goto LABEL_13;
  }
}

+ (unsigned)versionedDocumentSerializationVersion
{
  return 0;
}

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (ICTTVersionedDocument)initWithArchive:(const void *)a3 replicaID:(id)a4
{
  id v7;
  ICTTVersionedDocument *v8;
  ICTTVersionedDocument *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICTTVersionedDocument;
  v8 = -[ICTTVersionedDocument init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replicaID, a4);
    -[ICTTVersionedDocument loadArchive:](v9, "loadArchive:", a3);
  }

  return v9;
}

- (void)loadArchive:(const void *)documentArchive
{
  int32x2_t *v5;
  __n128 v6;
  int32x2_t *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (int32x2_t *)operator new();
  v6.n128_f64[0] = versioned_document::Document::Document((versioned_document::Document *)v5);
  self->_documentArchive = v5;
  if (v5 != documentArchive)
  {
    v7 = (int32x2_t *)((char *)documentArchive + 40);
    if (v5[6].i32[0] >= 1)
    {
      v8 = 0;
      do
      {
        v9 = *(_QWORD *)(*(_QWORD *)&v5[5] + 8 * v8);
        (*(void (**)(uint64_t, __n128))(*(_QWORD *)v9 + 32))(v9, v6);
        ++v8;
      }
      while (v8 < v5[6].i32[0]);
    }
    v5[6].i32[0] = 0;
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>(v5 + 5, v7);
    documentArchive = self->_documentArchive;
  }
  -[ICTTVersionedDocument loadDocumentArchive:](self, "loadDocumentArchive:", documentArchive);
}

- (unint64_t)futureVersionCount
{
  return *((int *)self->_documentArchive + 12);
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (void)saveCurrentVersion:(void *)a3
{
  int v5;
  void *v6;
  int v7;
  id v8;
  _QWORD *v9;
  int v10;

  v5 = objc_msgSend((id)objc_opt_class(), "minimumSupportedVersion");
  v10 = 0;
  -[ICTTVersionedDocument serializeCurrentVersion:](self, "serializeCurrentVersion:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  *((_DWORD *)a3 + 8) |= 3u;
  *((_DWORD *)a3 + 10) = v7;
  *((_DWORD *)a3 + 11) = v5;
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  *((_DWORD *)a3 + 8) |= 4u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*((_QWORD *)a3 + 6) == google::protobuf::internal::empty_string_)
  {
    v9 = (_QWORD *)operator new();
    *v9 = 0;
    v9[1] = 0;
    v9[2] = 0;
    *((_QWORD *)a3 + 6) = v9;
  }
  MEMORY[0x1C3B7A7E8]();

}

- (unint64_t)mergeWithVersionedDocument:(id)a3
{
  id v4;
  int32x2_t *v5;
  int32x2_t *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  v6 = (int32x2_t *)objc_msgSend(v4, "documentArchive");
  if (v6 != v5)
  {
    if (v5[6].i32[0] >= 1)
    {
      v7 = 0;
      do
      {
        (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)&v5[5] + 8 * v7) + 32))(*(_QWORD *)(*(_QWORD *)&v5[5] + 8 * v7));
        ++v7;
      }
      while (v7 < v5[6].i32[0]);
    }
    v5[6].i32[0] = 0;
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>(v5 + 5, v6 + 5);
  }

  return 1;
}

- (unsigned)maxDocumentVersion
{
  int *v3;
  std::string *v4;
  char v6;
  std::string v7[2];

  if (*(int *)(-[ICTTVersionedDocument documentArchive](self, "documentArchive") + 48) < 1)
    return objc_msgSend((id)objc_opt_class(), "serializationVersion");
  v3 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  if (v3[12] <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Source/Shared/protobuf-lite/google/protobuf/repeated_field.h", 886);
    v4 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (index) < (size()): ");
    google::protobuf::internal::LogFinisher::operator=((uint64_t)&v6, (google::protobuf::internal::LogMessage *)v4);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  return *(_DWORD *)(**((_QWORD **)v3 + 5) + 40);
}

- (id)serialize
{
  NSObject *v3;
  int v4;
  _DWORD *v5;
  unsigned int v6;
  int *v7;
  int32x2_t *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  versioned_document::Version *v12;
  int32x2_t v13;
  int32x2_t v14;
  id v15;
  void *v16;
  void *v17;
  google::protobuf::MessageLite *v18;
  id v19;
  _DWORD *v20;
  int v21;
  std::string *v22;
  uint64_t v23;
  int v24;
  void *v25;
  char v27;
  std::string v28[2];
  char v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
    -[ICTTVersionedDocument serialize].cold.1((uint64_t)-[ICTTVersionedDocument documentArchive](self, "documentArchive"), (uint64_t)v29, v4);
  }

  v5 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  v6 = +[ICTTVersionedDocument versionedDocumentSerializationVersion](ICTTVersionedDocument, "versionedDocumentSerializationVersion");
  v5[8] |= 1u;
  v5[16] = v6;
  v7 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  v8 = (int32x2_t *)v7;
  v9 = v7[13];
  v10 = v7[12];
  if ((int)v10 >= v9)
  {
    if (v9 == v7[14])
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7 + 10, v9 + 1);
    v12 = google::protobuf::internal::GenericTypeHandler<versioned_document::Version>::New();
    v13 = v8[5];
    v14 = v8[6];
    v8[6] = vadd_s32(v14, (int32x2_t)0x100000001);
    *(_QWORD *)(*(_QWORD *)&v13 + 8 * v14.i32[0]) = v12;
  }
  else
  {
    v11 = *((_QWORD *)v7 + 5);
    v7[12] = v10 + 1;
    v12 = *(versioned_document::Version **)(v11 + 8 * v10);
  }
  -[ICTTVersionedDocument saveCurrentVersion:](self, "saveCurrentVersion:", v12);
  v15 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v16 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  v17 = (void *)objc_msgSend(v15, "initWithLength:", (*(int (**)(void *))(*(_QWORD *)v16 + 72))(v16));
  v18 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  v19 = objc_retainAutorelease(v17);
  google::protobuf::MessageLite::SerializeToArray(v18, (void *)objc_msgSend(v19, "mutableBytes"), objc_msgSend(v19, "length"));
  v20 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  v21 = v20[12];
  if (v21 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Source/Shared/protobuf-lite/google/protobuf/repeated_field.h", 913);
    v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((uint64_t)&v27, (google::protobuf::internal::LogMessage *)v22);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    v21 = v20[12];
  }
  v23 = *((_QWORD *)v20 + 5);
  v24 = v21 - 1;
  v20[12] = v24;
  (*(void (**)(_QWORD))(**(_QWORD **)(v23 + 8 * v24) + 32))(*(_QWORD *)(v23 + 8 * v24));
  objc_msgSend(v19, "ic_gzipDeflate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)saveToArchive:(void *)a3
{
  NSObject *v5;
  int v6;
  unsigned int v7;
  int32x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  versioned_document::Version *v14;
  uint64_t v15;
  int32x2_t v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
    -[ICTTVersionedDocument serialize].cold.1((uint64_t)-[ICTTVersionedDocument documentArchive](self, "documentArchive"), (uint64_t)v17, v6);
  }

  v7 = +[ICTTVersionedDocument versionedDocumentSerializationVersion](ICTTVersionedDocument, "versionedDocumentSerializationVersion");
  *((_DWORD *)a3 + 8) |= 1u;
  *((_DWORD *)a3 + 16) = v7;
  v8 = -[ICTTVersionedDocument documentArchive](self, "documentArchive");
  if (v8 != a3)
  {
    if (*((int *)a3 + 12) >= 1)
    {
      v9 = 0;
      do
      {
        v10 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8 * v9);
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 32))(v10);
        ++v9;
      }
      while (v9 < *((int *)a3 + 12));
    }
    *((_DWORD *)a3 + 12) = 0;
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((int32x2_t *)a3 + 5, v8 + 5);
  }
  v11 = *((_DWORD *)a3 + 13);
  v12 = *((int *)a3 + 12);
  if ((int)v12 >= v11)
  {
    if (v11 == *((_DWORD *)a3 + 14))
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 10, v11 + 1);
    v14 = google::protobuf::internal::GenericTypeHandler<versioned_document::Version>::New();
    v15 = *((_QWORD *)a3 + 5);
    v16 = *(int32x2_t *)((char *)a3 + 48);
    *((int32x2_t *)a3 + 6) = vadd_s32(v16, (int32x2_t)0x100000001);
    *(_QWORD *)(v15 + 8 * v16.i32[0]) = v14;
  }
  else
  {
    v13 = *((_QWORD *)a3 + 5);
    *((_DWORD *)a3 + 12) = v12 + 1;
    v14 = *(versioned_document::Version **)(v13 + 8 * v12);
  }
  -[ICTTVersionedDocument saveCurrentVersion:](self, "saveCurrentVersion:", v14);
}

- (void)documentArchive
{
  return self->_documentArchive;
}

- (void)setDocumentArchive:(void *)a3
{
  self->_documentArchive = a3;
}

void __34__ICTTVersionedDocument_loadData___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "ICTTVersionedDocument gzipped protobuf corrupt.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __34__ICTTVersionedDocument_loadData___block_invoke_cold_2(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICTTVersionedDocument is wrong versionedDocumentSerializationVersion %d != %d.", buf, 0xEu);
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "ICTTVersionedDocument did not load any compatible version.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Should not attempt to load invalid version.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)serialize
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_1_9(1.5047e-36, a1, a2, a3);
  OUTLINED_FUNCTION_2_5(&dword_1BD918000, "Saving versioned document %d with %d future versions.", v3, v4);
}

@end
