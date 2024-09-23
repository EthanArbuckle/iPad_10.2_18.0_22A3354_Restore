@implementation CHInputContextLexiconManager

- (CHInputContextLexiconManager)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  id v28;
  void *v29;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFStringRef *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  dispatch_time_t v49;
  NSObject *v50;
  NSObject *attr;
  objc_super v53;
  void *v54;
  uint64_t block;
  uint64_t p_block;
  uint64_t v57;
  void *v58;
  id *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id location[2];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)CHInputContextLexiconManager;
  v2 = -[CHInputContextLexiconManager init](&v53, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UNSPECIFIED, 0);
    attr = objc_claimAutoreleasedReturnValue();

    v4 = dispatch_queue_create("com.apple.handwritingd.LexiconManagerQueue", attr);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("handwritingd-transient-lexicon-%p"), v7, v8, v9, v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = *MEMORY[0x1E0D437C8];
    v11 = v63;
    v64 = v10;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)&v64, (uint64_t)&v63, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v2 + 9) = LXLexiconCreateTransient();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("handwritingd-transient-phrase-lexicon-%p"), v16, v17, v18, v2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v11;
    v62 = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v62, (uint64_t)&v61, 1, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v2 + 10) = LXLexiconCreateTransient();
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v23;

    location[0] = 0;
    location[1] = location;
    v66 = 0x2050000000;
    v25 = (void *)qword_1EF568080;
    v67 = qword_1EF568080;
    v26 = MEMORY[0x1E0C809B0];
    if (!qword_1EF568080)
    {
      block = MEMORY[0x1E0C809B0];
      p_block = 3221225472;
      v57 = (uint64_t)sub_1BE6EA004;
      v58 = &unk_1E77F2D50;
      v59 = location;
      sub_1BE6EA004((uint64_t)&block);
      v25 = (void *)*((_QWORD *)location[1] + 3);
    }
    v27 = objc_retainAutorelease(v25);
    _Block_object_dispose(location, 8);
    v28 = objc_alloc_init(v27);
    v29 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v28;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    block = 0;
    p_block = (uint64_t)&block;
    v57 = 0x2020000000;
    v31 = (CFStringRef *)qword_1EF568090;
    v58 = (void *)qword_1EF568090;
    if (qword_1EF568090)
      goto LABEL_10;
    v54 = 0;
    if (qword_1EF568088)
    {
      v31 = (CFStringRef *)qword_1EF568088;
    }
    else
    {
      *(_OWORD *)location = xmmword_1E77F3CC8;
      v66 = 0;
      qword_1EF568088 = _sl_dlopen();
      v32 = v54;
      v31 = (CFStringRef *)qword_1EF568088;
      if (!qword_1EF568088)
      {
        v32 = (void *)abort_report_np();
        goto LABEL_15;
      }
      if (v54)
        goto LABEL_16;
    }
    while (1)
    {
      v31 = (CFStringRef *)dlsym(v31, "KSTextReplacementDidChangeNotification");
      *(_QWORD *)(p_block + 24) = v31;
      qword_1EF568090 = (uint64_t)v31;
LABEL_10:
      _Block_object_dispose(&block, 8);
      if (v31)
        break;
      dlerror();
      v32 = (void *)abort_report_np();
LABEL_15:
      __break(1u);
LABEL_16:
      free(v32);
    }
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1BE6E8458, *v31, 0, (CFNotificationSuspensionBehavior)0);
    sub_1BE6E8460(v2);
    *((_QWORD *)v2 + 7) = LMVocabularyCreate();
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v33;

    objc_initWeak(location, v2);
    block = v26;
    p_block = 3221225472;
    v57 = (uint64_t)sub_1BE6E8CDC;
    v58 = &unk_1E77F3BE0;
    objc_copyWeak((id *)&v59, location);
    v35 = MEMORY[0x1C3B81A84](&block);
    v36 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v35;

    v37 = sub_1BE6E8600();
    objc_msgSend_sharedManager(v37, v38, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)objc_msgSend_addContactObserver_(v43, v44, *((_QWORD *)v2 + 2), v45, v46, v47);

    objc_destroyWeak((id *)&v59);
    objc_destroyWeak(location);
    *((_QWORD *)v2 + 3) = 0;
    objc_initWeak(location, v2);
    v49 = dispatch_time(0, 0);
    v50 = *((_QWORD *)v2 + 1);
    block = v26;
    p_block = 3221225472;
    v57 = (uint64_t)sub_1BE6E8F34;
    v58 = &unk_1E77F3C08;
    objc_copyWeak(&v60, location);
    v59 = (id *)v2;
    dispatch_after(v49, v50, &block);
    objc_destroyWeak(&v60);
    objc_destroyWeak(location);

  }
  return (CHInputContextLexiconManager *)v2;
}

- (void)dealloc
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _LXLexicon *transientLexicon;
  _LXLexicon *transientPhraseLexicon;
  NSMutableDictionary *textReplacements;
  _KSTextReplacementClientStore *textReplacementStore;
  NSMutableArray *addressBook;
  void *vocabulary;
  objc_super v20;

  v3 = sub_1BE6E8600();
  objc_msgSend_sharedManager(v3, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeContactObserver_(v9, v10, (uint64_t)self->_contactsObserverBlock, v11, v12, v13);

  transientLexicon = self->_transientLexicon;
  if (transientLexicon)
  {
    CFRelease(transientLexicon);
    self->_transientLexicon = 0;
  }
  transientPhraseLexicon = self->_transientPhraseLexicon;
  if (transientPhraseLexicon)
  {
    CFRelease(transientPhraseLexicon);
    self->_transientPhraseLexicon = 0;
  }
  textReplacements = self->_textReplacements;
  self->_textReplacements = 0;

  textReplacementStore = self->_textReplacementStore;
  self->_textReplacementStore = 0;

  addressBook = self->_addressBook;
  self->_addressBook = 0;

  vocabulary = self->_vocabulary;
  if (vocabulary)
  {
    CFRelease(vocabulary);
    self->_vocabulary = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)CHInputContextLexiconManager;
  -[CHInputContextLexiconManager dealloc](&v20, sel_dealloc);
}

- (OS_dispatch_queue)lexiconQueue
{
  return self->_lexiconQueue;
}

- (NSDictionary)textReplacements
{
  NSObject *lexiconQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1BE6E8BA0;
  v10 = sub_1BE6E8BB0;
  v11 = 0;
  lexiconQueue = self->_lexiconQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BE6E8BB8;
  v5[3] = &unk_1E77F23B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lexiconQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (NSArray)addressBookLexicon
{
  NSObject *lexiconQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1BE6E8BA0;
  v10 = sub_1BE6E8BB0;
  v11 = 0;
  lexiconQueue = self->_lexiconQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BE6E8CA4;
  v5[3] = &unk_1E77F23B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lexiconQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (_LXLexicon)transientLexicon
{
  return self->_transientLexicon;
}

- (_LXLexicon)transientPhraseLexicon
{
  return self->_transientPhraseLexicon;
}

- (void)vocabulary
{
  return self->_vocabulary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBook, 0);
  objc_storeStrong((id *)&self->_textReplacementStore, 0);
  objc_storeStrong((id *)&self->_textReplacements, 0);
  objc_storeStrong((id *)&self->_recognitionProcessingQueue, 0);
  objc_storeStrong(&self->_contactsObserverBlock, 0);
  objc_storeStrong((id *)&self->_lexiconQueue, 0);
}

@end
