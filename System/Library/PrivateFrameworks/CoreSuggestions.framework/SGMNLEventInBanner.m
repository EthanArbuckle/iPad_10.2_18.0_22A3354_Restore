@implementation SGMNLEventInBanner

- (SGMNLEventInBanner)init
{
  SGMNLEventInBanner *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PETScalarEventTracker *tracker;
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
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[21];

  v29[19] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SGMNLEventInBanner;
  v2 = -[SGMNLEventInBanner init](&v28, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("I"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("A"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("T"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("L"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("D"), 0, 57, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("C"), 0, 101, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("S"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("P"), 0, 100, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("E"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("B"), 0, 11, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("TiS"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("TiA"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("DaA"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("DuA"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("LoA"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("AttC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("CaUL"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("MaUL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("MeUL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D80F38]);
    v29[0] = v25;
    v29[1] = v27;
    v29[2] = v26;
    v29[3] = v22;
    v29[4] = v24;
    v29[5] = v20;
    v29[6] = v21;
    v29[7] = v19;
    v29[8] = v23;
    v29[9] = v18;
    v29[10] = v17;
    v29[11] = v16;
    v29[12] = v3;
    v29[13] = v4;
    v29[14] = v5;
    v29[15] = v6;
    v29[16] = v7;
    v29[17] = v8;
    v11 = (void *)v7;
    v29[18] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("NLEventInBanner"), v12, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v13;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 interface:(SGMNLEventInterface_)a4 actionType:(SGMNLEventActionType_)a5 eventType:(id)a6 languageID:(id)a7 daysFromStartDate:(unint64_t)a8 confidenceScore:(unint64_t)a9 significantSender:(SGMBoolOption_)a10 participantCount:(unint64_t)a11 extractionLevel:(SGMNLEventExtractionLevel_)a12 usedBubblesCount:(unint64_t)a13 titleSource:(SGMEventTitleSource_)a14 titleAdj:(SGMEventStringAdj_)a15 dateAdj:(SGMEventDateAdj_)a16 duraAdj:(SGMEventDurationAdj_)a17 locationAdj:(SGMEventLocationAdj_)a18 addedAttendeesCount:(id)a19 calendarAppUsageLevel:(id)a20 mailAppUsageLevel:(SGMAppUsageLevel_)a21 messagesAppUsageLevel:(SGMAppUsageLevel_)a22
{
  id v25;
  id v26;
  id v27;
  id v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  id v68;
  id v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  id v78;
  id v79;
  PETScalarEventTracker *tracker;
  _QWORD v84[21];

  v84[19] = *MEMORY[0x1E0C80C00];
  v25 = a6;
  v26 = a7;
  v27 = a19;
  v28 = a20;
  if (a4.var0 >= 0x14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMNLEventInterface_toString(SGMNLEventInterface)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("SGMetricsDefines.h"), 477, CFSTR("unrecognized tag %lu on SGMNLEventInterface"), a4.var0);

    v29 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v29 = off_1E4761488[a4.var0];
  }
  v77 = v29;
  if (a5.var0 >= 0xC)
  {
    v32 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMNLEventActionType_toString(SGMNLEventActionType)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("SGMetricsDefines.h"), 428, CFSTR("unrecognized tag %lu on SGMNLEventActionType"), a5.var0);

    v76 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v76 = off_1E47612D0[a5.var0];
    v32 = 0x1E0CB3000;
  }
  v79 = v25;
  v78 = v26;
  if (a10.var0 >= 3)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBoolOption_toString(SGMBoolOption)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("SGMetricsDefines.h"), 27, CFSTR("unrecognized tag %lu on SGMBoolOption"), a10.var0);

    v75 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v75 = off_1E4761330[a10.var0];
    v35 = 0x1E0CB3000;
  }
  if (a12.var0 >= 6)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMNLEventExtractionLevel_toString(SGMNLEventExtractionLevel)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("SGMetricsDefines.h"), 378, CFSTR("unrecognized tag %lu on SGMNLEventExtractionLevel"), a12.var0);

    v38 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v38 = off_1E4761348[a12.var0];
  }
  v74 = v38;
  if (a14.var0 >= 4)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMEventTitleSource_toString(SGMEventTitleSource)");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("SGMetricsDefines.h"), 395, CFSTR("unrecognized tag %lu on SGMEventTitleSource"), a14.var0);

    v41 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v41 = off_1E4761378[a14.var0];
  }
  v73 = v41;
  if (a15.var0 >= 5)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMEventStringAdj_toString(SGMEventStringAdj)");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("SGMetricsDefines.h"), 288, CFSTR("unrecognized tag %lu on SGMEventStringAdj"), a15.var0);

    v44 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v44 = off_1E4761398[a15.var0];
  }
  v72 = v44;
  if (a16.var0 >= 0xA)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMEventDateAdj_toString(SGMEventDateAdj)");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("SGMetricsDefines.h"), 317, CFSTR("unrecognized tag %lu on SGMEventDateAdj"), a16.var0);

    v47 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v47 = off_1E47613C0[a16.var0];
  }
  v71 = v47;
  if (a17.var0 >= 6)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMEventDurationAdj_toString(SGMEventDurationAdj)");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("SGMetricsDefines.h"), 338, CFSTR("unrecognized tag %lu on SGMEventDurationAdj"), a17.var0);

    v50 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v50 = off_1E4761410[a17.var0];
  }
  v70 = v50;
  if (a18.var0 >= 5)
  {
    objc_msgSend(*(id *)(v32 + 1160), "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMEventLocationAdj_toString(SGMEventLocationAdj)");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("SGMetricsDefines.h"), 357, CFSTR("unrecognized tag %lu on SGMEventLocationAdj"), a18.var0);

    v53 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v53 = off_1E4761440[a18.var0];
  }
  v67 = v53;
  v69 = v27;
  v68 = v28;
  if (a21.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2368), "stringWithUTF8String:", "NSString * _Nonnull SGMAppUsageLevel_toString(SGMAppUsageLevel)");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("SGMetricsDefines.h"), 494, CFSTR("unrecognized tag %lu on SGMAppUsageLevel"), a21.var0);

    v56 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v56 = off_1E4761468[a21.var0];
  }
  if (a22.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMAppUsageLevel_toString(SGMAppUsageLevel)");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("SGMetricsDefines.h"), 494, CFSTR("unrecognized tag %lu on SGMAppUsageLevel"), a22.var0);

    v59 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v59 = off_1E4761468[a22.var0];
  }
  tracker = self->_tracker;
  v84[0] = v77;
  v84[1] = v76;
  v84[2] = v79;
  v84[3] = v78;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v62;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v63;
  v84[6] = v75;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a11);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v84[7] = v64;
  v84[8] = v74;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a13);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v84[9] = v65;
  v84[10] = v73;
  v84[11] = v72;
  v84[12] = v71;
  v84[13] = v70;
  v84[14] = v67;
  v84[15] = v69;
  v84[16] = v68;
  v84[17] = v56;
  v84[18] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 19);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v66, a3);

}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
