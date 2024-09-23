@implementation RepairController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *supportedSPCs;
  NSSet *v14;
  NSSet *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[RepairController setupWithInputs:responder:]";
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v16, 0x20u);
  }

  -[RepairController setInputs:](self, "setInputs:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
    objc_msgSend(v11, "setStatusCode:", &off_100008B00);

    -[RepairController setFinished:](self, "setFinished:", 1);
  }
  v12 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100008C08));
  supportedSPCs = self->supportedSPCs;
  self->supportedSPCs = v12;

  v14 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObjectsFromArray:](self->supportedSPCs, "setByAddingObjectsFromArray:", &off_100008C20));
  v15 = self->supportedSPCs;
  self->supportedSPCs = v14;

}

- (id)parsePatchItems
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v29[4];
  NSMutableDictionary *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "patchItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), 0);
        if (!v10)
        {
          v17 = handleForCategory(0);
          v11 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_100005C98(v11, v18, v19, v20, v21, v22, v23, v24);
          goto LABEL_20;
        }
        v11 = v10;
        v31 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v10, 0, 0, &v31));
        v13 = v31;
        v14 = v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 0;
        if (!v15)
        {
          v25 = handleForCategory(0);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid patch info, failed to get patch info dictionary, error: %@", buf, 0xCu);
          }

LABEL_20:
          v16 = 0;
          goto LABEL_21;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000049DC;
        v29[3] = &unk_1000081F8;
        v30 = v3;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v29);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = v3;
LABEL_21:

  return v16;
}

- (void)start
{
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_semaphore_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  NSMutableArray *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
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
  NSObject *v71;
  void *v72;
  void *v73;
  dispatch_time_t v74;
  intptr_t v75;
  void *v76;
  void *v77;
  _UNKNOWN **v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
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
  NSObject *v130;
  void *v131;
  _QWORD v132[5];
  id v133;
  NSObject *v134;
  _QWORD v135[4];
  NSMutableArray *v136;
  NSMutableArray *v137;
  NSMutableArray *v138;
  _QWORD v139[13];
  _QWORD v140[13];
  uint8_t buf[4];
  void *v142;

  v3 = objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
  objc_msgSend((id)v3, "setStatusCode:", &off_100008B18);

  LOBYTE(v3) = MGGetBoolAnswer(CFSTR("InternalBuild"));
  v4 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    v96 = handleForCategory(0);
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      sub_100005CF8(v97, v98, v99, v100, v101, v102, v103, v104);

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
    v20 = v77;
    v78 = &off_100008B30;
    goto LABEL_53;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "partSPC"));
  objc_msgSend(v6, "intersectSet:", self->supportedSPCs);

  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "partSPC"));
    *(_DWORD *)buf = 138412290;
    v142 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "selected PartSPCs:%@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "partSPC"));
  if (!v12)
  {

    goto LABEL_52;
  }
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "partSPC"));
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
LABEL_52:
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
    v20 = v77;
    v78 = &off_100008B78;
LABEL_53:
    objc_msgSend(v77, "setStatusCode:", v78);
    goto LABEL_58;
  }
  v17 = dispatch_semaphore_create(0);
  v18 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairHelperProtocol));
  objc_msgSend(v18, "setRemoteObjectInterface:", v19);

  objc_msgSend(v18, "resume");
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patchItems"));

  if (v22)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[RepairController parsePatchItems](self, "parsePatchItems"));
    if (!v23)
    {
      v79 = handleForCategory(0);
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        sub_100005CC8(v80, v81, v82, v83, v84, v85, v86, v87);

      v88 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
      objc_msgSend(v88, "setStatusCode:", &off_100008B48);

      goto LABEL_57;
    }
    v24 = (void *)v23;
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_100005734;
    v135[3] = &unk_100008220;
    v136 = objc_opt_new(NSMutableArray);
    v137 = objc_opt_new(NSMutableArray);
    v138 = objc_opt_new(NSMutableArray);
    v25 = v138;
    v26 = v137;
    v27 = v136;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v135);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("patchDataClasses"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("patchDataInstances"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("patchValues"));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v29 = objc_msgSend(v28, "enableStagedSeal");

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v30, "enableStagedSeal")));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, CFSTR("enableStagedSeal"));

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v33 = objc_msgSend(v32, "ignoreStagedData");

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v34, "ignoreStagedData")));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v35, CFSTR("ignoreStagedData"));

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v37 = objc_msgSend(v36, "skipStageEAN");

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v38, "skipStageEAN")));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v39, CFSTR("skipStageEAN"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v41 = objc_msgSend(v40, "allowSelfService");

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v42, "allowSelfService")));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v43, CFSTR("allowSelfService"));

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v45 = objc_msgSend(v44, "allowUsedPart");

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v46, "allowUsedPart")));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v47, CFSTR("allowUsedPart"));

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "keyBlob"));

  if (v49)
  {
    v50 = objc_alloc((Class)NSData);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "keyBlob"));
    v53 = objc_msgSend(v50, "initWithBase64EncodedString:options:", v52, 0);

    if (v53)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v53, CFSTR("keyBlob"));

  }
  v139[0] = CFSTR("doSeal");
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v128, "doSeal")));
  v140[0] = v127;
  v139[1] = CFSTR("enableProxy");
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v126, "enableProxy")));
  v140[1] = v125;
  v139[2] = CFSTR("KBBSerialNumber");
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "KBBSerialNumber"));
  v55 = (void *)v54;
  if (!v54)
    v54 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v108 = (void *)v54;
  v140[2] = v54;
  v139[3] = CFSTR("KGBSerialNumber");
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "KGBSerialNumber"));
  v57 = (void *)v56;
  if (!v56)
    v56 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v107 = (void *)v56;
  v140[3] = v56;
  v139[4] = CFSTR("partSPC");
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "partSPC"));
  v59 = (void *)v58;
  if (!v58)
    v58 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v119 = v59;
  v121 = v57;
  v123 = v55;
  v106 = (void *)v58;
  v140[4] = v58;
  v139[5] = CFSTR("updateProperties");
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "updateProperties"));
  v117 = (void *)v60;
  if (!v60)
    v60 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v130 = v17;
  v131 = v20;
  v129 = v18;
  v105 = (void *)v60;
  v140[5] = v60;
  v139[6] = CFSTR("DisplayMaxDuration");
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "displayMaxDuration"));
  v140[6] = v115;
  v139[7] = CFSTR("CAURL");
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "FDRCAURL"));
  v140[7] = v113;
  v139[8] = CFSTR("DSURL");
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "FDRDSURL"));
  v140[8] = v111;
  v139[9] = CFSTR("TrustObjectURL");
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "trustObjectURL"));
  v140[9] = v109;
  v139[10] = CFSTR("SealingURL");
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "FDRSealingURL"));
  v140[10] = v62;
  v139[11] = CFSTR("UseSOCKSHost");
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "SOCKSHost"));
  v65 = v64;
  if (!v64)
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v140[11] = v65;
  v139[12] = CFSTR("UseSOCKSPort");
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "SOCKSPort"));
  v68 = v67;
  if (!v67)
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v140[12] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v140, v139, 13));
  objc_msgSend(v131, "addEntriesFromDictionary:", v69);

  if (!v67)
  if (!v64)

  v18 = v129;
  v17 = v130;
  v20 = v131;
  if (!v117)

  if (!v119)
  if (!v121)

  if (!v123)
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "remoteObjectProxy"));
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472;
  v132[2] = sub_100005830;
  v132[3] = &unk_100008248;
  v132[4] = self;
  v133 = v129;
  v71 = v130;
  v134 = v71;
  objc_msgSend(v70, "seal:withReply:", v131, v132);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController inputs](self, "inputs"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "timeoutPeriod"));
  v74 = dispatch_time(0, 1000000000 * (int)objc_msgSend(v73, "intValue"));
  v75 = dispatch_semaphore_wait(v71, v74);

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
    objc_msgSend(v76, "setStatusCode:", &off_100008B60);

  }
LABEL_57:

LABEL_58:
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "data"));
  v91 = objc_msgSend(v90, "mutableCopy");

  if (v91)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));
    if (v93)
    {
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v93, CFSTR("pluginVersion"));
    }
    else
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v94, CFSTR("pluginVersion"));

    }
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[RepairController result](self, "result"));
    objc_msgSend(v95, "setData:", v91);

  }
  -[RepairController setFinished:](self, "setFinished:", 1);

}

- (RepairInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputs, 0);
  objc_storeStrong((id *)&self->supportedSPCs, 0);
  objc_storeStrong((id *)&self->sealingMapSet, 0);
}

@end
