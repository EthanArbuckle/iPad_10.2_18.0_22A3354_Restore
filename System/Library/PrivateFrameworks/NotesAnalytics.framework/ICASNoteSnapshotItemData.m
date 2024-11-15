@implementation ICASNoteSnapshotItemData

- (ICASNoteSnapshotItemData)initWithNoteID:(id)a3 noteType:(id)a4 collaborationStatus:(id)a5 collaborationType:(id)a6 countOfInvitees:(id)a7 countOfAcceptances:(id)a8 countOfDocScan:(id)a9 countOfInlineDrawingV1:(id)a10 countOfInlineDrawingV2:(id)a11 countOfFullscreenDrawing:(id)a12 countOfTables:(id)a13 countOfAttachmentOther:(id)a14 hasChecklist:(id)a15 isPinned:(id)a16 isLocked:(id)a17 charLength:(id)a18 creationDate:(id)a19 countOfInlineDrawingV1PencilStrokes:(id)a20 countOfInlineDrawingV1FingerStrokes:(id)a21 countOfInlineDrawingV2PencilStrokes:(id)a22 countOfInlineDrawingV2FingerStrokes:(id)a23 countOfFullscreenDrawingStrokes:(id)a24
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  ICASNoteSnapshotItemData *v35;
  ICASNoteSnapshotItemData *v36;
  id v39;
  id v40;
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
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v57 = a3;
  v39 = a4;
  v56 = a4;
  v40 = a5;
  v55 = a5;
  v54 = a6;
  v53 = a7;
  v52 = a8;
  v51 = a9;
  v50 = a10;
  v49 = a11;
  v48 = a12;
  v47 = a13;
  v46 = a14;
  v45 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = a20;
  v34 = a21;
  v44 = a22;
  v43 = a23;
  v42 = a24;
  v58.receiver = self;
  v58.super_class = (Class)ICASNoteSnapshotItemData;
  v35 = -[ICASNoteSnapshotItemData init](&v58, sel_init);
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_noteID, a3);
    objc_storeStrong((id *)&v36->_noteType, v39);
    objc_storeStrong((id *)&v36->_collaborationStatus, v40);
    objc_storeStrong((id *)&v36->_collaborationType, a6);
    objc_storeStrong((id *)&v36->_countOfInvitees, a7);
    objc_storeStrong((id *)&v36->_countOfAcceptances, a8);
    objc_storeStrong((id *)&v36->_countOfDocScan, a9);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV1, a10);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV2, a11);
    objc_storeStrong((id *)&v36->_countOfFullscreenDrawing, a12);
    objc_storeStrong((id *)&v36->_countOfTables, a13);
    objc_storeStrong((id *)&v36->_countOfAttachmentOther, a14);
    objc_storeStrong((id *)&v36->_hasChecklist, a15);
    objc_storeStrong((id *)&v36->_isPinned, a16);
    objc_storeStrong((id *)&v36->_isLocked, a17);
    objc_storeStrong((id *)&v36->_charLength, a18);
    objc_storeStrong((id *)&v36->_creationDate, a19);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV1PencilStrokes, a20);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV1FingerStrokes, a21);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV2PencilStrokes, a22);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV2FingerStrokes, a23);
    objc_storeStrong((id *)&v36->_countOfFullscreenDrawingStrokes, a24);
  }

  return v36;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("NoteSnapshotItemData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[22];
  _QWORD v72[24];

  v72[22] = *MEMORY[0x1E0C80C00];
  v71[0] = CFSTR("noteID");
  -[ICASNoteSnapshotItemData noteID](self, "noteID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    -[ICASNoteSnapshotItemData noteID](self, "noteID");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v69 = (void *)v3;
  v72[0] = v3;
  v71[1] = CFSTR("noteType");
  -[ICASNoteSnapshotItemData noteType](self, "noteType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    -[ICASNoteSnapshotItemData noteType](self, "noteType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v67 = (void *)v4;
  v72[1] = v4;
  v71[2] = CFSTR("collaborationStatus");
  -[ICASNoteSnapshotItemData collaborationStatus](self, "collaborationStatus");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    -[ICASNoteSnapshotItemData collaborationStatus](self, "collaborationStatus");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v65 = (void *)v5;
  v72[2] = v5;
  v71[3] = CFSTR("collaborationType");
  -[ICASNoteSnapshotItemData collaborationType](self, "collaborationType");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    -[ICASNoteSnapshotItemData collaborationType](self, "collaborationType");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v63 = (void *)v6;
  v72[3] = v6;
  v71[4] = CFSTR("countOfInvitees");
  -[ICASNoteSnapshotItemData countOfInvitees](self, "countOfInvitees");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    -[ICASNoteSnapshotItemData countOfInvitees](self, "countOfInvitees");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v61 = (void *)v7;
  v72[4] = v7;
  v71[5] = CFSTR("countOfAcceptances");
  -[ICASNoteSnapshotItemData countOfAcceptances](self, "countOfAcceptances");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[ICASNoteSnapshotItemData countOfAcceptances](self, "countOfAcceptances");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v59 = (void *)v8;
  v72[5] = v8;
  v71[6] = CFSTR("countOfDocScan");
  -[ICASNoteSnapshotItemData countOfDocScan](self, "countOfDocScan");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    -[ICASNoteSnapshotItemData countOfDocScan](self, "countOfDocScan");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v57 = (void *)v9;
  v72[6] = v9;
  v71[7] = CFSTR("countOfInlineDrawingV1");
  -[ICASNoteSnapshotItemData countOfInlineDrawingV1](self, "countOfInlineDrawingV1");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    -[ICASNoteSnapshotItemData countOfInlineDrawingV1](self, "countOfInlineDrawingV1");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v55 = (void *)v10;
  v72[7] = v10;
  v71[8] = CFSTR("countOfInlineDrawingV2");
  -[ICASNoteSnapshotItemData countOfInlineDrawingV2](self, "countOfInlineDrawingV2");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[ICASNoteSnapshotItemData countOfInlineDrawingV2](self, "countOfInlineDrawingV2");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v53 = (void *)v11;
  v72[8] = v11;
  v71[9] = CFSTR("countOfFullscreenDrawing");
  -[ICASNoteSnapshotItemData countOfFullscreenDrawing](self, "countOfFullscreenDrawing");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[ICASNoteSnapshotItemData countOfFullscreenDrawing](self, "countOfFullscreenDrawing");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v51 = (void *)v12;
  v72[9] = v12;
  v71[10] = CFSTR("countOfTables");
  -[ICASNoteSnapshotItemData countOfTables](self, "countOfTables");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    -[ICASNoteSnapshotItemData countOfTables](self, "countOfTables");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v49 = (void *)v13;
  v72[10] = v13;
  v71[11] = CFSTR("countOfAttachmentOther");
  -[ICASNoteSnapshotItemData countOfAttachmentOther](self, "countOfAttachmentOther");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[ICASNoteSnapshotItemData countOfAttachmentOther](self, "countOfAttachmentOther");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v47 = (void *)v14;
  v72[11] = v14;
  v71[12] = CFSTR("hasChecklist");
  -[ICASNoteSnapshotItemData hasChecklist](self, "hasChecklist");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    -[ICASNoteSnapshotItemData hasChecklist](self, "hasChecklist");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v45 = (void *)v15;
  v72[12] = v15;
  v71[13] = CFSTR("isPinned");
  -[ICASNoteSnapshotItemData isPinned](self, "isPinned");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    -[ICASNoteSnapshotItemData isPinned](self, "isPinned");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v43 = (void *)v16;
  v72[13] = v16;
  v71[14] = CFSTR("isLocked");
  -[ICASNoteSnapshotItemData isLocked](self, "isLocked");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[ICASNoteSnapshotItemData isLocked](self, "isLocked");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v41 = (void *)v17;
  v72[14] = v17;
  v71[15] = CFSTR("charLength");
  -[ICASNoteSnapshotItemData charLength](self, "charLength");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    -[ICASNoteSnapshotItemData charLength](self, "charLength");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_opt_new();
  }
  v39 = (void *)v18;
  v72[15] = v18;
  v71[16] = CFSTR("creationDate");
  -[ICASNoteSnapshotItemData creationDate](self, "creationDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[ICASNoteSnapshotItemData creationDate](self, "creationDate");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v37 = (void *)v19;
  v72[16] = v19;
  v71[17] = CFSTR("countOfInlineDrawingV1PencilStrokes");
  -[ICASNoteSnapshotItemData countOfInlineDrawingV1PencilStrokes](self, "countOfInlineDrawingV1PencilStrokes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[ICASNoteSnapshotItemData countOfInlineDrawingV1PencilStrokes](self, "countOfInlineDrawingV1PencilStrokes");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_opt_new();
  }
  v22 = (void *)v21;
  v72[17] = v21;
  v71[18] = CFSTR("countOfInlineDrawingV1FingerStrokes");
  -[ICASNoteSnapshotItemData countOfInlineDrawingV1FingerStrokes](self, "countOfInlineDrawingV1FingerStrokes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASNoteSnapshotItemData countOfInlineDrawingV1FingerStrokes](self, "countOfInlineDrawingV1FingerStrokes");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = objc_opt_new();
  }
  v25 = (void *)v24;
  v72[18] = v24;
  v71[19] = CFSTR("countOfInlineDrawingV2PencilStrokes");
  -[ICASNoteSnapshotItemData countOfInlineDrawingV2PencilStrokes](self, "countOfInlineDrawingV2PencilStrokes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[ICASNoteSnapshotItemData countOfInlineDrawingV2PencilStrokes](self, "countOfInlineDrawingV2PencilStrokes");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = objc_opt_new();
  }
  v28 = (void *)v27;
  v72[19] = v27;
  v71[20] = CFSTR("countOfInlineDrawingV2FingerStrokes");
  -[ICASNoteSnapshotItemData countOfInlineDrawingV2FingerStrokes](self, "countOfInlineDrawingV2FingerStrokes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[ICASNoteSnapshotItemData countOfInlineDrawingV2FingerStrokes](self, "countOfInlineDrawingV2FingerStrokes");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = objc_opt_new();
  }
  v31 = (void *)v30;
  v72[20] = v30;
  v71[21] = CFSTR("countOfFullscreenDrawingStrokes");
  -[ICASNoteSnapshotItemData countOfFullscreenDrawingStrokes](self, "countOfFullscreenDrawingStrokes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[ICASNoteSnapshotItemData countOfFullscreenDrawingStrokes](self, "countOfFullscreenDrawingStrokes");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = objc_opt_new();
  }
  v34 = (void *)v33;
  v72[21] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 22);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (NSString)noteID
{
  return self->_noteID;
}

- (ICASNoteType)noteType
{
  return self->_noteType;
}

- (ICASCollaborationStatus)collaborationStatus
{
  return self->_collaborationStatus;
}

- (ICASCollaborationType)collaborationType
{
  return self->_collaborationType;
}

- (NSNumber)countOfInvitees
{
  return self->_countOfInvitees;
}

- (NSNumber)countOfAcceptances
{
  return self->_countOfAcceptances;
}

- (NSNumber)countOfDocScan
{
  return self->_countOfDocScan;
}

- (NSNumber)countOfInlineDrawingV1
{
  return self->_countOfInlineDrawingV1;
}

- (NSNumber)countOfInlineDrawingV2
{
  return self->_countOfInlineDrawingV2;
}

- (NSNumber)countOfFullscreenDrawing
{
  return self->_countOfFullscreenDrawing;
}

- (NSNumber)countOfTables
{
  return self->_countOfTables;
}

- (NSNumber)countOfAttachmentOther
{
  return self->_countOfAttachmentOther;
}

- (NSNumber)hasChecklist
{
  return self->_hasChecklist;
}

- (NSNumber)isPinned
{
  return self->_isPinned;
}

- (NSNumber)isLocked
{
  return self->_isLocked;
}

- (NSNumber)charLength
{
  return self->_charLength;
}

- (NSNumber)creationDate
{
  return self->_creationDate;
}

- (NSNumber)countOfInlineDrawingV1PencilStrokes
{
  return self->_countOfInlineDrawingV1PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV1FingerStrokes
{
  return self->_countOfInlineDrawingV1FingerStrokes;
}

- (NSNumber)countOfInlineDrawingV2PencilStrokes
{
  return self->_countOfInlineDrawingV2PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV2FingerStrokes
{
  return self->_countOfInlineDrawingV2FingerStrokes;
}

- (NSNumber)countOfFullscreenDrawingStrokes
{
  return self->_countOfFullscreenDrawingStrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfFullscreenDrawingStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2PencilStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1PencilStrokes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_charLength, 0);
  objc_storeStrong((id *)&self->_isLocked, 0);
  objc_storeStrong((id *)&self->_isPinned, 0);
  objc_storeStrong((id *)&self->_hasChecklist, 0);
  objc_storeStrong((id *)&self->_countOfAttachmentOther, 0);
  objc_storeStrong((id *)&self->_countOfTables, 0);
  objc_storeStrong((id *)&self->_countOfFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_countOfDocScan, 0);
  objc_storeStrong((id *)&self->_countOfAcceptances, 0);
  objc_storeStrong((id *)&self->_countOfInvitees, 0);
  objc_storeStrong((id *)&self->_collaborationType, 0);
  objc_storeStrong((id *)&self->_collaborationStatus, 0);
  objc_storeStrong((id *)&self->_noteType, 0);
  objc_storeStrong((id *)&self->_noteID, 0);
}

@end
