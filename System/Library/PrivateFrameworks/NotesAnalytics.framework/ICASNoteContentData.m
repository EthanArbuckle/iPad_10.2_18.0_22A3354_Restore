@implementation ICASNoteContentData

- (ICASNoteContentData)initWithCharacterCount:(id)a3 hasChecklist:(id)a4 hasStyleFormatting:(id)a5 hasTable:(id)a6 hasAttachmentInlineDrawingV1:(id)a7 hasAttachmentInlineDrawingV2:(id)a8 hasAttachmentFullscreenDrawing:(id)a9 hasAttachmentOther:(id)a10 hasAttachedPhoto:(id)a11 weeksSinceCreation:(id)a12 hasAttachmentRichUrl:(id)a13 hasAttachmentMapLink:(id)a14 hasTags:(id)a15 hasScannedDoc:(id)a16 countOfTags:(id)a17 countOfDistinctTags:(id)a18 hasMentions:(id)a19 countOfMentions:(id)a20 countOfDistinctMentions:(id)a21 hasPaperKitDrawing:(id)a22 hasPaperDocument:(id)a23 hasPdf:(id)a24 countOfNoteLinks:(id)a25 countOfDistinctNoteLinks:(id)a26 countOfFolderLinks:(id)a27 countOfDistinctFolderLinks:(id)a28
{
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  ICASNoteContentData *v39;
  ICASNoteContentData *v40;
  id v43;
  id v44;
  id v45;
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
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  objc_super v67;

  v66 = a3;
  v43 = a4;
  v65 = a4;
  v44 = a5;
  v64 = a5;
  v45 = a6;
  v63 = a6;
  v62 = a7;
  v61 = a8;
  v60 = a9;
  v59 = a10;
  v58 = a11;
  v57 = a12;
  v56 = a13;
  v55 = a14;
  v54 = a15;
  v53 = a16;
  v52 = a17;
  v51 = a18;
  v33 = a19;
  v34 = a20;
  v35 = a21;
  v36 = a22;
  v37 = a23;
  v38 = a24;
  v50 = a25;
  v49 = a26;
  v48 = a27;
  v47 = a28;
  v67.receiver = self;
  v67.super_class = (Class)ICASNoteContentData;
  v39 = -[ICASNoteContentData init](&v67, sel_init);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_characterCount, a3);
    objc_storeStrong((id *)&v40->_hasChecklist, v43);
    objc_storeStrong((id *)&v40->_hasStyleFormatting, v44);
    objc_storeStrong((id *)&v40->_hasTable, v45);
    objc_storeStrong((id *)&v40->_hasAttachmentInlineDrawingV1, a7);
    objc_storeStrong((id *)&v40->_hasAttachmentInlineDrawingV2, a8);
    objc_storeStrong((id *)&v40->_hasAttachmentFullscreenDrawing, a9);
    objc_storeStrong((id *)&v40->_hasAttachmentOther, a10);
    objc_storeStrong((id *)&v40->_hasAttachedPhoto, a11);
    objc_storeStrong((id *)&v40->_weeksSinceCreation, a12);
    objc_storeStrong((id *)&v40->_hasAttachmentRichUrl, a13);
    objc_storeStrong((id *)&v40->_hasAttachmentMapLink, a14);
    objc_storeStrong((id *)&v40->_hasTags, a15);
    objc_storeStrong((id *)&v40->_hasScannedDoc, a16);
    objc_storeStrong((id *)&v40->_countOfTags, a17);
    objc_storeStrong((id *)&v40->_countOfDistinctTags, a18);
    objc_storeStrong((id *)&v40->_hasMentions, a19);
    objc_storeStrong((id *)&v40->_countOfMentions, a20);
    objc_storeStrong((id *)&v40->_countOfDistinctMentions, a21);
    objc_storeStrong((id *)&v40->_hasPaperKitDrawing, a22);
    objc_storeStrong((id *)&v40->_hasPaperDocument, a23);
    objc_storeStrong((id *)&v40->_hasPdf, a24);
    objc_storeStrong((id *)&v40->_countOfNoteLinks, a25);
    objc_storeStrong((id *)&v40->_countOfDistinctNoteLinks, a26);
    objc_storeStrong((id *)&v40->_countOfFolderLinks, a27);
    objc_storeStrong((id *)&v40->_countOfDistinctFolderLinks, a28);
  }

  return v40;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("NoteContentData");
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v40;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[26];
  _QWORD v84[28];

  v84[26] = *MEMORY[0x1E0C80C00];
  v83[0] = CFSTR("characterCount");
  -[ICASNoteContentData characterCount](self, "characterCount");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    -[ICASNoteContentData characterCount](self, "characterCount");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v81 = (void *)v3;
  v84[0] = v3;
  v83[1] = CFSTR("hasChecklist");
  -[ICASNoteContentData hasChecklist](self, "hasChecklist");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    -[ICASNoteContentData hasChecklist](self, "hasChecklist");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v79 = (void *)v4;
  v84[1] = v4;
  v83[2] = CFSTR("hasStyleFormatting");
  -[ICASNoteContentData hasStyleFormatting](self, "hasStyleFormatting");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    -[ICASNoteContentData hasStyleFormatting](self, "hasStyleFormatting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v77 = (void *)v5;
  v84[2] = v5;
  v83[3] = CFSTR("hasTable");
  -[ICASNoteContentData hasTable](self, "hasTable");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    -[ICASNoteContentData hasTable](self, "hasTable");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v75 = (void *)v6;
  v84[3] = v6;
  v83[4] = CFSTR("hasAttachmentInlineDrawingV1");
  -[ICASNoteContentData hasAttachmentInlineDrawingV1](self, "hasAttachmentInlineDrawingV1");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    -[ICASNoteContentData hasAttachmentInlineDrawingV1](self, "hasAttachmentInlineDrawingV1");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v73 = (void *)v7;
  v84[4] = v7;
  v83[5] = CFSTR("hasAttachmentInlineDrawingV2");
  -[ICASNoteContentData hasAttachmentInlineDrawingV2](self, "hasAttachmentInlineDrawingV2");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    -[ICASNoteContentData hasAttachmentInlineDrawingV2](self, "hasAttachmentInlineDrawingV2");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v71 = (void *)v8;
  v84[5] = v8;
  v83[6] = CFSTR("hasAttachmentFullscreenDrawing");
  -[ICASNoteContentData hasAttachmentFullscreenDrawing](self, "hasAttachmentFullscreenDrawing");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    -[ICASNoteContentData hasAttachmentFullscreenDrawing](self, "hasAttachmentFullscreenDrawing");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v69 = (void *)v9;
  v84[6] = v9;
  v83[7] = CFSTR("hasAttachmentOther");
  -[ICASNoteContentData hasAttachmentOther](self, "hasAttachmentOther");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    -[ICASNoteContentData hasAttachmentOther](self, "hasAttachmentOther");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v67 = (void *)v10;
  v84[7] = v10;
  v83[8] = CFSTR("hasAttachedPhoto");
  -[ICASNoteContentData hasAttachedPhoto](self, "hasAttachedPhoto");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    -[ICASNoteContentData hasAttachedPhoto](self, "hasAttachedPhoto");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v65 = (void *)v11;
  v84[8] = v11;
  v83[9] = CFSTR("weeksSinceCreation");
  -[ICASNoteContentData weeksSinceCreation](self, "weeksSinceCreation");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    -[ICASNoteContentData weeksSinceCreation](self, "weeksSinceCreation");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v63 = (void *)v12;
  v84[9] = v12;
  v83[10] = CFSTR("hasAttachmentRichUrl");
  -[ICASNoteContentData hasAttachmentRichUrl](self, "hasAttachmentRichUrl");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    -[ICASNoteContentData hasAttachmentRichUrl](self, "hasAttachmentRichUrl");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v61 = (void *)v13;
  v84[10] = v13;
  v83[11] = CFSTR("hasAttachmentMapLink");
  -[ICASNoteContentData hasAttachmentMapLink](self, "hasAttachmentMapLink");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[ICASNoteContentData hasAttachmentMapLink](self, "hasAttachmentMapLink");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v59 = (void *)v14;
  v84[11] = v14;
  v83[12] = CFSTR("hasTags");
  -[ICASNoteContentData hasTags](self, "hasTags");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    -[ICASNoteContentData hasTags](self, "hasTags");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v57 = (void *)v15;
  v84[12] = v15;
  v83[13] = CFSTR("hasScannedDoc");
  -[ICASNoteContentData hasScannedDoc](self, "hasScannedDoc");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    -[ICASNoteContentData hasScannedDoc](self, "hasScannedDoc");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v55 = (void *)v16;
  v84[13] = v16;
  v83[14] = CFSTR("countOfTags");
  -[ICASNoteContentData countOfTags](self, "countOfTags");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[ICASNoteContentData countOfTags](self, "countOfTags");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v53 = (void *)v17;
  v84[14] = v17;
  v83[15] = CFSTR("countOfDistinctTags");
  -[ICASNoteContentData countOfDistinctTags](self, "countOfDistinctTags");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[ICASNoteContentData countOfDistinctTags](self, "countOfDistinctTags");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_opt_new();
  }
  v51 = (void *)v18;
  v84[15] = v18;
  v83[16] = CFSTR("hasMentions");
  -[ICASNoteContentData hasMentions](self, "hasMentions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    -[ICASNoteContentData hasMentions](self, "hasMentions");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v49 = (void *)v19;
  v84[16] = v19;
  v83[17] = CFSTR("countOfMentions");
  -[ICASNoteContentData countOfMentions](self, "countOfMentions");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[ICASNoteContentData countOfMentions](self, "countOfMentions");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v47 = (void *)v20;
  v84[17] = v20;
  v83[18] = CFSTR("countOfDistinctMentions");
  -[ICASNoteContentData countOfDistinctMentions](self, "countOfDistinctMentions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    -[ICASNoteContentData countOfDistinctMentions](self, "countOfDistinctMentions");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_opt_new();
  }
  v45 = (void *)v21;
  v84[18] = v21;
  v83[19] = CFSTR("hasPaperKitDrawing");
  -[ICASNoteContentData hasPaperKitDrawing](self, "hasPaperKitDrawing");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    -[ICASNoteContentData hasPaperKitDrawing](self, "hasPaperKitDrawing");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = objc_opt_new();
  }
  v43 = (void *)v22;
  v84[19] = v22;
  v83[20] = CFSTR("hasPaperDocument");
  -[ICASNoteContentData hasPaperDocument](self, "hasPaperDocument");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[ICASNoteContentData hasPaperDocument](self, "hasPaperDocument");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_opt_new();
  }
  v41 = (void *)v23;
  v84[20] = v23;
  v83[21] = CFSTR("hasPdf");
  -[ICASNoteContentData hasPdf](self, "hasPdf");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICASNoteContentData hasPdf](self, "hasPdf");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = objc_opt_new();
  }
  v26 = (void *)v25;
  v84[21] = v25;
  v83[22] = CFSTR("countOfNoteLinks");
  -[ICASNoteContentData countOfNoteLinks](self, "countOfNoteLinks");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[ICASNoteContentData countOfNoteLinks](self, "countOfNoteLinks");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = objc_opt_new();
  }
  v29 = (void *)v28;
  v84[22] = v28;
  v83[23] = CFSTR("countOfDistinctNoteLinks");
  -[ICASNoteContentData countOfDistinctNoteLinks](self, "countOfDistinctNoteLinks");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[ICASNoteContentData countOfDistinctNoteLinks](self, "countOfDistinctNoteLinks");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = objc_opt_new();
  }
  v32 = (void *)v31;
  v84[23] = v31;
  v83[24] = CFSTR("countOfFolderLinks");
  -[ICASNoteContentData countOfFolderLinks](self, "countOfFolderLinks");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[ICASNoteContentData countOfFolderLinks](self, "countOfFolderLinks");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = objc_opt_new();
  }
  v35 = (void *)v34;
  v84[24] = v34;
  v83[25] = CFSTR("countOfDistinctFolderLinks");
  -[ICASNoteContentData countOfDistinctFolderLinks](self, "countOfDistinctFolderLinks");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[ICASNoteContentData countOfDistinctFolderLinks](self, "countOfDistinctFolderLinks");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = objc_opt_new();
  }
  v38 = (void *)v37;
  v84[25] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 26);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (NSNumber)characterCount
{
  return self->_characterCount;
}

- (NSNumber)hasChecklist
{
  return self->_hasChecklist;
}

- (NSNumber)hasStyleFormatting
{
  return self->_hasStyleFormatting;
}

- (NSNumber)hasTable
{
  return self->_hasTable;
}

- (NSNumber)hasAttachmentInlineDrawingV1
{
  return self->_hasAttachmentInlineDrawingV1;
}

- (NSNumber)hasAttachmentInlineDrawingV2
{
  return self->_hasAttachmentInlineDrawingV2;
}

- (NSNumber)hasAttachmentFullscreenDrawing
{
  return self->_hasAttachmentFullscreenDrawing;
}

- (NSNumber)hasAttachmentOther
{
  return self->_hasAttachmentOther;
}

- (NSNumber)hasAttachedPhoto
{
  return self->_hasAttachedPhoto;
}

- (NSNumber)weeksSinceCreation
{
  return self->_weeksSinceCreation;
}

- (NSNumber)hasAttachmentRichUrl
{
  return self->_hasAttachmentRichUrl;
}

- (NSNumber)hasAttachmentMapLink
{
  return self->_hasAttachmentMapLink;
}

- (NSNumber)hasTags
{
  return self->_hasTags;
}

- (NSNumber)hasScannedDoc
{
  return self->_hasScannedDoc;
}

- (NSNumber)countOfTags
{
  return self->_countOfTags;
}

- (NSNumber)countOfDistinctTags
{
  return self->_countOfDistinctTags;
}

- (NSNumber)hasMentions
{
  return self->_hasMentions;
}

- (NSNumber)countOfMentions
{
  return self->_countOfMentions;
}

- (NSNumber)countOfDistinctMentions
{
  return self->_countOfDistinctMentions;
}

- (NSNumber)hasPaperKitDrawing
{
  return self->_hasPaperKitDrawing;
}

- (NSNumber)hasPaperDocument
{
  return self->_hasPaperDocument;
}

- (NSNumber)hasPdf
{
  return self->_hasPdf;
}

- (NSNumber)countOfNoteLinks
{
  return self->_countOfNoteLinks;
}

- (NSNumber)countOfDistinctNoteLinks
{
  return self->_countOfDistinctNoteLinks;
}

- (NSNumber)countOfFolderLinks
{
  return self->_countOfFolderLinks;
}

- (NSNumber)countOfDistinctFolderLinks
{
  return self->_countOfDistinctFolderLinks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfDistinctFolderLinks, 0);
  objc_storeStrong((id *)&self->_countOfFolderLinks, 0);
  objc_storeStrong((id *)&self->_countOfDistinctNoteLinks, 0);
  objc_storeStrong((id *)&self->_countOfNoteLinks, 0);
  objc_storeStrong((id *)&self->_hasPdf, 0);
  objc_storeStrong((id *)&self->_hasPaperDocument, 0);
  objc_storeStrong((id *)&self->_hasPaperKitDrawing, 0);
  objc_storeStrong((id *)&self->_countOfDistinctMentions, 0);
  objc_storeStrong((id *)&self->_countOfMentions, 0);
  objc_storeStrong((id *)&self->_hasMentions, 0);
  objc_storeStrong((id *)&self->_countOfDistinctTags, 0);
  objc_storeStrong((id *)&self->_countOfTags, 0);
  objc_storeStrong((id *)&self->_hasScannedDoc, 0);
  objc_storeStrong((id *)&self->_hasTags, 0);
  objc_storeStrong((id *)&self->_hasAttachmentMapLink, 0);
  objc_storeStrong((id *)&self->_hasAttachmentRichUrl, 0);
  objc_storeStrong((id *)&self->_weeksSinceCreation, 0);
  objc_storeStrong((id *)&self->_hasAttachedPhoto, 0);
  objc_storeStrong((id *)&self->_hasAttachmentOther, 0);
  objc_storeStrong((id *)&self->_hasAttachmentFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_hasAttachmentInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_hasAttachmentInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_hasTable, 0);
  objc_storeStrong((id *)&self->_hasStyleFormatting, 0);
  objc_storeStrong((id *)&self->_hasChecklist, 0);
  objc_storeStrong((id *)&self->_characterCount, 0);
}

@end
