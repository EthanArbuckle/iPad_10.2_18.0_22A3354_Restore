@implementation ICCRCoderUnarchiver

+ (void)initialize
{
  +[ICCRCoder registerCRClasses](ICCRCoder, "registerCRClasses");
}

+ (id)decodedDocumentFromData:(id)a3 replica:(id)a4
{
  id v5;
  id v6;
  ICCRCoderUnarchiver *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(ICCRCoderUnarchiver);
  -[ICCRCoderUnarchiver decodeDocumentFromData:replica:](v7, "decodeDocumentFromData:replica:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)willModifySelfInInitForClass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
  }
}

- (id)allocedObjectAtIndex:(unint64_t)a3 outNeedsInit:(BOOL *)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  __objc2_class **v16;
  ICTTMergeableAttributedString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void **v27;
  void *__p[2];
  char v29;

  if (a4)
    *a4 = 1;
  if (*(int *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 64) > a3)
  {
    while (1)
    {
      -[ICCRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      -[ICCRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 > a3)
        break;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {

      v15 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_DocObject>::TypeHandler>((uint64_t)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 56), a3);
      v16 = off_1E76C5B18;
      switch(*(_DWORD *)(v15 + 48))
      {
        case 1:
          v16 = off_1E76C5B38;
          goto LABEL_33;
        case 2:
          v16 = off_1E76C5B30;
          goto LABEL_33;
        case 3:
          v16 = off_1E76C5B40;
          goto LABEL_33;
        case 4:
          v16 = off_1E76C5B58;
          goto LABEL_33;
        case 5:
          goto LABEL_33;
        case 6:
          v16 = off_1E76C5AF0;
          goto LABEL_33;
        case 7:
          v16 = off_1E76C5B68;
          goto LABEL_33;
        case 8:
          v16 = off_1E76C5B90;
          goto LABEL_33;
        case 9:
          v16 = off_1E76C5B00;
          goto LABEL_33;
        case 0xA:
          if (a4)
            *a4 = 0;
          v17 = -[ICTTMergeableAttributedString initWithICCRCoder:]([ICTTMergeableAttributedString alloc], "initWithICCRCoder:", self);
          goto LABEL_34;
        case 0xB:
          v16 = &off_1E76C5BA0;
          goto LABEL_33;
        case 0xC:
          v16 = off_1E76C5B10;
          goto LABEL_33;
        case 0xD:
          v18 = *(_QWORD *)(v15 + 40);
          if ((*(_BYTE *)(v18 + 32) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "customObject.has_type()", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, CFSTR("Type not set"));
            if ((*(_BYTE *)(v18 + 32) & 1) == 0)
              goto LABEL_44;
          }
          v19 = *(int *)(v18 + 64);
          -[ICCRCoderUnarchiver typeSetForDecoding](self, "typeSetForDecoding");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndex:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICCRCoder typeToClassDict](self, "typeToClassDict");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (objc_class *)objc_msgSend(v22, "objectForKeyedSubscript:", v21);

          if (v23)
          {
            if (-[ICCRCoderUnarchiver willModifySelfInInitForClass:](self, "willModifySelfInInitForClass:", v23))
            {
              if (a4)
                *a4 = 0;
              v24 = (id)objc_msgSend([v23 alloc], "initWithICCRCoder:", self);
LABEL_43:
              v13 = v24;

              if (v13)
              {
LABEL_35:
                -[ICCRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setObject:atIndexedSubscript:", v13, a3);

              }
              else
              {
LABEL_44:
                v13 = 0;
                objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, CFSTR("Failed to allocate memory at index %ld"), a3);
              }
              return v13;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "aClass", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, CFSTR("Did not find class for type: %@"), v21);
          }
          v24 = [v23 alloc];
          goto LABEL_43;
        case 0xE:
          v16 = off_1E76C6050;
          goto LABEL_33;
        case 0xF:
          v16 = off_1E76C5AC8;
          goto LABEL_33;
        case 0x10:
          v16 = off_1E76C5B70;
LABEL_33:
          v17 = (ICTTMergeableAttributedString *)objc_alloc(*v16);
LABEL_34:
          v13 = v17;
          if (v17)
            goto LABEL_35;
          goto LABEL_44;
        default:
          v26 = (void *)MEMORY[0x1E0D641A0];
          (*(void (**)(void **__return_ptr))(*(_QWORD *)v15 + 16))(__p);
          if (v29 >= 0)
            v27 = __p;
          else
            v27 = (void **)__p[0];
          objc_msgSend(v26, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, CFSTR("Unable to allocate memory for unknown object of type: %s"), v27);
          if (v29 < 0)
            operator delete(__p[0]);
          return 0;
      }
    }
    return v13;
  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:]", 1, 0, CFSTR("Index out of bounds"));
  return 0;
}

- (id)decodeDocumentFromData:(id)a3 replica:(id)a4
{
  CRDT::Document *v6;
  void *v7;
  google::protobuf::MessageLite *v8;
  void *v9;
  uint64_t i;
  int *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  ICCRVectorTimestamp *v16;
  _QWORD *v17;
  uint64_t v18;
  ICCRVectorTimestamp *v19;
  _QWORD *v20;
  uint64_t v21;
  ICCRDocument *v22;
  TTICCRVectorMultiTimestamp *v23;
  _QWORD *v24;
  uint64_t v25;
  ICCRTTCompatibleDocument *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t j;
  int *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  uint64_t k;
  int *v38;
  void *v39;
  void *v40;
  int v41;
  char v42;
  char v43;
  uint64_t v44;
  _QWORD *m;
  int *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  void (**v64)(_QWORD, _QWORD);
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  ICCRVectorTimestamp *v74;
  ICCRVectorTimestamp *v75;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v77 = a4;
  -[ICCRCoderUnarchiver setReplica:](self, "setReplica:");
  v6 = (CRDT::Document *)operator new();
  CRDT::Document::Document(v6);
  -[ICCRCoderUnarchiver setCurrentDocument:](self, "setCurrentDocument:", v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRCoderUnarchiver setCompletionHandlers:](self, "setCompletionHandlers:", v7);

  v8 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
  v78 = objc_retainAutorelease(v76);
  if (!google::protobuf::MessageLite::ParseFromArray(v8, (char *)objc_msgSend(v78, "bytes"), objc_msgSend(v78, "length"))|| !*(_DWORD *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 64))
  {
    v15 = 0;
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 136));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRCoderUnarchiver setUuidArray:](self, "setUuidArray:", v9);

  for (i = *(_QWORD *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 128); ; i += 8)
  {
    v11 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
    if (i == *((_QWORD *)v11 + 16) + 8 * v11[34])
      break;
    v12 = *(_QWORD **)i;
    if (*(char *)(*(_QWORD *)i + 23) < 0)
      v12 = (_QWORD *)*v12;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v12);
    -[ICCRCoderUnarchiver uuidArray](self, "uuidArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

  }
  v16 = [ICCRVectorTimestamp alloc];
  v17 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
  v18 = v17[5];
  if (!v18)
    v18 = *(_QWORD *)(CRDT::Document::default_instance((CRDT::Document *)v17) + 40);
  v74 = -[ICCRVectorTimestamp initWithProtobufTimestamp:decoder:](v16, "initWithProtobufTimestamp:decoder:", v18, self);
  v19 = [ICCRVectorTimestamp alloc];
  v20 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
  v21 = v20[6];
  if (!v21)
    v21 = *(_QWORD *)(CRDT::Document::default_instance((CRDT::Document *)v20) + 48);
  v75 = -[ICCRVectorTimestamp initWithProtobufTimestamp:decoder:](v19, "initWithProtobufTimestamp:decoder:", v21, self);
  if ((*(_BYTE *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 32) & 0x40) != 0)
  {
    v23 = [TTICCRVectorMultiTimestamp alloc];
    v24 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
    v25 = v24[19];
    if (!v25)
      v25 = *(_QWORD *)(CRDT::Document::default_instance((CRDT::Document *)v24) + 152);
    v22 = -[ICTTVectorMultiTimestamp initWithArchive:andCapacity:](v23, "initWithArchive:andCapacity:", v25, 2);
    v26 = -[ICCRTTCompatibleDocument initWithVersion:startVersion:rootObject:replica:topoTimestamp:]([ICCRTTCompatibleDocument alloc], "initWithVersion:startVersion:rootObject:replica:topoTimestamp:", v74, v75, 0, v77, v22);
    -[ICCRCoderUnarchiver setDocument:](self, "setDocument:", v26);

  }
  else
  {
    v22 = -[ICCRDocument initWithVersion:startVersion:rootObject:replica:]([ICCRDocument alloc], "initWithVersion:startVersion:rootObject:replica:", v74, v75, 0, v77);
    -[ICCRCoderUnarchiver setDocument:](self, "setDocument:", v22);
  }

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", *(int *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 112));
  -[ICCRCoderUnarchiver setTypeSetForDecoding:](self, "setTypeSetForDecoding:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", *(int *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 88));
  -[ICCRCoderUnarchiver setKeySet:](self, "setKeySet:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(int *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 64));
  -[ICCRCoderUnarchiver setAllocedDocObjects:](self, "setAllocedDocObjects:", v29);

  for (j = *(_QWORD *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 104); ; j += 8)
  {
    v31 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
    if (j == *((_QWORD *)v31 + 13) + 8 * v31[28])
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRCoderUnarchiver typeSetForDecoding](self, "typeSetForDecoding");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v32);

    -[ICCRCoder typeSet](self, "typeSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "indexOfObject:", v32) == 0x7FFFFFFFFFFFFFFFLL;

    if (v35)
    {
      v36 = os_log_create("com.apple.notes", "CRFramework");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v32;
        _os_log_debug_impl(&dword_1BD918000, v36, OS_LOG_TYPE_DEBUG, "Type (%@) is not registered yet", buf, 0xCu);
      }

    }
  }
  for (k = *(_QWORD *)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 80); ; k += 8)
  {
    v38 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
    if (k == *((_QWORD *)v38 + 10) + 8 * v38[22])
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRCoderUnarchiver keySet](self, "keySet");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v39);

  }
  v41 = 0;
  v42 = 1;
  do
  {
    v43 = v42;
    v44 = 0;
    for (m = *(_QWORD **)(-[ICCRCoderUnarchiver currentDocument](self, "currentDocument") + 56); ; ++m)
    {
      v46 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
      if (m == (_QWORD *)(*((_QWORD *)v46 + 7) + 8 * v46[16]))
        break;
      v47 = *m;
      -[ICCRCoderUnarchiver setCurrentDocObjectForDecodingPtr:](self, "setCurrentDocObjectForDecodingPtr:", *m);
      v48 = *(_DWORD *)(v47 + 48);
      if (v48 == 10)
      {
        if ((v43 & 1) == 0)
          goto LABEL_47;
        goto LABEL_41;
      }
      if (v48 != 13)
      {
        if ((v41 & 1) == 0)
          goto LABEL_47;
LABEL_41:
        buf[0] = 0;
        -[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:](self, "allocedObjectAtIndex:outNeedsInit:", v44, buf);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v56 && buf[0])
        {
          v58 = v56;
          v59 = (id)objc_msgSend(v58, "initWithICCRCoder:", self);
          if (v58 != v59)
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "object == initObject", "-[ICCRCoderUnarchiver decodeDocumentFromData:replica:]", 1, 0, CFSTR("Object modified self in init"));

        }
        goto LABEL_47;
      }
      v49 = *(_QWORD *)(v47 + 40);
      if ((*(_BYTE *)(v49 + 32) & 1) != 0)
      {
        v50 = *(int *)(v49 + 64);
        -[ICCRCoderUnarchiver typeSetForDecoding](self, "typeSetForDecoding");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndex:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICCRCoder typeToClassDict](self, "typeToClassDict");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "objectForKeyedSubscript:", v52);

        if (!v54)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "aClass", "-[ICCRCoderUnarchiver decodeDocumentFromData:replica:]", 1, 0, CFSTR("Did not find class for type: %@"), v52);
        v55 = -[ICCRCoderUnarchiver willModifySelfInInitForClass:](self, "willModifySelfInInitForClass:", v54);

        if (((v41 ^ v55) & 1) != 0)
          goto LABEL_41;
      }
LABEL_47:
      ++v44;
    }
    v42 = 0;
    v41 = 1;
  }
  while ((v43 & 1) != 0);
  -[ICCRCoderUnarchiver sortCompletionHandlers](self, "sortCompletionHandlers");
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v80;
    do
    {
      for (n = 0; n != v61; ++n)
      {
        if (*(_QWORD *)v80 != v62)
          objc_enumerationMutation(v60);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * n), "block");
        v64 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, ICCRCoderUnarchiver *))v64)[2](v64, self);

      }
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    }
    while (v61);
  }

  -[ICCRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRCoderUnarchiver setCurrentDocObjectForDecodingPtr:](self, "setCurrentDocObjectForDecodingPtr:", 0);
  -[ICCRCoderUnarchiver setTypeSetForDecoding:](self, "setTypeSetForDecoding:", 0);
  -[ICCRCoderUnarchiver setKeySet:](self, "setKeySet:", 0);
  -[ICCRCoderUnarchiver setAllocedDocObjects:](self, "setAllocedDocObjects:", 0);

LABEL_57:
  -[ICCRCoderUnarchiver setCompletionHandlers:](self, "setCompletionHandlers:", 0);
  v66 = -[ICCRCoderUnarchiver currentDocument](self, "currentDocument");
  if (v66)
    (*(void (**)(void *))(*(_QWORD *)v66 + 8))(v66);
  -[ICCRCoderUnarchiver setCurrentDocument:](self, "setCurrentDocument:", 0);
  if (v15 && (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF5316F8) & 1) != 0)
  {
    -[ICCRCoderUnarchiver document](self, "document");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setRootObject:", v15);

    -[ICCRCoderUnarchiver document](self, "document");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = (void *)MEMORY[0x1E0D641A0];
    -[ICCRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "count");
    -[ICCRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeDocumentFromData:replica:]", 1, 0, CFSTR("Unable to get root object from %ld objects (%@) or does not conform to expected protocol ICCRCoding, got: %@"), v71, v72, v15);

    v68 = 0;
  }

  return v68;
}

- (const)currentObjectIDForKey:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  const void *v12;

  v4 = a3;
  if (*(_DWORD *)(-[ICCRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr") + 48) != 13)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.currentDocObjectForDecodingPtr->has_custom()", "-[ICCRCoderUnarchiver currentObjectIDForKey:]", 1, 0, CFSTR("Not a custom object"));
  if (*(_DWORD *)(-[ICCRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr") + 48) != 13
    || ((v5 = -[ICCRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr"),
         *((_DWORD *)v5 + 12) != 13)
      ? (v6 = CRDT::Document_CustomObject::default_instance((CRDT::Document_CustomObject *)v5))
      : (v6 = v5[5]),
        (v7 = -[ICCRCoderUnarchiver indexForKey:](self, "indexForKey:", v4), v8 = v7, v7 == 0x7FFFFFFFFFFFFFFFLL)
     || *(int *)(v6 + 48) < 1))
  {
LABEL_15:
    v12 = 0;
  }
  else
  {
    v9 = 0;
    while (1)
    {
      v10 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_CustomObject_MapEntry>::TypeHandler>(v6 + 40, v9);
      if ((~*(_DWORD *)(v10 + 32) & 3) == 0 && *(_DWORD *)(v10 + 48) == v8)
        break;
      if (++v9 >= *(_DWORD *)(v6 + 48))
        goto LABEL_15;
    }
    v12 = *(const void **)(v10 + 40);
    if (!v12)
      v12 = *(const void **)(CRDT::Document_CustomObject_MapEntry::default_instance((CRDT::Document_CustomObject_MapEntry *)v10)
                           + 40);
  }

  return v12;
}

- (id)decodeKeys
{
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (*(_DWORD *)(-[ICCRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr") + 48) != 13)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.currentDocObjectForDecodingPtr->has_custom()", "-[ICCRCoderUnarchiver decodeKeys]", 1, 0, CFSTR("Not a custom object"));
  if (*(_DWORD *)(-[ICCRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr") + 48) == 13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ICCRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr");
    if (*((_DWORD *)v4 + 12) == 13)
      v5 = v4[5];
    else
      v5 = CRDT::Document_CustomObject::default_instance((CRDT::Document_CustomObject *)v4);
    if (*(int *)(v5 + 48) >= 1)
    {
      v7 = 0;
      do
      {
        v8 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_CustomObject_MapEntry>::TypeHandler>(v5 + 40, v7);
        if ((~*(_DWORD *)(v8 + 32) & 3) == 0)
        {
          v9 = *(int *)(v8 + 48);
          -[ICCRCoderUnarchiver keySet](self, "keySet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndex:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "ic_addNonNilObject:", v11);

        }
        ++v7;
      }
      while (v7 < *(_DWORD *)(v5 + 48));
    }
    v6 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)decodeObjectForKey:(id)a3
{
  id v4;
  const void *v5;
  void *v6;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (v5)
  {
    -[ICCRCoderUnarchiver decodeObjectForProtobufObjectID:](self, "decodeObjectForProtobufObjectID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)decodeObjectForProtobufObjectID:(const void *)a3
{
  void *v3;

  if (*((_DWORD *)a3 + 12) == 6)
  {
    -[ICCRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:](self, "allocedObjectAtIndex:outNeedsInit:", *((unsigned int *)a3 + 10), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)decodeDataForKey:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (*((_DWORD *)v5 + 12) == 5)
  {
    v6 = (uint64_t *)v5[5];
    if (*((char *)v6 + 23) < 0)
    {
      v6 = (uint64_t *)*v6;
      v7 = *(_QWORD *)(v5[5] + 8);
    }
    else
    {
      v7 = *((unsigned __int8 *)v6 + 23);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeDataForKey:]", 1, 0, CFSTR("Unable to find data for key: %@"), v4);
    v8 = 0;
  }

  return v8;
}

- (id)decodeStringForKey:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t *v6;
  void *v7;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (*((_DWORD *)v5 + 12) == 4)
  {
    v6 = (uint64_t *)v5[5];
    if (*((char *)v6 + 23) < 0)
      v6 = (uint64_t *)*v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeStringForKey:]", 1, 0, CFSTR("Unable to find string for key: %@"), v4);
    v7 = 0;
  }

  return v7;
}

- (id)decodeUUIDForKey:(id)a3
{
  void *v3;
  void *v4;

  -[ICCRCoderUnarchiver decodeStringForKey:](self, "decodeStringForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  else
    v4 = 0;

  return v4;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v4;
  double *v5;
  double v6;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (*((_DWORD *)v5 + 12) == 3)
  {
    v6 = v5[5];
  }
  else
  {
    v6 = 0.0;
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeDoubleForKey:]", 1, 0, CFSTR("Unable to find double for key: %@"), v4);
  }

  return v6;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v4;
  _DWORD *v5;
  int v6;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (v5 && v5[12] == 1)
  {
    v6 = v5[10];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeInt32ForKey:]", 1, 0, CFSTR("Unable to find integer for key: %@"), v4);
    v6 = 0;
  }

  return v6;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v4;
  _QWORD *v5;
  int64_t v6;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (v5 && *((_DWORD *)v5 + 12) == 1)
  {
    v6 = v5[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeInt64ForKey:]", 1, 0, CFSTR("Unable to find integer for key: %@"), v4);
    v6 = 0;
  }

  return v6;
}

- (unsigned)decodeUInt32ForKey:(id)a3
{
  id v4;
  _DWORD *v5;
  unsigned int v6;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (v5 && v5[12] == 2)
  {
    v6 = v5[10];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeUInt32ForKey:]", 1, 0, CFSTR("Unable to find integer for key: %@"), v4);
    v6 = 0;
  }

  return v6;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  id v4;
  _QWORD *v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (v5 && *((_DWORD *)v5 + 12) == 2)
  {
    v6 = v5[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCRCoderUnarchiver decodeUInt64ForKey:]", 1, 0, CFSTR("Unable to find integer for key: %@"), v4);
    v6 = 0;
  }

  return v6;
}

- (id)decodeUUIDFromUUIDIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[ICCRCoderUnarchiver uuidArray](self, "uuidArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index < self.uuidArray.count", "-[ICCRCoderUnarchiver decodeUUIDFromUUIDIndex:]", 1, 0, CFSTR("Index %ld out of bounds"), a3);
  -[ICCRCoderUnarchiver uuidArray](self, "uuidArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasDecodableValueForKey:(id)a3
{
  return -[ICCRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3) != 0;
}

- (void)addDecoderCompletionHandler:(id)a3 dependency:(id)a4 for:(id)a5
{
  id v8;
  id v9;
  ICCRCoderUnarchiverCompletionHandler *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(ICCRCoderUnarchiverCompletionHandler);
  -[ICCRCoderUnarchiverCompletionHandler setBlock:](v10, "setBlock:", v12);
  -[ICCRCoderUnarchiverCompletionHandler setDependency:](v10, "setDependency:", v8);
  -[ICCRCoderUnarchiverCompletionHandler setValue:](v10, "setValue:", v9);
  -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

}

- (void)sortCompletionHandlers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  while (1)
  {
    -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

    if (v7)
      break;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v9)
      goto LABEL_24;
    v10 = *(_QWORD *)v31;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
      objc_msgSend(v12, "dependency");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (!v9)
        {
LABEL_24:

LABEL_25:
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("No topological sort of completion handlers."), 0);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v25);
        }
        goto LABEL_5;
      }
    }
    v15 = v12;

    if (!v15)
      goto LABEL_25;
    objc_msgSend(v5, "addObject:", v15);
    -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v15);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[ICCRCoderUnarchiver completionHandlers](self, "completionHandlers", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v21, "dependency");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v22 == v23;

          if (v24)
            objc_msgSend(v21, "setDependency:", 0);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

  }
  -[ICCRCoderUnarchiver setCompletionHandlers:](self, "setCompletionHandlers:", v5);

}

- (unint64_t)indexForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ICCRCoderUnarchiver keySet](self, "keySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.keySet", "-[ICCRCoderUnarchiver indexForKey:]", 1, 0, CFSTR("keySet should have been allocated"));
  -[ICCRCoderUnarchiver keySet](self, "keySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return v7;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICCRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (NSMutableArray)allocedDocObjects
{
  return self->_allocedDocObjects;
}

- (void)setAllocedDocObjects:(id)a3
{
  objc_storeStrong((id *)&self->_allocedDocObjects, a3);
}

- (const)currentDocObjectForDecodingPtr
{
  return self->_currentDocObjectForDecodingPtr;
}

- (void)setCurrentDocObjectForDecodingPtr:(const void *)a3
{
  self->_currentDocObjectForDecodingPtr = a3;
}

- (NSMutableOrderedSet)typeSetForDecoding
{
  return self->_typeSetForDecoding;
}

- (void)setTypeSetForDecoding:(id)a3
{
  objc_storeStrong((id *)&self->_typeSetForDecoding, a3);
}

- (NSMutableOrderedSet)keySet
{
  return self->_keySet;
}

- (void)setKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_keySet, a3);
}

- (NSMutableArray)uuidArray
{
  return self->_uuidArray;
}

- (void)setUuidArray:(id)a3
{
  objc_storeStrong((id *)&self->_uuidArray, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_uuidArray, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_typeSetForDecoding, 0);
  objc_storeStrong((id *)&self->_allocedDocObjects, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replica, 0);
}

@end
