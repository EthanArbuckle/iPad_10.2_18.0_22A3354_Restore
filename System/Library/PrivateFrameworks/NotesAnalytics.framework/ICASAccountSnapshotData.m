@implementation ICASAccountSnapshotData

- (id)initWithUserStartMonth:(void *)a3 userStartYear:(void *)a4 saltVersion:(void *)a5 accountSnapshotSummary:(void *)a6 accountNotesTwoFactorSummary:(void *)a7 collabNotesSummary:(void *)a8 collabFoldersSummary:(id)a9 noteAttachmentSummary:(id)a10 scrapPaperAttachmentSummary:(id)a11 lockedNotesSummary:(id)a12 smartFoldersSummary:(id)a13 totalNoteCount:(id)a14 totalFolderCount:(id)a15 totalSmartFolderCount:(id)a16 totalChecklistCount:(id)a17 totalNotesWithChecklistCount:(id)a18 totalCountOfPinnedNotes:(id)a19 totalCountOfLockedNotes:(id)a20 deviceSnapshotSummary:(id)a21 userSnapshotSummary:(id)a22 attachmentUTISummary:(id)a23 folderDirectNoteCountHistogram:(id)a24 collabRootFolderTotalNoteCountHistogram:(id)a25 docScanPageCountHistogram:(id)a26 collabOwnedRootFolderInviteeCountHistogram:(id)a27 collabOwnedRootFolderAcceptanceCountHistogram:(id)a28 collabOwnedRootFolderNoReplyCountHistogram:(id)a29 collabOwnedRootFolderAcceptanceRatioHistogram:(id)a30 collabOwnedSingleNoteInviteeCountHistogram:(id)a31 collabOwnedSingleNoteAcceptanceCountHistogram:(id)a32 collabOwnedSingleNoteNoReplyCountHistogram:(id)a33 collabOwnedSingleNoteAcceptanceRatioHistogram:(id)a34 noteCharCountHistogram:(id)a35 inlineDrawingV1TotalStrokeCountHistogram:(id)a36 inlineDrawingV1PencilStrokeCountHistogram:(id)a37 inlineDrawingV1FingerStrokeCountHistogram:(id)a38 inlineDrawingV1FingerStrokeRatioHistogram:(id)a39 inlineDrawingV2TotalStrokeCountHistogram:(id)a40 inlineDrawingV2PencilStrokeCountHistogram:(id)a41 inlineDrawingV2FingerStrokeCountHistogram:(id)a42 inlineDrawingV2FingerStrokeRatioHistogram:(id)a43 fullscreenDrawingStrokeCountHistogram:(id)a44 tableRowCountHistogram:(id)a45 tableColumnCountHistogram:(id)a46 tableCellCountHistogram:(id)a47 passwordProtectedNoteWeeklyAgeHistogram:(id)a48 topLevelFolderTotalNoteCountHistogram:(id)a49 attachmentCountPerNoteHistogram:(id)a50 drawingCountPerNoteHistogram:(id)a51 inlineDrawingFingerStrokesCountPerNoteHistogram:(id)a52 inlineDrawingPencilStrokesCountPerNoteHistogram:(id)a53 fullScreenDrawingStrokesCountPerNoteHistogram:(id)a54 totalStrokesCountPerNoteHistogram:(id)a55 tagCountPerNoteHistogram:(id)a56 distinctTagCountPerNoteHistogram:(id)a57 totalCountOfNotesWithTags:(id)a58 totalCountOfNotesWithCollapsedSections:(id)a59 totalCountOfNotesWithMentions:(id)a60 totalScrapPaperCount:(id)a61 totalCountOfScrapPapersWithTags:(id)a62 totalCountOfScrapPapersWithMentions:(id)a63 totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:
{
  id a64;
  id a65;
  id a66;
  id a67;
  id a68;
  id a69;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  ICASAccountSnapshotData *v78;
  id *p_isa;
  id v82;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  objc_super v147;

  v144 = a3;
  v82 = a4;
  v143 = a4;
  v142 = a5;
  v141 = a6;
  v140 = a7;
  v139 = a8;
  v138 = a9;
  v137 = a10;
  v136 = a11;
  v135 = a12;
  v134 = a13;
  v133 = a14;
  v132 = a15;
  v131 = a16;
  v130 = a17;
  v129 = a18;
  v128 = a19;
  v127 = a20;
  v126 = a21;
  v125 = a22;
  v124 = a23;
  v123 = a24;
  v122 = a25;
  v121 = a26;
  v120 = a27;
  v119 = a28;
  v118 = a29;
  v117 = a30;
  v116 = a31;
  v115 = a32;
  v114 = a33;
  v113 = a34;
  v112 = a35;
  v111 = a36;
  v110 = a37;
  v109 = a38;
  v108 = a39;
  v107 = a40;
  v106 = a41;
  v105 = a42;
  v72 = a43;
  v92 = a44;
  v73 = a45;
  v74 = a46;
  v75 = a47;
  v76 = a48;
  v93 = a49;
  v77 = a50;
  v95 = a51;
  v104 = a52;
  v103 = a53;
  v102 = a54;
  v101 = a55;
  v100 = a56;
  v99 = a57;
  v98 = a58;
  v97 = a59;
  v96 = a60;
  v94 = a61;
  v91 = a62;
  v90 = a63;
  v89 = a64;
  v88 = a65;
  v87 = a66;
  v86 = a67;
  v85 = a68;
  v84 = a69;
  v147.receiver = a1;
  v147.super_class = (Class)ICASAccountSnapshotData;
  v78 = -[ICASAccountSnapshotData init](&v147, sel_init);
  p_isa = (id *)&v78->super.isa;
  if (v78)
  {
    objc_storeStrong((id *)&v78->_userStartMonth, a3);
    objc_storeStrong(p_isa + 2, v82);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
    objc_storeStrong(p_isa + 9, a11);
    objc_storeStrong(p_isa + 10, a12);
    objc_storeStrong(p_isa + 11, a13);
    objc_storeStrong(p_isa + 12, a14);
    objc_storeStrong(p_isa + 13, a15);
    objc_storeStrong(p_isa + 14, a16);
    objc_storeStrong(p_isa + 15, a17);
    objc_storeStrong(p_isa + 16, a18);
    objc_storeStrong(p_isa + 17, a19);
    objc_storeStrong(p_isa + 18, a20);
    objc_storeStrong(p_isa + 19, a21);
    objc_storeStrong(p_isa + 20, a22);
    objc_storeStrong(p_isa + 21, a23);
    objc_storeStrong(p_isa + 22, a24);
    objc_storeStrong(p_isa + 23, a25);
    objc_storeStrong(p_isa + 24, a26);
    objc_storeStrong(p_isa + 25, a27);
    objc_storeStrong(p_isa + 26, a28);
    objc_storeStrong(p_isa + 27, a29);
    objc_storeStrong(p_isa + 28, a30);
    objc_storeStrong(p_isa + 29, a31);
    objc_storeStrong(p_isa + 30, a32);
    objc_storeStrong(p_isa + 31, a33);
    objc_storeStrong(p_isa + 32, a34);
    objc_storeStrong(p_isa + 33, a35);
    objc_storeStrong(p_isa + 34, a36);
    objc_storeStrong(p_isa + 35, a37);
    objc_storeStrong(p_isa + 36, a38);
    objc_storeStrong(p_isa + 37, a39);
    objc_storeStrong(p_isa + 38, a40);
    objc_storeStrong(p_isa + 39, a41);
    objc_storeStrong(p_isa + 40, a42);
    objc_storeStrong(p_isa + 41, a43);
    objc_storeStrong(p_isa + 42, a44);
    objc_storeStrong(p_isa + 43, a45);
    objc_storeStrong(p_isa + 44, a46);
    objc_storeStrong(p_isa + 45, a47);
    objc_storeStrong(p_isa + 46, a48);
    objc_storeStrong(p_isa + 47, a49);
    objc_storeStrong(p_isa + 48, a50);
    objc_storeStrong(p_isa + 49, a51);
    objc_storeStrong(p_isa + 50, a52);
    objc_storeStrong(p_isa + 51, a53);
    objc_storeStrong(p_isa + 52, a54);
    objc_storeStrong(p_isa + 53, a55);
    objc_storeStrong(p_isa + 54, a56);
    objc_storeStrong(p_isa + 55, a57);
    objc_storeStrong(p_isa + 56, a58);
    objc_storeStrong(p_isa + 57, a59);
    objc_storeStrong(p_isa + 58, a60);
    objc_storeStrong(p_isa + 59, a61);
    objc_storeStrong(p_isa + 60, a62);
    objc_storeStrong(p_isa + 61, a63);
    objc_storeStrong(p_isa + 62, a64);
    objc_storeStrong(p_isa + 63, a65);
    objc_storeStrong(p_isa + 64, a66);
    objc_storeStrong(p_isa + 65, a67);
    objc_storeStrong(p_isa + 66, a68);
    objc_storeStrong(p_isa + 67, a69);
  }

  return p_isa;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("AccountSnapshotData");
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  _QWORD v206[67];
  _QWORD v207[69];

  v207[67] = *MEMORY[0x1E0C80C00];
  v206[0] = CFSTR("userStartMonth");
  -[ICASAccountSnapshotData userStartMonth](self, "userStartMonth");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  if (v205)
  {
    -[ICASAccountSnapshotData userStartMonth](self, "userStartMonth");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v204 = (void *)v3;
  v207[0] = v3;
  v206[1] = CFSTR("userStartYear");
  -[ICASAccountSnapshotData userStartYear](self, "userStartYear");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  if (v203)
  {
    -[ICASAccountSnapshotData userStartYear](self, "userStartYear");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v202 = (void *)v4;
  v207[1] = v4;
  v206[2] = CFSTR("saltVersion");
  -[ICASAccountSnapshotData saltVersion](self, "saltVersion");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  if (v201)
  {
    -[ICASAccountSnapshotData saltVersion](self, "saltVersion");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v200 = (void *)v5;
  v207[2] = v5;
  v206[3] = CFSTR("accountSnapshotSummary");
  -[ICASAccountSnapshotData accountSnapshotSummary](self, "accountSnapshotSummary");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  if (v199)
  {
    -[ICASAccountSnapshotData accountSnapshotSummary](self, "accountSnapshotSummary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v198 = (void *)v6;
  v207[3] = v6;
  v206[4] = CFSTR("accountNotesTwoFactorSummary");
  -[ICASAccountSnapshotData accountNotesTwoFactorSummary](self, "accountNotesTwoFactorSummary");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    -[ICASAccountSnapshotData accountNotesTwoFactorSummary](self, "accountNotesTwoFactorSummary");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v196 = (void *)v7;
  v207[4] = v7;
  v206[5] = CFSTR("collabNotesSummary");
  -[ICASAccountSnapshotData collabNotesSummary](self, "collabNotesSummary");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (v195)
  {
    -[ICASAccountSnapshotData collabNotesSummary](self, "collabNotesSummary");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v194 = (void *)v8;
  v207[5] = v8;
  v206[6] = CFSTR("collabFoldersSummary");
  -[ICASAccountSnapshotData collabFoldersSummary](self, "collabFoldersSummary");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    -[ICASAccountSnapshotData collabFoldersSummary](self, "collabFoldersSummary");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v192 = (void *)v9;
  v207[6] = v9;
  v206[7] = CFSTR("noteAttachmentSummary");
  -[ICASAccountSnapshotData noteAttachmentSummary](self, "noteAttachmentSummary");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (v191)
  {
    -[ICASAccountSnapshotData noteAttachmentSummary](self, "noteAttachmentSummary");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v190 = (void *)v10;
  v207[7] = v10;
  v206[8] = CFSTR("scrapPaperAttachmentSummary");
  -[ICASAccountSnapshotData scrapPaperAttachmentSummary](self, "scrapPaperAttachmentSummary");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (v189)
  {
    -[ICASAccountSnapshotData scrapPaperAttachmentSummary](self, "scrapPaperAttachmentSummary");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v188 = (void *)v11;
  v207[8] = v11;
  v206[9] = CFSTR("lockedNotesSummary");
  -[ICASAccountSnapshotData lockedNotesSummary](self, "lockedNotesSummary");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    -[ICASAccountSnapshotData lockedNotesSummary](self, "lockedNotesSummary");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v186 = (void *)v12;
  v207[9] = v12;
  v206[10] = CFSTR("smartFoldersSummary");
  -[ICASAccountSnapshotData smartFoldersSummary](self, "smartFoldersSummary");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  if (v185)
  {
    -[ICASAccountSnapshotData smartFoldersSummary](self, "smartFoldersSummary");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v184 = (void *)v13;
  v207[10] = v13;
  v206[11] = CFSTR("totalNoteCount");
  -[ICASAccountSnapshotData totalNoteCount](self, "totalNoteCount");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    -[ICASAccountSnapshotData totalNoteCount](self, "totalNoteCount");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v182 = (void *)v14;
  v207[11] = v14;
  v206[12] = CFSTR("totalFolderCount");
  -[ICASAccountSnapshotData totalFolderCount](self, "totalFolderCount");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  if (v181)
  {
    -[ICASAccountSnapshotData totalFolderCount](self, "totalFolderCount");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v180 = (void *)v15;
  v207[12] = v15;
  v206[13] = CFSTR("totalSmartFolderCount");
  -[ICASAccountSnapshotData totalSmartFolderCount](self, "totalSmartFolderCount");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  if (v179)
  {
    -[ICASAccountSnapshotData totalSmartFolderCount](self, "totalSmartFolderCount");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v178 = (void *)v16;
  v207[13] = v16;
  v206[14] = CFSTR("totalChecklistCount");
  -[ICASAccountSnapshotData totalChecklistCount](self, "totalChecklistCount");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  if (v177)
  {
    -[ICASAccountSnapshotData totalChecklistCount](self, "totalChecklistCount");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v176 = (void *)v17;
  v207[14] = v17;
  v206[15] = CFSTR("totalNotesWithChecklistCount");
  -[ICASAccountSnapshotData totalNotesWithChecklistCount](self, "totalNotesWithChecklistCount");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v175)
  {
    -[ICASAccountSnapshotData totalNotesWithChecklistCount](self, "totalNotesWithChecklistCount");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_opt_new();
  }
  v174 = (void *)v18;
  v207[15] = v18;
  v206[16] = CFSTR("totalCountOfPinnedNotes");
  -[ICASAccountSnapshotData totalCountOfPinnedNotes](self, "totalCountOfPinnedNotes");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    -[ICASAccountSnapshotData totalCountOfPinnedNotes](self, "totalCountOfPinnedNotes");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v172 = (void *)v19;
  v207[16] = v19;
  v206[17] = CFSTR("totalCountOfLockedNotes");
  -[ICASAccountSnapshotData totalCountOfLockedNotes](self, "totalCountOfLockedNotes");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  if (v171)
  {
    -[ICASAccountSnapshotData totalCountOfLockedNotes](self, "totalCountOfLockedNotes");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v170 = (void *)v20;
  v207[17] = v20;
  v206[18] = CFSTR("deviceSnapshotSummary");
  -[ICASAccountSnapshotData deviceSnapshotSummary](self, "deviceSnapshotSummary");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  if (v169)
  {
    -[ICASAccountSnapshotData deviceSnapshotSummary](self, "deviceSnapshotSummary");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_opt_new();
  }
  v168 = (void *)v21;
  v207[18] = v21;
  v206[19] = CFSTR("userSnapshotSummary");
  -[ICASAccountSnapshotData userSnapshotSummary](self, "userSnapshotSummary");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    -[ICASAccountSnapshotData userSnapshotSummary](self, "userSnapshotSummary");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = objc_opt_new();
  }
  v166 = (void *)v22;
  v207[19] = v22;
  v206[20] = CFSTR("attachmentUTISummary");
  -[ICASAccountSnapshotData attachmentUTISummary](self, "attachmentUTISummary");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  if (v165)
  {
    -[ICASAccountSnapshotData attachmentUTISummary](self, "attachmentUTISummary");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_opt_new();
  }
  v164 = (void *)v23;
  v207[20] = v23;
  v206[21] = CFSTR("folderDirectNoteCountHistogram");
  -[ICASAccountSnapshotData folderDirectNoteCountHistogram](self, "folderDirectNoteCountHistogram");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    -[ICASAccountSnapshotData folderDirectNoteCountHistogram](self, "folderDirectNoteCountHistogram");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = objc_opt_new();
  }
  v162 = (void *)v24;
  v207[21] = v24;
  v206[22] = CFSTR("collabRootFolderTotalNoteCountHistogram");
  -[ICASAccountSnapshotData collabRootFolderTotalNoteCountHistogram](self, "collabRootFolderTotalNoteCountHistogram");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v161)
  {
    -[ICASAccountSnapshotData collabRootFolderTotalNoteCountHistogram](self, "collabRootFolderTotalNoteCountHistogram");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = objc_opt_new();
  }
  v160 = (void *)v25;
  v207[22] = v25;
  v206[23] = CFSTR("docScanPageCountHistogram");
  -[ICASAccountSnapshotData docScanPageCountHistogram](self, "docScanPageCountHistogram");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (v159)
  {
    -[ICASAccountSnapshotData docScanPageCountHistogram](self, "docScanPageCountHistogram");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = objc_opt_new();
  }
  v158 = (void *)v26;
  v207[23] = v26;
  v206[24] = CFSTR("collabOwnedRootFolderInviteeCountHistogram");
  -[ICASAccountSnapshotData collabOwnedRootFolderInviteeCountHistogram](self, "collabOwnedRootFolderInviteeCountHistogram");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    -[ICASAccountSnapshotData collabOwnedRootFolderInviteeCountHistogram](self, "collabOwnedRootFolderInviteeCountHistogram");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = objc_opt_new();
  }
  v156 = (void *)v27;
  v207[24] = v27;
  v206[25] = CFSTR("collabOwnedRootFolderAcceptanceCountHistogram");
  -[ICASAccountSnapshotData collabOwnedRootFolderAcceptanceCountHistogram](self, "collabOwnedRootFolderAcceptanceCountHistogram");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    -[ICASAccountSnapshotData collabOwnedRootFolderAcceptanceCountHistogram](self, "collabOwnedRootFolderAcceptanceCountHistogram");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = objc_opt_new();
  }
  v154 = (void *)v28;
  v207[25] = v28;
  v206[26] = CFSTR("collabOwnedRootFolderNoReplyCountHistogram");
  -[ICASAccountSnapshotData collabOwnedRootFolderNoReplyCountHistogram](self, "collabOwnedRootFolderNoReplyCountHistogram");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    -[ICASAccountSnapshotData collabOwnedRootFolderNoReplyCountHistogram](self, "collabOwnedRootFolderNoReplyCountHistogram");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = objc_opt_new();
  }
  v152 = (void *)v29;
  v207[26] = v29;
  v206[27] = CFSTR("collabOwnedRootFolderAcceptanceRatioHistogram");
  -[ICASAccountSnapshotData collabOwnedRootFolderAcceptanceRatioHistogram](self, "collabOwnedRootFolderAcceptanceRatioHistogram");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    -[ICASAccountSnapshotData collabOwnedRootFolderAcceptanceRatioHistogram](self, "collabOwnedRootFolderAcceptanceRatioHistogram");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = objc_opt_new();
  }
  v150 = (void *)v30;
  v207[27] = v30;
  v206[28] = CFSTR("collabOwnedSingleNoteInviteeCountHistogram");
  -[ICASAccountSnapshotData collabOwnedSingleNoteInviteeCountHistogram](self, "collabOwnedSingleNoteInviteeCountHistogram");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    -[ICASAccountSnapshotData collabOwnedSingleNoteInviteeCountHistogram](self, "collabOwnedSingleNoteInviteeCountHistogram");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = objc_opt_new();
  }
  v148 = (void *)v31;
  v207[28] = v31;
  v206[29] = CFSTR("collabOwnedSingleNoteAcceptanceCountHistogram");
  -[ICASAccountSnapshotData collabOwnedSingleNoteAcceptanceCountHistogram](self, "collabOwnedSingleNoteAcceptanceCountHistogram");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    -[ICASAccountSnapshotData collabOwnedSingleNoteAcceptanceCountHistogram](self, "collabOwnedSingleNoteAcceptanceCountHistogram");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = objc_opt_new();
  }
  v146 = (void *)v32;
  v207[29] = v32;
  v206[30] = CFSTR("collabOwnedSingleNoteNoReplyCountHistogram");
  -[ICASAccountSnapshotData collabOwnedSingleNoteNoReplyCountHistogram](self, "collabOwnedSingleNoteNoReplyCountHistogram");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  if (v145)
  {
    -[ICASAccountSnapshotData collabOwnedSingleNoteNoReplyCountHistogram](self, "collabOwnedSingleNoteNoReplyCountHistogram");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = objc_opt_new();
  }
  v144 = (void *)v33;
  v207[30] = v33;
  v206[31] = CFSTR("collabOwnedSingleNoteAcceptanceRatioHistogram");
  -[ICASAccountSnapshotData collabOwnedSingleNoteAcceptanceRatioHistogram](self, "collabOwnedSingleNoteAcceptanceRatioHistogram");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    -[ICASAccountSnapshotData collabOwnedSingleNoteAcceptanceRatioHistogram](self, "collabOwnedSingleNoteAcceptanceRatioHistogram");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = objc_opt_new();
  }
  v142 = (void *)v34;
  v207[31] = v34;
  v206[32] = CFSTR("noteCharCountHistogram");
  -[ICASAccountSnapshotData noteCharCountHistogram](self, "noteCharCountHistogram");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (v141)
  {
    -[ICASAccountSnapshotData noteCharCountHistogram](self, "noteCharCountHistogram");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = objc_opt_new();
  }
  v140 = (void *)v35;
  v207[32] = v35;
  v206[33] = CFSTR("inlineDrawingV1TotalStrokeCountHistogram");
  -[ICASAccountSnapshotData inlineDrawingV1TotalStrokeCountHistogram](self, "inlineDrawingV1TotalStrokeCountHistogram");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if (v139)
  {
    -[ICASAccountSnapshotData inlineDrawingV1TotalStrokeCountHistogram](self, "inlineDrawingV1TotalStrokeCountHistogram");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = objc_opt_new();
  }
  v138 = (void *)v36;
  v207[33] = v36;
  v206[34] = CFSTR("inlineDrawingV1PencilStrokeCountHistogram");
  -[ICASAccountSnapshotData inlineDrawingV1PencilStrokeCountHistogram](self, "inlineDrawingV1PencilStrokeCountHistogram");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    -[ICASAccountSnapshotData inlineDrawingV1PencilStrokeCountHistogram](self, "inlineDrawingV1PencilStrokeCountHistogram");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = objc_opt_new();
  }
  v136 = (void *)v37;
  v207[34] = v37;
  v206[35] = CFSTR("inlineDrawingV1FingerStrokeCountHistogram");
  -[ICASAccountSnapshotData inlineDrawingV1FingerStrokeCountHistogram](self, "inlineDrawingV1FingerStrokeCountHistogram");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    -[ICASAccountSnapshotData inlineDrawingV1FingerStrokeCountHistogram](self, "inlineDrawingV1FingerStrokeCountHistogram");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = objc_opt_new();
  }
  v134 = (void *)v38;
  v207[35] = v38;
  v206[36] = CFSTR("inlineDrawingV1FingerStrokeRatioHistogram");
  -[ICASAccountSnapshotData inlineDrawingV1FingerStrokeRatioHistogram](self, "inlineDrawingV1FingerStrokeRatioHistogram");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    -[ICASAccountSnapshotData inlineDrawingV1FingerStrokeRatioHistogram](self, "inlineDrawingV1FingerStrokeRatioHistogram");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = objc_opt_new();
  }
  v132 = (void *)v39;
  v207[36] = v39;
  v206[37] = CFSTR("inlineDrawingV2TotalStrokeCountHistogram");
  -[ICASAccountSnapshotData inlineDrawingV2TotalStrokeCountHistogram](self, "inlineDrawingV2TotalStrokeCountHistogram");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    -[ICASAccountSnapshotData inlineDrawingV2TotalStrokeCountHistogram](self, "inlineDrawingV2TotalStrokeCountHistogram");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = objc_opt_new();
  }
  v130 = (void *)v40;
  v207[37] = v40;
  v206[38] = CFSTR("inlineDrawingV2PencilStrokeCountHistogram");
  -[ICASAccountSnapshotData inlineDrawingV2PencilStrokeCountHistogram](self, "inlineDrawingV2PencilStrokeCountHistogram");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    -[ICASAccountSnapshotData inlineDrawingV2PencilStrokeCountHistogram](self, "inlineDrawingV2PencilStrokeCountHistogram");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = objc_opt_new();
  }
  v128 = (void *)v41;
  v207[38] = v41;
  v206[39] = CFSTR("inlineDrawingV2FingerStrokeCountHistogram");
  -[ICASAccountSnapshotData inlineDrawingV2FingerStrokeCountHistogram](self, "inlineDrawingV2FingerStrokeCountHistogram");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    -[ICASAccountSnapshotData inlineDrawingV2FingerStrokeCountHistogram](self, "inlineDrawingV2FingerStrokeCountHistogram");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = objc_opt_new();
  }
  v126 = (void *)v42;
  v207[39] = v42;
  v206[40] = CFSTR("inlineDrawingV2FingerStrokeRatioHistogram");
  -[ICASAccountSnapshotData inlineDrawingV2FingerStrokeRatioHistogram](self, "inlineDrawingV2FingerStrokeRatioHistogram");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    -[ICASAccountSnapshotData inlineDrawingV2FingerStrokeRatioHistogram](self, "inlineDrawingV2FingerStrokeRatioHistogram");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = objc_opt_new();
  }
  v124 = (void *)v43;
  v207[40] = v43;
  v206[41] = CFSTR("fullscreenDrawingStrokeCountHistogram");
  -[ICASAccountSnapshotData fullscreenDrawingStrokeCountHistogram](self, "fullscreenDrawingStrokeCountHistogram");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    -[ICASAccountSnapshotData fullscreenDrawingStrokeCountHistogram](self, "fullscreenDrawingStrokeCountHistogram");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = objc_opt_new();
  }
  v122 = (void *)v44;
  v207[41] = v44;
  v206[42] = CFSTR("tableRowCountHistogram");
  -[ICASAccountSnapshotData tableRowCountHistogram](self, "tableRowCountHistogram");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (v121)
  {
    -[ICASAccountSnapshotData tableRowCountHistogram](self, "tableRowCountHistogram");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = objc_opt_new();
  }
  v120 = (void *)v45;
  v207[42] = v45;
  v206[43] = CFSTR("tableColumnCountHistogram");
  -[ICASAccountSnapshotData tableColumnCountHistogram](self, "tableColumnCountHistogram");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    -[ICASAccountSnapshotData tableColumnCountHistogram](self, "tableColumnCountHistogram");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = objc_opt_new();
  }
  v118 = (void *)v46;
  v207[43] = v46;
  v206[44] = CFSTR("tableCellCountHistogram");
  -[ICASAccountSnapshotData tableCellCountHistogram](self, "tableCellCountHistogram");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    -[ICASAccountSnapshotData tableCellCountHistogram](self, "tableCellCountHistogram");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = objc_opt_new();
  }
  v116 = (void *)v47;
  v207[44] = v47;
  v206[45] = CFSTR("passwordProtectedNoteWeeklyAgeHistogram");
  -[ICASAccountSnapshotData passwordProtectedNoteWeeklyAgeHistogram](self, "passwordProtectedNoteWeeklyAgeHistogram");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    -[ICASAccountSnapshotData passwordProtectedNoteWeeklyAgeHistogram](self, "passwordProtectedNoteWeeklyAgeHistogram");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = objc_opt_new();
  }
  v114 = (void *)v48;
  v207[45] = v48;
  v206[46] = CFSTR("topLevelFolderTotalNoteCountHistogram");
  -[ICASAccountSnapshotData topLevelFolderTotalNoteCountHistogram](self, "topLevelFolderTotalNoteCountHistogram");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    -[ICASAccountSnapshotData topLevelFolderTotalNoteCountHistogram](self, "topLevelFolderTotalNoteCountHistogram");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = objc_opt_new();
  }
  v112 = (void *)v49;
  v207[46] = v49;
  v206[47] = CFSTR("attachmentCountPerNoteHistogram");
  -[ICASAccountSnapshotData attachmentCountPerNoteHistogram](self, "attachmentCountPerNoteHistogram");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    -[ICASAccountSnapshotData attachmentCountPerNoteHistogram](self, "attachmentCountPerNoteHistogram");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = objc_opt_new();
  }
  v110 = (void *)v50;
  v207[47] = v50;
  v206[48] = CFSTR("drawingCountPerNoteHistogram");
  -[ICASAccountSnapshotData drawingCountPerNoteHistogram](self, "drawingCountPerNoteHistogram");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    -[ICASAccountSnapshotData drawingCountPerNoteHistogram](self, "drawingCountPerNoteHistogram");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = objc_opt_new();
  }
  v108 = (void *)v51;
  v207[48] = v51;
  v206[49] = CFSTR("inlineDrawingFingerStrokesCountPerNoteHistogram");
  -[ICASAccountSnapshotData inlineDrawingFingerStrokesCountPerNoteHistogram](self, "inlineDrawingFingerStrokesCountPerNoteHistogram");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    -[ICASAccountSnapshotData inlineDrawingFingerStrokesCountPerNoteHistogram](self, "inlineDrawingFingerStrokesCountPerNoteHistogram");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = objc_opt_new();
  }
  v106 = (void *)v52;
  v207[49] = v52;
  v206[50] = CFSTR("inlineDrawingPencilStrokesCountPerNoteHistogram");
  -[ICASAccountSnapshotData inlineDrawingPencilStrokesCountPerNoteHistogram](self, "inlineDrawingPencilStrokesCountPerNoteHistogram");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    -[ICASAccountSnapshotData inlineDrawingPencilStrokesCountPerNoteHistogram](self, "inlineDrawingPencilStrokesCountPerNoteHistogram");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = objc_opt_new();
  }
  v104 = (void *)v53;
  v207[50] = v53;
  v206[51] = CFSTR("fullScreenDrawingStrokesCountPerNoteHistogram");
  -[ICASAccountSnapshotData fullScreenDrawingStrokesCountPerNoteHistogram](self, "fullScreenDrawingStrokesCountPerNoteHistogram");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    -[ICASAccountSnapshotData fullScreenDrawingStrokesCountPerNoteHistogram](self, "fullScreenDrawingStrokesCountPerNoteHistogram");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = objc_opt_new();
  }
  v102 = (void *)v54;
  v207[51] = v54;
  v206[52] = CFSTR("totalStrokesCountPerNoteHistogram");
  -[ICASAccountSnapshotData totalStrokesCountPerNoteHistogram](self, "totalStrokesCountPerNoteHistogram");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    -[ICASAccountSnapshotData totalStrokesCountPerNoteHistogram](self, "totalStrokesCountPerNoteHistogram");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = objc_opt_new();
  }
  v100 = (void *)v55;
  v207[52] = v55;
  v206[53] = CFSTR("tagCountPerNoteHistogram");
  -[ICASAccountSnapshotData tagCountPerNoteHistogram](self, "tagCountPerNoteHistogram");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    -[ICASAccountSnapshotData tagCountPerNoteHistogram](self, "tagCountPerNoteHistogram");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = objc_opt_new();
  }
  v98 = (void *)v56;
  v207[53] = v56;
  v206[54] = CFSTR("distinctTagCountPerNoteHistogram");
  -[ICASAccountSnapshotData distinctTagCountPerNoteHistogram](self, "distinctTagCountPerNoteHistogram");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    -[ICASAccountSnapshotData distinctTagCountPerNoteHistogram](self, "distinctTagCountPerNoteHistogram");
    v57 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57 = objc_opt_new();
  }
  v96 = (void *)v57;
  v207[54] = v57;
  v206[55] = CFSTR("totalCountOfNotesWithTags");
  -[ICASAccountSnapshotData totalCountOfNotesWithTags](self, "totalCountOfNotesWithTags");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    -[ICASAccountSnapshotData totalCountOfNotesWithTags](self, "totalCountOfNotesWithTags");
    v58 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = objc_opt_new();
  }
  v94 = (void *)v58;
  v207[55] = v58;
  v206[56] = CFSTR("totalCountOfNotesWithCollapsedSections");
  -[ICASAccountSnapshotData totalCountOfNotesWithCollapsedSections](self, "totalCountOfNotesWithCollapsedSections");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    -[ICASAccountSnapshotData totalCountOfNotesWithCollapsedSections](self, "totalCountOfNotesWithCollapsedSections");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = objc_opt_new();
  }
  v92 = (void *)v59;
  v207[56] = v59;
  v206[57] = CFSTR("totalCountOfNotesWithMentions");
  -[ICASAccountSnapshotData totalCountOfNotesWithMentions](self, "totalCountOfNotesWithMentions");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    -[ICASAccountSnapshotData totalCountOfNotesWithMentions](self, "totalCountOfNotesWithMentions");
    v60 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = objc_opt_new();
  }
  v90 = (void *)v60;
  v207[57] = v60;
  v206[58] = CFSTR("totalScrapPaperCount");
  -[ICASAccountSnapshotData totalScrapPaperCount](self, "totalScrapPaperCount");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    -[ICASAccountSnapshotData totalScrapPaperCount](self, "totalScrapPaperCount");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = objc_opt_new();
  }
  v88 = (void *)v61;
  v207[58] = v61;
  v206[59] = CFSTR("totalCountOfScrapPapersWithTags");
  -[ICASAccountSnapshotData totalCountOfScrapPapersWithTags](self, "totalCountOfScrapPapersWithTags");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    -[ICASAccountSnapshotData totalCountOfScrapPapersWithTags](self, "totalCountOfScrapPapersWithTags");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = objc_opt_new();
  }
  v86 = (void *)v62;
  v207[59] = v62;
  v206[60] = CFSTR("totalCountOfScrapPapersWithMentions");
  -[ICASAccountSnapshotData totalCountOfScrapPapersWithMentions](self, "totalCountOfScrapPapersWithMentions");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    -[ICASAccountSnapshotData totalCountOfScrapPapersWithMentions](self, "totalCountOfScrapPapersWithMentions");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = objc_opt_new();
  }
  v84 = (void *)v63;
  v207[60] = v63;
  v206[61] = CFSTR("totalCountOfPinnedScrapPapers");
  -[ICASAccountSnapshotData totalCountOfPinnedScrapPapers](self, "totalCountOfPinnedScrapPapers");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    -[ICASAccountSnapshotData totalCountOfPinnedScrapPapers](self, "totalCountOfPinnedScrapPapers");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = objc_opt_new();
  }
  v82 = (void *)v64;
  v207[61] = v64;
  v206[62] = CFSTR("totalCountOfLockedScrapPapers");
  -[ICASAccountSnapshotData totalCountOfLockedScrapPapers](self, "totalCountOfLockedScrapPapers");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    -[ICASAccountSnapshotData totalCountOfLockedScrapPapers](self, "totalCountOfLockedScrapPapers");
    v66 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = objc_opt_new();
  }
  v67 = (void *)v66;
  v207[62] = v66;
  v206[63] = CFSTR("totalCountOfCollaboratedScrapPapers");
  -[ICASAccountSnapshotData totalCountOfCollaboratedScrapPapers](self, "totalCountOfCollaboratedScrapPapers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    -[ICASAccountSnapshotData totalCountOfCollaboratedScrapPapers](self, "totalCountOfCollaboratedScrapPapers");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = objc_opt_new();
  }
  v70 = (void *)v69;
  v207[63] = v69;
  v206[64] = CFSTR("mentionCountPerNoteHistogram");
  -[ICASAccountSnapshotData mentionCountPerNoteHistogram](self, "mentionCountPerNoteHistogram");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    -[ICASAccountSnapshotData mentionCountPerNoteHistogram](self, "mentionCountPerNoteHistogram");
    v72 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = objc_opt_new();
  }
  v73 = (void *)v72;
  v207[64] = v72;
  v206[65] = CFSTR("distinctMentionCountPerNoteHistogram");
  -[ICASAccountSnapshotData distinctMentionCountPerNoteHistogram](self, "distinctMentionCountPerNoteHistogram");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    -[ICASAccountSnapshotData distinctMentionCountPerNoteHistogram](self, "distinctMentionCountPerNoteHistogram");
    v75 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = objc_opt_new();
  }
  v76 = (void *)v75;
  v207[65] = v75;
  v206[66] = CFSTR("totalCountOfNotesWithMathUsage");
  -[ICASAccountSnapshotData totalCountOfNotesWithMathUsage](self, "totalCountOfNotesWithMathUsage");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    -[ICASAccountSnapshotData totalCountOfNotesWithMathUsage](self, "totalCountOfNotesWithMathUsage");
    v78 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = objc_opt_new();
  }
  v79 = (void *)v78;
  v207[66] = v78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v207, v206, 67);
  v81 = (id)objc_claimAutoreleasedReturnValue();

  return v81;
}

- (NSNumber)userStartMonth
{
  return self->_userStartMonth;
}

- (NSNumber)userStartYear
{
  return self->_userStartYear;
}

- (NSString)saltVersion
{
  return self->_saltVersion;
}

- (NSArray)accountSnapshotSummary
{
  return self->_accountSnapshotSummary;
}

- (NSArray)accountNotesTwoFactorSummary
{
  return self->_accountNotesTwoFactorSummary;
}

- (NSArray)collabNotesSummary
{
  return self->_collabNotesSummary;
}

- (NSArray)collabFoldersSummary
{
  return self->_collabFoldersSummary;
}

- (NSArray)noteAttachmentSummary
{
  return self->_noteAttachmentSummary;
}

- (NSArray)scrapPaperAttachmentSummary
{
  return self->_scrapPaperAttachmentSummary;
}

- (NSArray)lockedNotesSummary
{
  return self->_lockedNotesSummary;
}

- (NSArray)smartFoldersSummary
{
  return self->_smartFoldersSummary;
}

- (NSNumber)totalNoteCount
{
  return self->_totalNoteCount;
}

- (NSNumber)totalFolderCount
{
  return self->_totalFolderCount;
}

- (NSNumber)totalSmartFolderCount
{
  return self->_totalSmartFolderCount;
}

- (NSNumber)totalChecklistCount
{
  return self->_totalChecklistCount;
}

- (NSNumber)totalNotesWithChecklistCount
{
  return self->_totalNotesWithChecklistCount;
}

- (NSNumber)totalCountOfPinnedNotes
{
  return self->_totalCountOfPinnedNotes;
}

- (NSNumber)totalCountOfLockedNotes
{
  return self->_totalCountOfLockedNotes;
}

- (NSArray)deviceSnapshotSummary
{
  return self->_deviceSnapshotSummary;
}

- (NSArray)userSnapshotSummary
{
  return self->_userSnapshotSummary;
}

- (NSArray)attachmentUTISummary
{
  return self->_attachmentUTISummary;
}

- (NSArray)folderDirectNoteCountHistogram
{
  return self->_folderDirectNoteCountHistogram;
}

- (NSArray)collabRootFolderTotalNoteCountHistogram
{
  return self->_collabRootFolderTotalNoteCountHistogram;
}

- (NSArray)docScanPageCountHistogram
{
  return self->_docScanPageCountHistogram;
}

- (NSArray)collabOwnedRootFolderInviteeCountHistogram
{
  return self->_collabOwnedRootFolderInviteeCountHistogram;
}

- (NSArray)collabOwnedRootFolderAcceptanceCountHistogram
{
  return self->_collabOwnedRootFolderAcceptanceCountHistogram;
}

- (NSArray)collabOwnedRootFolderNoReplyCountHistogram
{
  return self->_collabOwnedRootFolderNoReplyCountHistogram;
}

- (NSArray)collabOwnedRootFolderAcceptanceRatioHistogram
{
  return self->_collabOwnedRootFolderAcceptanceRatioHistogram;
}

- (NSArray)collabOwnedSingleNoteInviteeCountHistogram
{
  return self->_collabOwnedSingleNoteInviteeCountHistogram;
}

- (NSArray)collabOwnedSingleNoteAcceptanceCountHistogram
{
  return self->_collabOwnedSingleNoteAcceptanceCountHistogram;
}

- (NSArray)collabOwnedSingleNoteNoReplyCountHistogram
{
  return self->_collabOwnedSingleNoteNoReplyCountHistogram;
}

- (NSArray)collabOwnedSingleNoteAcceptanceRatioHistogram
{
  return self->_collabOwnedSingleNoteAcceptanceRatioHistogram;
}

- (NSArray)noteCharCountHistogram
{
  return self->_noteCharCountHistogram;
}

- (NSArray)inlineDrawingV1TotalStrokeCountHistogram
{
  return self->_inlineDrawingV1TotalStrokeCountHistogram;
}

- (NSArray)inlineDrawingV1PencilStrokeCountHistogram
{
  return self->_inlineDrawingV1PencilStrokeCountHistogram;
}

- (NSArray)inlineDrawingV1FingerStrokeCountHistogram
{
  return self->_inlineDrawingV1FingerStrokeCountHistogram;
}

- (NSArray)inlineDrawingV1FingerStrokeRatioHistogram
{
  return self->_inlineDrawingV1FingerStrokeRatioHistogram;
}

- (NSArray)inlineDrawingV2TotalStrokeCountHistogram
{
  return self->_inlineDrawingV2TotalStrokeCountHistogram;
}

- (NSArray)inlineDrawingV2PencilStrokeCountHistogram
{
  return self->_inlineDrawingV2PencilStrokeCountHistogram;
}

- (NSArray)inlineDrawingV2FingerStrokeCountHistogram
{
  return self->_inlineDrawingV2FingerStrokeCountHistogram;
}

- (NSArray)inlineDrawingV2FingerStrokeRatioHistogram
{
  return self->_inlineDrawingV2FingerStrokeRatioHistogram;
}

- (NSArray)fullscreenDrawingStrokeCountHistogram
{
  return self->_fullscreenDrawingStrokeCountHistogram;
}

- (NSArray)tableRowCountHistogram
{
  return self->_tableRowCountHistogram;
}

- (NSArray)tableColumnCountHistogram
{
  return self->_tableColumnCountHistogram;
}

- (NSArray)tableCellCountHistogram
{
  return self->_tableCellCountHistogram;
}

- (NSArray)passwordProtectedNoteWeeklyAgeHistogram
{
  return self->_passwordProtectedNoteWeeklyAgeHistogram;
}

- (NSArray)topLevelFolderTotalNoteCountHistogram
{
  return self->_topLevelFolderTotalNoteCountHistogram;
}

- (NSArray)attachmentCountPerNoteHistogram
{
  return self->_attachmentCountPerNoteHistogram;
}

- (NSArray)drawingCountPerNoteHistogram
{
  return self->_drawingCountPerNoteHistogram;
}

- (NSArray)inlineDrawingFingerStrokesCountPerNoteHistogram
{
  return self->_inlineDrawingFingerStrokesCountPerNoteHistogram;
}

- (NSArray)inlineDrawingPencilStrokesCountPerNoteHistogram
{
  return self->_inlineDrawingPencilStrokesCountPerNoteHistogram;
}

- (NSArray)fullScreenDrawingStrokesCountPerNoteHistogram
{
  return self->_fullScreenDrawingStrokesCountPerNoteHistogram;
}

- (NSArray)totalStrokesCountPerNoteHistogram
{
  return self->_totalStrokesCountPerNoteHistogram;
}

- (NSArray)tagCountPerNoteHistogram
{
  return self->_tagCountPerNoteHistogram;
}

- (NSArray)distinctTagCountPerNoteHistogram
{
  return self->_distinctTagCountPerNoteHistogram;
}

- (NSNumber)totalCountOfNotesWithTags
{
  return self->_totalCountOfNotesWithTags;
}

- (NSNumber)totalCountOfNotesWithCollapsedSections
{
  return self->_totalCountOfNotesWithCollapsedSections;
}

- (NSNumber)totalCountOfNotesWithMentions
{
  return self->_totalCountOfNotesWithMentions;
}

- (NSNumber)totalScrapPaperCount
{
  return self->_totalScrapPaperCount;
}

- (NSNumber)totalCountOfScrapPapersWithTags
{
  return self->_totalCountOfScrapPapersWithTags;
}

- (NSNumber)totalCountOfScrapPapersWithMentions
{
  return self->_totalCountOfScrapPapersWithMentions;
}

- (NSNumber)totalCountOfPinnedScrapPapers
{
  return self->_totalCountOfPinnedScrapPapers;
}

- (NSNumber)totalCountOfLockedScrapPapers
{
  return self->_totalCountOfLockedScrapPapers;
}

- (NSNumber)totalCountOfCollaboratedScrapPapers
{
  return self->_totalCountOfCollaboratedScrapPapers;
}

- (NSArray)mentionCountPerNoteHistogram
{
  return self->_mentionCountPerNoteHistogram;
}

- (NSArray)distinctMentionCountPerNoteHistogram
{
  return self->_distinctMentionCountPerNoteHistogram;
}

- (NSNumber)totalCountOfNotesWithMathUsage
{
  return self->_totalCountOfNotesWithMathUsage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfNotesWithMathUsage, 0);
  objc_storeStrong((id *)&self->_distinctMentionCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_mentionCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_totalCountOfCollaboratedScrapPapers, 0);
  objc_storeStrong((id *)&self->_totalCountOfLockedScrapPapers, 0);
  objc_storeStrong((id *)&self->_totalCountOfPinnedScrapPapers, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithMentions, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithTags, 0);
  objc_storeStrong((id *)&self->_totalScrapPaperCount, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithMentions, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollapsedSections, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithTags, 0);
  objc_storeStrong((id *)&self->_distinctTagCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_tagCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_totalStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_fullScreenDrawingStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingPencilStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingFingerStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_drawingCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_attachmentCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_topLevelFolderTotalNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_passwordProtectedNoteWeeklyAgeHistogram, 0);
  objc_storeStrong((id *)&self->_tableCellCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableColumnCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableRowCountHistogram, 0);
  objc_storeStrong((id *)&self->_fullscreenDrawingStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeRatioHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2PencilStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2TotalStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeRatioHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1PencilStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1TotalStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_noteCharCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceRatioHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteNoReplyCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteInviteeCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceRatioHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderNoReplyCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderInviteeCountHistogram, 0);
  objc_storeStrong((id *)&self->_docScanPageCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabRootFolderTotalNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_folderDirectNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_attachmentUTISummary, 0);
  objc_storeStrong((id *)&self->_userSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_deviceSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_totalCountOfLockedNotes, 0);
  objc_storeStrong((id *)&self->_totalCountOfPinnedNotes, 0);
  objc_storeStrong((id *)&self->_totalNotesWithChecklistCount, 0);
  objc_storeStrong((id *)&self->_totalChecklistCount, 0);
  objc_storeStrong((id *)&self->_totalSmartFolderCount, 0);
  objc_storeStrong((id *)&self->_totalFolderCount, 0);
  objc_storeStrong((id *)&self->_totalNoteCount, 0);
  objc_storeStrong((id *)&self->_smartFoldersSummary, 0);
  objc_storeStrong((id *)&self->_lockedNotesSummary, 0);
  objc_storeStrong((id *)&self->_scrapPaperAttachmentSummary, 0);
  objc_storeStrong((id *)&self->_noteAttachmentSummary, 0);
  objc_storeStrong((id *)&self->_collabFoldersSummary, 0);
  objc_storeStrong((id *)&self->_collabNotesSummary, 0);
  objc_storeStrong((id *)&self->_accountNotesTwoFactorSummary, 0);
  objc_storeStrong((id *)&self->_accountSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_saltVersion, 0);
  objc_storeStrong((id *)&self->_userStartYear, 0);
  objc_storeStrong((id *)&self->_userStartMonth, 0);
}

@end
