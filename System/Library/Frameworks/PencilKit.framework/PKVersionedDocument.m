@implementation PKVersionedDocument

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

+ (unsigned)versionedDocumentSerializationVersion
{
  return 0;
}

- (PKVersionedDocument)init
{
  PKVersionedDocument *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKVersionedDocument;
  v2 = -[PKVersionedDocument init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)v3 = off_1E7774868;
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 0;
    *(_DWORD *)(v3 + 36) = 0;
    v2->_documentArchive = (void *)v3;
  }
  return v2;
}

- (PKVersionedDocument)initWithData:(id)a3
{
  id v4;
  PKVersionedDocument *v5;
  PKVersionedDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKVersionedDocument;
  v5 = -[PKVersionedDocument init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKVersionedDocument loadData:](v5, "loadData:", v4);

  return v6;
}

- (PKVersionedDocument)initWithUnzippedData:(id)a3
{
  id v4;
  PKVersionedDocument *v5;
  PKVersionedDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKVersionedDocument;
  v5 = -[PKVersionedDocument init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKVersionedDocument loadUnzippedData:](v5, "loadUnzippedData:", v4);

  return v6;
}

- (PKVersionedDocument)initWithArchive:(const void *)a3
{
  PKVersionedDocument *v4;
  PKVersionedDocument *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKVersionedDocument;
  v4 = -[PKVersionedDocument init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PKVersionedDocument loadArchive:](v4, "loadArchive:", a3);
  return v5;
}

- (BOOL)loadData:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD activity_block[4];
  id v9;
  PKVersionedDocument *v10;
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
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __32__PKVersionedDocument_loadData___block_invoke;
  activity_block[3] = &unk_1E777CB38;
  v10 = self;
  v11 = &v12;
  v9 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1BE213000, "Unzipping versioned document", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v6 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

void __32__PKVersionedDocument_loadData___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "PK_gzipInflate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "loadUnzippedData:", v2);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v3 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v4 = 0;
        _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "PKVersionedDocument gzipped protobuf corrupt.", v4, 2u);
      }

    }
  }

}

- (BOOL)loadUnzippedData:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD activity_block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __40__PKVersionedDocument_loadUnzippedData___block_invoke;
  activity_block[3] = &unk_1E777B180;
  activity_block[4] = self;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  _os_activity_initiate(&dword_1BE213000, "Loading versioned document", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __40__PKVersionedDocument_loadUnzippedData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  const unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  _BYTE v7[32];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = operator new();
    *(_QWORD *)v2 = off_1E7774868;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)(v2 + 24) = 0;
    *(_DWORD *)(v2 + 36) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v2;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v4 = (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease((id)result), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    result = PB::Reader::Reader((PB::Reader *)v7, v4);
    if (*(_QWORD *)(a1 + 40))
    {
      result = (*(uint64_t (**)(_QWORD, _BYTE *))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v7);
      if ((_DWORD)result)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if ((*(_BYTE *)(v5 + 36) & 1) != 0)
        {
          v6 = *(_DWORD *)(v5 + 32);
          result = +[PKVersionedDocument versionedDocumentSerializationVersion](PKVersionedDocument, "versionedDocumentSerializationVersion");
          if (v6 == (_DWORD)result)
          {
            result = objc_msgSend(*(id *)(a1 + 32), "loadDocumentArchive:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
          }
        }
      }
    }
  }
  return result;
}

- (void)loadArchive:(const void *)a3
{
  versioned_document::Document *v5;

  v5 = (versioned_document::Document *)operator new();
  self->_documentArchive = versioned_document::Document::Document(v5, (const versioned_document::Document *)a3);
  -[PKVersionedDocument loadDocumentArchive:](self, "loadDocumentArchive:", v5);
}

- (BOOL)loadDocumentArchive:(void *)a3
{
  unsigned int v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  NSObject *v20;
  unsigned int v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  NSObject *v25;
  unsigned int v26;
  int v27;
  __int128 v29;
  unsigned int v30;
  uint8_t buf[4];
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
  v7 = *((_QWORD *)a3 + 1);
  v8 = *((_QWORD *)a3 + 2) - v7;
  v9 = v8 >> 3;
  if (!(v8 >> 3))
    goto LABEL_26;
  v10 = v5;
  v11 = 0;
  v12 = (v8 >> 3);
  v13 = -1;
  do
  {
    v14 = *(_QWORD *)(v7 + 8 * v11);
    if (*(_DWORD *)(v14 + 20) < v5)
    {
      if (v13 < 0)
        v13 = v11;
      if (v13 < 0)
        goto LABEL_26;
LABEL_8:
      v15 = v9 - v13;
      if (v9 <= v13)
        return 1;
      v16 = 8 * v13;
      *(_QWORD *)&v6 = 67109632;
      v29 = v6;
      while (1)
      {
        v17 = *(_QWORD *)(*((_QWORD *)a3 + 1) + v16);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", **(_QWORD **)(v17 + 8), *(_QWORD *)(*(_QWORD *)(v17 + 8) + 8), 0, v29);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_DWORD *)(v17 + 20);
        if (v19 >= v10)
        {
          if (v19 == v10)
          {
            v20 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              v32 = v10;
              v22 = v20;
              v23 = "Loading current version %d";
              v24 = 8;
              goto LABEL_20;
            }
          }
          else
          {
            v30 = *(_DWORD *)(v17 + 16);
            v25 = os_log_create("com.apple.pencilkit", ");
            v20 = v25;
            if (v30 > v10)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1BE213000, v20, OS_LOG_TYPE_ERROR, "Should not attempt to load invalid version.", buf, 2u);
              }

              goto LABEL_28;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v27 = *(_DWORD *)(v17 + 16);
              v26 = *(_DWORD *)(v17 + 20);
              *(_DWORD *)buf = v29;
              v32 = v26;
              v33 = 1024;
              v34 = v10;
              v35 = 1024;
              v36 = v27;
              v22 = v20;
              v23 = "Loading future version %d > %d where min-supported %d";
              v24 = 20;
              goto LABEL_20;
            }
          }
        }
        else
        {
          v20 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = *(_DWORD *)(v17 + 20);
            *(_DWORD *)buf = 67109376;
            v32 = v21;
            v33 = 1024;
            v34 = v10;
            v22 = v20;
            v23 = "Loading old version %d < %d";
            v24 = 14;
LABEL_20:
            _os_log_debug_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEBUG, v23, buf, v24);
          }
        }

        -[PKVersionedDocument mergeVersion:fromData:](self, "mergeVersion:fromData:", *(unsigned int *)(v17 + 20), v18);
        v16 += 8;
        if (!--v15)
          return 1;
      }
    }
    if (*(_DWORD *)(v14 + 16) <= v5)
      v13 = v11;
    ++v11;
  }
  while (v12 != v11);
  if ((v13 & 0x80000000) == 0)
    goto LABEL_8;
LABEL_26:
  v18 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE213000, v18, OS_LOG_TYPE_ERROR, "PKVersionedDocument did not load any compatible version.", buf, 2u);
  }
LABEL_28:

  return 1;
}

- (void)dealloc
{
  void *documentArchive;
  objc_super v4;

  documentArchive = self->_documentArchive;
  if (documentArchive)
    (*(void (**)(void *, SEL))(*(_QWORD *)documentArchive + 8))(documentArchive, a2);
  v4.receiver = self;
  v4.super_class = (Class)PKVersionedDocument;
  -[PKVersionedDocument dealloc](&v4, sel_dealloc);
}

- (unint64_t)futureVersionCount
{
  return (uint64_t)(*((_QWORD *)self->_documentArchive + 2) - *((_QWORD *)self->_documentArchive + 1)) >> 3;
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  return 0;
}

- (void)saveCurrentVersion:(void *)a3
{
  int v5;
  void *v6;
  int v7;
  id v8;
  const unsigned __int8 *v9;
  void ***v10;
  void **v11;
  void **v12;
  uint64_t v13;
  int v14;
  void **v15;

  v5 = objc_msgSend((id)objc_opt_class(), "minimumSupportedVersion");
  v14 = 0;
  -[PKVersionedDocument serializeCurrentVersion:](self, "serializeCurrentVersion:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  *((_BYTE *)a3 + 24) |= 3u;
  *((_DWORD *)a3 + 4) = v5;
  *((_DWORD *)a3 + 5) = v7;
  v8 = objc_retainAutorelease(v6);
  v9 = (const unsigned __int8 *)objc_msgSend(v8, "bytes");
  v12 = (void **)*((_QWORD *)a3 + 1);
  v10 = (void ***)((char *)a3 + 8);
  v11 = v12;
  if (!v12)
  {
    v13 = operator new();
    *(_QWORD *)v13 = 0;
    *(_QWORD *)(v13 + 8) = 0;
    v15 = 0;
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v10, (void **)v13);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](&v15, 0);
    v11 = *v10;
  }
  PB::Data::assign((PB::Data *)v11, v9, &v9[objc_msgSend(v8, "length")]);

}

- (unint64_t)mergeWithVersionedDocument:(id)a3
{
  return 1;
}

- (unsigned)maxDocumentVersion
{
  _QWORD *v3;

  v3 = -[PKVersionedDocument documentArchive](self, "documentArchive");
  if (v3[2] == v3[1])
    return objc_msgSend((id)objc_opt_class(), "serializationVersion");
  else
    return *(_DWORD *)(**(_QWORD **)(-[PKVersionedDocument documentArchive](self, "documentArchive") + 8) + 20);
}

- (id)serialize
{
  NSObject *v3;
  _BYTE *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
    v17 = -[PKVersionedDocument documentArchive](self, "documentArchive");
    v18 = (uint64_t)(v17[2] - v17[1]) >> 3;
    LODWORD(v19) = 67109376;
    HIDWORD(v19) = v16;
    LOWORD(v20[0]) = 2048;
    *(_QWORD *)((char *)v20 + 2) = v18;
    _os_log_debug_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEBUG, "Saving versioned document %d with %ld future versions.", (uint8_t *)&v19, 0x12u);
  }

  v4 = -[PKVersionedDocument documentArchive](self, "documentArchive");
  v5 = +[PKVersionedDocument versionedDocumentSerializationVersion](PKVersionedDocument, "versionedDocumentSerializationVersion");
  v4[36] |= 1u;
  *((_DWORD *)v4 + 8) = v5;
  PB::PtrVector<versioned_document::Version>::emplace_back<>((uint64_t **)(-[PKVersionedDocument documentArchive](self, "documentArchive")+ 8));
  -[PKVersionedDocument saveCurrentVersion:](self, "saveCurrentVersion:", *(_QWORD *)(*(_QWORD *)(-[PKVersionedDocument documentArchive](self, "documentArchive") + 16) - 8));
  v6 = -[PKVersionedDocument documentArchive](self, "documentArchive");
  PB::Writer::Writer((PB::Writer *)&v19);
  (*(void (**)(void *, uint64_t *))(*(_QWORD *)v6 + 24))(v6, &v19);
  v7 = objc_alloc(MEMORY[0x1E0C99D50]);
  v8 = (void *)objc_msgSend(v7, "initWithBytes:length:", v20[0], v19 - v20[0]);
  PB::Writer::~Writer((PB::Writer *)&v19);
  v9 = -[PKVersionedDocument documentArchive](self, "documentArchive");
  v10 = v9[2];
  v13 = *(_QWORD *)(v10 - 8);
  v12 = (_QWORD *)(v10 - 8);
  v11 = v13;
  *v12 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v9[2] = v12;
  objc_msgSend(v8, "PK_gzipDeflate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)saveToArchive:(void *)a3
{
  NSObject *v5;
  unsigned int v6;
  _QWORD *v7;
  const versioned_document::Version **v8;
  const versioned_document::Version **v9;
  int64x2_t *v10;
  const versioned_document::Version *v11;
  versioned_document::Version *v12;
  unint64_t v13;
  versioned_document::Version **v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  versioned_document::Version **v21;
  char *v22;
  _QWORD *v23;
  _QWORD *v24;
  versioned_document::Version *v25;
  int64x2_t v26;
  char *v27;
  int v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  int64x2_t v32;
  char *v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v28 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
    v29 = -[PKVersionedDocument documentArchive](self, "documentArchive");
    v30 = (uint64_t)(v29[2] - v29[1]) >> 3;
    LODWORD(v31) = 67109376;
    HIDWORD(v31) = v28;
    v32.i16[0] = 2048;
    *(uint64_t *)((char *)v32.i64 + 2) = v30;
    _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "Saving versioned document %d with %ld future versions.", (uint8_t *)&v31, 0x12u);
  }

  versioned_document::Document::operator=((uint64_t)a3, (const versioned_document::Document *)self->_documentArchive);
  v6 = +[PKVersionedDocument versionedDocumentSerializationVersion](PKVersionedDocument, "versionedDocumentSerializationVersion");
  *((_BYTE *)a3 + 36) |= 1u;
  *((_DWORD *)a3 + 8) = v6;
  v7 = -[PKVersionedDocument documentArchive](self, "documentArchive");
  v8 = (const versioned_document::Version **)v7[1];
  v9 = (const versioned_document::Version **)v7[2];
  if (v8 != v9)
  {
    v10 = (int64x2_t *)((char *)a3 + 8);
    do
    {
      v11 = *v8;
      v12 = (versioned_document::Version *)operator new();
      versioned_document::Version::Version(v12, v11);
      v14 = (versioned_document::Version **)*((_QWORD *)a3 + 2);
      v13 = *((_QWORD *)a3 + 3);
      if ((unint64_t)v14 >= v13)
      {
        v16 = ((uint64_t)v14 - v10->i64[0]) >> 3;
        if ((unint64_t)(v16 + 1) >> 61)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v17 = v13 - v10->i64[0];
        v18 = v17 >> 2;
        if (v17 >> 2 <= (unint64_t)(v16 + 1))
          v18 = v16 + 1;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
          v19 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v19 = v18;
        v34 = (char *)a3 + 24;
        if (v19)
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 24, v19);
        else
          v20 = 0;
        v21 = (versioned_document::Version **)&v20[8 * v16];
        v22 = &v20[8 * v19];
        v33 = v22;
        *v21 = v12;
        v15 = v21 + 1;
        v32.i64[1] = (uint64_t)(v21 + 1);
        v24 = (_QWORD *)*((_QWORD *)a3 + 1);
        v23 = (_QWORD *)*((_QWORD *)a3 + 2);
        if (v23 == v24)
        {
          v26 = vdupq_n_s64((unint64_t)v23);
        }
        else
        {
          do
          {
            v25 = (versioned_document::Version *)*--v23;
            *v23 = 0;
            *--v21 = v25;
          }
          while (v23 != v24);
          v26 = *v10;
          v15 = (_QWORD *)v32.i64[1];
          v22 = v33;
        }
        *((_QWORD *)a3 + 1) = v21;
        *((_QWORD *)a3 + 2) = v15;
        v32 = v26;
        v27 = (char *)*((_QWORD *)a3 + 3);
        *((_QWORD *)a3 + 3) = v22;
        v33 = v27;
        v31 = v26.i64[0];
        std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((uint64_t)&v31);
      }
      else
      {
        *v14 = v12;
        v15 = v14 + 1;
      }
      *((_QWORD *)a3 + 2) = v15;
      ++v8;
    }
    while (v8 != v9);
  }
  PB::PtrVector<versioned_document::Version>::emplace_back<>((uint64_t **)a3 + 1);
  -[PKVersionedDocument saveCurrentVersion:](self, "saveCurrentVersion:", *(_QWORD *)(*((_QWORD *)a3 + 2) - 8));
}

- (void)documentArchive
{
  return self->_documentArchive;
}

- (void)setDocumentArchive:(void *)a3
{
  self->_documentArchive = a3;
}

@end
