@implementation CKDProtobufResponseBodyParser

- (void)setIsParsing:(BOOL)a3
{
  self->_isParsing = a3;
}

- (BOOL)_parseObjects:(BOOL)a3 group:(id)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  id v63;
  const char *v64;
  void *v65;
  const char *v66;
  const char *v67;
  void *v68;
  void *v69;
  const char *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v78;
  const char *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _BOOL4 v99;
  uint8_t v100[8];
  uint64_t v101;
  uint8_t buf[24];
  uint64_t v103;

  v4 = a3;
  v103 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v4)
  {
    v9 = 1;
  }
  else if (objc_msgSend_parsingStandaloneMessage(self, v6, v7))
  {
    v9 = 0x7FFFFFFFLL;
  }
  else
  {
    v9 = 10;
  }
  objc_msgSend_parserData(self, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v10, v11, v12);
  v16 = objc_msgSend_bytes(v10, v14, v15);
  v19 = (void *)MEMORY[0x1C3B83E24]();
  if (v13 > 0x7FFFFFFE)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 1005, CFSTR("_parserData has insane length %lu"), v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParserError_(self, v21, (uint64_t)v20);
LABEL_8:

LABEL_38:
    objc_autoreleasePoolPop(v19);
    if (!v13)
      goto LABEL_35;
LABEL_39:
    v63 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v65 = (void *)objc_msgSend_initWithBytes_length_(v63, v64, v16, v13);
    objc_msgSend_setTailParserData_(self, v66, (uint64_t)v65);

    objc_msgSend_setParserData_(self, v67, 0);
    if (v4)
    {
      objc_msgSend_parserError(self, v55, v56);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v68)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v55, *MEMORY[0x1E0C94B20], 1005, CFSTR("Parser had %lu additional unparsed bytes remaining"), v13);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setParserError_(self, v70, (uint64_t)v69);

      }
    }
    goto LABEL_42;
  }
  v99 = v4;
  while (1)
  {
    if (v13 < v9 || objc_msgSend_curObjectLength(self, v17, v18))
      goto LABEL_14;
    if (objc_msgSend_parsingStandaloneMessage(self, v17, v18))
    {
      objc_msgSend_setCurObjectLength_(self, v22, v13);
LABEL_14:
      v20 = 0;
      goto LABEL_15;
    }
    v101 = 0;
    *(_QWORD *)buf = 0;
    if ((PBReaderReadVarIntBuf() & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v49, *MEMORY[0x1E0C94B20], 1005, CFSTR("Couldn't read the size of the next object from the server"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setParserError_(self, v90, (uint64_t)v89);

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v91 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_1BE990000, v91, OS_LOG_TYPE_INFO, "Warn: Couldn't read length from input stream", v100, 2u);
      }
      goto LABEL_38;
    }
    objc_msgSend_setCurObjectLength_(self, v49, v101);
    if ((unint64_t)objc_msgSend_curObjectLength(self, v50, v51) >= 0x7FFFFFFF)
    {
      v92 = (void *)MEMORY[0x1E0C94FF8];
      v93 = *MEMORY[0x1E0C94B20];
      v97 = objc_msgSend_curObjectLength(self, v52, v53);
      objc_msgSend_errorWithDomain_code_format_(v92, v94, v93, 1005, CFSTR("_curObjectLength has insane length %lu"), v97);
      goto LABEL_62;
    }
    if (v13 < *(_QWORD *)buf)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v52, *MEMORY[0x1E0C94B20], 1005, CFSTR("ParserData length %lu isn't greater than varIntLen of %lu (objectLength %llu)"), v13, *(_QWORD *)buf, v101);
LABEL_62:
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setParserError_(self, v95, (uint64_t)v20);
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99DF0], v52, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 += *(_QWORD *)buf;
    v13 -= *(_QWORD *)buf;
LABEL_15:
    if ((unint64_t)objc_msgSend_curObjectLength(self, v17, v18) >= 0x7FFFFFFF)
    {
      v57 = (void *)MEMORY[0x1E0C94FF8];
      v58 = *MEMORY[0x1E0C94B20];
      v59 = objc_msgSend_curObjectLength(self, v23, v24);
      objc_msgSend_errorWithDomain_code_format_(v57, v60, v58, 1005, CFSTR("_curObjectLength has insane length %lu"), v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setParserError_(self, v62, (uint64_t)v61);

      goto LABEL_37;
    }
    if (objc_msgSend_curObjectLength(self, v23, v24) && v13 >= objc_msgSend_curObjectLength(self, v25, v26))
    {
      v27 = objc_alloc(MEMORY[0x1E0C99D50]);
      v30 = objc_msgSend_curObjectLength(self, v28, v29);
      v32 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v27, v31, v16, v30, 0);
      objc_msgSend_appendData_(v20, v33, (uint64_t)v32);
      if ((objc_msgSend__parseObjectFromData_rawData_group_(self, v34, (uint64_t)v32, v20, v8) & 1) != 0)
      {
        if ((unint64_t)objc_msgSend_curObjectLength(self, v35, v36) >= 0x7FFFFFFF)
        {
          v81 = (void *)MEMORY[0x1E0C94FF8];
          v82 = *MEMORY[0x1E0C94B20];
          v96 = objc_msgSend_curObjectLength(self, v37, v38);
          objc_msgSend_errorWithDomain_code_format_(v81, v83, v82, 1005, CFSTR("_curObjectLength has insane length %lu"), v96);
        }
        else
        {
          if (v13 >= objc_msgSend_curObjectLength(self, v37, v38))
          {
            v16 += objc_msgSend_curObjectLength(self, v39, v40);
            v43 = objc_msgSend_curObjectLength(self, v41, v42);
            if (v13 >= v43)
              v13 -= v43;
            else
              v13 = 0;
            objc_msgSend_setCurObjectLength_(self, v44, 0);

            goto LABEL_25;
          }
          v84 = (void *)MEMORY[0x1E0C94FF8];
          v85 = *MEMORY[0x1E0C94B20];
          v98 = objc_msgSend_curObjectLength(self, v39, v40);
          objc_msgSend_errorWithDomain_code_format_(v84, v86, v85, 1005, CFSTR("ParserData length %lu isn't greater than self.curObjectLength of %lu"), v13, v98);
        }
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setParserError_(self, v88, (uint64_t)v87);

        v4 = v99;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v35, *MEMORY[0x1E0C94B20], 1005, CFSTR("Couldn't parse an object from the server"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setParserError_(self, v79, (uint64_t)v78);

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v80 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE990000, v80, OS_LOG_TYPE_ERROR, "Failed to parse object from input stream", buf, 2u);
        }
      }

      goto LABEL_8;
    }
LABEL_25:

    objc_autoreleasePoolPop(v19);
    if ((v13 < v9 || objc_msgSend_curObjectLength(self, v45, v46))
      && (!objc_msgSend_curObjectLength(self, v45, v46) || v13 < objc_msgSend_curObjectLength(self, v47, v48)))
    {
      break;
    }
    v19 = (void *)MEMORY[0x1C3B83E24]();
  }
  if (v13)
    goto LABEL_39;
LABEL_35:
  objc_msgSend_setTailParserData_(self, v47, 0);
  objc_msgSend_setParserData_(self, v54, 0);
LABEL_42:
  objc_msgSend_parserError(self, v55, v56);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v72 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v73 = v72;
      objc_msgSend_parserError(self, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v76;
      _os_log_impl(&dword_1BE990000, v73, OS_LOG_TYPE_INFO, "Warn: Parser encountered an error: %@", buf, 0xCu);

    }
  }

  return v71 == 0;
}

- (unint64_t)curObjectLength
{
  return self->_curObjectLength;
}

- (void)setTailParserData:(id)a3
{
  objc_storeStrong((id *)&self->_tailParserData, a3);
}

- (void)setCurObjectLength:(unint64_t)a3
{
  self->_curObjectLength = a3;
}

- (BOOL)parsingStandaloneMessage
{
  return self->_parsingStandaloneMessage;
}

- (BOOL)_parseObjectFromData:(id)a3 rawData:(id)a4 group:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  objc_class *v40;
  void *v41;
  NSObject *v42;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  objc_class *v50;
  void *v51;
  const char *v52;
  _QWORD v53[4];
  NSObject *v54;
  _QWORD v55[4];
  NSObject *v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x1E0D82B90]);
  v14 = (void *)objc_msgSend_initWithData_(v12, v13, (uint64_t)v9);
  if (!objc_msgSend_messageClass(self, v15, v16))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v49, v52, (uint64_t)a2, self, CFSTR("CKDProtobufResponseBodyParser.m"), 38, CFSTR("You can't use %@ without setting a message class"), v51);

  }
  v19 = objc_alloc_init((Class)objc_msgSend_messageClass(self, v17, v18));
  v23 = objc_msgSend_readFrom_(v19, v20, (uint64_t)v14);
  if (v23)
  {
    objc_msgSend_objectParsedBlock(self, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)*MEMORY[0x1E0C952F8];
    if (v24)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v25);
      v26 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v44 = v26;
        *(_DWORD *)buf = 138412546;
        v58 = objc_msgSend_messageClass(self, v45, v46);
        v59 = 2048;
        v60 = objc_msgSend_length(v9, v47, v48);
        _os_log_debug_impl(&dword_1BE990000, v44, OS_LOG_TYPE_DEBUG, "Successfully parsed message %@ (%tu)", buf, 0x16u);

      }
      dispatch_group_enter(v11);
      objc_msgSend_objectParsedBlock(self, v27, v28);
      v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = sub_1BE9C26DC;
      v55[3] = &unk_1E782EA40;
      v30 = v11;
      v56 = v30;
      ((void (**)(_QWORD, id, id, _QWORD *))v29)[2](v29, v19, v10, v55);

      if (*MEMORY[0x1E0C95280] && objc_msgSend_testRepeatedParseResults(self, v31, v32))
      {
        dispatch_group_enter(v30);
        objc_msgSend_objectParsedBlock(self, v33, v34);
        v35 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = sub_1BEAE6060;
        v53[3] = &unk_1E782EA40;
        v54 = v30;
        ((void (**)(_QWORD, id, id, _QWORD *))v35)[2](v35, v19, v10, v53);

      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v25);
      v42 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "If an object is parsed in the woods and no one is there to hear it, was it really parsed? You're leaking objects on the floor. Set up a parser callback block", buf, 2u);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      v40 = (objc_class *)objc_msgSend_messageClass(self, v38, v39);
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v58 = (uint64_t)v41;
      v59 = 2112;
      v60 = (uint64_t)v9;
      v61 = 2113;
      v62 = v10;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Error parsing message of class %{public}@ from data %@. Raw data is %{private}@", buf, 0x20u);

    }
  }

  return v23;
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (NSMutableData)tailParserData
{
  return self->_tailParserData;
}

- (void)processData:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend_parseQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE996340;
  v14[3] = &unk_1E78301A8;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = a2;
  v12 = v8;
  v13 = v7;
  dispatch_async(v11, v14);

}

- (BOOL)isParsing
{
  return self->_isParsing;
}

- (CKDProtobufResponseBodyParser)initWithQoS:(int64_t)a3 messageClass:(Class)a4 parsingStandaloneMessage:(BOOL)a5
{
  CKDProtobufResponseBodyParser *v7;
  CKDProtobufResponseBodyParser *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDProtobufResponseBodyParser;
  v7 = -[CKDResponseBodyParser initWithQoS:](&v10, sel_initWithQoS_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_messageClass, a4);
    v8->_parsingStandaloneMessage = a5;
  }
  return v8;
}

- (void)finishWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_parseQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BE9C30C0;
  v9[3] = &unk_1E782F4D0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailParserData, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
}

- (void)setMessageClass:(Class)a3
{
  objc_storeStrong((id *)&self->_messageClass, a3);
}

- (void)setParsingStandaloneMessage:(BOOL)a3
{
  self->_parsingStandaloneMessage = a3;
}

@end
