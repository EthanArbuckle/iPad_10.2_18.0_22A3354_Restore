@implementation ICNAHistogramManager

- (ICNAHistogramManager)init
{
  ICNAHistogramManager *v2;
  ICNACollabOwnedRootFolderAcceptanceCountHistogram *v3;
  ICNACollabOwnedRootFolderAcceptanceCountHistogram *collabOwnedRootFolderAcceptanceCountHistogram;
  ICNACollabOwnedRootFolderAcceptanceRatioHistogram *v5;
  ICNACollabOwnedRootFolderAcceptanceRatioHistogram *collabOwnedRootFolderAcceptanceRatioHistogram;
  ICNACollabOwnedRootFolderInviteeCountHistogram *v7;
  ICNACollabOwnedRootFolderInviteeCountHistogram *collabOwnedRootFolderInviteeCountHistogram;
  ICNACollabOwnedRootFolderNoReplyCountHistogram *v9;
  ICNACollabOwnedRootFolderNoReplyCountHistogram *collabOwnedRootFolderNoReplyCountHistogram;
  ICNACollabOwnedSingleNoteAcceptanceCountHistogram *v11;
  ICNACollabOwnedSingleNoteAcceptanceCountHistogram *collabOwnedSingleNoteAcceptanceCountHistogram;
  ICNACollabOwnedSingleNoteAcceptanceRatioHistogram *v13;
  ICNACollabOwnedSingleNoteAcceptanceRatioHistogram *collabOwnedSingleNoteAcceptanceRatioHistogram;
  ICNACollabOwnedSingleNoteInviteeCountHistogram *v15;
  ICNACollabOwnedSingleNoteInviteeCountHistogram *collabOwnedSingleNoteInviteeCountHistogram;
  ICNACollabOwnedSingleNoteNoReplyCountHistogram *v17;
  ICNACollabOwnedSingleNoteNoReplyCountHistogram *collabOwnedSingleNoteNoReplyCountHistogram;
  ICNACollabRootFolderTotalNoteCountHistogram *v19;
  ICNACollabRootFolderTotalNoteCountHistogram *collabRootFolderTotalNoteCountHistogram;
  ICNADocScanPageCountHistogram *v21;
  ICNADocScanPageCountHistogram *docScanPageCountHistogram;
  ICNAFolderDirectNoteCountHistogram *v23;
  ICNAFolderDirectNoteCountHistogram *folderDirectNoteCountHistogram;
  ICNAFullscreenDrawingStrokeCountHistogram *v25;
  ICNAFullscreenDrawingStrokeCountHistogram *fullscreenDrawingStrokeCountHistogram;
  ICNAInlineDrawingV1FingerStrokeCountHistogram *v27;
  ICNAInlineDrawingV1FingerStrokeCountHistogram *inlineDrawingV1FingerStrokeCountHistogram;
  ICNAInlineDrawingV1FingerStrokeRatioHistogram *v29;
  ICNAInlineDrawingV1FingerStrokeRatioHistogram *inlineDrawingV1FingerStrokeRatioHistogram;
  ICNAInlineDrawingV1PencilStrokeCountHistogram *v31;
  ICNAInlineDrawingV1PencilStrokeCountHistogram *inlineDrawingV1PencilStrokeCountHistogram;
  ICNAInlineDrawingV1TotalStrokeCountHistogram *v33;
  ICNAInlineDrawingV1TotalStrokeCountHistogram *inlineDrawingV1TotalStrokeCountHistogram;
  ICNAInlineDrawingV2FingerStrokeCountHistogram *v35;
  ICNAInlineDrawingV2FingerStrokeCountHistogram *inlineDrawingV2FingerStrokeCountHistogram;
  ICNAInlineDrawingV2FingerStrokeRatioHistogram *v37;
  ICNAInlineDrawingV2FingerStrokeRatioHistogram *inlineDrawingV2FingerStrokeRatioHistogram;
  ICNAInlineDrawingV2PencilStrokeCountHistogram *v39;
  ICNAInlineDrawingV2PencilStrokeCountHistogram *inlineDrawingV2PencilStrokeCountHistogram;
  ICNAInlineDrawingV2TotalStrokeCountHistogram *v41;
  ICNAInlineDrawingV2TotalStrokeCountHistogram *inlineDrawingV2TotalStrokeCountHistogram;
  ICNANoteCharCountHistogram *v43;
  ICNANoteCharCountHistogram *noteCharCountHistogram;
  ICNAPasswordProtectedNoteWeeklyAgeHistogram *v45;
  ICNAPasswordProtectedNoteWeeklyAgeHistogram *passwordProtectedNoteWeeklyAgeHistogram;
  ICNATableCellCountHistogram *v47;
  ICNATableCellCountHistogram *tableCellCountHistogram;
  ICNATableColumnCountHistogram *v49;
  ICNATableColumnCountHistogram *tableColumnCountHistogram;
  ICNATableRowCountHistogram *v51;
  ICNATableRowCountHistogram *tableRowCountHistogram;
  ICNATopLevelFolderTotalNoteCountHistogram *v53;
  ICNATopLevelFolderTotalNoteCountHistogram *topLevelFolderTotalNoteCountHistogram;
  ICNAAttachmentCountPerNoteHistogram *v55;
  ICNAAttachmentCountPerNoteHistogram *attachmentCountPerNoteHistogram;
  ICNADrawingCountPerNoteHistogram *v57;
  ICNADrawingCountPerNoteHistogram *drawingCountPerNoteHistogram;
  ICNAInlineDrawingFingerStrokesCountPerNoteHistogram *v59;
  ICNAInlineDrawingFingerStrokesCountPerNoteHistogram *inlineDrawingFingerStrokesCountPerNoteHistogram;
  ICNAInlineDrawingPencilStrokesCountPerNoteHistogram *v61;
  ICNAInlineDrawingPencilStrokesCountPerNoteHistogram *inlineDrawingPencilStrokesCountPerNoteHistogram;
  ICNAFullScreenDrawingStrokesCountPerNoteHistogram *v63;
  ICNAFullScreenDrawingStrokesCountPerNoteHistogram *fullScreenDrawingStrokesCountPerNoteHistogram;
  ICNATotalStrokesCountPerNoteHistogram *v65;
  ICNATotalStrokesCountPerNoteHistogram *totalStrokesCountPerNoteHistogram;
  ICNAInlineAttachmentCountPerNoteHistogram *v67;
  ICNAInlineAttachmentCountPerNoteHistogram *tagCountPerNoteHistogram;
  ICNAInlineAttachmentCountPerNoteHistogram *v69;
  ICNAInlineAttachmentCountPerNoteHistogram *distinctTagCountPerNoteHistogram;
  ICNAInlineAttachmentCountPerNoteHistogram *v71;
  ICNAInlineAttachmentCountPerNoteHistogram *mentionCountPerNoteHistogram;
  ICNAInlineAttachmentCountPerNoteHistogram *v73;
  ICNAInlineAttachmentCountPerNoteHistogram *distinctMentionCountPerNoteHistogram;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)ICNAHistogramManager;
  v2 = -[ICNAHistogramManager init](&v76, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICNACollabOwnedRootFolderAcceptanceCountHistogram);
    collabOwnedRootFolderAcceptanceCountHistogram = v2->_collabOwnedRootFolderAcceptanceCountHistogram;
    v2->_collabOwnedRootFolderAcceptanceCountHistogram = v3;

    v5 = objc_alloc_init(ICNACollabOwnedRootFolderAcceptanceRatioHistogram);
    collabOwnedRootFolderAcceptanceRatioHistogram = v2->_collabOwnedRootFolderAcceptanceRatioHistogram;
    v2->_collabOwnedRootFolderAcceptanceRatioHistogram = v5;

    v7 = objc_alloc_init(ICNACollabOwnedRootFolderInviteeCountHistogram);
    collabOwnedRootFolderInviteeCountHistogram = v2->_collabOwnedRootFolderInviteeCountHistogram;
    v2->_collabOwnedRootFolderInviteeCountHistogram = v7;

    v9 = objc_alloc_init(ICNACollabOwnedRootFolderNoReplyCountHistogram);
    collabOwnedRootFolderNoReplyCountHistogram = v2->_collabOwnedRootFolderNoReplyCountHistogram;
    v2->_collabOwnedRootFolderNoReplyCountHistogram = v9;

    v11 = objc_alloc_init(ICNACollabOwnedSingleNoteAcceptanceCountHistogram);
    collabOwnedSingleNoteAcceptanceCountHistogram = v2->_collabOwnedSingleNoteAcceptanceCountHistogram;
    v2->_collabOwnedSingleNoteAcceptanceCountHistogram = v11;

    v13 = objc_alloc_init(ICNACollabOwnedSingleNoteAcceptanceRatioHistogram);
    collabOwnedSingleNoteAcceptanceRatioHistogram = v2->_collabOwnedSingleNoteAcceptanceRatioHistogram;
    v2->_collabOwnedSingleNoteAcceptanceRatioHistogram = v13;

    v15 = objc_alloc_init(ICNACollabOwnedSingleNoteInviteeCountHistogram);
    collabOwnedSingleNoteInviteeCountHistogram = v2->_collabOwnedSingleNoteInviteeCountHistogram;
    v2->_collabOwnedSingleNoteInviteeCountHistogram = v15;

    v17 = objc_alloc_init(ICNACollabOwnedSingleNoteNoReplyCountHistogram);
    collabOwnedSingleNoteNoReplyCountHistogram = v2->_collabOwnedSingleNoteNoReplyCountHistogram;
    v2->_collabOwnedSingleNoteNoReplyCountHistogram = v17;

    v19 = objc_alloc_init(ICNACollabRootFolderTotalNoteCountHistogram);
    collabRootFolderTotalNoteCountHistogram = v2->_collabRootFolderTotalNoteCountHistogram;
    v2->_collabRootFolderTotalNoteCountHistogram = v19;

    v21 = objc_alloc_init(ICNADocScanPageCountHistogram);
    docScanPageCountHistogram = v2->_docScanPageCountHistogram;
    v2->_docScanPageCountHistogram = v21;

    v23 = objc_alloc_init(ICNAFolderDirectNoteCountHistogram);
    folderDirectNoteCountHistogram = v2->_folderDirectNoteCountHistogram;
    v2->_folderDirectNoteCountHistogram = v23;

    v25 = objc_alloc_init(ICNAFullscreenDrawingStrokeCountHistogram);
    fullscreenDrawingStrokeCountHistogram = v2->_fullscreenDrawingStrokeCountHistogram;
    v2->_fullscreenDrawingStrokeCountHistogram = v25;

    v27 = objc_alloc_init(ICNAInlineDrawingV1FingerStrokeCountHistogram);
    inlineDrawingV1FingerStrokeCountHistogram = v2->_inlineDrawingV1FingerStrokeCountHistogram;
    v2->_inlineDrawingV1FingerStrokeCountHistogram = v27;

    v29 = objc_alloc_init(ICNAInlineDrawingV1FingerStrokeRatioHistogram);
    inlineDrawingV1FingerStrokeRatioHistogram = v2->_inlineDrawingV1FingerStrokeRatioHistogram;
    v2->_inlineDrawingV1FingerStrokeRatioHistogram = v29;

    v31 = objc_alloc_init(ICNAInlineDrawingV1PencilStrokeCountHistogram);
    inlineDrawingV1PencilStrokeCountHistogram = v2->_inlineDrawingV1PencilStrokeCountHistogram;
    v2->_inlineDrawingV1PencilStrokeCountHistogram = v31;

    v33 = objc_alloc_init(ICNAInlineDrawingV1TotalStrokeCountHistogram);
    inlineDrawingV1TotalStrokeCountHistogram = v2->_inlineDrawingV1TotalStrokeCountHistogram;
    v2->_inlineDrawingV1TotalStrokeCountHistogram = v33;

    v35 = objc_alloc_init(ICNAInlineDrawingV2FingerStrokeCountHistogram);
    inlineDrawingV2FingerStrokeCountHistogram = v2->_inlineDrawingV2FingerStrokeCountHistogram;
    v2->_inlineDrawingV2FingerStrokeCountHistogram = v35;

    v37 = objc_alloc_init(ICNAInlineDrawingV2FingerStrokeRatioHistogram);
    inlineDrawingV2FingerStrokeRatioHistogram = v2->_inlineDrawingV2FingerStrokeRatioHistogram;
    v2->_inlineDrawingV2FingerStrokeRatioHistogram = v37;

    v39 = objc_alloc_init(ICNAInlineDrawingV2PencilStrokeCountHistogram);
    inlineDrawingV2PencilStrokeCountHistogram = v2->_inlineDrawingV2PencilStrokeCountHistogram;
    v2->_inlineDrawingV2PencilStrokeCountHistogram = v39;

    v41 = objc_alloc_init(ICNAInlineDrawingV2TotalStrokeCountHistogram);
    inlineDrawingV2TotalStrokeCountHistogram = v2->_inlineDrawingV2TotalStrokeCountHistogram;
    v2->_inlineDrawingV2TotalStrokeCountHistogram = v41;

    v43 = objc_alloc_init(ICNANoteCharCountHistogram);
    noteCharCountHistogram = v2->_noteCharCountHistogram;
    v2->_noteCharCountHistogram = v43;

    v45 = objc_alloc_init(ICNAPasswordProtectedNoteWeeklyAgeHistogram);
    passwordProtectedNoteWeeklyAgeHistogram = v2->_passwordProtectedNoteWeeklyAgeHistogram;
    v2->_passwordProtectedNoteWeeklyAgeHistogram = v45;

    v47 = objc_alloc_init(ICNATableCellCountHistogram);
    tableCellCountHistogram = v2->_tableCellCountHistogram;
    v2->_tableCellCountHistogram = v47;

    v49 = objc_alloc_init(ICNATableColumnCountHistogram);
    tableColumnCountHistogram = v2->_tableColumnCountHistogram;
    v2->_tableColumnCountHistogram = v49;

    v51 = objc_alloc_init(ICNATableRowCountHistogram);
    tableRowCountHistogram = v2->_tableRowCountHistogram;
    v2->_tableRowCountHistogram = v51;

    v53 = objc_alloc_init(ICNATopLevelFolderTotalNoteCountHistogram);
    topLevelFolderTotalNoteCountHistogram = v2->_topLevelFolderTotalNoteCountHistogram;
    v2->_topLevelFolderTotalNoteCountHistogram = v53;

    v55 = objc_alloc_init(ICNAAttachmentCountPerNoteHistogram);
    attachmentCountPerNoteHistogram = v2->_attachmentCountPerNoteHistogram;
    v2->_attachmentCountPerNoteHistogram = v55;

    v57 = objc_alloc_init(ICNADrawingCountPerNoteHistogram);
    drawingCountPerNoteHistogram = v2->_drawingCountPerNoteHistogram;
    v2->_drawingCountPerNoteHistogram = v57;

    v59 = objc_alloc_init(ICNAInlineDrawingFingerStrokesCountPerNoteHistogram);
    inlineDrawingFingerStrokesCountPerNoteHistogram = v2->_inlineDrawingFingerStrokesCountPerNoteHistogram;
    v2->_inlineDrawingFingerStrokesCountPerNoteHistogram = v59;

    v61 = objc_alloc_init(ICNAInlineDrawingPencilStrokesCountPerNoteHistogram);
    inlineDrawingPencilStrokesCountPerNoteHistogram = v2->_inlineDrawingPencilStrokesCountPerNoteHistogram;
    v2->_inlineDrawingPencilStrokesCountPerNoteHistogram = v61;

    v63 = objc_alloc_init(ICNAFullScreenDrawingStrokesCountPerNoteHistogram);
    fullScreenDrawingStrokesCountPerNoteHistogram = v2->_fullScreenDrawingStrokesCountPerNoteHistogram;
    v2->_fullScreenDrawingStrokesCountPerNoteHistogram = v63;

    v65 = objc_alloc_init(ICNATotalStrokesCountPerNoteHistogram);
    totalStrokesCountPerNoteHistogram = v2->_totalStrokesCountPerNoteHistogram;
    v2->_totalStrokesCountPerNoteHistogram = v65;

    v67 = objc_alloc_init(ICNAInlineAttachmentCountPerNoteHistogram);
    tagCountPerNoteHistogram = v2->_tagCountPerNoteHistogram;
    v2->_tagCountPerNoteHistogram = v67;

    v69 = objc_alloc_init(ICNAInlineAttachmentCountPerNoteHistogram);
    distinctTagCountPerNoteHistogram = v2->_distinctTagCountPerNoteHistogram;
    v2->_distinctTagCountPerNoteHistogram = v69;

    v71 = objc_alloc_init(ICNAInlineAttachmentCountPerNoteHistogram);
    mentionCountPerNoteHistogram = v2->_mentionCountPerNoteHistogram;
    v2->_mentionCountPerNoteHistogram = v71;

    v73 = objc_alloc_init(ICNAInlineAttachmentCountPerNoteHistogram);
    distinctMentionCountPerNoteHistogram = v2->_distinctMentionCountPerNoteHistogram;
    v2->_distinctMentionCountPerNoteHistogram = v73;

  }
  return v2;
}

- (ICNACollabOwnedRootFolderAcceptanceCountHistogram)collabOwnedRootFolderAcceptanceCountHistogram
{
  return self->_collabOwnedRootFolderAcceptanceCountHistogram;
}

- (void)setCollabOwnedRootFolderAcceptanceCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceCountHistogram, a3);
}

- (ICNACollabOwnedRootFolderAcceptanceRatioHistogram)collabOwnedRootFolderAcceptanceRatioHistogram
{
  return self->_collabOwnedRootFolderAcceptanceRatioHistogram;
}

- (void)setCollabOwnedRootFolderAcceptanceRatioHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceRatioHistogram, a3);
}

- (ICNACollabOwnedRootFolderInviteeCountHistogram)collabOwnedRootFolderInviteeCountHistogram
{
  return self->_collabOwnedRootFolderInviteeCountHistogram;
}

- (void)setCollabOwnedRootFolderInviteeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedRootFolderInviteeCountHistogram, a3);
}

- (ICNACollabOwnedRootFolderNoReplyCountHistogram)collabOwnedRootFolderNoReplyCountHistogram
{
  return self->_collabOwnedRootFolderNoReplyCountHistogram;
}

- (void)setCollabOwnedRootFolderNoReplyCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedRootFolderNoReplyCountHistogram, a3);
}

- (ICNACollabOwnedSingleNoteAcceptanceCountHistogram)collabOwnedSingleNoteAcceptanceCountHistogram
{
  return self->_collabOwnedSingleNoteAcceptanceCountHistogram;
}

- (void)setCollabOwnedSingleNoteAcceptanceCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceCountHistogram, a3);
}

- (ICNACollabOwnedSingleNoteAcceptanceRatioHistogram)collabOwnedSingleNoteAcceptanceRatioHistogram
{
  return self->_collabOwnedSingleNoteAcceptanceRatioHistogram;
}

- (void)setCollabOwnedSingleNoteAcceptanceRatioHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceRatioHistogram, a3);
}

- (ICNACollabOwnedSingleNoteInviteeCountHistogram)collabOwnedSingleNoteInviteeCountHistogram
{
  return self->_collabOwnedSingleNoteInviteeCountHistogram;
}

- (void)setCollabOwnedSingleNoteInviteeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteInviteeCountHistogram, a3);
}

- (ICNACollabOwnedSingleNoteNoReplyCountHistogram)collabOwnedSingleNoteNoReplyCountHistogram
{
  return self->_collabOwnedSingleNoteNoReplyCountHistogram;
}

- (void)setCollabOwnedSingleNoteNoReplyCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteNoReplyCountHistogram, a3);
}

- (ICNACollabRootFolderTotalNoteCountHistogram)collabRootFolderTotalNoteCountHistogram
{
  return self->_collabRootFolderTotalNoteCountHistogram;
}

- (void)setCollabRootFolderTotalNoteCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_collabRootFolderTotalNoteCountHistogram, a3);
}

- (ICNADocScanPageCountHistogram)docScanPageCountHistogram
{
  return self->_docScanPageCountHistogram;
}

- (void)setDocScanPageCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_docScanPageCountHistogram, a3);
}

- (ICNAFolderDirectNoteCountHistogram)folderDirectNoteCountHistogram
{
  return self->_folderDirectNoteCountHistogram;
}

- (void)setFolderDirectNoteCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_folderDirectNoteCountHistogram, a3);
}

- (ICNAFullscreenDrawingStrokeCountHistogram)fullscreenDrawingStrokeCountHistogram
{
  return self->_fullscreenDrawingStrokeCountHistogram;
}

- (void)setFullscreenDrawingStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenDrawingStrokeCountHistogram, a3);
}

- (ICNAInlineDrawingV1FingerStrokeCountHistogram)inlineDrawingV1FingerStrokeCountHistogram
{
  return self->_inlineDrawingV1FingerStrokeCountHistogram;
}

- (void)setInlineDrawingV1FingerStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeCountHistogram, a3);
}

- (ICNAInlineDrawingV1FingerStrokeRatioHistogram)inlineDrawingV1FingerStrokeRatioHistogram
{
  return self->_inlineDrawingV1FingerStrokeRatioHistogram;
}

- (void)setInlineDrawingV1FingerStrokeRatioHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeRatioHistogram, a3);
}

- (ICNAInlineDrawingV1PencilStrokeCountHistogram)inlineDrawingV1PencilStrokeCountHistogram
{
  return self->_inlineDrawingV1PencilStrokeCountHistogram;
}

- (void)setInlineDrawingV1PencilStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV1PencilStrokeCountHistogram, a3);
}

- (ICNAInlineDrawingV1TotalStrokeCountHistogram)inlineDrawingV1TotalStrokeCountHistogram
{
  return self->_inlineDrawingV1TotalStrokeCountHistogram;
}

- (void)setInlineDrawingV1TotalStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV1TotalStrokeCountHistogram, a3);
}

- (ICNAInlineDrawingV2FingerStrokeCountHistogram)inlineDrawingV2FingerStrokeCountHistogram
{
  return self->_inlineDrawingV2FingerStrokeCountHistogram;
}

- (void)setInlineDrawingV2FingerStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeCountHistogram, a3);
}

- (ICNAInlineDrawingV2FingerStrokeRatioHistogram)inlineDrawingV2FingerStrokeRatioHistogram
{
  return self->_inlineDrawingV2FingerStrokeRatioHistogram;
}

- (void)setInlineDrawingV2FingerStrokeRatioHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeRatioHistogram, a3);
}

- (ICNAInlineDrawingV2PencilStrokeCountHistogram)inlineDrawingV2PencilStrokeCountHistogram
{
  return self->_inlineDrawingV2PencilStrokeCountHistogram;
}

- (void)setInlineDrawingV2PencilStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV2PencilStrokeCountHistogram, a3);
}

- (ICNAInlineDrawingV2TotalStrokeCountHistogram)inlineDrawingV2TotalStrokeCountHistogram
{
  return self->_inlineDrawingV2TotalStrokeCountHistogram;
}

- (void)setInlineDrawingV2TotalStrokeCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingV2TotalStrokeCountHistogram, a3);
}

- (ICNANoteCharCountHistogram)noteCharCountHistogram
{
  return self->_noteCharCountHistogram;
}

- (void)setNoteCharCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_noteCharCountHistogram, a3);
}

- (ICNAPasswordProtectedNoteWeeklyAgeHistogram)passwordProtectedNoteWeeklyAgeHistogram
{
  return self->_passwordProtectedNoteWeeklyAgeHistogram;
}

- (void)setPasswordProtectedNoteWeeklyAgeHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_passwordProtectedNoteWeeklyAgeHistogram, a3);
}

- (ICNATableCellCountHistogram)tableCellCountHistogram
{
  return self->_tableCellCountHistogram;
}

- (void)setTableCellCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_tableCellCountHistogram, a3);
}

- (ICNATableColumnCountHistogram)tableColumnCountHistogram
{
  return self->_tableColumnCountHistogram;
}

- (void)setTableColumnCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_tableColumnCountHistogram, a3);
}

- (ICNATableRowCountHistogram)tableRowCountHistogram
{
  return self->_tableRowCountHistogram;
}

- (void)setTableRowCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_tableRowCountHistogram, a3);
}

- (ICNATopLevelFolderTotalNoteCountHistogram)topLevelFolderTotalNoteCountHistogram
{
  return self->_topLevelFolderTotalNoteCountHistogram;
}

- (void)setTopLevelFolderTotalNoteCountHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelFolderTotalNoteCountHistogram, a3);
}

- (ICNAAttachmentCountPerNoteHistogram)attachmentCountPerNoteHistogram
{
  return self->_attachmentCountPerNoteHistogram;
}

- (void)setAttachmentCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentCountPerNoteHistogram, a3);
}

- (ICNADrawingCountPerNoteHistogram)drawingCountPerNoteHistogram
{
  return self->_drawingCountPerNoteHistogram;
}

- (void)setDrawingCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_drawingCountPerNoteHistogram, a3);
}

- (ICNAInlineDrawingFingerStrokesCountPerNoteHistogram)inlineDrawingFingerStrokesCountPerNoteHistogram
{
  return self->_inlineDrawingFingerStrokesCountPerNoteHistogram;
}

- (void)setInlineDrawingFingerStrokesCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingFingerStrokesCountPerNoteHistogram, a3);
}

- (ICNAInlineDrawingPencilStrokesCountPerNoteHistogram)inlineDrawingPencilStrokesCountPerNoteHistogram
{
  return self->_inlineDrawingPencilStrokesCountPerNoteHistogram;
}

- (void)setInlineDrawingPencilStrokesCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_inlineDrawingPencilStrokesCountPerNoteHistogram, a3);
}

- (ICNAFullScreenDrawingStrokesCountPerNoteHistogram)fullScreenDrawingStrokesCountPerNoteHistogram
{
  return self->_fullScreenDrawingStrokesCountPerNoteHistogram;
}

- (void)setFullScreenDrawingStrokesCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenDrawingStrokesCountPerNoteHistogram, a3);
}

- (ICNATotalStrokesCountPerNoteHistogram)totalStrokesCountPerNoteHistogram
{
  return self->_totalStrokesCountPerNoteHistogram;
}

- (void)setTotalStrokesCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_totalStrokesCountPerNoteHistogram, a3);
}

- (ICNAInlineAttachmentCountPerNoteHistogram)tagCountPerNoteHistogram
{
  return self->_tagCountPerNoteHistogram;
}

- (void)setTagCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_tagCountPerNoteHistogram, a3);
}

- (ICNAInlineAttachmentCountPerNoteHistogram)distinctTagCountPerNoteHistogram
{
  return self->_distinctTagCountPerNoteHistogram;
}

- (void)setDistinctTagCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_distinctTagCountPerNoteHistogram, a3);
}

- (ICNAInlineAttachmentCountPerNoteHistogram)mentionCountPerNoteHistogram
{
  return self->_mentionCountPerNoteHistogram;
}

- (void)setMentionCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_mentionCountPerNoteHistogram, a3);
}

- (ICNAInlineAttachmentCountPerNoteHistogram)distinctMentionCountPerNoteHistogram
{
  return self->_distinctMentionCountPerNoteHistogram;
}

- (void)setDistinctMentionCountPerNoteHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_distinctMentionCountPerNoteHistogram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distinctMentionCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_mentionCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_distinctTagCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_tagCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_totalStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_fullScreenDrawingStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingPencilStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingFingerStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_drawingCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_attachmentCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_topLevelFolderTotalNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableRowCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableColumnCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableCellCountHistogram, 0);
  objc_storeStrong((id *)&self->_passwordProtectedNoteWeeklyAgeHistogram, 0);
  objc_storeStrong((id *)&self->_noteCharCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2TotalStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2PencilStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeRatioHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1TotalStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1PencilStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeRatioHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_fullscreenDrawingStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_folderDirectNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_docScanPageCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabRootFolderTotalNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteNoReplyCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteInviteeCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceRatioHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderNoReplyCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderInviteeCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceRatioHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceCountHistogram, 0);
}

@end
