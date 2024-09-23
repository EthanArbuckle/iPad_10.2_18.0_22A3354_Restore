@implementation ICAirDropDocument

+ (id)documentAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "url.fileURL", "+[ICAirDropDocument documentAtURL:]", 1, 0, CFSTR("Airdrop document is not a file url %@"), v4);
  if (objc_msgSend(v4, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentsAtPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v7);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0D641A0];
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "data", "+[ICAirDropDocument documentAtURL:]", 1, 0, CFSTR("Failed to get data from path %@"), v10);

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ICAirDropDocument)initWithData:(id)a3
{
  id v4;
  ICAirDropDocument *v5;
  ICAirDropDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAirDropDocument;
  v5 = -[ICAirDropDocument init](&v8, sel_init);
  v6 = v5;
  if (v5
    && !ICProtobufUtilitiesParseArchiveFromNSData<airdrop_document::Document>((google::protobuf::MessageLite *)&v5->_document, v4))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAirDropDocument initWithData:]", 1, 0, CFSTR("Failed to parse archive from data with length %lu"), objc_msgSend(v4, "length"));

    v6 = 0;
  }

  return v6;
}

- (BOOL)hasDocumentForNote
{
  return self->_document._unknown_fields_.__r_.var0 & 1;
}

- (BOOL)hasDocumentForLegacyNote
{
  return (LOBYTE(self->_document._unknown_fields_.__r_.var0) >> 1) & 1;
}

- (void)document
{
  return &self->_document;
}

- (id)activityItem
{
  return ICProtobufUtilitiesNSDataFromArchive<airdrop_document::Document>((google::protobuf::MessageLite *)&self->_document);
}

- (void).cxx_destruct
{
  airdrop_document::Document::~Document((airdrop_document::Document *)&self->_document);
}

- (id).cxx_construct
{
  airdrop_document::Document::Document((airdrop_document::Document *)&self->_document);
  return self;
}

+ (BOOL)canAirDropImportIntoAccount:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL4 v7;

  v5 = a3;
  v6 = a4;
  if (v5)
    v7 = !+[ICLegacyAccountUtilities didChooseToMigrateAccount:context:](ICLegacyAccountUtilities, "didChooseToMigrateAccount:context:", v5, v6);
  else
    LOBYTE(v7) = 0;

  return v7;
}

+ (id)legacyNoteAirDropDocumentWithData:(id)a3
{
  id v3;
  ICAirDropDocument *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;

  v3 = a3;
  v4 = objc_alloc_init(ICAirDropDocument);
  v5 = -[ICAirDropDocument document](v4, "document");
  *(_DWORD *)(v5 + 32) |= 2u;
  v6 = *(_QWORD *)(v5 + 48);
  if (!v6)
  {
    v6 = operator new();
    airdrop_document::LegacyNoteDocument::LegacyNoteDocument((airdrop_document::LegacyNoteDocument *)v6);
    *(_QWORD *)(v5 + 48) = v6;
  }
  *(_DWORD *)(v6 + 32) |= 1u;
  v7 = *(_QWORD *)(v6 + 40);
  if (!v7)
  {
    v7 = operator new();
    airdrop_document::LegacyNoteDocument1_0::LegacyNoteDocument1_0((airdrop_document::LegacyNoteDocument1_0 *)v7);
    *(_QWORD *)(v6 + 40) = v7;
  }
  *(_DWORD *)(v7 + 32) |= 1u;
  v8 = *(_QWORD *)(v7 + 40);
  if (!v8)
  {
    v8 = operator new();
    airdrop_document::WebArchive::WebArchive((airdrop_document::WebArchive *)v8);
    *(_QWORD *)(v7 + 40) = v8;
  }
  v9 = objc_retainAutorelease(v3);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  *(_DWORD *)(v8 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(v8 + 40) == google::protobuf::internal::empty_string_)
  {
    v10 = (_QWORD *)operator new();
    *v10 = 0;
    v10[1] = 0;
    v10[2] = 0;
    *(_QWORD *)(v8 + 40) = v10;
  }
  MEMORY[0x1C3B7A7E8]();

  return v4;
}

- (id)dataFromLegacyNoteDocument
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v2 = -[ICAirDropDocument document](self, "document");
  v3 = v2;
  if ((v2[32] & 2) == 0)
  {
    v2 = (_BYTE *)objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "document.has_legacynotedocument()", "-[ICAirDropDocument(Legacy) dataFromLegacyNoteDocument]", 1, 0, CFSTR("AirDrop document does not have legacy note document"));
    if ((v3[32] & 2) == 0)
      goto LABEL_11;
  }
  v4 = *((_QWORD *)v3 + 6);
  if (!v4)
  {
    v2 = (_BYTE *)airdrop_document::Document::default_instance((airdrop_document::Document *)v2);
    v4 = *((_QWORD *)v2 + 6);
  }
  if ((*(_BYTE *)(v4 + 32) & 1) == 0)
  {
    v2 = (_BYTE *)objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "legacyNoteDocument.has_version1_0()", "-[ICAirDropDocument(Legacy) dataFromLegacyNoteDocument]", 1, 0, CFSTR("Failed to find any legacy note document version"));
    if ((*(_BYTE *)(v4 + 32) & 1) == 0)
      goto LABEL_11;
  }
  v5 = *(_QWORD *)(v4 + 40);
  if (!v5)
  {
    v2 = (_BYTE *)airdrop_document::LegacyNoteDocument::default_instance((airdrop_document::LegacyNoteDocument *)v2);
    v5 = *((_QWORD *)v2 + 5);
  }
  if ((*(_BYTE *)(v5 + 32) & 1) != 0
    || (v2 = (_BYTE *)objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "version1_0.has_webarchive()", "-[ICAirDropDocument(Legacy) dataFromLegacyNoteDocument]", 1, 0, CFSTR("No archive found from legacy version 1.0 data")), (*(_BYTE *)(v5 + 32) & 1) != 0))
  {
    v7 = *(_QWORD *)(v5 + 40);
    if (!v7)
      v7 = *(_QWORD *)(airdrop_document::LegacyNoteDocument1_0::default_instance((airdrop_document::LegacyNoteDocument1_0 *)v2)
                     + 40);
    v8 = *(uint64_t **)(v7 + 40);
    if (*((char *)v8 + 23) < 0)
    {
      v8 = (uint64_t *)*v8;
      v9 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8);
    }
    else
    {
      v9 = *((unsigned __int8 *)v8 + 23);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v6 = 0;
  }
  return v6;
}

@end
