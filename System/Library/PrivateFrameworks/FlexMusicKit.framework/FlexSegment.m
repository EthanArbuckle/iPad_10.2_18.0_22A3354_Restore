@implementation FlexSegment

- (FlexSegment)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  FlexSegment *v8;
  uint64_t v9;
  NSString *name;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *customBarMarkers;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t sampleCount;
  NSArray *v81;
  uint64_t bars;
  void *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  NSDictionary *transitions;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  NSDictionary *markers;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSDictionary *metadataValues;
  objc_super v124;

  v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)FlexSegment;
  v8 = -[FlexSegment init](&v124, sel_init);
  if (v8)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("name"), v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend__decodeTypeInfoFromSegmentName(v8, v11, v12, v13, v14);
    objc_msgSend_objectForKey_(v4, v15, (uint64_t)CFSTR("bars"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_bars = (int)objc_msgSend_intValue(v18, v19, v20, v21, v22);

    objc_msgSend_objectForKey_(v4, v23, (uint64_t)CFSTR("priority"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_priority = (int)objc_msgSend_intValue(v26, v27, v28, v29, v30);

    objc_msgSend_objectForKey_(v4, v31, (uint64_t)CFSTR("beatsPerBar"), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_beatsPerBar = (int)objc_msgSend_intValue(v34, v35, v36, v37, v38);

    if (!v8->_beatsPerBar)
      v8->_beatsPerBar = 4;
    objc_msgSend_objectForKey_(v4, v39, (uint64_t)CFSTR("sampleRate"), v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sampleRate = (int)objc_msgSend_intValue(v42, v43, v44, v45, v46);

    objc_msgSend_objectForKey_(v4, v47, (uint64_t)CFSTR("sampleCount"), v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sampleCount = objc_msgSend_longLongValue(v50, v51, v52, v53, v54);

    objc_msgSend_objectForKey_(v4, v55, (uint64_t)CFSTR("sliceable"), v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sliceable = objc_msgSend_BOOLValue(v58, v59, v60, v61, v62);

    if (v8->_sliceable && objc_msgSend_type(v8, v63, v64, v65, v66) != 2)
      v8->_sliceable = 0;
    objc_msgSend_objectForKey_(v4, v63, (uint64_t)CFSTR("customBarMarkers"), v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_opt_class();
    objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v69, (uint64_t)v67, v68, v70);
    v71 = objc_claimAutoreleasedReturnValue();
    customBarMarkers = v8->_customBarMarkers;
    v8->_customBarMarkers = (NSArray *)v71;

    if (objc_msgSend_count(v8->_customBarMarkers, v73, v74, v75, v76))
    {
      sampleCount = -1;
    }
    else
    {
      v81 = v8->_customBarMarkers;
      v8->_customBarMarkers = 0;

      bars = v8->_bars;
      sampleCount = v8->_sampleCount;
      if (bars >= 1)
        sampleCount /= bars;
    }
    v8->_samplesPerBar = sampleCount;
    objc_msgSend_objectForKey_(v4, v77, (uint64_t)CFSTR("transitions"), v78, v79);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_opt_class();
    objc_msgSend_decodeItemsInDict_asClass_(FlexUtilities, v85, (uint64_t)v83, v84, v86);
    v87 = objc_claimAutoreleasedReturnValue();
    transitions = v8->_transitions;
    v8->_transitions = (NSDictionary *)v87;

    if ((objc_msgSend_sliceable(v8, v89, v90, v91, v92) & 1) == 0
      && objc_msgSend_relinkAllTransitions(v8, v93, v94, v95, v96))
    {
      FlexLogForCategory(1uLL);
      v97 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_DEBUG))
        sub_20D045058(v8, v97, v98, v99, v100);

    }
    if (objc_msgSend_type(v8, v93, v94, v95, v96) == 4)
    {
      objc_msgSend_objectForKey_(v4, v101, (uint64_t)CFSTR("markers"), v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_opt_class();
      objc_msgSend_decodeItemsInDict_asClass_(FlexUtilities, v106, (uint64_t)v104, v105, v107);
      v108 = objc_claimAutoreleasedReturnValue();
      markers = v8->_markers;
      v8->_markers = (NSDictionary *)v108;

    }
    objc_msgSend_objectForKey_(v4, v101, (uint64_t)CFSTR("peakValue"), v102, v103);
    v110 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v4, v111, (uint64_t)CFSTR("loudness"), v112, v113);
    v114 = objc_claimAutoreleasedReturnValue();
    if (v110 | v114)
    {
      v115 = (void *)objc_opt_new();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_setObject_forKey_(v115, v116, v110, (uint64_t)CFSTR("PeakValue"), v117);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_setObject_forKey_(v115, v118, v114, (uint64_t)CFSTR("Loudness"), v120);
      objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v118, (uint64_t)v115, v119, v120);
      v121 = objc_claimAutoreleasedReturnValue();
      metadataValues = v8->_metadataValues;
      v8->_metadataValues = (NSDictionary *)v121;

    }
  }

  return v8;
}

- (id)initAsCrossFade:(id)a3 sampleRate:(int64_t)a4 sampleCount:(int64_t)a5 beatsPerBar:(int64_t)a6
{
  id v11;
  FlexSegment *v12;
  FlexSegment *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *customBarMarkers;
  NSDictionary *transitions;
  FlexSegment *v20;
  objc_super v22;

  v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FlexSegment;
  v12 = -[FlexSegment init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_msgSend__decodeTypeInfoFromSegmentName(v13, v14, v15, v16, v17);
    if (v13->_type != 5)
    {
      v20 = 0;
      goto LABEL_6;
    }
    *(int64x2_t *)&v13->_priority = vdupq_n_s64(1uLL);
    v13->_sampleRate = a4;
    v13->_sampleCount = a5;
    v13->_sliceable = 0;
    v13->_beatsPerBar = a6;
    v13->_samplesPerBar = a5;
    customBarMarkers = v13->_customBarMarkers;
    v13->_customBarMarkers = 0;

    transitions = v13->_transitions;
    v13->_transitions = 0;

    v13->_errors = 0;
  }
  v20 = v13;
LABEL_6:

  return v20;
}

- (int64_t)samplesPerBar
{
  int64_t bars;
  int64_t result;

  if (self->_samplesPerBar == -1)
    return -1;
  bars = self->_bars;
  result = self->_sampleCount;
  if (bars >= 2)
    result /= bars;
  return result;
}

- (FlexSegment)initWithFileAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FlexSegment *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *name;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  FlexSegment *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  FlexSegment *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *customBarMarkers;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  NSDictionary *transitions;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)FlexSegment;
  v9 = -[FlexSegment init](&v60, sel_init);
  if (!v9)
  {
LABEL_9:
    v29 = v9;
    goto LABEL_10;
  }
  objc_msgSend_lastPathComponent(v4, v5, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v10, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  name = v9->_name;
  v9->_name = (NSString *)v15;

  objc_msgSend__decodeTypeInfoFromSegmentName(v9, v17, v18, v19, v20);
  objc_msgSend_readInfoFromAudioFileAtPath_(FlexSegment, v21, (uint64_t)v4, v22, v23);
  v24 = (FlexSegment *)objc_claimAutoreleasedReturnValue();
  v29 = v24;
  if (v24)
  {
    v9->_sampleRate = objc_msgSend_sampleRate(v24, v25, v26, v27, v28);
    v9->_sampleCount = objc_msgSend_sampleCount(v29, v30, v31, v32, v33);
    v9->_beatsPerBar = 4;
    v9->_bars = objc_msgSend_bars(v29, v34, v35, v36, v37);
    v9->_samplesPerBar = objc_msgSend_samplesPerBar(v29, v38, v39, v40, v41);
    objc_msgSend_customBarMarkers(v29, v42, v43, v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    customBarMarkers = v9->_customBarMarkers;
    v9->_customBarMarkers = (NSArray *)v46;

    if (objc_msgSend_type(v9, v48, v49, v50, v51) == 2)
    {
      LODWORD(v56) = 10 * objc_msgSend_intValue(v9->_nameIndex, v52, v53, v54, v55);
      if ((int)v56 >= 100)
        LODWORD(v56) = 100;
      v56 = (int)v56;
    }
    else
    {
      v56 = 0;
    }
    v9->_priority = v56;
    v9->_sliceable = 0;
    v57 = objc_opt_new();
    transitions = v9->_transitions;
    v9->_transitions = (NSDictionary *)v57;

    goto LABEL_9;
  }
LABEL_10:

  return v29;
}

- (id)encodeAsDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("name"), v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  v19 = objc_msgSend_bars(self, v15, v16, v17, v18);
  objc_msgSend_numberWithInteger_(v14, v20, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v24, (uint64_t)v23, (uint64_t)CFSTR("bars"), v25);

  v26 = (void *)MEMORY[0x24BDD16E0];
  v31 = objc_msgSend_priority(self, v27, v28, v29, v30);
  objc_msgSend_numberWithInteger_(v26, v32, v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v36, (uint64_t)v35, (uint64_t)CFSTR("priority"), v37);

  v38 = (void *)MEMORY[0x24BDD16E0];
  v43 = objc_msgSend_beatsPerBar(self, v39, v40, v41, v42);
  objc_msgSend_numberWithInteger_(v38, v44, v43, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v48, (uint64_t)v47, (uint64_t)CFSTR("beatsPerBar"), v49);

  v50 = (void *)MEMORY[0x24BDD16E0];
  v55 = objc_msgSend_sampleRate(self, v51, v52, v53, v54);
  objc_msgSend_numberWithInteger_(v50, v56, v55, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v60, (uint64_t)v59, (uint64_t)CFSTR("sampleRate"), v61);

  v62 = (void *)MEMORY[0x24BDD16E0];
  v67 = objc_msgSend_sampleCount(self, v63, v64, v65, v66);
  objc_msgSend_numberWithLongLong_(v62, v68, v67, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v72, (uint64_t)v71, (uint64_t)CFSTR("sampleCount"), v73);

  if (objc_msgSend_type(self, v74, v75, v76, v77) == 2
    && objc_msgSend_sliceable(self, v78, v79, v80, v81))
  {
    v82 = (void *)MEMORY[0x24BDD16E0];
    v83 = objc_msgSend_sliceable(self, v78, v79, v80, v81);
    objc_msgSend_numberWithBool_(v82, v84, v83, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v6, v88, (uint64_t)v87, (uint64_t)CFSTR("sliceable"), v89);

  }
  objc_msgSend_customBarMarkers(self, v78, v79, v80, v81);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeItemsInArray_(FlexUtilities, v91, (uint64_t)v90, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
    objc_msgSend_setValue_forKey_(v6, v95, (uint64_t)v94, (uint64_t)CFSTR("customBarMarkers"), v98);
  objc_msgSend_transitions(self, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_count(v99, v100, v101, v102, v103);

  if (v104)
  {
    objc_msgSend_transitions(self, v105, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeItemsInDict_(FlexUtilities, v110, (uint64_t)v109, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (v113)
      objc_msgSend_setValue_forKey_(v6, v114, (uint64_t)v113, (uint64_t)CFSTR("transitions"), v115);

  }
  if (objc_msgSend_type(self, v105, v106, v107, v108) == 4)
  {
    objc_msgSend_markers(self, v116, v117, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend_count(v120, v121, v122, v123, v124);

    if (v125)
    {
      objc_msgSend_markers(self, v116, v126, v118, v119);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeItemsInDict_(FlexUtilities, v128, (uint64_t)v127, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();

      if (v131)
        objc_msgSend_setValue_forKey_(v6, v132, (uint64_t)v131, (uint64_t)CFSTR("markers"), v133);

    }
  }
  objc_msgSend_metadataValueForKey_(self, v116, (uint64_t)CFSTR("PeakValue"), v118, v119);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (v137)
    objc_msgSend_setValue_forKey_(v6, v134, (uint64_t)v137, (uint64_t)CFSTR("peakValue"), v136);
  objc_msgSend_metadataValueForKey_(self, v134, (uint64_t)CFSTR("Loudness"), v135, v136);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (v140)
    objc_msgSend_setValue_forKey_(v6, v138, (uint64_t)v140, (uint64_t)CFSTR("loudness"), v139);

  return v6;
}

+ (id)readInfoFromAudioFileAtPath:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;
  const __CFURL *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  FlexMarker *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  NSObject *v163;
  int v164;
  id v165;
  int *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  id v171;
  UInt32 outDataSize[2];
  _OWORD outPropertyData[2];
  uint64_t v174;
  UInt32 ioPropertyDataSize;
  ExtAudioFileRef outExtAudioFile;
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v21 = 0;
    goto LABEL_17;
  }
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v3, (uint64_t)v5, 0, v4);
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v21 = 0;
    goto LABEL_16;
  }
  v7 = (void *)objc_opt_new();
  outExtAudioFile = 0;
  if (ExtAudioFileOpenURL(v6, &outExtAudioFile))
    v11 = 1;
  else
    v11 = outExtAudioFile == 0;
  if (v11)
  {
LABEL_10:
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Cannot open audio file: %@"), v9, v10, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    FlexLogForCategory(1uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_20D045124((uint64_t)v18, v19, v20);

    v21 = 0;
    goto LABEL_13;
  }
  v174 = 0;
  memset(outPropertyData, 0, sizeof(outPropertyData));
  ioPropertyDataSize = 40;
  if (ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData)
    || (objc_msgSend_setSampleRate_(v7, v12, (int)*(double *)outPropertyData, v13, v14),
        *(_QWORD *)outDataSize = 0,
        ioPropertyDataSize = 8,
        ExtAudioFileGetProperty(outExtAudioFile, 0x2366726Du, &ioPropertyDataSize, outDataSize)))
  {
    ExtAudioFileDispose(outExtAudioFile);
    outExtAudioFile = 0;
    goto LABEL_10;
  }
  objc_msgSend_setSampleCount_(v7, v15, *(uint64_t *)outDataSize, v16, v17);
  ExtAudioFileDispose(outExtAudioFile);
  outExtAudioFile = 0;
  *(_QWORD *)&outPropertyData[0] = 0;
  if (AudioFileOpenURL(v6, kAudioFileReadPermission, 0, (AudioFileID *)outPropertyData)
    || !*(_QWORD *)&outPropertyData[0])
  {
    goto LABEL_27;
  }
  outDataSize[0] = 0;
  if (AudioFileGetPropertyInfo(*(AudioFileID *)&outPropertyData[0], 0x6D6B6C73u, outDataSize, 0) || !outDataSize[0])
  {
    AudioFileClose(*(AudioFileID *)&outPropertyData[0]);
    goto LABEL_27;
  }
  v26 = (int *)malloc_type_malloc(outDataSize[0], 0xED5210EBuLL);
  if (AudioFileGetProperty(*(AudioFileID *)&outPropertyData[0], 0x6D6B6C73u, outDataSize, v26) || !v26[1])
  {
    v27 = 0;
    goto LABEL_24;
  }
  v39 = 0;
  v27 = 0;
  v40 = (id *)(v26 + 6);
  do
  {
    v41 = *(v40 - 1);
    if (objc_msgSend_hasPrefix_(v41, v42, (uint64_t)CFSTR("Tempo:"), v43, v44))
    {
      if (objc_msgSend_bpm(v7, v45, v46, v47, v48))
        goto LABEL_43;
      v165 = v27;
      v52 = v26;
      objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v49, (uint64_t)v41, v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_scanString_intoString_(v53, v54, (uint64_t)CFSTR("Tempo:"), 0, v55);
      objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = 0;
      objc_msgSend_scanCharactersFromSet_intoString_(v53, v61, (uint64_t)v60, (uint64_t)&v171, v62);
      v63 = v171;

      if (objc_msgSend_length(v63, v64, v65, v66, v67))
      {
        v72 = objc_msgSend_intValue(v63, v68, v69, v70, v71);
        if (v72 >= 1)
          objc_msgSend_setBpm_(v7, v73, v72, v74, v75);
      }

      v26 = v52;
      v27 = v165;
    }
    else
    {
      v76 = *(int *)v40;
      v77 = (uint64_t)*((double *)v40 - 2);
      v78 = [FlexMarker alloc];
      v80 = (void *)objc_msgSend_initWithName_markerID_position_(v78, v79, (uint64_t)v41, v76, v77);
      v53 = v80;
      if (v80 && objc_msgSend_type(v80, v81, v82, v83, v84))
      {
        if (!v27)
        {
          objc_msgSend_array(MEMORY[0x24BDBCEB8], v85, v86, v87, v88);
          v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_addObject_(v27, v85, (uint64_t)v53, v87, v88);
      }
    }

LABEL_43:
    ++v39;
    v40 += 5;
  }
  while (v39 < v26[1]);
  if (v27)
  {
    objc_msgSend_sortUsingComparator_(v27, v89, (uint64_t)&unk_24C5EFC28, v90, v91);
    if (objc_msgSend_count(v27, v92, v93, v94, v95) == 1)
    {
      objc_msgSend_firstObject(v27, v96, v97, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_type(v100, v101, v102, v103, v104) == 2
        && objc_msgSend_number(v100, v105, v106, v107, v108) >= 1)
      {
        v113 = objc_msgSend_number(v100, v109, v110, v111, v112);
        objc_msgSend_setBars_(v7, v114, v113, v115, v116);
        v121 = objc_msgSend_sampleCount(v7, v117, v118, v119, v120);
        v126 = objc_msgSend_bars(v7, v122, v123, v124, v125);
        objc_msgSend_setSamplesPerBar_(v7, v127, v121 / v126, v128, v129);
        objc_msgSend_setCustomBarMarkers_(v7, v130, 0, v131, v132);
      }
      else
      {
        FlexLogForCategory(1uLL);
        v163 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
          sub_20D0450E4(v163);

        v27 = 0;
      }

    }
    else if (objc_msgSend_count(v27, v96, v97, v98, v99))
    {
      v166 = v26;
      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      v27 = v27;
      v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v133, (uint64_t)&v167, (uint64_t)v177, 16);
      if (v134)
      {
        v139 = v134;
        v140 = *(_QWORD *)v168;
        v141 = 1;
        while (2)
        {
          v142 = 0;
          v143 = v141;
          v164 = v139 + v141;
          do
          {
            if (*(_QWORD *)v168 != v140)
              objc_enumerationMutation(v27);
            v144 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v142);
            if (objc_msgSend_type(v144, v135, v136, v137, v138) != 1
              || v143 + v142 != objc_msgSend_number(v144, v145, v146, v147, v148))
            {

              v27 = 0;
              goto LABEL_65;
            }
            ++v142;
          }
          while (v139 != v142);
          v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v135, (uint64_t)&v167, (uint64_t)v177, 16);
          v141 = v164;
          if (v139)
            continue;
          break;
        }
      }

      v153 = objc_msgSend_count(v27, v149, v150, v151, v152);
      objc_msgSend_setBars_(v7, v154, v153, v155, v156);
      objc_msgSend_setSamplesPerBar_(v7, v157, -1, v158, v159);
      objc_msgSend_setCustomBarMarkers_(v7, v160, (uint64_t)v27, v161, v162);
LABEL_65:
      v26 = v166;
    }
  }
LABEL_24:
  free(v26);
  AudioFileClose(*(AudioFileID *)&outPropertyData[0]);
  if (!v27)
  {
LABEL_27:
    objc_msgSend_setBars_(v7, v23, 1, v24, v25);
    v32 = objc_msgSend_sampleCount(v7, v28, v29, v30, v31);
    objc_msgSend_setSamplesPerBar_(v7, v33, v32, v34, v35);
    objc_msgSend_setCustomBarMarkers_(v7, v36, 0, v37, v38);
    v27 = 0;
  }

  v21 = v7;
LABEL_13:

LABEL_16:
LABEL_17:

  return v21;
}

- (void)setName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_storeStrong((id *)&self->_name, a3);
  objc_msgSend__decodeTypeInfoFromSegmentName(self, v4, v5, v6, v7);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("name %@"), v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)shortLabelForSegmentType:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return off_24C5F0BF8[a3];
}

+ (id)longLabelForSegmentType:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return off_24C5F0C28[a3];
}

- (void)_decodeTypeInfoFromSegmentName
{
  NSString *namePrefix;
  NSString *nameStem;
  void **p_nameStem;
  NSString *nameIndex;
  NSString *nameSuffix;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char isEqualToString;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSString *v38;
  NSString *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  id v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  unint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;

  namePrefix = self->_namePrefix;
  self->_namePrefix = (NSString *)&stru_24C5F0F80;

  p_nameStem = (void **)&self->_nameStem;
  nameStem = self->_nameStem;
  self->_nameStem = (NSString *)&stru_24C5F0F80;

  nameIndex = self->_nameIndex;
  self->_nameIndex = (NSString *)&stru_24C5F0F80;

  nameSuffix = self->_nameSuffix;
  self->_nameSuffix = (NSString *)&stru_24C5F0F80;

  self->_type = 0;
  objc_msgSend_name(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v17 = (void *)MEMORY[0x24BDD17A8];
    objc_msgSend_name(self, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scannerWithString_(v17, v19, (uint64_t)v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = 0;
    objc_msgSend_scanUpToString_intoString_(v22, v23, (uint64_t)CFSTR("_"), (uint64_t)&v111, v24);
    v29 = v111;
    if (v29
      && (objc_msgSend_name(self, v25, v26, v27, v28),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToString = objc_msgSend_isEqualToString_(v29, v31, (uint64_t)v30, v32, v33),
          v30,
          (isEqualToString & 1) == 0))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("%@_"), v27, v28, v29);
      v38 = (NSString *)objc_claimAutoreleasedReturnValue();
      v39 = self->_namePrefix;
      self->_namePrefix = v38;

      v35 = objc_msgSend_scanLocation(v22, v40, v41, v42, v43) + 1;
      objc_msgSend_setScanLocation_(v22, v44, v35, v45, v46);
    }
    else
    {
      v35 = 0;
      objc_msgSend_setScanLocation_(v22, v25, 0, v27, v28);
    }
    objc_msgSend_scanUpToString_intoString_(v22, v36, (uint64_t)CFSTR("-"), 0, v37);
    v51 = objc_msgSend_scanLocation(v22, v47, v48, v49, v50);
    objc_msgSend_name(self, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_length(v56, v57, v58, v59, v60);

    objc_msgSend_setScanLocation_(v22, v62, v35, v63, v64);
    if (v51 != v61)
    {
      v107 = 0;
      objc_msgSend_scanUpToString_intoString_(v22, v65, (uint64_t)&stru_24C5F0F80, (uint64_t)&v107, v68);
      v96 = v107;
      v73 = v107;
      objc_storeStrong((id *)&self->_nameStem, v96);
      v84 = 0;
      v95 = 0;
      v97 = 5;
      goto LABEL_23;
    }
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0;
    objc_msgSend_scanUpToCharactersFromSet_intoString_(v22, v70, (uint64_t)v69, (uint64_t)&v110, v71);
    v72 = v110;
    v73 = v110;

    if (v73)
    {
      objc_storeStrong((id *)&self->_nameStem, v72);
      objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v77, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = 0;
      objc_msgSend_scanCharactersFromSet_intoString_(v22, v82, (uint64_t)v81, (uint64_t)&v109, v83);
      v84 = v109;

      if (v84)
      {
        v86 = (void *)MEMORY[0x24BDD17C8];
        v87 = objc_msgSend_intValue(v84, v74, v85, v75, v76);
        objc_msgSend_stringWithFormat_(v86, v88, (uint64_t)CFSTR("%i"), v89, v90, v87);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_nameIndex, v91);
        v108 = 0;
        objc_msgSend_scanUpToString_intoString_(v22, v92, (uint64_t)&stru_24C5F0F80, (uint64_t)&v108, v93);
        v94 = v108;
        v95 = v108;
        if (v95)
          objc_storeStrong((id *)&self->_nameSuffix, v94);

LABEL_15:
        if ((objc_msgSend_isEqualToString_(*p_nameStem, v74, (uint64_t)CFSTR("Body"), v75, v76) & 1) != 0)
        {
          v97 = 2;
        }
        else if ((objc_msgSend_isEqualToString_(*p_nameStem, v98, (uint64_t)CFSTR("In"), v99, v100) & 1) != 0)
        {
          v97 = 1;
        }
        else if ((objc_msgSend_isEqualToString_(*p_nameStem, v101, (uint64_t)CFSTR("Trans"), v102, v103) & 1) != 0)
        {
          v97 = 3;
        }
        else
        {
          if ((objc_msgSend_isEqualToString_(*p_nameStem, v104, (uint64_t)CFSTR("Out"), v105, v106) & 1) == 0)
          {
LABEL_24:

            return;
          }
          v97 = 4;
        }
LABEL_23:
        self->_type = v97;
        goto LABEL_24;
      }
    }
    else
    {
      v84 = 0;
    }
    v95 = 0;
    goto LABEL_15;
  }
}

- (int64_t)barStartPositionForBarIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a3 < 0)
    return 0;
  v5 = a3;
  if (objc_msgSend_bars(self, a2, a3, v3, v4) <= a3)
    return 0;
  if (objc_msgSend_samplesPerBar(self, v7, v8, v9, v10) != -1)
  {
    v5 *= objc_msgSend_samplesPerBar(self, v11, v12, v13, v14);
    return v5;
  }
  objc_msgSend_customBarMarkers(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v15, v16, v17, v18, v19);

  if (v20 <= v5)
    return 0;
  objc_msgSend_customBarMarkers(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v25, v26, v5, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v5 = objc_msgSend_position(v29, v30, v31, v32, v33);

  return v5;
}

- (int64_t)barEndPositionForBarIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 < 0 || objc_msgSend_bars(self, a2, a3, v3, v4) <= a3)
    return 0;
  if (objc_msgSend_bars(self, v7, v8, v9, v10) - 1 == a3)
    return objc_msgSend_sampleCount(self, v11, v12, v13, v14);
  return objc_msgSend_barStartPositionForBarIndex_(self, v11, a3 + 1, v13, v14);
}

- (int64_t)barDurationForBarIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_barEndPositionForBarIndex_(self, a2, a3, v3, v4);
  return v7 - objc_msgSend_barStartPositionForBarIndex_(self, v8, a3, v9, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;

  v9 = objc_alloc_init((Class)objc_opt_class());
  if (v9)
  {
    objc_msgSend_name(self, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_copyWithZone_(v10, v11, (uint64_t)a3, v12, v13);
    v15 = (void *)v9[2];
    v9[2] = v14;

    objc_msgSend__decodeTypeInfoFromSegmentName(v9, v16, v17, v18, v19);
    v9[3] = objc_msgSend_priority(self, v20, v21, v22, v23);
    v9[4] = objc_msgSend_bars(self, v24, v25, v26, v27);
    v9[5] = objc_msgSend_beatsPerBar(self, v28, v29, v30, v31);
    v9[6] = objc_msgSend_samplesPerBar(self, v32, v33, v34, v35);
    objc_msgSend_customBarMarkers(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_copyWithZone_(v40, v41, (uint64_t)a3, v42, v43);
    v45 = (void *)v9[7];
    v9[7] = v44;

    v9[8] = objc_msgSend_sampleRate(self, v46, v47, v48, v49);
    v9[9] = objc_msgSend_sampleCount(self, v50, v51, v52, v53);
    *((_BYTE *)v9 + 8) = objc_msgSend_sliceable(self, v54, v55, v56, v57);
    objc_msgSend_transitions(self, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_copyWithZone_(v62, v63, (uint64_t)a3, v64, v65);
    v67 = (void *)v9[10];
    v9[10] = v66;

    objc_msgSend_markers(self, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_copyWithZone_(v72, v73, (uint64_t)a3, v74, v75);
    v77 = (void *)v9[11];
    v9[11] = v76;

    v9[13] = objc_msgSend_errors(self, v78, v79, v80, v81);
    objc_msgSend_metadataValues(self, v82, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend_copyWithZone_(v86, v87, (uint64_t)a3, v88, v89);
    v91 = (void *)v9[14];
    v9[14] = v90;

  }
  return v9;
}

- (BOOL)linkedPerBarTransitionsToSegmentNamed:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_transitions(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_((void *)v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  return (v9 & 1) == 0;
}

- (void)setLinkedPerBarTransitions:(BOOL)a3 toSegmentNamed:(id)a4
{
  int v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  NSDictionary *v62;
  const char *v63;
  uint64_t v64;
  NSDictionary *transitions;
  const char *v66;

  v4 = a3;
  v6 = (char *)a4;
  v66 = v6;
  if ((v4 & 1) != 0 || (v10 = objc_msgSend_sliceable(self, v6, v7, v8, v9), v6 = (char *)v66, v10))
  {
    v11 = objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v6, (uint64_t)v66, v8, v9);
    v6 = (char *)v66;
    if (v11 != v4)
    {
      objc_msgSend_transitions(self, v66, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v15, v16, (uint64_t)v66, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v4 & 1) == 0)
      {
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v28 = v19;
        else
          v28 = 0;
        objc_msgSend_array(MEMORY[0x24BDBCEB8], v20, v21, v22, v23);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_bars(self, v39, v40, v41, v42) >= 1)
        {
          v47 = 0;
          do
          {
            if (v28)
              v48 = objc_msgSend_copy(v28, v43, v44, v45, v46);
            else
              v48 = objc_opt_new();
            v52 = (void *)v48;
            objc_msgSend_addObject_(v38, v49, v48, v50, v51);

            ++v47;
          }
          while (v47 < objc_msgSend_bars(self, v53, v54, v55, v56));
        }
        v57 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend_transitions(self, v43, v44, v45, v46);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithDictionary_(v57, v59, (uint64_t)v58, v60, v61);
        v62 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKey_(v62, v63, (uint64_t)v38, (uint64_t)v66, v64);
        transitions = self->_transitions;
        self->_transitions = v62;

        goto LABEL_26;
      }
      if (!v19)
        goto LABEL_27;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_27;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_firstObject(v19, v24, v25, v26, v27);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_11:
          v29 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend_transitions(self, v24, v25, v26, v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionaryWithDictionary_(v29, v31, (uint64_t)v30, v32, v33);
          v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend_setObject_forKey_(v34, v35, (uint64_t)v28, (uint64_t)v66, v37);
          else
            objc_msgSend_removeObjectForKey_(v34, v35, (uint64_t)v66, v36, v37);
          v38 = self->_transitions;
          self->_transitions = v34;
LABEL_26:

LABEL_27:
          v6 = (char *)v66;
          goto LABEL_28;
        }

      }
      v28 = 0;
      goto LABEL_11;
    }
  }
LABEL_28:

}

- (id)transitionToSegmentNamed:(id)a3 fromBarIndex:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  char isKindOfClass;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  v10 = a3;
  if (v10)
  {
    objc_msgSend_transitions(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v11, v12, (uint64_t)v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
LABEL_12:

        goto LABEL_13;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v16 = 0;
      if (a4 < 0 || (isKindOfClass & 1) == 0)
        goto LABEL_12;
      if (objc_msgSend_count(v15, v18, v19, v20, v21) > (unint64_t)a4)
      {
        objc_msgSend_objectAtIndex_(v15, v22, a4, v23, v24);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_12;
        objc_opt_class();
        objc_opt_isKindOfClass();

      }
    }
    v16 = 0;
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (void)addOrReplaceTransition:(id)a3 toSegmentNamed:(id)a4 fromBarIndex:(int64_t)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char isKindOfClass;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  NSDictionary *transitions;
  id v51;

  v51 = a3;
  v12 = a4;
  if (v51 && v12)
  {
    v13 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend_transitions(self, v8, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithDictionary_(v13, v15, (uint64_t)v14, v16, v17);
    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v19, (uint64_t)v12, v20, v21))
    {
      if (objc_msgSend_isDefaultTransition(v51, v22, v23, v24, v25))
        objc_msgSend_removeObjectForKey_(v18, v26, (uint64_t)v12, v27, v28);
      else
        objc_msgSend_setObject_forKey_(v18, v26, (uint64_t)v51, (uint64_t)v12, v28);
    }
    else
    {
      objc_msgSend_objectForKey_(v18, v22, (uint64_t)v12, v24, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((a5 & 0x8000000000000000) == 0
          && (isKindOfClass & 1) != 0
          && objc_msgSend_count(v29, v31, v32, v33, v34) > (unint64_t)a5)
        {
          objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v35, (uint64_t)v29, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isDefaultTransition(v51, v39, v40, v41, v42))
          {
            v45 = (void *)objc_opt_new();
            objc_msgSend_setObject_atIndexedSubscript_(v38, v46, (uint64_t)v45, a5, v47);

          }
          else
          {
            objc_msgSend_setObject_atIndexedSubscript_(v38, v43, (uint64_t)v51, a5, v44);
          }
          objc_msgSend_setObject_forKey_(v18, v48, (uint64_t)v38, (uint64_t)v12, v49);

        }
      }

    }
    transitions = self->_transitions;
    self->_transitions = v18;

  }
}

- (void)removeTransitionToSegmentNamed:(id)a3 fromBarIndex:(int64_t)a4
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char isKindOfClass;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSDictionary *transitions;
  uint64_t v38;

  v6 = (char *)a3;
  if (v6)
  {
    v10 = (void *)MEMORY[0x24BDBCED8];
    v38 = (uint64_t)v6;
    objc_msgSend_transitions(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithDictionary_(v10, v12, (uint64_t)v11, v13, v14);
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v16, v38, v17, v18))
    {
      objc_msgSend_removeObjectForKey_(v15, v19, v38, v20, v21);
    }
    else
    {
      objc_msgSend_objectForKey_(v15, v19, v38, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((a4 & 0x8000000000000000) == 0
          && (isKindOfClass & 1) != 0
          && objc_msgSend_count(v22, v24, v25, v26, v27) > (unint64_t)a4)
        {
          objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v28, (uint64_t)v22, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_opt_new();
          objc_msgSend_setObject_atIndexedSubscript_(v31, v33, (uint64_t)v32, a4, v34);

          objc_msgSend_setObject_forKey_(v15, v35, (uint64_t)v31, v38, v36);
        }
      }

    }
    transitions = self->_transitions;
    self->_transitions = v15;

    v6 = (char *)v38;
  }

}

+ (BOOL)canTransitionFromSegment:(id)a3 toSegment:(id)a4 fromBarIndex:(int64_t)a5 checkIfPrevented:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int isEqualToString;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v15 = objc_msgSend_type(v9, v11, v12, v13, v14);
  v20 = objc_msgSend_type(v10, v16, v17, v18, v19);
  LOBYTE(v25) = 0;
  if (v15 == 5 || !v15 || !v20 || v20 == 5)
    goto LABEL_33;
  if (v15 == 3)
  {
    v26 = (v20 & 0xFFFFFFFFFFFFFFFDLL) == 1;
LABEL_10:
    v25 = !v26;
    if (!v25)
      goto LABEL_33;
    goto LABEL_17;
  }
  if (v15 != 2)
  {
    if (v15 == 1)
    {
      v26 = v20 == 1;
      goto LABEL_10;
    }
LABEL_30:
    LOBYTE(v25) = 0;
    goto LABEL_33;
  }
  if ((unint64_t)(v20 - 3) >= 2)
  {
    if (v20 != 2)
      goto LABEL_30;
    objc_msgSend_nameIndex(v9, v21, v22, v23, v24);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nameIndex(v10, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_compare_options_(v44, v50, (uint64_t)v49, 65, v51);

    if (v52 != -1)
    {
      if (!v52)
      {
        objc_msgSend_nameSuffix(v9, v21, v22, v23, v24);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameSuffix(v10, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend_caseInsensitiveCompare_(v53, v59, (uint64_t)v58, v60, v61);

        objc_msgSend_nameIndex(v9, v63, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameIndex(v10, v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v67, v73, (uint64_t)v72, v74, v75);

        if (v62 == 1)
          v25 = isEqualToString;
        else
          v25 = 1;
        if (!v25)
          goto LABEL_33;
        goto LABEL_17;
      }
      goto LABEL_30;
    }
  }
  LOBYTE(v25) = 1;
LABEL_17:
  if (v6)
  {
    objc_msgSend_name(v10, v21, v22, v23, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v9, v28, (uint64_t)v27, v29, v30);

    if (v31)
      a5 = objc_msgSend_bars(v9, v32, v33, v34, v35) - 1;
    objc_msgSend_name(v10, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v9, v37, (uint64_t)v36, a5, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
      v25 = objc_msgSend_prevented(v39, v40, v41, v42, v43) ^ 1;
    else
      LOBYTE(v25) = 1;

  }
LABEL_33:

  return v25;
}

- (BOOL)isPriorityValid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend_type(self, a2, v2, v3, v4) != 2)
    return 1;
  if (objc_msgSend_priority(self, v6, v7, v8, v9) < 1)
    return 0;
  return objc_msgSend_priority(self, v10, v11, v12, v13) < 101;
}

- (BOOL)relinkAllTransitions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_transitions(self, a2, v2, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    v12 = v8;
    v13 = 0;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v6);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v9, v16, v10, v11) & 1) == 0)
        {
          v13 = 1;
          objc_msgSend_setLinkedPerBarTransitions_toSegmentNamed_(self, v9, 1, v16, v11);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13 & 1;
}

- (void)setBars:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (self->_bars != a3)
  {
    objc_msgSend_relinkAllTransitions(self, a2, a3, v3, v4);
    self->_bars = a3;
  }
}

- (void)setSliceable:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    objc_msgSend_relinkAllTransitions(self, a2, a3, v3, v4);
  self->_sliceable = a3;
}

+ (id)segmentsWithType:(unint64_t)a3 inSegments:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  unint64_t v26;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  objc_msgSend_array(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = sub_20D0448E4;
  v24 = &unk_24C5F0B88;
  v25 = v11;
  v26 = a3;
  v12 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v13, (uint64_t)&v21, v14, v15);

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v16, (uint64_t)v12, v17, v18, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)segmentsWithType:(unint64_t)a3 nameIndex:(id)a4 nameSuffix:(id)a5 inSegments:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;

  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCEB8];
  v12 = a6;
  objc_msgSend_array(v11, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = sub_20D044A34;
  v32 = &unk_24C5F0BB0;
  v33 = v9;
  v34 = v10;
  v35 = v17;
  v36 = a3;
  v18 = v17;
  v19 = v10;
  v20 = v9;
  objc_msgSend_enumerateObjectsUsingBlock_(v12, v21, (uint64_t)&v29, v22, v23);

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v24, (uint64_t)v18, v25, v26, v29, v30, v31, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (FlexSegment)segmentWithName:(id)a3 inSegments:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_20D044BF0;
  v20 = sub_20D044C00;
  v21 = 0;
  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_20D044C08;
    v13[3] = &unk_24C5F0BD8;
    v14 = v5;
    v15 = &v16;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, (uint64_t)v13, v8, v9);

    v10 = (void *)v17[5];
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);

  return (FlexSegment *)v11;
}

+ (int64_t)samplesForTimeInMsec:(int64_t)a3 atSampleRate:(int64_t)a4
{
  int32_t v4;
  CMTime v6;
  CMTime time;

  v4 = a4;
  CMTimeMake(&time, a3, 1000);
  CMTimeConvertScale(&v6, &time, v4, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v6.value;
}

+ (int64_t)crossfadeLengthInSamplesForFromSeg:(id)a3 toSeg:(id)a4 fadeOutTimeInMsec:(int64_t)a5 fadeInTimeInMsec:(int64_t)a6 validFadeOutSamples:(int64_t *)a7 validFadeInSamples:(int64_t *)a8
{
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v13 = a3;
  v14 = a4;
  v19 = objc_msgSend_sampleRate(v13, v15, v16, v17, v18);
  v22 = objc_msgSend_samplesForTimeInMsec_atSampleRate_(FlexSegment, v20, a5, v19, v21);
  if (v22 > objc_msgSend_sampleCount(v13, v23, v24, v25, v26))
    v22 = objc_msgSend_sampleCount(v13, v27, v28, v29, v30);
  if (v22 > objc_msgSend_sampleCount(v14, v27, v28, v29, v30))
    v22 = objc_msgSend_sampleCount(v14, v31, v32, v33, v34);
  v35 = objc_msgSend_samplesForTimeInMsec_atSampleRate_(FlexSegment, v31, a6, v19, v34);
  if (v35 > objc_msgSend_sampleCount(v14, v36, v37, v38, v39))
    v35 = objc_msgSend_sampleCount(v14, v40, v41, v42, v43);
  if (a7)
    *a7 = v22;
  if (a8)
    *a8 = v35;
  if (v35 <= v22)
    v44 = v22;
  else
    v44 = v35;

  return v44;
}

- (void)addMetadataValue:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *v22;
  NSDictionary *metadataValues;
  NSDictionary *v24;
  void *v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  NSDictionary *v30;
  NSDictionary *v31;

  if (self->_metadataValues)
  {
    v6 = (void *)MEMORY[0x24BDBCED8];
    v7 = a4;
    v8 = a3;
    objc_msgSend_metadataValues(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithDictionary_(v6, v14, (uint64_t)v13, v15, v16);
    v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKey_(v31, v17, (uint64_t)v8, (uint64_t)v7, v18);
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v19, (uint64_t)v31, v20, v21);
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadataValues = self->_metadataValues;
    self->_metadataValues = v22;

    v24 = v31;
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDBCE70];
    v26 = a4;
    v27 = a3;
    objc_msgSend_dictionaryWithObject_forKey_(v25, v28, (uint64_t)v27, (uint64_t)v26, v29);
    v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    v24 = self->_metadataValues;
    self->_metadataValues = v30;
  }

}

- (id)metadataValueForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_objectForKey_(self->_metadataValues, a2, (uint64_t)a3, v3, v4);
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)bars
{
  return self->_bars;
}

- (int64_t)beatsPerBar
{
  return self->_beatsPerBar;
}

- (void)setBeatsPerBar:(int64_t)a3
{
  self->_beatsPerBar = a3;
}

- (void)setSamplesPerBar:(int64_t)a3
{
  self->_samplesPerBar = a3;
}

- (NSArray)customBarMarkers
{
  return self->_customBarMarkers;
}

- (void)setCustomBarMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_customBarMarkers, a3);
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = a3;
}

- (BOOL)sliceable
{
  return self->_sliceable;
}

- (NSDictionary)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_transitions, a3);
}

- (NSDictionary)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_markers, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)errors
{
  return self->_errors;
}

- (void)setErrors:(unint64_t)a3
{
  self->_errors = a3;
}

- (NSDictionary)metadataValues
{
  return self->_metadataValues;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameStem
{
  return self->_nameStem;
}

- (NSString)nameIndex
{
  return self->_nameIndex;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_nameIndex, 0);
  objc_storeStrong((id *)&self->_nameStem, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_customBarMarkers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
