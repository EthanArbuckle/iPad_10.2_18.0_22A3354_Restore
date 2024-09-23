@implementation DDActionController

- (DDActionController)init
{
  DDActionController *v2;
  DDActionController *v3;
  UIViewController *presentedViewController;
  UIViewController *currentBaseViewController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DDActionController;
  v2 = -[DDActionController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    presentedViewController = v2->_presentedViewController;
    v2->_presentedViewController = 0;

    currentBaseViewController = v3->_currentBaseViewController;
    v3->_currentBaseViewController = 0;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_idsListenerID)
  {
    objc_msgSend(MEMORY[0x1E0D34368], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeListenerID:forService:", self->_idsListenerID, *MEMORY[0x1E0D34210]);

  }
  v4.receiver = self;
  v4.super_class = (Class)DDActionController;
  -[DDActionController dealloc](&v4, sel_dealloc);
}

- (void)_cleanup
{
  UIViewController *presentedViewController;
  UIViewController *currentBaseViewController;
  UIAlertController *alertController;
  UIWindow *originalWindow;

  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = 0;

  currentBaseViewController = self->_currentBaseViewController;
  self->_currentBaseViewController = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

  -[DDActionController setCurrentAction:](self, "setCurrentAction:", 0);
  -[DDActionController setBaseView:](self, "setBaseView:", 0);
  -[DDActionController setInteractionDelegate:](self, "setInteractionDelegate:", 0);
  originalWindow = self->_originalWindow;
  self->_originalWindow = 0;

}

- (BOOL)facetimeAvailable
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSString *v6;
  NSString *idsListenerID;
  void *v8;
  void *v9;
  BOOL v10;

  if (self->_idsListenerID)
  {
    v3 = *MEMORY[0x1E0D34210];
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = facetimeAvailable_i++;
    v6 = (NSString *)objc_msgSend(v4, "initWithFormat:", CFSTR("com.apple.datadetectors.%d"), v5);
    idsListenerID = self->_idsListenerID;
    self->_idsListenerID = v6;

    objc_msgSend(MEMORY[0x1E0D34368], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D34210];
    objc_msgSend(v8, "addListenerID:forService:", self->_idsListenerID, *MEMORY[0x1E0D34210]);

  }
  objc_msgSend(MEMORY[0x1E0D34368], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "availabilityForListenerID:forService:", self->_idsListenerID, v3) == 1;

  return v10;
}

- (id)actionsForURL:(id)a3 result:(__DDResult *)a4 enclosingResult:(__DDResult *)a5 context:(id)a6
{
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  DDAddToAddressBookAction *v14;
  DDDirectionsAction *v15;
  DDOpenMapsAction *v16;
  DDChatBotAction *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int Category;
  DDDirectionsAction *v28;
  DDOpenMapsAction *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  __objc2_class **v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  __objc2_class *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  int v65;
  const __CFString *Type;
  _BOOL8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  int v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  uint64_t v96;
  void *v97;
  __objc2_class *v98;
  void *v99;
  void *v100;
  int v101;
  int ShouldKeepParsecScoresBelowThreshold;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  void *v114;
  void *v115;
  char isKindOfClass;
  uint64_t v117;
  void *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  id v128;
  _BYTE v129[128];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[3];
  _QWORD v134[3];

  v134[1] = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t)a3;
  v11 = a6;
  v12 = v11;
  if (v10 | (unint64_t)a4)
  {
    if (+[DDMessagesCustomAction handlesUrl:result:](DDMessagesCustomAction, "handlesUrl:result:", v10, a4))
    {
      v22 = (void *)MEMORY[0x1E0C99D20];
      +[DDAction actionWithURL:result:context:](DDMessagesCustomAction, "actionWithURL:result:context:", v10, a4, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayWithObjects:", v23, v24, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_78;
    }
    if (+[DDChatBotAction handlesUrl:result:](DDChatBotAction, "handlesUrl:result:", v10, a4))
    {
      v17 = -[DDAction initWithURL:result:context:]([DDChatBotAction alloc], "initWithURL:result:context:", v10, a4, v12);
      -[DDChatBotAction sheetActions](v17, "sheetActions");
      v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

      goto LABEL_78;
    }
    objc_msgSend((id)v10, "scheme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      Category = DDResultGetCategory();
      if (!v26)
      {
LABEL_37:
        if (((objc_msgSend((id)v10, "isFaceTimeURL") & 1) != 0
           || objc_msgSend((id)v10, "isFaceTimePromptURL"))
          && -[DDActionController facetimeAvailable](self, "facetimeAvailable")
          || ((objc_msgSend((id)v10, "isFaceTimeAudioURL") & 1) != 0
           || objc_msgSend((id)v10, "isFaceTimeAudioPromptURL"))
          && -[DDActionController facetimeAvailable](self, "facetimeAvailable"))
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (+[DDFaceTimeAction isAvailable](DDFaceTimeAction, "isAvailable"))
          {
            +[DDAction actionWithURL:result:context:](DDFaceTimeAction, "actionWithURL:result:context:", v10, a4, v12);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v30);

          }
          if (+[DDFaceTimeAudioAction isAvailable](DDFaceTimeAudioAction, "isAvailable"))
          {
            +[DDAction actionWithURL:result:context:](DDFaceTimeAudioAction, "actionWithURL:result:context:", v10, a4, v12);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v31);

          }
          +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v32);
          goto LABEL_76;
        }
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("mailto")))
        {
          v35 = +[DDAddToAddressBookAction isAvailable](DDAddToAddressBookAction, "isAvailable");
          v36 = (void *)MEMORY[0x1E0C99D20];
          +[DDAction actionWithURL:result:context:](DDSendMailAction, "actionWithURL:result:context:", v10, a4, v12);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            +[DDAddressAction actionWithURL:result:enclosingResult:context:](DDAddToAddressBookAction, "actionWithURL:result:enclosingResult:context:", v10, a4, a5, v12);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "arrayWithObjects:", v37, v38, v39, 0);
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "arrayWithObjects:", v37, v58, 0);
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_83:

          goto LABEL_77;
        }
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("upi")))
        {
LABEL_80:
          +[DDUPIAction actionsWithURL:result:context:](DDUPIAction, "actionsWithURL:result:context:", v10, a4, v12);
          v57 = objc_claimAutoreleasedReturnValue();
LABEL_81:
          v13 = (id)v57;
          goto LABEL_77;
        }
        if (objc_msgSend((id)v10, "dd_isMaps:", 0)
          && DDExtractMapLocationInformationFromURL((void *)v10, 0, 0))
        {
          v59 = (void *)MEMORY[0x1E0C99D20];
          +[DDAction actionWithURL:result:context:](DDDirectionsAction, "actionWithURL:result:context:", v10, a4, v12);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = DDOpenMapsAction;
LABEL_87:
          -[__objc2_class actionWithURL:result:context:](v61, "actionWithURL:result:context:", v10, a4, v12);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "arrayWithObjects:", v60, v62, v63, 0);
          v64 = objc_claimAutoreleasedReturnValue();
LABEL_88:
          v13 = (id)v64;

LABEL_89:
          goto LABEL_148;
        }
        if (+[DDClientPreviewAction clientCanPerformActionWithUrl:](DDClientPreviewAction, "clientCanPerformActionWithUrl:", v10))
        {
          +[DDAction actionWithURL:result:context:](DDClientPreviewAction, "actionWithURL:result:context:", v10, 0, v12);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v134[0] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_76:

LABEL_77:
          goto LABEL_78;
        }
        if (!a4)
        {
          v67 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v67)
            -[DDActionController actionsForURL:result:enclosingResult:context:].cold.2(v67, v68, v69, v70, v71, v72, v73, v74);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[DDActionController actionsForURL:result:enclosingResult:context:].cold.1((void *)v10);
          v13 = 0;
          goto LABEL_77;
        }
        v65 = DDResultGetCategory();
        Type = (const __CFString *)DDResultGetType();
        switch(v65)
        {
          case 1:
            if (!v10)
            {
              _DDURLFromResult((uint64_t)a4);
              v10 = objc_claimAutoreleasedReturnValue();
            }
            if (+[DDNewsPreviewAction handlesUrl:result:](DDNewsPreviewAction, "handlesUrl:result:", v10, a4)|| +[DDURLPreviewAction handlesUrl:result:](DDURLPreviewAction, "handlesUrl:result:", v10, a4))
            {
              if (+[DDAddToReadingListAction isAvailable](DDAddToReadingListAction, "isAvailable"))
              {
                +[DDAction actionWithURL:result:context:](DDAddToReadingListAction, "actionWithURL:result:context:", v10, a4, v12);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v133[0] = v60;
                +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v133[1] = v62;
                +[DDAction actionWithURL:result:context:](DDShareAction, "actionWithURL:result:context:", v10, a4, v12);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v133[2] = v63;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 3);
                v64 = objc_claimAutoreleasedReturnValue();
                goto LABEL_88;
              }
              +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v132[0] = v60;
              +[DDAction actionWithURL:result:context:](DDShareAction, "actionWithURL:result:context:", v10, a4, v12);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v132[1] = v82;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);
              v96 = objc_claimAutoreleasedReturnValue();
              goto LABEL_146;
            }
            objc_msgSend((id)v10, "scheme");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "lowercaseString");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "isEqualToString:", CFSTR("upi"));

            if (v101)
              goto LABEL_80;
            v97 = (void *)MEMORY[0x1E0C99D20];
            v98 = DDOpenURLAction;
            goto LABEL_145;
          case 3:
            v75 = +[DDAddToAddressBookAction isAvailable](DDAddToAddressBookAction, "isAvailable");
            v76 = (void *)MEMORY[0x1E0C99D20];
            +[DDAction actionWithURL:result:context:](DDDirectionsAction, "actionWithURL:result:context:", v10, a4, v12);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            +[DDAction actionWithURL:result:context:](DDOpenMapsAction, "actionWithURL:result:context:", v10, a4, v12);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if (v75)
            {
              +[DDAddressAction actionWithURL:result:enclosingResult:context:](DDAddToAddressBookAction, "actionWithURL:result:enclosingResult:context:", v10, a4, a5, v12);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "arrayWithObjects:", v37, v77, v78, v79, 0);
              v13 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "arrayWithObjects:", v37, v77, v95, 0);
              v13 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_83;
          case 4:
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (+[DDAddEventAction isAvailable](DDCreateEventAction, "isAvailable"))
            {
              +[DDAction actionWithURL:result:context:](DDCreateEventAction, "actionWithURL:result:context:", v10, a4, v12);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v80);

            }
            if (+[DDCreateReminderAction isAvailable](DDCreateReminderAction, "isAvailable"))
            {
              +[DDAction actionWithURL:result:context:](DDCreateReminderAction, "actionWithURL:result:context:", v10, a4, v12);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v81);

            }
            +[DDAction actionWithURL:result:context:](DDShowCalendarAction, "actionWithURL:result:context:", v10, a4, v12);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v131[0] = v60;
            +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v131[1] = v82;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObjectsFromArray:", v83);
            goto LABEL_136;
          case 5:
            v84 = Type;
            if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CBA0], 0))
            {
              if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CAF0], 0))
              {
                if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CB38], 0) == kCFCompareEqualTo)
                {
                  ShouldKeepParsecScoresBelowThreshold = DDScannerShouldKeepParsecScoresBelowThreshold();
                  v59 = (void *)MEMORY[0x1E0C99D20];
                  if (ShouldKeepParsecScoresBelowThreshold)
                  {
                    +[DDAction actionWithURL:result:context:](DDParsecYeaAction, "actionWithURL:result:context:", v10, a4, v12);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    +[DDAction actionWithURL:result:context:](DDParsecNayAction, "actionWithURL:result:context:", v10, a4, v12);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    +[DDAction actionWithURL:result:context:](DDParsecAction, "actionWithURL:result:context:", v10, a4, v12);
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    +[DDAction actionWithURL:result:context:](DDSearchWebAction, "actionWithURL:result:context:", v10, a4, v12);
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "arrayWithObjects:", v60, v62, v103, v104, v105, 0);
                    v13 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_89;
                  }
                  +[DDAction actionWithURL:result:context:](DDParsecAction, "actionWithURL:result:context:", v10, a4, v12);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = DDSearchWebAction;
                  goto LABEL_87;
                }
                v118 = v26;
                if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CAB8], 0) == kCFCompareEqualTo)
                {
                  +[DDAction actionWithURL:result:context:](DDFlightAction, "actionWithURL:result:context:", v10, a4, v12);
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v130[0] = v106;
                  +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  v130[1] = v107;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
                  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_171:
                  v26 = v118;
                  goto LABEL_77;
                }
                if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CA38], 0))
                {
                  if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CB48], 0) == kCFCompareEqualTo)
                  {
                    +[DDConversionAction allActionsForResult:context:](DDConversionAction, "allActionsForResult:context:", a4, v12);
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v123 = 0u;
                    v124 = 0u;
                    v125 = 0u;
                    v126 = 0u;
                    v88 = v109;
                    v110 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v129, 16);
                    if (v110)
                    {
                      v111 = v110;
                      v112 = *(_QWORD *)v124;
                      do
                      {
                        for (i = 0; i != v111; ++i)
                        {
                          if (*(_QWORD *)v124 != v112)
                            objc_enumerationMutation(v88);
                          v114 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
                          objc_msgSend(v114, "firstObject");
                          v115 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          isKindOfClass = objc_opt_isKindOfClass();

                          if ((isKindOfClass & 1) != 0)
                            objc_msgSend(v13, "addObjectsFromArray:", v114);
                        }
                        v111 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v129, 16);
                      }
                      while (v111);
                    }

                    goto LABEL_165;
                  }
                  if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CBA8], 0))
                  {
                    if (CFStringCompare(v84, (CFStringRef)*MEMORY[0x1E0D1CAA8], 0) == kCFCompareEqualTo)
                    {
                      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "bundleIdentifier");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      v87 = objc_msgSend(v86, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

                      if (v87)
                      {
                        +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
                        v88 = (id)objc_claimAutoreleasedReturnValue();
                        v128 = v88;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
                        v89 = objc_claimAutoreleasedReturnValue();
LABEL_153:
                        v13 = (id)v89;
LABEL_165:

                        goto LABEL_171;
                      }
                    }
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      -[DDActionController actionsForURL:result:enclosingResult:context:].cold.4((uint64_t)v84, v10);
                    objc_msgSend(MEMORY[0x1E0C99D20], "array");
                    v117 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    +[DDUPIAction actionsWithURL:result:context:](DDUPIAction, "actionsWithURL:result:context:", v10, a4, v12);
                    v117 = objc_claimAutoreleasedReturnValue();
                  }
                  v13 = (id)v117;
                  goto LABEL_171;
                }
                v108 = (void *)MEMORY[0x1E0C99D20];
                +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
                v88 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "arrayWithObjects:", v88, 0);
                v89 = objc_claimAutoreleasedReturnValue();
                goto LABEL_153;
              }
              v97 = (void *)MEMORY[0x1E0C99D20];
              v98 = DDShowItemAction;
            }
            else
            {
              v97 = (void *)MEMORY[0x1E0C99D20];
              v98 = DDTrackShipmentAction;
            }
LABEL_145:
            -[__objc2_class actionWithURL:result:context:](v98, "actionWithURL:result:context:", v10, a4, v12);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "arrayWithObjects:", v60, v82, 0);
            v96 = objc_claimAutoreleasedReturnValue();
LABEL_146:
            v13 = (id)v96;
LABEL_147:

LABEL_148:
            goto LABEL_77;
          case 6:
            +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (v60 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              +[DDAction actionWithURL:result:context:](DDMoneyPreviewAction, "actionWithURL:result:context:", v10, a4, v12);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v90);

            }
            if (+[DDConversionAction actionAvailableForResult:](DDConversionAction, "actionAvailableForResult:", a4))
            {
              +[DDAction actionWithURL:result:context:](DDConversionAction, "actionWithURL:result:context:", v10, a4, v12);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v82);
              objc_msgSend(v82, "specialCaseActions");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = 0u;
              v120 = 0u;
              v121 = 0u;
              v122 = 0u;
              v91 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
              if (v91)
              {
                v92 = v91;
                v93 = *(_QWORD *)v120;
                do
                {
                  for (j = 0; j != v92; ++j)
                  {
                    if (*(_QWORD *)v120 != v93)
                      objc_enumerationMutation(v83);
                    objc_msgSend(v13, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j));
                  }
                  v92 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
                }
                while (v92);
              }
LABEL_136:

            }
            else
            {
              +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v82);
            }
            goto LABEL_147;
          default:
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[DDActionController actionsForURL:result:enclosingResult:context:].cold.3((uint64_t)a4, v10);
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v57 = objc_claimAutoreleasedReturnValue();
            goto LABEL_81;
        }
      }
    }
    else
    {
      Category = 0;
      if (!v26)
        goto LABEL_37;
    }
    if ((objc_msgSend((id)v10, "dd_isAnySimpleTelephonyScheme") & 1) == 0 && Category != 2)
      goto LABEL_37;
    v33 = +[DDTextMessageAction supportsURL:](DDTextMessageAction, "supportsURL:", v10);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      +[DDAction actionWithURL:result:context:](DDTextMessageAction, "actionWithURL:result:context:", v10, a4, v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v34);
    }
    else
    {
      if (!dd_phoneNumberResultCanBeRdarLink((_BOOL8)a4))
      {
LABEL_57:
        if (+[DDCallAction isAvailable](DDCallAction, "isAvailable"))
        {
          +[DDAction actionWithURL:result:context:](DDCallAction, "actionWithURL:result:context:", v10, a4, v12);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v42);

        }
        if (+[DDAssistedCallAction isAvailable](DDTTYCallAction, "isAvailable"))
        {
          +[DDAction actionWithURL:result:context:](DDTTYCallAction, "actionWithURL:result:context:", v10, a4, v12);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v43);

        }
        if (+[DDAssistedCallAction isAvailable](DDRelayCallAction, "isAvailable"))
        {
          +[DDAction actionWithURL:result:context:](DDRelayCallAction, "actionWithURL:result:context:", v10, a4, v12);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v44);

        }
        if (+[DDFaceTimeAudioAction isAvailable](DDFaceTimeAudioAction, "isAvailable")
          && -[DDActionController facetimeAvailable](self, "facetimeAvailable"))
        {
          +[DDAction actionWithURL:result:context:](DDFaceTimeAudioAction, "actionWithURL:result:context:", v10, a4, v12);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v45);

        }
        if (!v33)
        {
          +[DDDetectionController sharedController](DDDetectionController, "sharedController");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "shouldIgnoreMessageActionForURL:", v10);

          if ((v47 & 1) == 0)
          {
            +[DDAction actionWithURL:result:context:](DDTextMessageAction, "actionWithURL:result:context:", v10, a4, v12);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v48);

          }
        }
        if (+[DDAddToAddressBookAction isAvailable](DDAddToAddressBookAction, "isAvailable"))
        {
          +[DDAddressAction actionWithURL:result:enclosingResult:context:](DDAddToAddressBookAction, "actionWithURL:result:enclosingResult:context:", v10, a4, a5, v12);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v49);

        }
        +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v10, a4, v12);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v50);

        v51 = off_1E4257590;
        if (+[DDSingleCallKitAction isAvailable](DDSingleCallKitAction, "isAvailable")
          || (v51 = off_1E4257540,
              +[DDMoreCallActionsAction isAvailable](DDMoreCallActionsAction, "isAvailable")))
        {
          -[__objc2_class actionWithURL:result:context:](*v51, "actionWithURL:result:context:", v10, a4, v12);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v52);

        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bundleIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

        if (!v55)
          goto LABEL_77;
        objc_msgSend(v13, "objectAtIndex:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addToRecents");
        goto LABEL_76;
      }
      objc_msgSend((id)v10, "dd_rdarLinkFromTelScheme");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        +[DDAction actionWithURL:result:context:](DDOpenURLAction, "actionWithURL:result:context:", v34, 0, v12);
        v40 = v26;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v41);

        v26 = v40;
      }
    }

    goto LABEL_57;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Contact"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_11;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (+[DDAddToAddressBookAction actionAvailableForContact:](DDAddToAddressBookAction, "actionAvailableForContact:", v10))
  {
    v14 = -[DDAction initWithURL:result:context:]([DDAddToAddressBookAction alloc], "initWithURL:result:context:", 0, 0, v12);
    objc_msgSend(v13, "addObject:", v14);

  }
  if (+[DDOpenMapsAction actionAvailableForContact:](DDDirectionsAction, "actionAvailableForContact:", v10))
  {
    v15 = -[DDAction initWithURL:result:context:]([DDDirectionsAction alloc], "initWithURL:result:context:", 0, 0, v12);
    objc_msgSend(v13, "addObject:", v15);

  }
  if (+[DDOpenMapsAction actionAvailableForContact:](DDOpenMapsAction, "actionAvailableForContact:", v10))
  {
    v16 = -[DDAction initWithURL:result:context:]([DDOpenMapsAction alloc], "initWithURL:result:context:", 0, 0, v12);
    objc_msgSend(v13, "addObject:", v16);

  }
  if (!objc_msgSend(v13, "count"))
  {

LABEL_11:
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ICS"));
    v17 = (DDChatBotAction *)objc_claimAutoreleasedReturnValue();
    if (-[DDChatBotAction length](v17, "length"))
    {
      +[DDAddEventAction cachedEventForICSString:](DDAddEventAction, "cachedEventForICSString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v18, 0x1E4259480, v12);
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
        if (+[DDAddEventAction isAvailable](DDAddEventAction, "isAvailable"))
        {
          +[DDAction actionWithURL:result:context:](DDAddEventAction, "actionWithURL:result:context:", 0, 0, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (id)objc_msgSend(v20, "initWithObjects:", v21, 0);

        }
        else
        {
          v13 = (id)objc_msgSend(v20, "initWithObjects:", 0, 0);
        }
        if (+[DDOpenMapsAction actionAvailableForCachedEvent:](DDDirectionsAction, "actionAvailableForCachedEvent:", v18))
        {
          v28 = -[DDAction initWithURL:result:context:]([DDDirectionsAction alloc], "initWithURL:result:context:", 0, 0, v19);
          objc_msgSend(v13, "addObject:", v28);

        }
        if (+[DDOpenMapsAction actionAvailableForCachedEvent:](DDOpenMapsAction, "actionAvailableForCachedEvent:", v18))
        {
          v29 = -[DDAction initWithURL:result:context:]([DDOpenMapsAction alloc], "initWithURL:result:context:", 0, 0, v19);
          objc_msgSend(v13, "addObject:", v29);

        }
        if (!objc_msgSend(v13, "count"))
        {

          v13 = 0;
        }
        v12 = (void *)v19;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
    goto LABEL_33;
  }
LABEL_78:

  return v13;
}

- (id)actionsForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  return -[DDActionController actionsForURL:result:enclosingResult:context:](self, "actionsForURL:result:enclosingResult:context:", a3, a4, 0, a5);
}

- (id)defaultActionForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __objc2_class *v13;
  id v14;
  __DDResult *v15;
  void *v16;
  id v18;
  int Category;
  const void *Type;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  void *v31;

  v8 = a3;
  v9 = a5;
  if (!+[DDMessagesCustomAction handlesUrl:result:](DDMessagesCustomAction, "handlesUrl:result:", v8, a4))
  {
    objc_msgSend(v8, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isEqualToString:", CFSTR("mailto")))
    {
      v13 = DDSendMailAction;
LABEL_5:
      v14 = v8;
      v15 = a4;
      goto LABEL_6;
    }
    if (objc_msgSend(v8, "dd_isAnySimpleTelephonyScheme"))
    {
      -[DDActionController actionsForURL:result:context:](self, "actionsForURL:result:context:", v8, a4, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setIsDefaultAction:", 1);
      goto LABEL_9;
    }
    if (+[DDClientPreviewAction clientCanPerformActionWithUrl:](DDClientPreviewAction, "clientCanPerformActionWithUrl:", v8))
    {
      v13 = DDClientPreviewAction;
      v14 = v8;
      v15 = 0;
LABEL_6:
      -[__objc2_class defaultActionWithURL:result:context:](v13, "defaultActionWithURL:result:context:", v14, v15, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
    if (!objc_msgSend(v8, "isSpringboardHandledURL"))
    {
      if (a4)
      {
        Category = DDResultGetCategory();
        Type = (const void *)DDResultGetType();
        switch(Category)
        {
          case 3:
            v13 = DDOpenMapsAction;
            goto LABEL_5;
          case 4:
            v13 = DDShowCalendarAction;
            goto LABEL_5;
          case 5:
            v30 = Type;
            if (CFEqual(Type, (CFTypeRef)*MEMORY[0x1E0D1CBA0]))
            {
              v13 = DDTrackShipmentAction;
              goto LABEL_5;
            }
            if (CFEqual(v30, (CFTypeRef)*MEMORY[0x1E0D1CAF0]))
            {
              v13 = DDShowItemAction;
              goto LABEL_5;
            }
            if (CFEqual(v30, (CFTypeRef)*MEMORY[0x1E0D1CB38]))
            {
              v13 = DDParsecAction;
              goto LABEL_5;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[DDActionController defaultActionForURL:result:context:].cold.5((uint64_t)v30, (uint64_t)v8);
            break;
          case 6:
            v13 = DDMoneyPreviewAction;
            goto LABEL_5;
          default:
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[DDActionController actionsForURL:result:enclosingResult:context:].cold.3((uint64_t)a4, (uint64_t)v8);
            goto LABEL_35;
        }
      }
      else
      {
        v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v22)
          -[DDActionController actionsForURL:result:enclosingResult:context:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[DDActionController actionsForURL:result:enclosingResult:context:].cold.1(v8);
      }
      goto LABEL_35;
    }
    if (!objc_msgSend(v8, "hasTelephonyScheme"))
    {
      if ((objc_msgSend(v8, "isFaceTimeURL") & 1) != 0
        || (objc_msgSend(v8, "isFaceTimeAudioURL") & 1) != 0
        || (objc_msgSend(v8, "isFaceTimePromptURL") & 1) != 0
        || objc_msgSend(v8, "isFaceTimeAudioPromptURL"))
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", v8);
        objc_msgSend(v21, "setShowUIPrompt:", 1);
        objc_msgSend(v21, "setPerformDialAssist:", 1);
        objc_msgSend(v21, "URL");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[DDActionController defaultActionForURL:result:context:].cold.1(v8);

LABEL_27:
        if (v18)
        {
          +[DDAction defaultActionWithURL:result:context:](DDOpenURLAction, "defaultActionWithURL:result:context:", v18, a4, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
LABEL_35:
        v10 = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("http")) & 1) == 0
        && !objc_msgSend(v12, "isEqualToString:", CFSTR("https")))
      {
        goto LABEL_35;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("defaultHttpActionRequested"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_35;
    }
    v18 = v8;
    goto LABEL_27;
  }
  +[DDAction actionWithURL:result:context:](DDMessagesCustomAction, "actionWithURL:result:context:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

- (void)_presentController:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIViewController *presentedViewController;
  UIViewController *currentBaseViewController;
  UIWindow *originalWindow;
  _BOOL4 v15;
  UIAlertController *alertController;
  UIViewController *v17;
  UIViewController *v18;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  UIViewController *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIAlertController *v43;
  _QWORD v44[5];

  v5 = a3;
  if (v5)
  {
    if (self->_presentedViewController || self->_currentBaseViewController || self->_originalWindow)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[DDActionController _presentController:].cold.2((uint64_t)v5, (uint64_t)&self->_presentedViewController, v6, v7, v8, v9, v10, v11);
      presentedViewController = self->_presentedViewController;
      self->_presentedViewController = 0;

      currentBaseViewController = self->_currentBaseViewController;
      self->_currentBaseViewController = 0;

      originalWindow = self->_originalWindow;
      self->_originalWindow = 0;

    }
    -[DDActionController _willPresentViewController](self, "_willPresentViewController");
    if (self->_interactionDelegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[DDDetectionControllerInteractionDelegate actionWillStart:](self->_interactionDelegate, "actionWillStart:", self->_currentAction);
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    v15 = -[DDActionController isPresentingInPopover](self, "isPresentingInPopover");
    alertController = self->_alertController;
    if (alertController)
    {
      -[UIAlertController presentingViewController](alertController, "presentingViewController");
      v17 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      v18 = self->_currentBaseViewController;
      self->_currentBaseViewController = v17;

      if (-[DDAction interactionType](self->_currentAction, "interactionType") == 1
        || -[DDAction interactionType](self->_currentAction, "interactionType") == 3)
      {
        -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {

          v20 = 7;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "bundleIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

          if (v38)
            v20 = 2;
          else
            v20 = 7;
        }
        -[UIViewController setModalPresentationStyle:](self->_presentedViewController, "setModalPresentationStyle:", v20);
        -[UIViewController popoverPresentationController](self->_presentedViewController, "popoverPresentationController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sourceView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setSourceView:", v41);

        -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "sourceRect");
        objc_msgSend(v39, "setSourceRect:");

        objc_msgSend(v39, "setDelegate:", self);
      }
      if (v15)
        -[UIAlertController setModalTransitionStyle:](self->_alertController, "setModalTransitionStyle:", 2);
      v43 = self->_alertController;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __41__DDActionController__presentController___block_invoke;
      v44[3] = &unk_1E42580C8;
      v44[4] = self;
      -[UIAlertController dismissViewControllerAnimated:completion:](v43, "dismissViewControllerAnimated:completion:", 1, v44);
      goto LABEL_34;
    }
    if (!v15)
    {
      -[DDActionController _presentCurrentViewControllerOurselves](self, "_presentCurrentViewControllerOurselves");
      goto LABEL_34;
    }
    -[UIViewController popoverPresentationController](self->_presentedViewController, "popoverPresentationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction setupPopoverPresentationController:view:](self->_currentAction, "setupPopoverPresentationController:view:", v29, self->_baseView);
    objc_msgSend(v29, "setDelegate:", self);
    v30 = self->_currentBaseViewController;
    if (v30)
    {
      -[UIView window](self->_baseView, "window");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_32;
      v32 = (void *)v31;
      -[UIViewController view](self->_currentBaseViewController, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self->_baseView, "window");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34 == v35)
      {
LABEL_32:
        -[UIViewController presentViewController:animated:completion:](self->_currentBaseViewController, "presentViewController:animated:completion:", self->_presentedViewController, 1, 0);
        goto LABEL_33;
      }
      v30 = self->_currentBaseViewController;
    }
    self->_currentBaseViewController = 0;

    -[DDActionController _presentCurrentViewControllerOurselves](self, "_presentCurrentViewControllerOurselves");
LABEL_33:

    goto LABEL_34;
  }
  v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v21)
    -[DDActionController _presentController:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_34:

}

uint64_t __41__DDActionController__presentController___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "interactionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "interactionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action:didDismissAlertController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0);
  v8 = (void *)v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_presentCurrentViewControllerOurselves");
}

- (void)tellDelegateActionDidFinish
{
  -[DDActionController tellDelegateActionDidFinishShouldDismiss:](self, "tellDelegateActionDidFinishShouldDismiss:", 1);
}

- (void)tellDelegateActionDidFinishShouldDismiss:(BOOL)a3
{
  if (a3)
    -[DDActionController _didDismissActionViewController](self, "_didDismissActionViewController");
  if (self->_interactionDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[DDDetectionControllerInteractionDelegate actionDidFinish:](self->_interactionDelegate, "actionDidFinish:", self->_currentAction);
  }
}

- (void)_willPresentViewController
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("DDDetectionControllerWillPresentActionNotification"), 0, 0);

}

- (void)_didDismissActionViewController
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("DDDetectionControllerDidDismissActionNotification"), 0, 0);

}

- (void)dismissCurrentController
{
  UIViewController *currentBaseViewController;
  UIAlertController **p_alertController;
  void *v5;
  UIViewController *v6;
  UIViewController **p_presentedViewController;
  UIViewController *presentedViewController;
  UIAlertController *v9;
  UIAlertController *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  currentBaseViewController = self->_currentBaseViewController;
  if (currentBaseViewController)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__DDActionController_dismissCurrentController__block_invoke;
    v13[3] = &unk_1E42580C8;
    v13[4] = self;
    -[UIViewController dismissViewControllerAnimated:completion:](currentBaseViewController, "dismissViewControllerAnimated:completion:", 1, v13);
  }
  else
  {
    p_alertController = &self->_alertController;
    if (self->_alertController)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__DDActionController_dismissCurrentController__block_invoke_2;
      v12[3] = &unk_1E42580C8;
      v12[4] = self;
      v5 = (void *)MEMORY[0x1A1AF3244](v12, a2);
      presentedViewController = self->_presentedViewController;
      p_presentedViewController = &self->_presentedViewController;
      v6 = presentedViewController;
      if (!presentedViewController
        || (-[UIViewController presentingViewController](v6, "presentingViewController"),
            v9 = (UIAlertController *)objc_claimAutoreleasedReturnValue(),
            v10 = *p_alertController,
            v9,
            v9 == v10))
      {
        p_presentedViewController = (UIViewController **)p_alertController;
      }
      -[UIViewController presentingViewController](*p_presentedViewController, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v5);

    }
    else
    {
      -[DDActionController _dismissCurrentViewControllerOurselves](self, "_dismissCurrentViewControllerOurselves");
    }
  }
}

uint64_t __46__DDActionController_dismissCurrentController__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "tellDelegateActionDidFinish");
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

uint64_t __46__DDActionController_dismissCurrentController__block_invoke_2(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "action:didDismissAlertController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(a1 + 32), "tellDelegateActionDidFinish");
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)cleanupNoDismiss
{
  if (self->_presentedViewController || self->_currentBaseViewController || self->_originalWindow)
  {
    -[DDActionController tellDelegateActionDidFinishShouldDismiss:](self, "tellDelegateActionDidFinishShouldDismiss:", 0);
    -[DDActionController _cleanup](self, "_cleanup");
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[DDAction invalidate](self->_currentAction, "invalidate", a3);
  if (self->_interactionDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[DDDetectionControllerInteractionDelegate action:didDismissAlertController:](self->_interactionDelegate, "action:didDismissAlertController:", self->_currentAction, self->_alertController);
    -[DDActionController tellDelegateActionDidFinish](self, "tellDelegateActionDidFinish");
  }
  -[DDActionController _cleanup](self, "_cleanup");
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  -[DDAction adaptForPresentationInPopover:](self->_currentAction, "adaptForPresentationInPopover:", 0, a4);
  return 0;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  objc_msgSend(a3, "_setCentersPopoverIfSourceViewNotSet:", 1);
  -[DDAction adaptForPresentationInPopover:](self->_currentAction, "adaptForPresentationInPopover:", 1);
}

- (void)_presentCurrentViewControllerOurselves
{
  UIView *baseView;
  void *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  UIWindow *v10;
  UIWindow *originalWindow;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  DDFallbackController *v15;
  DDFallbackController *v16;
  DDFallbackController *v17;

  baseView = self->_baseView;
  if (!baseView)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyWindow");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_baseView;
    self->_baseView = v5;

    baseView = self->_baseView;
  }
  objc_msgSend(MEMORY[0x1E0CEABB8], "_viewControllerForFullScreenPresentationFromView:", baseView);
  v16 = (DDFallbackController *)objc_claimAutoreleasedReturnValue();
  -[DDFallbackController view](v16, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[UIView window](self->_baseView, "window");
    v10 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  }
  originalWindow = self->_originalWindow;
  self->_originalWindow = v10;

  if (!self->_originalWindow)
    DDUILogAssertionFailure((uint64_t)"_originalWindow != nil", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDActionController.m", (uint64_t)"-[DDActionController _presentCurrentViewControllerOurselves]", 827, CFSTR("Need an original window to present a fallback controller; _baseView = %@"),
      v12,
      v13,
      v14,
      (uint64_t)self->_baseView);
  v15 = v16;
  if (!v16)
    v15 = -[DDFallbackController initWithWindow:interactionDelegate:]([DDFallbackController alloc], "initWithWindow:interactionDelegate:", self->_originalWindow, self);
  v17 = v15;
  -[DDFallbackController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", self->_presentedViewController, 1, 0);

}

- (void)_dismissCurrentViewControllerOurselves
{
  void *v3;
  _QWORD v4[5];

  -[UIViewController presentingViewController](self->_presentedViewController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__DDActionController__dismissCurrentViewControllerOurselves__block_invoke;
  v4[3] = &unk_1E42580C8;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

uint64_t __60__DDActionController__dismissCurrentViewControllerOurselves__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "tellDelegateActionDidFinish");
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

+ (BOOL)presentingBaseView:(id)a3 isLargeEnoughForAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  _QWORD block[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "interactionType") == 1 && _UIApplicationIsExtension())
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20[5])
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "windows");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "screen");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v20[5];
        v20[5] = v11;

      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__DDActionController_presentingBaseView_isLargeEnoughForAction___block_invoke;
        block[3] = &unk_1E4258568;
        block[4] = &v19;
        dispatch_sync(MEMORY[0x1E0C80D38], block);
      }
    }
    if (v20[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = 375.0;
      else
        v14 = 320.0;
      objc_msgSend((id)v20[5], "bounds");
      v13 = v15 >= v14 && v16 >= 667.0 || v16 >= v14 && v15 >= 667.0;
    }
    else
    {
      v13 = 0;
    }
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

void __64__DDActionController_presentingBaseView_isLargeEnoughForAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)performAction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = objc_opt_class();
    _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Performing action %@", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDActionController performAction:].cold.1((uint64_t)v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__DDActionController_performAction___block_invoke;
  v6[3] = &unk_1E4258140;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_19EFBB000, "performing Data Detectors action", OS_ACTIVITY_FLAG_DEFAULT, v6);

}

void __36__DDActionController_performAction___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAction:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 40), "canBePerformedWhenDeviceIsLocked") ^ 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__DDActionController_performAction___block_invoke_2;
  v4[3] = &unk_1E4258590;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = v2;
  dd_requireDeviceUnlockAndPerformBlock(v2, v4);

}

void __36__DDActionController_performAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  id *v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "baseView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 40);
  v6 = +[DDActionController presentingBaseView:isLargeEnoughForAction:](DDActionController, "presentingBaseView:isLargeEnoughForAction:", v4, *(_QWORD *)(a1 + 40));

  if (objc_msgSend(*(id *)(a1 + 40), "interactionType"))
    v7 = v6;
  else
    v7 = 0;
  if (!a2 && *(_BYTE *)(a1 + 48))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __36__DDActionController_performAction___block_invoke_2_cold_2();
      if (v7)
        return;
    }
    else if (v7)
    {
      return;
    }
LABEL_18:
    objc_msgSend(*(id *)(a1 + 32), "_cleanup");
    return;
  }
  if (!v7)
  {
    if (v6 || objc_msgSend(*v5, "canBePerformedByOpeningURL"))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "baseView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performFromView:", v12);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __36__DDActionController_performAction___block_invoke_2_cold_1((id *)(a1 + 40));
    }
    goto LABEL_18;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 64);
  if (v9)
  {
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    v8 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*v5, "prepareViewControllerForActionController:", v8);
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
  -[DDActionController viewControllerRequiresModalInPopover:](self, "viewControllerRequiresModalInPopover:", 0);
}

- (void)action:(id)a3 viewControllerReady:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "setDelegate:", self);
  -[DDActionController _presentController:](self, "_presentController:", v6);

}

- (void)action:(id)a3 presentationShouldBeModal:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  if (self->_currentAction == a3)
  {
    v4 = a4;
    objc_msgSend(a3, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModalInPresentation:", v4);

    -[DDActionController viewControllerRequiresModalInPopover:](self, "viewControllerRequiresModalInPopover:", v4);
  }
}

- (void)failedToPrepareViewControllerForAction:(id)a3
{
  UIAlertController *alertController;
  void *v5;

  alertController = self->_alertController;
  if (alertController)
  {
    -[UIAlertController view](alertController, "view", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  }
  -[DDActionController setCurrentAction:](self, "setCurrentAction:", 0);
}

- (void)actionDidFinish:(id)a3 shouldDismiss:(BOOL)a4
{
  void *v5;

  if (a4)
    -[DDActionController dismissCurrentController](self, "dismissCurrentController", a3);
  else
    -[DDActionController cleanupNoDismiss](self, "cleanupNoDismiss", a3);
  -[DDActionController currentAction](self, "currentAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[DDActionController setCurrentAction:](self, "setCurrentAction:", 0);
}

- (void)actionDidFinish:(id)a3
{
  -[DDActionController actionDidFinish:shouldDismiss:](self, "actionDidFinish:shouldDismiss:", a3, 1);
}

- (BOOL)isPerformingAction
{
  return self->_currentAction != 0;
}

- (BOOL)actionIsCancellable
{
  UIAlertController *alertController;
  UIAlertController *v3;
  UIAlertController *v4;
  char v5;

  alertController = self->_alertController;
  if (alertController)
  {
    v3 = alertController;
  }
  else
  {
    -[DDAction viewController](self->_currentAction, "viewController");
    v3 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = -[UIAlertController isModalInPresentation](v3, "isModalInPresentation") ^ 1;

  return v5;
}

- (void)cancelAction
{
  id v3;

  -[DDActionController currentAction](self, "currentAction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DDActionController actionDidFinish:](self, "actionDidFinish:", v3);

}

- (BOOL)isPresentingInPopover
{
  UIAlertController *alertController;
  UIAlertController *v4;
  void *v5;
  uint64_t v6;

  alertController = self->_alertController;
  if (!alertController)
    alertController = (UIAlertController *)self->_presentedViewController;
  v4 = alertController;
  -[UIAlertController presentationController](v4, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "presentationStyle");
  if (objc_msgSend(v5, "_isAdapted")
    && -[DDAction interactionType](self->_currentAction, "interactionType") != 1)
  {
    v6 = objc_msgSend(v5, "adaptivePresentationStyle");
  }

  return v6 == 7;
}

- (void)viewControllerRequiresModalInPopover:(BOOL)a3
{
  -[UIAlertController setModalInPresentation:](self->_alertController, "setModalInPresentation:", a3);
}

- (DDDetectionControllerInteractionDelegate)interactionDelegate
{
  return self->_interactionDelegate;
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_interactionDelegate, a3);
}

- (UIView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
  objc_storeStrong((id *)&self->_baseView, a3);
}

- (DDAction)currentAction
{
  return (DDAction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_idsListenerID, 0);
  objc_storeStrong((id *)&self->_originalWindow, 0);
  objc_storeStrong((id *)&self->_interactionDelegate, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_currentBaseViewController, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

- (void)actionsForURL:(void *)a1 result:enclosingResult:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Could not find any actions for URL %p (%@) without any result.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)actionsForURL:(uint64_t)a3 result:(uint64_t)a4 enclosingResult:(uint64_t)a5 context:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "NULL result; this is probably because deprecated Data Detectors UI SPIs are used.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1_0();
}

- (void)actionsForURL:(uint64_t)a1 result:(uint64_t)a2 enclosingResult:context:.cold.3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v3, "Unknown DDResult category %d for result %@; could not find any actions for URL %p (%@)",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_0_1();
}

- (void)actionsForURL:(uint64_t)a1 result:(uint64_t)a2 enclosingResult:context:.cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v3, "Unknown result type %@ in the Misc category; no actions found (URL %p (%@))",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_0_1();
}

- (void)defaultActionForURL:(void *)a1 result:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Can't transform URL to prompt: %p (%@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)defaultActionForURL:(uint64_t)a1 result:(uint64_t)a2 context:.cold.5(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v3, "Unknown type %@ in the Misc category; could not find any actions for URL %p (%@)",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_0_1();
}

- (void)_presentController:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Trying to present a nil controller in _presentController:inView:, aborting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_presentController:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "In _presentController trying to present %@, but the previous controller %@ hasn't been dismissed. _presentedViewController, _currentBaseViewController and _originalWindow should all be nil by now. Cleaning up, but the delegate may have missed the actionDidFinish notification.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)performAction:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Performing action %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __36__DDActionController_performAction___block_invoke_2_cold_1(id *a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  v3 = objc_msgSend(*a1, "canBePerformedByOpeningURL");
  v4 = 138413058;
  v5 = v2;
  v6 = 1024;
  v7 = 1;
  v8 = 1024;
  v9 = 1;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Performing action %@ aborted (%d-%d-%d)", (uint8_t *)&v4, 0x1Eu);
}

void __36__DDActionController_performAction___block_invoke_2_cold_2()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 138412290;
  v1 = objc_opt_class();
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Performing action %@ aborted because device is locked", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
