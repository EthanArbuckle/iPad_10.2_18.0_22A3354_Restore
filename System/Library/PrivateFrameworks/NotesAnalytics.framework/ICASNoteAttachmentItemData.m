@implementation ICASNoteAttachmentItemData

- (ICASNoteAttachmentItemData)initWithTotalCountOfNotesWithAttachmentDocScan:(id)a3 totalCountOfNotesWithAttachmentInlineDrawingV1:(id)a4 totalCountOfNotesWithAttachmentInlineDrawingV2:(id)a5 totalCountOfNotesWithAttachmentPaperKit:(id)a6 totalCountOfNotesWithAttachmentFullscreenDrawing:(id)a7 totalCountOfNotesWithAttachmentTables:(id)a8 totalCountOfNotesWithAttachmentOther:(id)a9 totalCountOfNotesWithAttachmentRichUrl:(id)a10 totalCountOfNotesWithAttachmentMapLink:(id)a11 totalCountOfNotesWithAttachmentDeepLink:(id)a12 totalCountOfNotesWithPaperDocument:(id)a13 totalCountOfNotesWithPdfDocument:(id)a14 totalCountOfNotesWithNoteLinks:(id)a15 totalCountOfNotesWithFolderLinks:(id)a16 totalCountOfNotesWithAttachmentAudio:(id)a17 totalCountOfAudioAttachments:(id)a18 totalCountOfAudioAttachmentsRecordedInNotes:(id)a19 totalCountOfAudioAttachmentsWithAppendedAudio:(id)a20 totalCountOfNotesWithAttachmentAudioTranscript:(id)a21 totalCountOfNotesWithAttachmentAudioSummary:(id)a22
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  ICASNoteAttachmentItemData *v34;
  ICASNoteAttachmentItemData *v35;
  id v38;
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
  objc_super v55;

  v54 = a3;
  v38 = a4;
  v53 = a4;
  v39 = a5;
  v52 = a5;
  v40 = a6;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a13;
  v43 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v42 = a22;
  v55.receiver = self;
  v55.super_class = (Class)ICASNoteAttachmentItemData;
  v34 = -[ICASNoteAttachmentItemData init](&v55, sel_init);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_totalCountOfNotesWithAttachmentDocScan, a3);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentInlineDrawingV1, v38);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentInlineDrawingV2, v39);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentPaperKit, v40);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentFullscreenDrawing, a7);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentTables, a8);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentOther, a9);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentRichUrl, a10);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentMapLink, a11);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentDeepLink, a12);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithPaperDocument, a13);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithPdfDocument, a14);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithNoteLinks, a15);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithFolderLinks, a16);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentAudio, a17);
    objc_storeStrong((id *)&v35->_totalCountOfAudioAttachments, a18);
    objc_storeStrong((id *)&v35->_totalCountOfAudioAttachmentsRecordedInNotes, a19);
    objc_storeStrong((id *)&v35->_totalCountOfAudioAttachmentsWithAppendedAudio, a20);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentAudioTranscript, a21);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentAudioSummary, a22);
  }

  return v35;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("NoteAttachmentItemData");
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
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
  _QWORD v65[20];
  _QWORD v66[22];

  v66[20] = *MEMORY[0x1E0C80C00];
  v65[0] = CFSTR("totalCountOfNotesWithAttachmentDocScan");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentDocScan](self, "totalCountOfNotesWithAttachmentDocScan");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentDocScan](self, "totalCountOfNotesWithAttachmentDocScan");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v63 = (void *)v3;
  v66[0] = v3;
  v65[1] = CFSTR("totalCountOfNotesWithAttachmentInlineDrawingV1");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentInlineDrawingV1](self, "totalCountOfNotesWithAttachmentInlineDrawingV1");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentInlineDrawingV1](self, "totalCountOfNotesWithAttachmentInlineDrawingV1");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v61 = (void *)v4;
  v66[1] = v4;
  v65[2] = CFSTR("totalCountOfNotesWithAttachmentInlineDrawingV2");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentInlineDrawingV2](self, "totalCountOfNotesWithAttachmentInlineDrawingV2");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentInlineDrawingV2](self, "totalCountOfNotesWithAttachmentInlineDrawingV2");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v59 = (void *)v5;
  v66[2] = v5;
  v65[3] = CFSTR("totalCountOfNotesWithAttachmentPaperKit");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentPaperKit](self, "totalCountOfNotesWithAttachmentPaperKit");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentPaperKit](self, "totalCountOfNotesWithAttachmentPaperKit");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v57 = (void *)v6;
  v66[3] = v6;
  v65[4] = CFSTR("totalCountOfNotesWithAttachmentFullscreenDrawing");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentFullscreenDrawing](self, "totalCountOfNotesWithAttachmentFullscreenDrawing");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentFullscreenDrawing](self, "totalCountOfNotesWithAttachmentFullscreenDrawing");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v55 = (void *)v7;
  v66[4] = v7;
  v65[5] = CFSTR("totalCountOfNotesWithAttachmentTables");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentTables](self, "totalCountOfNotesWithAttachmentTables");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentTables](self, "totalCountOfNotesWithAttachmentTables");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v53 = (void *)v8;
  v66[5] = v8;
  v65[6] = CFSTR("totalCountOfNotesWithAttachmentOther");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentOther](self, "totalCountOfNotesWithAttachmentOther");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentOther](self, "totalCountOfNotesWithAttachmentOther");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v51 = (void *)v9;
  v66[6] = v9;
  v65[7] = CFSTR("totalCountOfNotesWithAttachmentRichUrl");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentRichUrl](self, "totalCountOfNotesWithAttachmentRichUrl");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentRichUrl](self, "totalCountOfNotesWithAttachmentRichUrl");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v49 = (void *)v10;
  v66[7] = v10;
  v65[8] = CFSTR("totalCountOfNotesWithAttachmentMapLink");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentMapLink](self, "totalCountOfNotesWithAttachmentMapLink");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentMapLink](self, "totalCountOfNotesWithAttachmentMapLink");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v47 = (void *)v11;
  v66[8] = v11;
  v65[9] = CFSTR("totalCountOfNotesWithAttachmentDeepLink");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentDeepLink](self, "totalCountOfNotesWithAttachmentDeepLink");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentDeepLink](self, "totalCountOfNotesWithAttachmentDeepLink");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v45 = (void *)v12;
  v66[9] = v12;
  v65[10] = CFSTR("totalCountOfNotesWithPaperDocument");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithPaperDocument](self, "totalCountOfNotesWithPaperDocument");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithPaperDocument](self, "totalCountOfNotesWithPaperDocument");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v43 = (void *)v13;
  v66[10] = v13;
  v65[11] = CFSTR("totalCountOfNotesWithPdfDocument");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithPdfDocument](self, "totalCountOfNotesWithPdfDocument");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithPdfDocument](self, "totalCountOfNotesWithPdfDocument");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v41 = (void *)v14;
  v66[11] = v14;
  v65[12] = CFSTR("totalCountOfNotesWithNoteLinks");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithNoteLinks](self, "totalCountOfNotesWithNoteLinks");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithNoteLinks](self, "totalCountOfNotesWithNoteLinks");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v39 = (void *)v15;
  v66[12] = v15;
  v65[13] = CFSTR("totalCountOfNotesWithFolderLinks");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithFolderLinks](self, "totalCountOfNotesWithFolderLinks");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithFolderLinks](self, "totalCountOfNotesWithFolderLinks");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v37 = (void *)v16;
  v66[13] = v16;
  v65[14] = CFSTR("totalCountOfNotesWithAttachmentAudio");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentAudio](self, "totalCountOfNotesWithAttachmentAudio");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentAudio](self, "totalCountOfNotesWithAttachmentAudio");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v35 = (void *)v17;
  v66[14] = v17;
  v65[15] = CFSTR("totalCountOfAudioAttachments");
  -[ICASNoteAttachmentItemData totalCountOfAudioAttachments](self, "totalCountOfAudioAttachments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ICASNoteAttachmentItemData totalCountOfAudioAttachments](self, "totalCountOfAudioAttachments");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v66[15] = v19;
  v65[16] = CFSTR("totalCountOfAudioAttachmentsRecordedInNotes");
  -[ICASNoteAttachmentItemData totalCountOfAudioAttachmentsRecordedInNotes](self, "totalCountOfAudioAttachmentsRecordedInNotes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[ICASNoteAttachmentItemData totalCountOfAudioAttachmentsRecordedInNotes](self, "totalCountOfAudioAttachmentsRecordedInNotes");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = objc_opt_new();
  }
  v23 = (void *)v22;
  v66[16] = v22;
  v65[17] = CFSTR("totalCountOfAudioAttachmentsWithAppendedAudio");
  -[ICASNoteAttachmentItemData totalCountOfAudioAttachmentsWithAppendedAudio](self, "totalCountOfAudioAttachmentsWithAppendedAudio");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICASNoteAttachmentItemData totalCountOfAudioAttachmentsWithAppendedAudio](self, "totalCountOfAudioAttachmentsWithAppendedAudio");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = objc_opt_new();
  }
  v26 = (void *)v25;
  v66[17] = v25;
  v65[18] = CFSTR("totalCountOfNotesWithAttachmentAudioTranscript");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentAudioTranscript](self, "totalCountOfNotesWithAttachmentAudioTranscript");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentAudioTranscript](self, "totalCountOfNotesWithAttachmentAudioTranscript");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = objc_opt_new();
  }
  v29 = (void *)v28;
  v66[18] = v28;
  v65[19] = CFSTR("totalCountOfNotesWithAttachmentAudioSummary");
  -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentAudioSummary](self, "totalCountOfNotesWithAttachmentAudioSummary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[ICASNoteAttachmentItemData totalCountOfNotesWithAttachmentAudioSummary](self, "totalCountOfNotesWithAttachmentAudioSummary");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = objc_opt_new();
  }
  v32 = (void *)v31;
  v66[19] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 20);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (NSNumber)totalCountOfNotesWithAttachmentDocScan
{
  return self->_totalCountOfNotesWithAttachmentDocScan;
}

- (NSNumber)totalCountOfNotesWithAttachmentInlineDrawingV1
{
  return self->_totalCountOfNotesWithAttachmentInlineDrawingV1;
}

- (NSNumber)totalCountOfNotesWithAttachmentInlineDrawingV2
{
  return self->_totalCountOfNotesWithAttachmentInlineDrawingV2;
}

- (NSNumber)totalCountOfNotesWithAttachmentPaperKit
{
  return self->_totalCountOfNotesWithAttachmentPaperKit;
}

- (NSNumber)totalCountOfNotesWithAttachmentFullscreenDrawing
{
  return self->_totalCountOfNotesWithAttachmentFullscreenDrawing;
}

- (NSNumber)totalCountOfNotesWithAttachmentTables
{
  return self->_totalCountOfNotesWithAttachmentTables;
}

- (NSNumber)totalCountOfNotesWithAttachmentOther
{
  return self->_totalCountOfNotesWithAttachmentOther;
}

- (NSNumber)totalCountOfNotesWithAttachmentRichUrl
{
  return self->_totalCountOfNotesWithAttachmentRichUrl;
}

- (NSNumber)totalCountOfNotesWithAttachmentMapLink
{
  return self->_totalCountOfNotesWithAttachmentMapLink;
}

- (NSNumber)totalCountOfNotesWithAttachmentDeepLink
{
  return self->_totalCountOfNotesWithAttachmentDeepLink;
}

- (NSNumber)totalCountOfNotesWithPaperDocument
{
  return self->_totalCountOfNotesWithPaperDocument;
}

- (NSNumber)totalCountOfNotesWithPdfDocument
{
  return self->_totalCountOfNotesWithPdfDocument;
}

- (NSNumber)totalCountOfNotesWithNoteLinks
{
  return self->_totalCountOfNotesWithNoteLinks;
}

- (NSNumber)totalCountOfNotesWithFolderLinks
{
  return self->_totalCountOfNotesWithFolderLinks;
}

- (NSNumber)totalCountOfNotesWithAttachmentAudio
{
  return self->_totalCountOfNotesWithAttachmentAudio;
}

- (NSNumber)totalCountOfAudioAttachments
{
  return self->_totalCountOfAudioAttachments;
}

- (NSNumber)totalCountOfAudioAttachmentsRecordedInNotes
{
  return self->_totalCountOfAudioAttachmentsRecordedInNotes;
}

- (NSNumber)totalCountOfAudioAttachmentsWithAppendedAudio
{
  return self->_totalCountOfAudioAttachmentsWithAppendedAudio;
}

- (NSNumber)totalCountOfNotesWithAttachmentAudioTranscript
{
  return self->_totalCountOfNotesWithAttachmentAudioTranscript;
}

- (NSNumber)totalCountOfNotesWithAttachmentAudioSummary
{
  return self->_totalCountOfNotesWithAttachmentAudioSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentAudioSummary, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentAudioTranscript, 0);
  objc_storeStrong((id *)&self->_totalCountOfAudioAttachmentsWithAppendedAudio, 0);
  objc_storeStrong((id *)&self->_totalCountOfAudioAttachmentsRecordedInNotes, 0);
  objc_storeStrong((id *)&self->_totalCountOfAudioAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentAudio, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFolderLinks, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithNoteLinks, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithPdfDocument, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithPaperDocument, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentDeepLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentMapLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentRichUrl, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentOther, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentPaperKit, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentDocScan, 0);
}

@end
