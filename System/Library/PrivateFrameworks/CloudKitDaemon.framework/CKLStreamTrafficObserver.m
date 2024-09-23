@implementation CKLStreamTrafficObserver

- (CKLStreamTrafficObserver)initWithLogTypes:(unint64_t)a3
{
  CKLStreamTrafficObserver *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *requestDictionary;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *printQueue;
  CKDTrafficLogParser *v9;
  CKDTrafficLogParser *parser;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKLStreamTrafficObserver;
  v3 = -[CKLStreamObserver initWithLogTypes:](&v12, sel_initWithLogTypes_, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestDictionary = v3->_requestDictionary;
    v3->_requestDictionary = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.cloudkitlog.parseandprint", v6);
    printQueue = v3->_printQueue;
    v3->_printQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(CKDTrafficLogParser);
    parser = v3->_parser;
    v3->_parser = v9;

  }
  return v3;
}

- (void)eventMatched:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  int hasPrefix;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  const char *v20;
  CKLTrafficLogMessageFragment *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  CKLStreamTrafficObserver *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  char v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  const char *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  id v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  id v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  id v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  int v95;
  void (**v96)(_QWORD, _QWORD);
  id v97;
  id v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD *v111;
  _QWORD v112[5];
  CKLStreamTrafficObserver *v113;
  _QWORD v114[5];
  _QWORD block[5];
  _BYTE v116[128];
  _QWORD v117[3];

  v117[1] = *MEMORY[0x1E0C80C00];
  v100 = a3;
  objc_msgSend_category(v100, v4, v5);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_composedMessage(v100, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v99, v9, (uint64_t)CFSTR("LogFacilityTraffic")) & 1) != 0
    || objc_msgSend_isEqualToString_(v99, v10, (uint64_t)CFSTR("Traffic")))
  {
    if (objc_msgSend_hasPrefix_(v8, v10, (uint64_t)CFSTR("SIM: ")))
    {
      objc_msgSend_substringFromIndex_(v8, v11, 5);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
    }
    hasPrefix = objc_msgSend_hasPrefix_(v8, v11, (uint64_t)CFSTR("traff-cont: "));
    objc_msgSend_printQueue(self, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (hasPrefix)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEB098D8;
      block[3] = &unk_1E782EA40;
      v17 = block;
      v8 = v8;
      block[4] = v8;
      dispatch_async(v16, block);

    }
    else
    {
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = sub_1BEB09954;
      v114[3] = &unk_1E782EA40;
      v17 = v114;
      v8 = v8;
      v114[4] = v8;
      dispatch_async(v16, v114);

    }
    v18 = (id)v17[4];
    goto LABEL_9;
  }
  if ((objc_msgSend_isEqualToString_(v99, v10, (uint64_t)CFSTR("LogFacilityTrafficBinary")) & 1) != 0
    || objc_msgSend_isEqualToString_(v99, v19, (uint64_t)CFSTR("TrafficBinary")))
  {
    v21 = [CKLTrafficLogMessageFragment alloc];
    objc_msgSend_composedMessage(v100, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend_initWithMessage_(v21, v25, (uint64_t)v24);

    if (v18)
    {
      objc_msgSend_requestDictionary(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uuid(v18, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v28, v32, (uint64_t)v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if (objc_msgSend_type(v18, v34, v35) == 6)
        {
          v112[0] = 0;
          v112[1] = v112;
          v112[2] = 0x3032000000;
          v112[3] = sub_1BE9BB058;
          v112[4] = sub_1BE9BADE0;
          v36 = self;
          v113 = v36;
          objc_msgSend_printQueue(v36, v37, v38);
          v39 = objc_claimAutoreleasedReturnValue();
          v109[0] = MEMORY[0x1E0C809B0];
          v109[1] = 3221225472;
          v109[2] = sub_1BEB099AC;
          v109[3] = &unk_1E78303D8;
          v111 = v112;
          v110 = v33;
          dispatch_async(v39, v109);

          objc_msgSend_requestDictionary(v36, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_uuid(v18, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v42, v46, (uint64_t)v45);

          _Block_object_dispose(v112, 8);
        }
        else
        {
          v107[0] = MEMORY[0x1E0C809B0];
          v107[1] = 3221225472;
          v107[2] = sub_1BEB099BC;
          v107[3] = &unk_1E7833778;
          v76 = v18;
          v108 = v76;
          v78 = objc_msgSend_indexOfObjectWithOptions_passingTest_(v33, v77, 2, v107);
          if (v78 == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend_insertObject_atIndex_(v33, v79, (uint64_t)v76, 0);
          else
            objc_msgSend_insertObject_atIndex_(v33, v79, (uint64_t)v76, v78 + 1);

        }
      }
      else
      {
        v66 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v68 = (void *)objc_msgSend_initWithObjects_(v66, v67, (uint64_t)v18, 0);
        objc_msgSend_requestDictionary(self, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uuid(v18, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v71, v75, (uint64_t)v68, v74);

      }
    }
    goto LABEL_9;
  }
  if (!objc_msgSend_isEqualToString_(v99, v20, (uint64_t)CFSTR("TrafficCompressed")))
    goto LABEL_10;
  objc_msgSend_parser(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v50, (uint64_t)v117, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  v53 = objc_msgSend_parse_error_(v49, v52, (uint64_t)v51, &v106);
  v18 = v106;

  if ((v53 & 1) != 0)
  {
    objc_msgSend_parser(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v18;
    objc_msgSend_consumeParsedTrafficLogsAndReturnError_(v56, v57, (uint64_t)&v105);
    v98 = (id)objc_claimAutoreleasedReturnValue();
    v97 = v105;

    if (v97)
    {
      v60 = objc_alloc(MEMORY[0x1E0CB3940]);
      v62 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v60, v61, (uint64_t)CFSTR("cloudkitlog consume parsed logs error: %@"), v97));
      v65 = (const char *)objc_msgSend_UTF8String(v62, v63, v64);
      puts(v65);
    }
    else
    {
      objc_msgSend_requestParsedBlock(self, v58, v59);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_29;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v62 = v98;
      v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v85, (uint64_t)&v101, v116, 16);
      if (v88)
      {
        v89 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v88; ++i)
          {
            if (*(_QWORD *)v102 != v89)
              objc_enumerationMutation(v62);
            v91 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
            objc_msgSend_logMessageFilter(self, v86, v87);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            if (v92)
            {
              objc_msgSend_logMessageFilter(self, v86, v87);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = objc_msgSend_evaluateWithObject_(v93, v94, v91);

              if (!v95)
                continue;
            }
            objc_msgSend_requestParsedBlock(self, v86, v87);
            v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v96[2](v96, v91);

          }
          v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v86, (uint64_t)&v101, v116, 16);
        }
        while (v88);
      }
    }

    v18 = v97;
  }
  else
  {
    v80 = objc_alloc(MEMORY[0x1E0CB3940]);
    v98 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v80, v81, (uint64_t)CFSTR("cloudkitlog parse error: %@"), v18));
    v84 = (const char *)objc_msgSend_UTF8String(v98, v82, v83);
    puts(v84);
  }
LABEL_29:

LABEL_9:
LABEL_10:

}

- (void)parseRequestArrayAndPrint:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  CKDProtobufResponseBodyParser *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  id v54;
  id v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  id v60;
  void *v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __CFString *v69;
  NSString *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  id v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  id v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  void *v93;
  const char *v94;
  id v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  id v100;
  CKDProtobufResponseBodyParser *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  CKDProtobufResponseBodyParser *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  NSObject *v119;
  uint64_t v120;
  NSObject *v121;
  const char *v122;
  void *v123;
  const char *v124;
  dispatch_time_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  id v129;
  const char *v130;
  id v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  id v135;
  const char *v136;
  id v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  const char *v141;
  void *v142;
  const char *v143;
  id v144;
  const char *v145;
  id v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  const char *v150;
  void *v151;
  const char *v152;
  void *v153;
  CKLTrafficLogMessage *v154;
  const char *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  const char *v164;
  int v165;
  void (**v166)(_QWORD, _QWORD);
  void *context;
  void *v168;
  void *v169;
  CKLStreamTrafficObserver *v170;
  uint64_t v171;
  id v172;
  id v173;
  uint64_t v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id obj;
  void *v181;
  _QWORD v182[4];
  NSObject *v183;
  _QWORD v184[4];
  NSObject *v185;
  _QWORD v186[4];
  id v187;
  _QWORD v188[4];
  id v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _QWORD v194[4];
  id v195;
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v170 = self;
  objc_msgSend_printQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_firstObject(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(v10, v11, v12);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v172 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = [CKDProtobufResponseBodyParser alloc];
  v17 = objc_opt_class();
  v19 = (void *)objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v16, v18, 25, v17, 0);
  v194[0] = MEMORY[0x1E0C809B0];
  v194[1] = 3221225472;
  v194[2] = sub_1BEB0A3DC;
  v194[3] = &unk_1E7830DC8;
  v175 = v15;
  v195 = v175;
  v181 = v19;
  objc_msgSend_setObjectParsedBlock_(v19, v20, (uint64_t)v194);
  v178 = (void *)objc_opt_new();
  v169 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1C3B83E24]();
  v190 = 0u;
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  obj = v4;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v190, v196, 16);
  if (v22)
  {
    v25 = v22;
    v171 = 0;
    v26 = 0;
    v179 = 0;
    v173 = v14;
    v174 = 0;
    v176 = 0;
    v177 = 0;
    v27 = *(_QWORD *)v191;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v191 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * i);
        if (objc_msgSend_seqNum(v29, v23, v24) != v26)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend_uuid(v29, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend_seqNum(v29, v36, v37);
          v40 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v32, v39, (uint64_t)CFSTR("cloudkitlog parse error: A traffic log packet for request %@ was likely dropped. Was expecting sequence number %li but received %li. Will attempt to parse but might be unsuccessful"), v35, v26, v38, context));
          v43 = (const char *)objc_msgSend_UTF8String(v40, v41, v42);
          puts(v43);

          v26 = objc_msgSend_seqNum(v29, v44, v45);
        }
        objc_msgSend_dataString(v29, v30, v31);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_length(v46, v47, v48);

        switch(objc_msgSend_type(v29, v50, v51))
        {
          case 1:
            v54 = v13;
            v55 = objc_alloc(MEMORY[0x1E0C99D50]);
            objc_msgSend_dataString(v29, v56, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v55, v59, (uint64_t)v58, 0);

            v61 = (void *)MEMORY[0x1E0CB3710];
            v62 = objc_opt_class();
            objc_msgSend_unarchivedObjectOfClass_fromData_error_(v61, v63, v62, v60, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_requestClassName(v64, v65, v66);
            v67 = objc_claimAutoreleasedReturnValue();
            v68 = (void *)v67;
            v69 = CFSTR("CKDPRequestOperation");
            if (v67)
              v69 = (__CFString *)v67;
            v70 = v69;

            v72 = (uint64_t)NSClassFromString(v70);
            if (!v72)
              v72 = objc_opt_class();
            objc_msgSend_setMessageClass_(v181, v71, v72);
            v75 = objc_msgSend_parsingStandaloneMessage(v64, v73, v74);
            objc_msgSend_setParsingStandaloneMessage_(v181, v76, v75);

            v176 = v64;
            v13 = v54;
            v14 = v173;
            break;
          case 2:
            v77 = objc_alloc(MEMORY[0x1E0C99D50]);
            objc_msgSend_dataString(v29, v78, v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v77, v81, (uint64_t)v80, 0);

            v82 = (void *)MEMORY[0x1E0CB3710];
            v83 = objc_opt_class();
            objc_msgSend_unarchivedObjectOfClass_fromData_error_(v82, v84, v83, v60, 0);
            v85 = objc_claimAutoreleasedReturnValue();

            v177 = (void *)v85;
            break;
          case 3:
            objc_msgSend_dataString(v29, v52, v53);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendString_(v13, v87, (uint64_t)v86);

            v88 = objc_alloc(MEMORY[0x1E0C99D50]);
            v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v88, v89, (uint64_t)v13, 0);
            if (v60)
            {
              objc_msgSend_setString_(v13, v90, (uint64_t)&stru_1E7838F48);
              objc_msgSend_processData_completionHandler_(v181, v91, (uint64_t)v60, 0);
              objc_msgSend_appendData_(v178, v92, (uint64_t)v60);
            }
            LOBYTE(v171) = 1;
            break;
          case 4:
            objc_msgSend_setString_(v14, v52, (uint64_t)&stru_1E7838F48);
            objc_msgSend_dataString(v29, v113, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_parserFromConfigurationMessage_(v170, v116, (uint64_t)v115);
            v117 = (void *)objc_claimAutoreleasedReturnValue();

            v186[0] = MEMORY[0x1E0C809B0];
            v186[1] = 3221225472;
            v186[2] = sub_1BEB0A474;
            v186[3] = &unk_1E7830DC8;
            v187 = v172;
            objc_msgSend_setObjectParsedBlock_(v117, v118, (uint64_t)v186);
            v60 = v187;
            v179 = v117;
            break;
          case 5:
            objc_msgSend_dataString(v29, v52, v53);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendString_(v14, v94, (uint64_t)v93);

            v95 = objc_alloc(MEMORY[0x1E0C99D50]);
            v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v95, v96, (uint64_t)v14, 0);
            if (v60)
            {
              objc_msgSend_setString_(v14, v97, (uint64_t)&stru_1E7838F48);
              objc_msgSend_processData_completionHandler_(v179, v98, (uint64_t)v60, 0);
              objc_msgSend_appendData_(v169, v99, (uint64_t)v60);
            }
            BYTE4(v171) = 1;
            break;
          case 7:
            ++v174;
            v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

            v60 = v181;
            v101 = [CKDProtobufResponseBodyParser alloc];
            v104 = objc_msgSend_messageClass(v60, v102, v103);
            v107 = objc_msgSend_parsingStandaloneMessage(v60, v105, v106);
            v108 = v101;
            v14 = v173;
            v110 = (void *)objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v108, v109, 25, v104, v107);

            v188[0] = MEMORY[0x1E0C809B0];
            v188[1] = 3221225472;
            v188[2] = sub_1BEB0A428;
            v188[3] = &unk_1E7830DC8;
            v175 = v100;
            v189 = v175;
            v181 = v110;
            objc_msgSend_setObjectParsedBlock_(v110, v111, (uint64_t)v188);
            v112 = objc_opt_new();

            v178 = (void *)v112;
            break;
          default:
            __assert_rtn("-[CKLStreamTrafficObserver parseRequestArrayAndPrint:]", "CKLStreamTrafficObserver.m", 275, "false");
        }
        v26 += v49;

      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v190, v196, 16);
    }
    while (v25);
  }
  else
  {
    v171 = 0;
    v179 = 0;
    v174 = 0;
    v176 = 0;
    v177 = 0;
  }

  objc_autoreleasePoolPop(context);
  v119 = dispatch_group_create();
  dispatch_group_enter(v119);
  v120 = MEMORY[0x1E0C809B0];
  v184[0] = MEMORY[0x1E0C809B0];
  v184[1] = 3221225472;
  v184[2] = sub_1BEB0A4C0;
  v184[3] = &unk_1E782EDA8;
  v121 = v119;
  v185 = v121;
  objc_msgSend_finishWithCompletion_(v181, v122, (uint64_t)v184);
  v123 = v179;
  if (v179)
  {
    dispatch_group_enter(v121);
    v182[0] = v120;
    v182[1] = 3221225472;
    v182[2] = sub_1BEB0A4FC;
    v182[3] = &unk_1E782EDA8;
    v183 = v121;
    objc_msgSend_finishWithCompletion_(v179, v124, (uint64_t)v182);

  }
  v125 = dispatch_time(0, 5000000000);
  v128 = v175;
  if (dispatch_group_wait(v121, v125))
  {
    v129 = objc_alloc(MEMORY[0x1E0CB3940]);
    v131 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v129, v130, (uint64_t)CFSTR("cloudkitlog parse error: request object parser timed out for request %@. Likely lost some request object data logs."), v168));
    v134 = (const char *)objc_msgSend_UTF8String(v131, v132, v133);
    puts(v134);

  }
  if ((v171 & 1) != 0 && !objc_msgSend_count(v175, v126, v127))
  {
    v135 = objc_alloc(MEMORY[0x1E0CB3940]);
    v137 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v135, v136, (uint64_t)CFSTR("cloudkitlog parse error: received request object data for request %@ but wasn't able to parse a single request object"), v168));
    v140 = (const char *)objc_msgSend_UTF8String(v137, v138, v139);
    puts(v140);

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v141, (uint64_t)CFSTR("/tmp/%@.request.dat"), v168);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeToFile_atomically_(v178, v143, (uint64_t)v142, 0);
    NSLog(CFSTR("Wrote raw request data to %@"), v142);

  }
  if ((v171 & 0x100000000) != 0 && !objc_msgSend_count(v172, v126, v127))
  {
    v144 = objc_alloc(MEMORY[0x1E0CB3940]);
    v146 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v144, v145, (uint64_t)CFSTR("cloudkitlog parse error: received response object data for request %@ but wasn't able to parse a single response object"), v168));
    v149 = (const char *)objc_msgSend_UTF8String(v146, v147, v148);
    puts(v149);

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v150, (uint64_t)CFSTR("/tmp/%@.response.dat"), v168);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeToFile_atomically_(v169, v152, (uint64_t)v151, 0);
    NSLog(CFSTR("Wrote raw response data to %@"), v151);

  }
  objc_msgSend_requestParsedBlock(v170, v126, v127);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  if (v153)
  {
    v154 = [CKLTrafficLogMessage alloc];
    v156 = (void *)objc_msgSend_initWithUuid_requestMetadata_requestObjects_bodyStreamResetCount_responseMetadata_responseObjects_(v154, v155, (uint64_t)v168, v176, v175, v174, v177, v172);
    objc_msgSend_logMessageFilter(v170, v157, v158);
    v159 = objc_claimAutoreleasedReturnValue();
    if (!v159
      || (v162 = (void *)v159,
          objc_msgSend_logMessageFilter(v170, v160, v161),
          v163 = (void *)objc_claimAutoreleasedReturnValue(),
          v165 = objc_msgSend_evaluateWithObject_(v163, v164, (uint64_t)v156),
          v163,
          v128 = v175,
          v162,
          v165))
    {
      objc_msgSend_requestParsedBlock(v170, v160, v161);
      v166 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v166)[2](v166, v156);

    }
    v123 = v179;
  }

}

- (void)finish
{
  uint64_t v2;
  NSObject *v3;

  objc_msgSend_printQueue(self, a2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &unk_1E7833798);

}

- (id)parserFromConfigurationMessage:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSString *v17;
  NSString *v18;
  Class v19;
  CKDProtobufResponseBodyParser *v20;
  const char *v21;
  void *v22;
  __objc2_class *v23;
  id v24;
  const char *v25;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v4, v5, (uint64_t)v3, 0);
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringWithRange_(v10, v11, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_integerValue(v12, v13, v14);

  switch(v15)
  {
    case 0:
    case 4:
      objc_msgSend_substringFromIndex_(v10, v16, 2);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = NSClassFromString(v17);
        v20 = [CKDProtobufResponseBodyParser alloc];
        v22 = (void *)objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v20, v21, 25, v19, v15 == 4);
      }
      else
      {
        v22 = 0;
      }

      goto LABEL_10;
    case 1:
      v23 = CKDJSONResponseBodyParser;
      goto LABEL_7;
    case 2:
      v23 = CKDPlistResponseBodyParser;
      goto LABEL_7;
    case 3:
      v23 = CKDPlaintextResponseBodyParser;
LABEL_7:
      v24 = [v23 alloc];
      v22 = (void *)objc_msgSend_initWithQoS_(v24, v25, 25);
LABEL_10:

      return v22;
    default:
      __assert_rtn("-[CKLStreamTrafficObserver parserFromConfigurationMessage:]", "CKLStreamTrafficObserver.m", 365, "false");
  }
}

- (NSPredicate)logMessageFilter
{
  return self->_logMessageFilter;
}

- (void)setLogMessageFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)requestParsedBlock
{
  return self->_requestParsedBlock;
}

- (void)setRequestParsedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableDictionary)requestDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)printQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPrintQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKDTrafficLogParser)parser
{
  return (CKDTrafficLogParser *)objc_getProperty(self, a2, 72, 1);
}

- (void)setParser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_printQueue, 0);
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong(&self->_requestParsedBlock, 0);
  objc_storeStrong((id *)&self->_logMessageFilter, 0);
}

@end
