@implementation ICNACoreAnalyticsReporter

+ (id)sharedReporter
{
  if (s_onceToken_3 != -1)
    dispatch_once(&s_onceToken_3, &__block_literal_global_7);
  return (id)sharedReporter_s_instance_1;
}

void __43__ICNACoreAnalyticsReporter_sharedReporter__block_invoke()
{
  ICNACoreAnalyticsReporter *v0;
  void *v1;

  v0 = objc_alloc_init(ICNACoreAnalyticsReporter);
  v1 = (void *)sharedReporter_s_instance_1;
  sharedReporter_s_instance_1 = (uint64_t)v0;

}

- (ICNACoreAnalyticsReporter)init
{
  ICNACoreAnalyticsReporter *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNACoreAnalyticsReporter;
  v2 = -[ICNAOptedInObject init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_appSessionWillEnd_, CFSTR("ICNASessionWillEndNotification"), 0);

  }
  return v2;
}

+ (id)analyticsQueue
{
  if (analyticsQueue_onceToken != -1)
    dispatch_once(&analyticsQueue_onceToken, &__block_literal_global_17);
  return (id)analyticsQueue_sAnalyticsQueue;
}

void __43__ICNACoreAnalyticsReporter_analyticsQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.analytics", v2);
  v1 = (void *)analyticsQueue_sAnalyticsQueue;
  analyticsQueue_sAnalyticsQueue = (uint64_t)v0;

}

- (id)consumeNoteViewApproach
{
  NSString *noteViewApproach;
  __CFString *v4;
  NSString *v5;

  noteViewApproach = self->_noteViewApproach;
  if (noteViewApproach)
    v4 = (__CFString *)-[NSString copy](noteViewApproach, "copy");
  else
    v4 = CFSTR("iOSInAppSelection");
  v5 = self->_noteViewApproach;
  self->_noteViewApproach = 0;

  return v4;
}

- (void)appSessionWillEnd:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "analyticsQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICNACoreAnalyticsReporter_appSessionWillEnd___block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __47__ICNACoreAnalyticsReporter_appSessionWillEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentlyViewedNoteIdentifier:", 0);
}

- (void)fireUpdateHandWritingContentEventWithNoteData:(id)a3 pencilIsUsed:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v4 = a4;
  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("isSystemPaper");
  objc_msgSend(a3, "isScrapPaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("isUpdatedByApplePencil");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)fireDeepLinkCreationEventWithNote:(id)a3 contentItem:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "sourceIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    +[ICNAEventReporter maskString:withoutPrefix:withMask:](ICNAEventReporter, "maskString:withoutPrefix:withMask:", v6, CFSTR("com.apple."), CFSTR("thirdPartyBundleID"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("unknown");
  }
  v11[0] = CFSTR("isDestinationNoteSystemPaper");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isSystemPaper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("sourceAppBundleID");
  v12[0] = v9;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)fireNoteViewEventWithNote:(id)a3 noteData:(id)a4 noteContentData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICNACoreAnalyticsReporter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "analyticsQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke;
  v15[3] = &unk_1E771CDE8;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke(id *a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_2;
  v5[3] = &unk_1E771CDE8;
  v4 = *((int8x16_t *)a1 + 2);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = a1[6];
  v8 = a1[7];
  objc_msgSend(v2, "performBlock:", v5);

}

void __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[10];
  _QWORD v40[12];

  v40[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "currentlyViewedNoteIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(a1[6], "hasPaperKitDrawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(a1[6], "hasAttachmentInlineDrawingV1");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(a1[6], "hasAttachmentInlineDrawingV2");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(a1[6], "hasAttachmentFullscreenDrawing");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v9, "BOOLValue");

        }
      }

    }
    objc_msgSend(a1[5], "textStorageWithoutCreating");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ic_containsNonWhitespaceAndAttachmentCharacters");

    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    objc_msgSend(a1[5], "visibleAttachments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_3;
    v26[3] = &unk_1E771CDC0;
    v26[4] = &v35;
    v26[5] = &v31;
    v26[6] = &v27;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);

    v39[0] = CFSTR("hasDrawing");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v39[1] = CFSTR("hasImage");
    objc_msgSend(a1[6], "hasAttachedPhoto");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v24;
    v39[2] = CFSTR("hasOtherLinks");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v28 + 24));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v14;
    v39[3] = CFSTR("hasDeeplinks");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v32 + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v15;
    v39[4] = CFSTR("hasTable");
    objc_msgSend(a1[6], "hasTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v16;
    v39[5] = CFSTR("hasTypedText");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40[5] = v17;
    v39[6] = CFSTR("hasWebHighlights");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v36 + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[6] = v18;
    v39[7] = CFSTR("isSystemPaper");
    objc_msgSend(a1[7], "isScrapPaper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[7] = v19;
    v39[8] = CFSTR("noteIsNewlyCreated");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1[5], "isEmpty"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[8] = v20;
    v39[9] = CFSTR("systemPaperInvocationMethod");
    objc_msgSend(a1[4], "consumeNoteViewApproach");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[9] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    objc_msgSend(a1[5], "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setCurrentlyViewedNoteIdentifier:", v23);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_3(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  BOOL v6;
  char v7;
  char v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v6 = +[ICNAEventReporter attachmentHasDeepLinkSafariHighlight:](ICNAEventReporter, "attachmentHasDeepLinkSafariHighlight:", v5);
    v5 = v9;
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) |= v6;
  }
  v7 = objc_msgSend(v5, "hasDeepLink");
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) |= v7;
  if ((v7 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= objc_msgSend(v9, "isURL");
  v8 = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v8)
  {
    v8 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
    if (v8)
      v8 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  }
  *a3 = v8;

}

- (void)fireSnapshotWithNoteReportToDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[14];
  _QWORD v23[16];

  v23[14] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("countOfModernNotes");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotes")));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("countOfModernNotesWithDeeplinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithDeeplink")));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  v22[2] = CFSTR("countOfModernNotesWithDrawing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithDrawing")));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  v22[3] = CFSTR("countOfModernNotesWithImage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithImage")));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("countOfModernNotesWithOtherLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithLinks")));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = CFSTR("countOfModernNotesWithTable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithTable")));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v16;
  v22[6] = CFSTR("countOfModernNotesWithWebHighlights");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithWebHighlights")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v5;
  v22[7] = CFSTR("countOfSystemPaper");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapers")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v6;
  v22[8] = CFSTR("countOfSystemPaperWithDeeplinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithDeepLink")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v7;
  v22[9] = CFSTR("countOfSystemPaperWithDrawing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithDrawing")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v8;
  v22[10] = CFSTR("countOfSystemPaperWithImage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithImage")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v9;
  v22[11] = CFSTR("countOfSystemPaperWithOtherLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithLinks")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v10;
  v22[12] = CFSTR("countOfSystemPaperWithTable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithTables")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v11;
  v22[13] = CFSTR("countOfSystemPaperWithWebHighlights");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "countOfScrapPapersWithWebHighlights");

  objc_msgSend(v12, "numberWithInteger:", ICNARoundTo2SigFigsInt(v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[13] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (NSString)noteViewApproach
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNoteViewApproach:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)currentlyViewedNoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentlyViewedNoteIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyViewedNoteIdentifier, 0);
  objc_storeStrong((id *)&self->_noteViewApproach, 0);
}

@end
